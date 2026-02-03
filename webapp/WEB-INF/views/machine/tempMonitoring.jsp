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
        
        .select-button {
    height: 47px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
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
        
        @media print {
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        overflow: visible;
    }

    body * {
        visibility: hidden;
    }

    #chartContainer, #chartContainer * {
        visibility: visible;
    }

    #chartContainer {
        position: absolute;
        top: 0;
        left: 0;
        width: auto;
        height: auto; /* ✅ 100% → auto 로 변경 */
        min-height: 100vh; /* ✅ 최소 높이 확보 */
    }
}
      
      
      .memo-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            background: white;
            border: 2px solid #333;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            z-index: 10000;
        }
        
        .memo-popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 9999;
        }
        
        .memo-popup h3 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: bold;
        }
        
        .memo-form-group {
            margin-bottom: 15px;
        }
        
        .memo-form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        .memo-form-group input,
        .memo-form-group select,
        .memo-form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .memo-form-group textarea {
            resize: vertical;
            min-height: 100px;
        }
        
        .memo-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }
        
        .memo-buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }
        
        .memo-save-btn {
            background: #4CAF50;
            color: white;
        }
        
        .memo-cancel-btn {
            background: #f44336;
            color: white;
        }  
</style>
    
<body>
    <main class="main">
        <div class="tab">
            <div class="button-container">
                <div class="box1">
                    <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
  
                    <label for="machineCode" style="margin-bottom:15px;margin-right:13px;font-size: 18px;">설비 선택:</label>
                    <select id="mch_code" style="font-size: 18px;height: 30px; margin-bottom:10px; width:200px;">
                        <option value="T_600">G-600</option>
                        <option value="T_800">G-800</option>
                        <option value="BLK">K-BLACK</option>
                        <option value="MLPL">공용설비</option>
                    </select>

                    <label class="daylabel">검색일자 :</label>
                    <input type="text" class="datetimeSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
                    
                    <span class="mid" style="font-size: 20px; font-weight: bold; margin-bottom:10px;"> ~ </span>
                    
                    <input type="text" class="datetimeSet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
                </div>

                <button class="select-button" style="width:90px;">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>

                <button id="printBtn" style="width:90px; margin-bottom:10px;">전체 인쇄</button>
                
                <!-- ✅ 메모 추가 버튼 -->
                <button id="addMemoBtn" style="width:90px; margin-bottom:10px; background:#2196F3; color:white;">메모 추가</button>
            </div>
        </div>
        
        <div id="chartContainer" style="width:100%; height:calc(100vh - 100px);"></div>
    </main>

    <!-- ✅ 메모 팝업 -->
    <div class="memo-popup-overlay" id="memoOverlay"></div>
    <div class="memo-popup" id="memoPopup">
        <h3>메모 추가</h3>
        <form id="memoForm">
            <div class="memo-form-group">
                <label>설비 선택 *</label>
                <select id="memo_mch_code" required>
                    <option value="T_600">G-600</option>
                    <option value="T_800">G-800</option>
                    <option value="BLK">K-BLACK</option>
                    <option value="MLPL">공용설비</option>
                </select>
            </div>
            
            <div class="memo-form-group">
                <label>메모 시간 *</label>
                <input type="text" id="memo_time" required placeholder="2026-02-03 11:22:57">
            </div>
            
            <div class="memo-form-group">
                <label>메모 내용 *</label>
                <textarea id="memo_content" required placeholder="메모 내용을 입력하세요"></textarea>
            </div>
            
            <div class="memo-buttons">
                <button type="button" class="memo-cancel-btn" id="memoCancelBtn">취소</button>
                <button type="submit" class="memo-save-btn">저장</button>
            </div>
        </form>
    </div>

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

// ✅ 현재 시간을 DATETIME 형식으로 반환
function getCurrentDateTime() {
    const now = new Date();
    const year = now.getFullYear();
    const month = paddingZero(now.getMonth() + 1);
    const day = paddingZero(now.getDate());
    const hour = paddingZero(now.getHours());
    const minute = paddingZero(now.getMinutes());
    const second = paddingZero(now.getSeconds());
    return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
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
        BLK:   { D12000: { base: 90,  tol: 25 }, D12001: { base: 180, tol: 10 } }, 
        MLPL:  { D12000: { base: 85,  tol: 20 }, D12001: { base: 175, tol: 10 } },
    };

    // ✅ 차트 로드 함수 (메모 포함)
    function loadChart(startDate, endDate, mch_code) {
        console.log("🔍 차트 로드 시작:", { startDate, endDate, mch_code });
        
        // 온도 데이터 조회
        $.ajax({
            type: "POST",
            url: "/geomet/machine/tempMonitoring/list",
            data: { startDate, endDate, mch_code },
            dataType: "json",
            success: function (data) {
                console.log("✅ 온도 데이터 응답:", data);
                
                if (data.status !== "success") {
                    alert("데이터 로딩 실패: " + data.message);
                    return;
                }

                const raw = data.data;
                if (!raw || !raw.length) {
                    alert("데이터가 없습니다.");
                    return;
                }

                // ✅ 메모 데이터 조회
                $.ajax({
                    type: "POST",
                    url: "/geomet/machine/tempMonitoring/memo/list",
                    data: { startDate, endDate, mch_code },
                    dataType: "json",
                    success: function (memoData) {
                        console.log("✅ 메모 데이터 응답:", memoData);
                        const memos = memoData.data || [];
                        console.log("📝 메모 개수:", memos.length);
                        
                        if (memos.length > 0) {
                            console.log("📝 첫 번째 메모:", memos[0]);
                        }
                        
                        renderChart(raw, memos, mch_code);
                    },
                    error: function (xhr, status, error) {
                        console.error("❌ 메모 조회 실패:", status, error);
                        console.log("응답:", xhr.responseText);
                        renderChart(raw, [], mch_code);
                    }
                });
            },
            error: function (xhr, status, error) {
                console.error("❌ 데이터 불러오기 실패:", status, error);
            }
        });
    }

    // ✅ 차트 렌더링 함수
    function renderChart(raw, memos, mch_code) {
        console.log("🎨 차트 렌더링 시작");
        console.log("📊 온도 데이터 개수:", raw.length);
        console.log("📝 메모 개수:", memos.length);
        
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

        // ✅ 메모를 xAxis plotLines로 추가
        const memoPlotLines = memos.map((memo, index) => {
            console.log(`📝 메모 ${index + 1} 처리:`, memo);
            console.log("  - memo_time:", memo.memo_time);
            console.log("  - memo_content:", memo.memo_content);
            
            // ✅ memo_time을 Unix timestamp(초)로 변환
            let memoTime;
            try {
                // "2026-02-03 11:47:34" 형식을 Date 객체로 변환
                const dateStr = memo.memo_time.replace(' ', 'T'); // ISO 형식으로 변환
                memoTime = new Date(dateStr).getTime() / 1000;
                console.log("  - 변환된 timestamp:", memoTime);
            } catch (e) {
                console.error("  - 시간 변환 실패:", e);
                memoTime = 0;
            }
            
            const plotLine = {
                value: memoTime,
                color: '#2196F3',
                width: 3,
                dashStyle: 'Solid',
                label: {
                    text: '📝 ' + (memo.memo_content.length > 10 ? memo.memo_content.substring(0, 10) + '...' : memo.memo_content),
                    align: 'center',
                    rotation: 0,
                    y: -10,
                    style: {
                        color: '#2196F3',
                        fontWeight: 'bold',
                        fontSize: '12px',
                        backgroundColor: 'white',
                        padding: '3px'
                    }
                },
                zIndex: 10
            };
            
            console.log("  - 생성된 plotLine:", plotLine);
            return plotLine;
        });

        console.log("📊 최종 memoPlotLines:", memoPlotLines);

        Highcharts.chart('chartContainer', {
            chart: {
                type: 'line',
                events: {
                    load: function () {
                        const chart = this;
                        console.log("📈 차트 로드 완료");
                        
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
                type: 'datetime', // ✅ datetime 타입 명시
                labels: {
                    formatter: function () {
                        return unix_timestamp(this.value);
                    },
                    style: { fontSize: "11pt" }
                },
                plotLines: memoPlotLines // ✅ 메모 표시
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
                    tickInterval: 10,
                    plotLines: mainheatPlotLines
                },
                {
                    title: { text: '예열 온도 (℃)' },
                    top: '55%',
                    height: '45%',
                    offset: 0,
                    min: (mch_code === "T_600" || mch_code === "T_800") ? 80 :
                         (mch_code === "BLK")   ? 55 :
                         (mch_code === "MLPL")  ? 50 : 40,
                    max: (mch_code === "T_600" || mch_code === "T_800") ? 120 :
                         (mch_code === "BLK")   ? 125 :
                         (mch_code === "MLPL")  ? 120 : 140,
                    tickInterval: 10,
                    plotLines: preheatPlotLines
                }
            ],
            tooltip: {
                shared: true,
                crosshairs: true
            },
            series: [...mainheatSeries, ...preheatSeries]
        });
    }

    // ✅ 조회 버튼 클릭
    $(".select-button").click(function () {
        const startDate = $("#startDate").val() || "";
        const endDate = $("#endDate").val() || "";
        const mch_code = $("#mch_code").val() || "";
        console.log("🔍 조회 버튼 클릭:", { startDate, endDate, mch_code });
        loadChart(startDate, endDate, mch_code);
    });

    // ✅ 메모 추가 버튼 클릭
    $("#addMemoBtn").click(function () {
        $("#memo_time").val(getCurrentDateTime());
        $("#memo_mch_code").val($("#mch_code").val());
        $("#memoOverlay").show();
        $("#memoPopup").show();
    });

    // ✅ 메모 취소 버튼
    $("#memoCancelBtn").click(function () {
        $("#memoOverlay").hide();
        $("#memoPopup").hide();
        $("#memoForm")[0].reset();
    });

    // ✅ 메모 저장
    $("#memoForm").submit(function (e) {
        e.preventDefault();
        
        const memoData = {
            mch_code: $("#memo_mch_code").val(),
            memo_time: $("#memo_time").val(),
            memo_content: $("#memo_content").val()
        };

        console.log("💾 메모 저장 요청:", memoData);

        $.ajax({
            type: "POST",
            url: "/geomet/machine/tempMonitoring/memo/insert",
            data: memoData,
            dataType: "json",
            success: function (result) {
                console.log("✅ 메모 저장 응답:", result);
                
                if (result.status === "success") {
                    alert("메모가 저장되었습니다.");
                    $("#memoOverlay").hide();
                    $("#memoPopup").hide();
                    $("#memoForm")[0].reset();
                    
                    // 차트 다시 로드
                    const startDate = $("#startDate").val();
                    const endDate = $("#endDate").val();
                    const mch_code = $("#mch_code").val();
                    loadChart(startDate, endDate, mch_code);
                } else {
                    alert("메모 저장 실패: " + result.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("❌ 메모 저장 실패:", status, error);
                console.log("응답:", xhr.responseText);
                alert("메모 저장 중 오류가 발생했습니다.");
            }
        });
    });

    // ✅ 날짜 포맷 함수
    function formatDate(date) {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const hours = String(date.getHours()).padStart(2, '0');
        const minutes = String(date.getMinutes()).padStart(2, '0');
        return year + "-" + month + "-" + day + " " + hours + ":" + minutes;
    }

 // ✅ 초기 로드
    const now = new Date();

    // 🔹 종료 시간 +2분
    const endPlus2Min = new Date(now.getTime() + 2 * 60 * 1000);

    // 🔹 시작 시간: 오늘 08:00
    const todayStart = new Date(
        now.getFullYear(),
        now.getMonth(),
        now.getDate(),
        8, 0
    );

    const sd = formatDate(todayStart);
    const ed = formatDate(endPlus2Min);
    const mc = "T_600";

    $("#startDate").val(sd);
    $("#endDate").val(ed);
    $("#mch_code").val(mc);

    loadChart(sd, ed, mc);


    // ✅ 인쇄 버튼
    $("#printBtn").click(function () {
        window.print();
    });
});
</script>
</body>
</html>


</html>
