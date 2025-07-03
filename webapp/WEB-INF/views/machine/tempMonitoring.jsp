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
                    <select id="mch_code" style="font-size: 18px;height: 30px; margin-bottom:10px; width:200px;">
                        <option value="T_600">G-600</option>
                        <option value="T_800">G-800</option>
                        <option value="BLK">K-BLACK</option>
                        <option value="MLPL">공용설비</option>
                    </select>

                    <label class="daylabel">검색일자 :</label>
                    <input type="text" class="datetimeSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
                    
                    <span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
                    
                    <input type="text" class="datetimeSet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
                </div>

   <button class="select-button" style="width:90px;">
    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
</button>

<button id="printBtn" style="width:90px; margin-bottom:10px;">전체 인쇄</button>

            </div>
        </div>
 		<div id="chartContainer" style="width:100%; height:calc(100vh - 100px);"></div>
       <!--  <div id="chartWrapper" style="height: 90vh;">
           
        </div> -->
    </main>

<script>
let now_page_code = "a05";

// 0 붙여주는 함수
function paddingZero(num) {
    return num < 10 ? "0" + num : num;
}

// 초 단위 timestamp → "yyyy-MM-dd HH:mm" 문자열 변환 함수
function cursorSetDateTime(t) {
    const date = new Date(t);
    const year = date.getFullYear();
    const month = paddingZero(date.getMonth() + 1);
    const day = paddingZero(date.getDate());
    const hour = paddingZero(date.getHours());
    const minute = paddingZero(date.getMinutes());
    return year + "-" + month + "-" + day + " " + hour + ":" + minute;
}

function unix_timestamp(t) {
    const date = new Date(t * 1000);
    const month = paddingZero(date.getMonth() + 1);
    const day = paddingZero(date.getDate());
    const hour = paddingZero(date.getHours());
    const minute = paddingZero(date.getMinutes());
    return month + "-" + day + "<br/> " + hour + ":" + minute;
}

$(function () {
    $(".headerP").text("모니터링 - 온도경향 모니터링");
});

$(document).ready(function () {
    const labelMap = {
        T_600: [
            { key: "T_600_D12000", label: "G_600 예열", code: "D12000", type: "pre" },
            { key: "T_600_D12001", label: "G_600 가열", code: "D12001", type: "main" }
        ],
        T_800: [
            { key: "T_800_D12000", label: "G_800 예열", code: "D12000", type: "pre" },
            { key: "T_800_D12001", label: "G_800 가열", code: "D12001", type: "main" }
        ],
        BLK: [
            { key: "BLK_D12000", label: "K-BLACK 예열", code: "D12000", type: "pre" },
            { key: "BLK_D12001", label: "K-BLACK 가열", code: "D12001", type: "main" }
        ],
        MLPL: [
            { key: "MLPL_D12000", label: "공용설비 예열", code: "D12000", type: "pre" },
            { key: "MLPL_D12001", label: "공용설비 가열", code: "D12001", type: "main" }
        ]
    };

    const thresholdMap = {
        T_600: { D12000: { base: 100, tol: 10 }, D12001: { base: 380, tol: 10 } },
        T_800: { D12000: { base: 100, tol: 10 }, D12001: { base: 370, tol: 10 } },
        BLK:   { D12000: { base: 100, tol: 40 }, D12001: { base: 180, tol: 10 } },
        MLPL:  { D12000: { base: 85,  tol: 20 }, D12001: { base: 175, tol: 10 } },
    };

    function loadChart(startDate, endDate, mch_code) {
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

                const seriesInfo = labelMap[mch_code] || [];
                const preheatSeries = [];
                const mainheatSeries = [];
                const preheatPlotLines = [];
                const mainheatPlotLines = [];

                const titleText = (seriesInfo[0] && seriesInfo[0].label)
                    ? seriesInfo[0].label.split(' ')[0] + " 온도 경향 모니터링"
                    : "온도 경향 모니터링";

                seriesInfo.forEach(info => {
                    const seriesData = raw.map(item => {
                        const t = Math.round(item.temp_time / 1000);
                        const v = item[info.key];
                        return [t, v != null ? Number(v) : null];
                    });

                    const axisIndex = info.type === "pre" ? 1 : 0;
                    const seriesItem = {
                        name: info.label,
                        data: seriesData,
                        yAxis: axisIndex
                    };

                    const cfg = thresholdMap[mch_code][info.code];
                    const low = cfg.base - cfg.tol;
                    const high = cfg.base + cfg.tol;

                    const plotLines = [
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
                    ];

                    if (info.type === "pre") {
                        preheatSeries.push(seriesItem);
                        preheatPlotLines.push(...plotLines);
                    } else {
                        mainheatSeries.push(seriesItem);
                        mainheatPlotLines.push(...plotLines);
                    }
                });

                Highcharts.chart('chartContainer', {
                    chart: {
                        type: 'line',
                        events: {
                            load: function () {
                                const chart = this;
                                // 예열 차트 테두리
                                chart.renderer.rect(
                                    chart.plotLeft,
                                    chart.plotTop + chart.plotHeight * 0.55,
                                    chart.plotWidth,
                                    chart.plotHeight * 0.45,
                                    0
                                ).attr({
                                	stroke: '#ddd',
                                    'stroke-width': 1,
                                    zIndex: 5
                                }).add();

                                // 가열 차트 테두리
                                chart.renderer.rect(
                                    chart.plotLeft,
                                    chart.plotTop,
                                    chart.plotWidth,
                                    chart.plotHeight * 0.50,
                                    0
                                ).attr({
                                	stroke: '#ddd',
                                    'stroke-width': 1,
                                    zIndex: 5
                                }).add();
                            }
                        }
                    },
                    title: {
                        text: titleText,
                        style: { fontSize: '18px', fontWeight: 'bold' }
                    },
                    exporting: { enabled: false },
                    xAxis: {
                        labels: {
                            formatter: function () {
                                return unix_timestamp(this.value);
                            },
                            style: { fontSize: "11pt" }
                        }
                    },
                    yAxis: [
                    	{
                    	    title: { text: '가열 온도 (℃)' },
                    	    height: '50%',
                    	    top: '0%',
                    	    offset: 0,
                    	    min: (mch_code === "T_600") ? 360 :
                    	         (mch_code === "T_800") ? 340 :
                    	         (mch_code === "BLK")   ? 160 :
                    	         (mch_code === "MLPL")  ? 150 : 0,
                    	    max: (mch_code === "T_600" || mch_code === "T_800") ? 400 : 200,
                    	    tickInterval: 20,
                    	    plotLines: mainheatPlotLines
                    	},

                        {
                            title: { text: '예열 온도 (℃)' },
                            top: '55%',
                            height: '45%',
                            offset: 0,
                            min: (mch_code === "T_600" || mch_code === "T_800") ? 60 : 40,
                            max: (mch_code === "T_600" || mch_code === "T_800") ? 140 : 
                                 (mch_code === "BLK") ? 160 : 140,
                            tickInterval: 20,
                            plotLines: preheatPlotLines
                        }
                    ],
                    series: [...mainheatSeries, ...preheatSeries]
                });
            },
            error: function (xhr, status, error) {
                console.error("❌ 데이터 불러오기 실패:", status, error);
            }
        });
    }

    $(".select-button").click(function () {
        const startDate = $("#startDate").val() || "";
        const endDate = $("#endDate").val() || "";
        const mch_code = $("#mch_code").val() || "";
        loadChart(startDate, endDate, mch_code);
    });

    function formatDate(date) {
        const offset = date.getTimezoneOffset() * 60000;
        const localDate = new Date(date.getTime() - offset);
        return localDate.toISOString().slice(0, 16);
    }

    const now = new Date();
    const todayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 8, 0);
    const sd = formatDate(todayStart);
    const ed = formatDate(now);
    const mc = "T_600";

    $("#startDate").val(sd);
    $("#endDate").val(ed);
    $("#mch_code").val(mc);

    loadChart(sd, ed, mc);

    $("#printBtn").click(function () {
        window.print();
    });
});
</script>


</body>

</html>
