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
                        <option value="T_600">600톤</option>
                        <option value="T_800">800톤</option>
                        <option value="BLK">K-BLACK</option>
                        <option value="MLPL">공용설비(ML/PL)</option>
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

$(function () {
    $(".headerP").text("모니터링 - 온도경향 모니터링");
});

$(document).ready(function () {
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
                console.log("✅ 받아온 데이터:", raw);
                if (!raw || !raw.length) {
                    alert("데이터가 없습니다.");
                    return;
                }

                // 설비별 시리즈 구성 + 어느 축(yAxis)에 그릴지 지정
                const labelMap = {
                    T_600: [
                        { key: "T_600_D12000", label: "t_600 예열", axis: 0 },
                        { key: "T_600_D12001", label: "t_600 가열", axis: 1 }
                    ],
                    T_800: [
                        { key: "T_800_D12000", label: "t_800 예열", axis: 0 },
                        { key: "T_800_D12001", label: "t_800 가열", axis: 1 }
                    ],
                    BLK: [
                        { key: "BLK_D12000", label: "K-BLACK 예열", axis: 0 },
                        { key: "BLK_D12001", label: "K-BLACK 가열", axis: 1 }
                    ],
                    MLPL: [
                        { key: "MLPL_D12000", label: "공용설비 예열", axis: 0 },
                        { key: "MLPL_D12001", label: "공용설비 가열", axis: 1 }
                    ]
                };

                const seriesInfo = labelMap[mch_code] || [];

                // 각 series에 yAxis index 달기
                const series = seriesInfo.map(info => ({
                    name: info.label,
                    yAxis: info.axis,        // ← 0 = left axis, 1 = right axis
                    data: raw.map(item => {
                        const t = Number(item.temp_time);
                        const v = item[info.key];
                        return [t, v != null ? Number(v) : null];
                    })
                }));

                Highcharts.chart('chartContainer', {
                    chart: { type: 'line' },
                    title: {
                        text: '온도 경향 모니터링',
                        style: { fontSize: '18px', fontWeight: 'bold' }
                    },
                    exporting: { enabled: false },

                    xAxis: {
                        type: 'datetime',
                        title: { text: '' },
                        tickInterval: 3600 * 1000,
                        dateTimeLabelFormats: {
                            hour: '%H:%M',
                            minute: '%H:%M'
                        }
                    },

                    yAxis: [
                        { // 축: 예열0
                            title: { text: '예열 온도 (℃)' },
                            min: 50,
                            max: 300,
                            opposite: false
                        },
                        { //  축: 가열1
                            title: { text: '가열 온도 (℃)' },
                            min: 50,
                            max: 400,
                            opposite: false
                        }
                    ],

                    series: series
                });
            },
            error: function (xhr, status, error) {
                console.error("❌ 데이터 불러오기 실패:", status, error);
            }
        });
    }

    // 조회 버튼
    $(".select-button").click(function () {
        const startDate = $("#startDate").val() || "";
        const endDate   = $("#endDate").val()   || "";
        const mch_code  = $("#mch_code").val()  || "";
        loadChart(startDate, endDate, mch_code);
    });

 // 초기 날짜 세팅
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

    // datetime-local 형식 (yyyy-MM-ddTHH:mm)에는 T 포함되어야 함
    $("#startDate").val(sd);
    $("#endDate").val(ed);
    $("#mch_code").val(mc);

    loadChart(sd, ed, mc);

});
</script>

</body>

</html>
