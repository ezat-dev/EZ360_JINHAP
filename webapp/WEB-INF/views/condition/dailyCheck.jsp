<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>일상점검일지</title>
<style>
	.tab {
	    width: 89%;
	    margin-bottom: 37px;
	    margin-top: 35px;
	    height: 55px;
	    border-radius: 6px 6px 0px 0px;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	}

    .tab-header {
        display: flex;
        align-items: center;
        font-size: 20px;
        font-weight: bold;
    }

    .tab-controls {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 16px;
    }

	.tab-controls label {
	    margin-right: 5px;
	    font-weight: 500;
	   	font-size: 19px;
	}
	
.tab-controls input.daySet {
    margin-top: 10px;
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 150px;
    text-align: center;
    height: 25px;
}



    .button-image {
        width: 16px;
        height: 16px;
        margin-right: 5px;
    }

    #m_code {
    margin-top: 11px;
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 186px;
    text-align: center;
    height: 38px;
    }
    h2 {
    margin-left: 20px;
	}
   .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
        
            transition: opacity 0.3s ease-in-out;
        }
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	        height: 80vh; 
	        overflow-y: auto; 
	        margin: 6% auto 0;
	        padding: 20px;
	        border-radius: 10px;
	        position: relative;
	        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	        transform: scale(0.8);
	        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
	        opacity: 0;
	    }
        .modal.show {
            display: block;
            opacity: 1;
        }
        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }
        .close {
            background-color:white;
            position: absolute;
            right: 15px;
            top: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .modal-content form {
            display: flex;
            flex-direction: column;
        }
        .modal-content label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content input, .modal-content textarea {
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button {
       
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
          
        }
        .modal-content button:hover {
  
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
		    width: 800px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
        	width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
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
        .row_select {
	    background-color: #ffeeba !important;
	    }
	    
	    	@media (max-width: 600px) {
	  .form-row {
	    flex-direction: column;
	    align-items: stretch;
	  }
	  .form-label {
	    margin-bottom: 4px;
	  }
	}
	
	.excel-import-button:hover {
	    background-color: #f0f0f0;
	}
	
	#excelOverlay {
	  display: none;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0,0,0,0.4);
	  z-index: 9998;
	}
	
	/* 로딩 박스 */
	#excelLoading {
	  display: none;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: white;
	  padding: 20px 30px;
	  border-radius: 10px;
	  box-shadow: 0 0 20px rgba(0,0,0,0.2);
	  font-size: 16px;
	  font-weight: bold;
	  z-index: 9999;
	  text-align: center;
	}
	
	/* 로딩 스피너 */
	#excelLoading::before {
	  content: "";
	  display: block;
	  margin: 0 auto 10px;
	  width: 30px;
	  height: 30px;
	  border: 4px solid #ccc;
	  border-top: 4px solid #4caf50;
	  border-radius: 50%;
	  animation: spin 1s linear infinite;
	}
	
	/* 애니메이션 */
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
	}
	    
</style>



</head>
<body>
    <main>
        <div id="excelOverlay"></div>
        <div id="excelLoading">
            엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...
        </div>

        <div class="tab">
            <h2></h2>
            <div class="tab-controls">
               
                <label for="s_time">검색일자 :</label>
                <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
				<input type="text" autocomplete="off" class="daySet" id="e_time" placeholder="시작 날짜 선택">

 				<label for="m_code">설비선택 :</label>
				<select id="m_code">
				    <option value="W0100">세척1호기</option>
				    <option value="W0200">세척2호기</option>
				    <option value="S0100">쇼트1호기</option>
				    <option value="S0200">쇼트2호기</option>
				    <option value="S0300">쇼트3호기</option>
				    <option value="S0400">쇼트4호기</option>
				    <option value="S0500">쇼트5호기</option>
				    <option value="S0600">쇼트6호기</option>
				    <option value="G03-GG03">G600</option>
				    <option value="G03-GG01" selected>G800</option> <!-- 🔹 기본 선택값 -->
				    <option value="G04-GG05">K-BLACK</option>
				    <option value="G04-GG07">공용설비</option>
				</select>

                <button class="select-button" onclick="loadWorkDailyData()">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>

                <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>

                <button class="delete-button">
                    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
                </button>

                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">Download
                </button>
            </div>
        </div>

        <div class="view">
        <div style="display: flex; justify-content: center;">
		    <div id="table3"></div>
		</div>
        </div>
    </main>
</body>

<script>
let table3, selectedRowData;
let now_page_code = "c04";

$(function() {
    const today = new Date();

    // 오늘 ISO 문자열
    const todayISO = today.toISOString().split('T')[0]; // yyyy-mm-dd

    // 이번 달 1일
    const firstDayOfMonth = todayISO.substring(0, 8) + '01';

    $('#s_time').val(firstDayOfMonth); // 이번 달 1일
    $('#e_time').val(todayISO);        // 오늘

    initTables();
    loadWorkDailyData();

    // 설비 선택 시 자동 조회
    $('#m_code').change(function() {
        loadWorkDailyData();
    });
});


// 추가 버튼 클릭
$('.insert-button').click(function() {
    const startDate = $('#s_time').val();
    selectedRowData = null;
    $('#corrForm')[0].reset();

    if (startDate) {
        const formattedDate = startDate.replace(/-/g, '') + '0900';
        $('input[name="input_date"]').val(formattedDate);
    }
});

// 테이블 초기화
function initTables() {
    table3 = new Tabulator("#table3", {
        height: "670px",
        layout: "fitColumns",
        headerHozAlign: "center",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        columnDefaults: {
            hozAlign: "center",
            headerTooltip: false
        },
        columns: [
            { title: "NO", formatter: "rownum", hozAlign: "center", headerSort: false, width: 60 },
            { title: "등록일자", field: "maint_date", hozAlign: "center", headerSort: false, width: 110 },
            { title: "공정명", field: "segment_id", hozAlign: "center", headerSort: false, width: 110 },
            { title: "설비명", field: "equipment_id", hozAlign: "center", headerSort: false, width: 110 },
            { title: "점검항목", field: "maint_item_name_ko_kr", headerSort: false, width: 250 },
            { title: "방법", field: "ss", hozAlign: "center", headerSort: false, width: 100 },
            { title: "기준값", field: "maint_target",  headerSort: false, width: 250 },
            { title: "상한값", field: "maint_usl", hozAlign: "center", headerSort: false, width: 90 },
            { title: "하한값", field: "maint_lsl", hozAlign: "center", headerSort: false, width: 90 },
            { title: "측정값", field: "maint_value", hozAlign: "center", headerSort: false, width: 90 },
           // { title: "D 결과", field: "d_result", hozAlign: "center", headerSort: false, width: 100 },
            { title: "결과", field: "e_result", hozAlign: "center", headerSort: false, width: 90 }
        ]


    });
}

// 조회 Ajax
function loadWorkDailyData() {
    let s_time = $("#s_time").val();
    let e_time = $("#e_time").val();
    let m_code = $("#m_code").val(); // 선택 설비 값

    console.log("보내는 값 (table3 조회):", { s_time, e_time, m_code });

    $.ajax({
        type: "POST",
        url: "/geomet/condition/dailyCheck/list",
        contentType: "application/json",
        data: JSON.stringify({ s_time, e_time, m_code }),
        success: function(response) {
            if (!response || !response.table3) {
                console.warn("서버 응답에 table3이 없습니다:", response);
                table3.setData([]);
                return;
            }
            table3.setData(response.table3);
        },
        error: function(xhr, status, error) {
            console.error("에러 응답:", xhr.responseText);
            alert("조회에 실패했습니다.");
        }
    });
}

// 엑셀 버튼 클릭
$(".excel-button").on("click", function () {
    $("#excelOverlay, #excelLoading").show();

    let s_time = $("#s_time").val().replaceAll("-", "");
    let e_time = $("#e_time").val().replaceAll("-", "");
    let m_code = $("#m_code").val(); // 선택 설비 값

    $.ajax({
        url: "/geomet/work/workDailyReport_600/excel",
        method: "POST",
        contentType: "application/json",
        data: { s_time, e_time, m_code },
        dataType: "json",
        success: function (result) {
            console.log("▶ 서버가 돌려준 result:", result);

            if (result && result.downloadPath) {
                const downloadUrl = result.downloadPath;
                const a = document.createElement('a');
                a.href = downloadUrl;
                a.style.display = 'none';
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);

                alert("작업일보 엑셀 저장 완료되었습니다.");
            } else {
                console.warn("✋ downloadPath 키가 없습니다!", result);
                alert("엑셀 생성 오류: 다운로드 경로가 전달되지 않았습니다.");
            }
        },
        error: function (xhr, status, error) {
            console.error("▶ 엑셀 생성/다운로드 중 오류:", {
                status: status,
                error: error,
                responseText: xhr.responseText
            });
            alert("엑셀 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
        },
        complete: function () {
            $("#excelOverlay, #excelLoading").hide();
        }
    });
});
</script>

</body>
</html>
