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
    let selectedDate = $('#s_time').val(); // yyyy-mm-dd 형식
    if (!selectedDate) {
        alert("날짜를 선택해주세요.");
        return;
    }

    // 날짜에서 하이픈 제거: yyyyMMdd 형식
    let s_time = selectedDate.replace(/-/g, "");

    // 다음 날 계산
    let dateObj = new Date(selectedDate);
    dateObj.setDate(dateObj.getDate() + 1);
    let nextDate = dateObj.toISOString().split('T')[0].replace(/-/g, "");
    let e_time = nextDate;

    $.ajax({
        type: "POST",
        url: "/geomet/work/machinePerformStatus/list",
        contentType: "application/json",
        data: JSON.stringify({ s_time, e_time }),
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


    $(function() {
        const today = new Date().toISOString().split('T')[0];
        $('#s_time').val(today);
        initTables();
        loadWorkDailyData();
    });


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
    	        { title: "투입중량", field: "std_weight", hozAlign: "center", headerSort: false },
    	        { title: "C/T", field: "c_t", hozAlign: "center", headerSort: false },
    	        { title: "분할<br>횟수", field: "aa", hozAlign: "center", headerSort: false },
    	        { title: "작업횟수<br>(코팅)", field: "bb", hozAlign: "center", headerSort: false },
    	        { title: "가동일수", field: "work_day", hozAlign: "center", headerSort: false },
    	        { title: "부여시간<br>(hr)", field: "set_hr", hozAlign: "center", headerSort: false },
    	        { title: "목표 가동시간", field: "mok_hr", hozAlign: "center", headerSort: false },
    	        {
    	            title: "일 생산실적 현황<br>(ton)",
    	            columns: [
    	                { title: "CAPA_일", field: "capa_day", hozAlign: "center", headerSort: false },
    	                { title: "생산실적", field: "day_ton", hozAlign: "center", headerSort: false },
    	                { title: "달성율", field: "percent_day", hozAlign: "center", headerSort: false },
    	                { title: "과부족량", field: "bujok_day", hozAlign: "center", headerSort: false }
    	            ]
    	        },
    	        {
    	            title: "진도일(율) 대비 생산실적<br>(ton)",
    	            columns: [
    	                { title: "CAPA_월", field: "capa_month", hozAlign: "center", headerSort: false },
    	                { title: "누적<br>capa", field: "capa_sum", hozAlign: "center", headerSort: false },
    	                { title: "누적<br>생산실적", field: "cc", hozAlign: "center", headerSort: false },
    	                { title: "달성율", field: "dd", hozAlign: "center", headerSort: false },
    	                { title: "누적<br>과부족량", field: "ee", hozAlign: "center", headerSort: false }
    	            ]
    	        }
    	    ]
    	});



    	
    	table3 = new Tabulator("#table3", {
    	    height: "400px",
    	    layout: "fitColumns",
    	    headerHozAlign: "center",

    	    columns: [
    	        {
    	            title: "목표",
    	            columns: [
    	            	{ title: "설비", field: "facility_name", hozAlign: "center", headerSort: false },
    	    	        
    	                { title: "가동시간", field: "work_time",hozAlign: "center", headerSort: false },
    	                { title: "통/HR", field: "tong",hozAlign: "center", headerSort: false },
    	                { title: "통/Shift", field: "a1",hozAlign: "center", headerSort: false },
    	                { title: "계획량/일", field: "a2",hozAlign: "center", headerSort: false }
    	            ]
    	        },
    	        {
    	            title: "운영계획</br>(실제 가동시간 기준)",
    	            columns: [
    	                { title: "비가동시간", field: "a3",hozAlign: "center", headerSort: false },
    	                { title: "실 가동시간", field: "a4",hozAlign: "center", headerSort: false },
    	                { title: "목표", field: "a5",hozAlign: "center", headerSort: false }
    	            ]
    	        },
    	        {
    	            title: "실적(통)",
    	            columns: [
    	                { title: "주간", field: "tong_day",hozAlign: "center", headerSort: false },
    	                { title: "야간", field: "tong_night",hozAlign: "center", headerSort: false },
    	                { title: "합계", field: "tong_sum",hozAlign: "center", headerSort: false },
    	                {
    	                    title: "달성율",
    	                    columns: [
    	                        { title: "목표", field: "a6",hozAlign: "center", headerSort: false },
    	                        { title: "운영계획", field: "a7",hozAlign: "center", headerSort: false }
    	                    ]
    	                },
    	                {
    	                    title: "과부족",
    	                    columns: [
    	                        { title: "목표", field: "a8",hozAlign: "center", headerSort: false },
    	                        { title: "운영계획", field: "a9",hozAlign: "center", headerSort: false }
    	                    ]
    	                }
    	            ]
    	        },
    	        {
    	            title: "손실(운영계획 대비)",
    	            columns: [
    	                { title: "통", field: "a10",hozAlign: "center", headerSort: false },
    	                { title: "중량(톤)", field: "a11", headerSort: false },
    	                {
    	                    title: "손실시간",
    	                    columns: [
    	                        { title: "시간", field: "a12", headerSort: false },
    	                        { title: "분", field: "a13", headerSort: false }
    	                    ]
    	                }
    	            ]
    	        }
    	    ]
    	});
    } 

  $(function() {
    $('#s_time').val(new Date().toISOString().split('T')[0]);
    initTables();
    loadWorkDailyData();
  });


</script>

</body>
</html>
