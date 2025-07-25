<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>설비별 생산실적</title>
<style>
    .tab {
        width: 99%;
        margin-bottom: 37px;
        margin-top: 5px;
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
        display: none;
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
</style>



</head>
<body>
  <main>
   		
        

  
     <div class="tab">
	     <h2>설비별 생산실적</h2>
	     <div class="tab-controls">
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>

                
	
		</div>
	</div>

        <div class="view">
            <div id="table1"></div>
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>
    

<script>
let now_page_code = "b01";

function loadWorkDailyData() {
    let selectedDate = $('#s_time').val();
    if (!selectedDate) {
        alert("날짜를 선택해주세요.");
        return;
    }

    let s_time = selectedDate.replace(/-/g, "");
    let dateObj = new Date(selectedDate);
    dateObj.setDate(dateObj.getDate() + 1);
    let nextDate = dateObj.toISOString().split('T')[0].replace(/-/g, "");
    let e_time = nextDate;

    // 보낼 데이터 구성
    const payload = { s_time, e_time };

    // 콘솔 출력
    console.log("서버로 전송할 데이터:", payload);

    $.ajax({
        type: "POST",
        url: "/geomet/work/machinePerformStatus/list",
        contentType: "application/json",
        data: JSON.stringify(payload),
        success: function(response) {
            console.log("받아온 데이터:", response);
            table2.setData(response.table2);
            table3.setData(response.table3);
        },
        error: function(xhr, status, error) {
            console.error("에러 응답:", xhr.responseText);
            alert("조회에 실패했습니다.");
        }
    });
}


function customRedFormatter(cell) {
    let value = cell.getValue();
    if (value == null || value === "") return "";
    const strVal = String(value);
    if (strVal.includes("-")) {
        return "<span style='color:red'>" + strVal.replace("-", "") + "</span>";
    }
    return strVal;
}

function initTables() {
    table2 = new Tabulator("#table2", {
        height: "390px",
        layout: "fitColumns",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        headerHozAlign: "center",
        columns: [
            { title: "설비", field: "facility_name", hozAlign: "center", headerSort: false },
            { title: "설비코드", field: "mach_code", hozAlign: "center", headerSort: false },
            { title: "표준중량", field: "std_weight", hozAlign: "center", headerSort: false },
            { title: "C/T", field: "c_t", hozAlign: "center", headerSort: false },
            { title: "분할<br>횟수", field: "aa", hozAlign: "center", headerSort: false },
            { title: "작업횟수<br>(코팅)", field: "bb", hozAlign: "center", headerSort: false },
            { title: "가동일수", field: "work_day", hozAlign: "center", headerSort: false },
            { title: "부여시간<br>(hr)", field: "set_hr", hozAlign: "center", headerSort: false },
            { title: "목표<br>가동시간", field: "mok_hr", hozAlign: "center", headerSort: false },
            {
                title: "일 생산실적 현황",
                columns: [
                    { title: "CAPA_일</br>(ton)", field: "capa_day", hozAlign: "center", headerSort: false },
                    { title: "생산실적</br>(ton)", field: "day_ton", hozAlign: "center", headerSort: false },
                    { title: "달성율</br>(%)", field: "percent_day", hozAlign: "center", headerSort: false },
                    { title: "과부족량</br>(ton)", field: "bujok_day", hozAlign: "center", headerSort: false, formatter: customRedFormatter }
                ]
            },
            {
                title: "진도일(율) 대비 생산실적",
                columns: [
                    { title: "CAPA_월</br>(ton)", field: "capa_month", hozAlign: "center", headerSort: false,formatter: customRedFormatter },
                    { title: "누적<br>capa</br>(ton)", field: "capa_sum", hozAlign: "center", headerSort: false,formatter: customRedFormatter },
                    { title: "누적<br>생산실적</br>(ton)", field: "month_ton", hozAlign: "center", headerSort: false,formatter: customRedFormatter },
                    { title: "달성율</br>(%)", field: "percent_month", hozAlign: "center", headerSort: false,formatter: customRedFormatter },
                    { title: "누적<br>과부족량</br>(ton)", field: "bujok_month", hozAlign: "center", headerSort: false,formatter: customRedFormatter }
                ]
            }
        ]
    });

    table3 = new Tabulator("#table3", {
        height: "400px",
        layout: "fitColumns",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        headerHozAlign: "center",
        columns: [
            {
                title: "목표",
                columns: [
                    { title: "설비", field: "facility_name", hozAlign: "center", headerSort: false, rowVertAlign: "middle" },
                    { title: "목표<br/>가동시간", field: "c_min", hozAlign: "center", headerSort: false },
                    { title: "시간당<br/>생산량(통)", field: "d", hozAlign: "center", headerSort: false },
                    { title: "조별 생산<br/>CAPA(통)", field: "e", hozAlign: "center", headerSort: false },
                    { title: "일<br/>CAPA(통)", field: "f", hozAlign: "center", headerSort: false }
                ]
            },
            {
                title: "운영계획</br>(실제 가동시간 기준)",
                columns: [
                    { title: "실 가동시간", field: "h_min", hozAlign: "center", headerSort: false },
                    //{ title: "비가동시간", field: "g", hozAlign: "center", headerSort: false },
                    { title: "목표<br/>생산량(통)", field: "i", hozAlign: "center", headerSort: false }
                ]
            },
            {
                title: "실적(통)",
                columns: [
                    { title: "주간<br/>생산실적", field: "j", hozAlign: "center", headerSort: false },
                    { title: "야간<br/>생산실적", field: "k", hozAlign: "center", headerSort: false },
                    { title: "일 생산<br/>실적(통)", field: "l", hozAlign: "center", headerSort: false },
                    {
                        title: "달성율",
                        columns: [
                            { title: "운영 계획<br/>달성률", field: "m", hozAlign: "center", headerSort: false },
                            { title: "일 계획<br/>달성률", field: "n", hozAlign: "center", headerSort: false }
                        ]
                    },
                    {
                        title: "과부족",
                        columns: [
                            {
                                title: "CAPA 대비<br/>부족 통수",
                                field: "o",
                                hozAlign: "center",
                                headerSort: false,
                                formatter: customRedFormatter
                            },
                            {
                                title: "운영게획<br/>부족 통수",
                                field: "p",
                                hozAlign: "center",
                                headerSort: false,
                                formatter: customRedFormatter
                            }
                        ]
                    }
                ]
            },
            {
                title: "손실(운영계획 대비)",
                columns: [
                    {
                        title: "손실<br/>톤수(톤)",
                        field: "r",
                        hozAlign: "center",
                        headerSort: false,
                        formatter: customRedFormatter
                    },
                    {
                        title: "손실시간",
                        columns: [
                            {
                                title: "시간",
                                field: "s",
                                hozAlign: "center",
                                headerSort: false,
                                formatter: customRedFormatter
                            },
                            {
                                title: "분",
                                field: "t",
                                hozAlign: "center",
                                headerSort: false,
                                formatter: customRedFormatter
                            }
                        ]
                    },
                    {
                        title: "손실률%",
                        field: "u",
                        hozAlign: "center",
                        headerSort: false,
                        formatter: customRedFormatter
                    }
                ]
            }
        ]
    });
}

// ✅ 최종 한 번만 호출
$(function() {
    $('#s_time').val(new Date().toISOString().split('T')[0]);
    initTables();
    loadWorkDailyData();
});
</script>

</body>
</html>
