<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온도경향 모니터링</title>
<%@include file="../include/pluginpage.jsp" %>
  <jsp:include page="../include/tabBar.jsp"/>    
<style>
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left: 1008px;
            margin-top: 200px;
        }
        .view {
            display: flex;
            justify-content: center;
            margin-top: 1%;
        }
        .tab {
            width: 95%;
            margin-bottom: 37px;
            margin-top: 5px;
            height: 45px;
            border-radius: 6px 6px 0px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
          .button-container {
    		display: flex;
		    gap: 10px;
		    margin-left: auto;
		    margin-right: 10px;
		    margin-top: 40px;
		}
		.box1 {
		    display: flex;
		    justify-content: right;
		    align-items: center;
		    width: 1000px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .datetimeSet {
            width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
	  .highcharts-title {
	    font-size: 18px !important;
	    font-weight: bold !important;
	  }
        .daylabel {
            margin-right: 10px;
            margin-bottom: 13px;
            font-size: 18px;
            margin-left: 20px;
        }
        button-container.button{
        height: 16px;
        }
        		 .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        
</style>
    
    
<body>
    <main class="main">
        <div class="tab">
            <div class="button-container">
                <div class="box1">
                    <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
  
                    <label for="machineCode" style="margin-bottom:15px;margin-right:13px;font-size: 18px; ">설비 선택:</label>
                    <select id="mch_code" style="font-size: 18px;height: 30px; margin-bottom:10px;">
                        <option value="T_600">G-600</option>
                        <option value="T_800">G-800</option>
                        <option value="BLK">K-BLACK</option>
                        <option value="MLPL">PL/ML</option>
                    </select>

                    <label class="daylabel">검색일자 :</label>
                    <input type="text" class="datetimeSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
                    
                    <span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
                    
                    <input type="text" class="datetimeSet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
                </div>

                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                
                <button class="select-button" style="margin-left:10px;">프린트</button>
            </div>
        </div>

        <div id="chartWrapper" style="height: 90vh;">
            <div id="chartContainer" style="width:100%; height:calc(100vh - 100px);"></div>
        </div>
    </main>

<script>
let now_page_code = "a05";

// 헤더 텍스트 세팅
$(function () {
    $(".headerP").text("모니터링 - 온도경향 모니터링");
});

$(document).ready(function () {
    // (1) 설비별 라벨 & axis 맵
    const labelMap = {
        T_600: [
            { key: "T_600_D12000", label: "t_600 예열", code: "D12000" },
            { key: "T_600_D12001", label: "t_600 가열", code: "D12001" }
        ],
        T_800: [
            { key: "T_800_D12000", label: "t_800 예열", code: "D12000" },
            { key: "T_800_D12001", label: "t_800 가열", code: "D12001" }
        ],
        BLK: [
            { key: "BLK_D12000", label: "K-BLACK 예열", code: "D12000" },
            { key: "BLK_D12001", label: "K-BLACK 가열", code: "D12001" }
        ],
        MLPL: [
            { key: "MLPL_D12000", label: "공용설비 예열", code: "D12000" },
            { key: "MLPL_D12001", label: "공용설비 가열", code: "D12001" }
        ]
    };

    // (2) 기준값(base) & 허용오차(tolerance) 맵
    const thresholdMap = {
        T_600: { D12000: { base: 100, tol: 10 }, D12001: { base: 370, tol: 10 } },
        T_800: { D12000: { base: 100, tol: 10 }, D12001: { base: 380, tol: 10 } },
        BLK:   { D12000: { base: 100, tol: 40 }, D12001: { base: 180, tol: 10 } },
        MLPL:  { D12000: { base: 85,  tol: 20 }, D12001: { base: 175, tol: 10 } },
    };

    // (3) 차트 로드 함수
    function loadChart(startDate, endDate, mch_code) {
        console.log("📅 검색 기간:", startDate, "~", endDate);
        console.log("🛠️ 설비 코드:", mch_code);

        $.ajax({
            type: "POST",
            url: "/geomet/machine/tempMonitoring/list",
            data: { startDate, endDate, mch_code },
            dataType: "json",
            success: function (data) {
                if (data.status !== "success") {
                    alert("데이터 로딩 실패: " + data.message);
                    return;
                }
                const raw = data.data;
                if (!raw || !raw.length) {
                    alert("데이터가 없습니다.");
                    return;
                }

                // (4) 시리즈 생성
                const seriesInfo = labelMap[mch_code] || [];
                const series = seriesInfo.map(info => ({
                    name: info.label,
                    data: raw.map(item => {
                        const t = Number(item.temp_time);
                        const v = item[info.key];
                        return [t, v != null ? Number(v) : null];
                    })
                }));

                // (5) 플롯라인 설정
                const plotLines = [];
                seriesInfo.forEach(info => {
                    const cfg = thresholdMap[mch_code][info.code];
                    const low  = cfg.base - cfg.tol;
                    const high = cfg.base + cfg.tol;
                    plotLines.push(
                        {
                            value: low,
                            color: 'red',
                            dashStyle: 'Dash',
                            width: 2,
                            label: { text: `하한(${low}℃)`, align: 'right', x: -5 }
                        },
                        {
                            value: high,
                            color: 'red',
                            dashStyle: 'Dash',
                            width: 2,
                            label: { text: `상한(${high}℃)`, align: 'right', x: -5 }
                        }
                    );
                });

                // (6) Highcharts 렌더링
                Highcharts.chart('chartContainer', {
                    chart: { type: 'line' },
                    title: {
                        text: '온도 경향 모니터링',
                        style: { fontSize: '18px', fontWeight: 'bold' }
                    },
                    exporting: { enabled: false },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 3600 * 1000,
                        dateTimeLabelFormats: {
                            hour: '%H:%M',
                            minute: '%H:%M'
                        }
                    },
                    yAxis: [{
                        title: { text: '온도 (℃)' },
                        min: 40,
                        max: 440,
                        tickPositioner: function () {
                            const ticks = [];
                            // 40 ~ 140 구간: 20 단위 눈금
                            for (let v = 40; v <= 140; v += 20) {
                                ticks.push(v);
                            }
                            // 320 ~ 440 구간: 20 단위 눈금
                            for (let v = 320; v <= 440; v += 20) {
                                ticks.push(v);
                            }
                            return ticks;
                        },
                        plotLines: plotLines
                    }],
                    series: series
                });
            },
            error: function (xhr, status, error) {
                console.error("❌ 데이터 불러오기 실패:", status, error);
            }
        });
    }

    // (7) 버튼 클릭 이벤트
    $(".select-button").click(function () {
        const startDate = $("#startDate").val() || "";
        const endDate   = $("#endDate").val()   || "";
        const mch_code  = $("#mch_code").val()  || "";
        loadChart(startDate, endDate, mch_code);
    });

    // (8) 초기 날짜·시간 세팅
    function formatDate(date) {
        const offset = date.getTimezoneOffset() * 60000;
        const localDate = new Date(date.getTime() - offset);
        return localDate.toISOString().slice(0, 16); // 'yyyy-MM-ddTHH:mm'
    }
    const now = new Date();
    const todayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 8, 0);
    const sd = formatDate(todayStart);
    const ed = formatDate(now);
    const mc = "T_600";

    $("#startDate").val(sd);
    $("#endDate").val(ed);
    $("#mch_code").val(mc);

    // (9) 초기 차트 로드
    loadChart(sd, ed, mc);
});
</script>

</body>

</html>
