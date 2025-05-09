<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>1호기(G-600)</title>
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
	     <h2>1호기(G-600)</h2>
	    <div class="tab-controls">
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	          <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                      <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
                
	    </div>
	    <div id="m_code">G03-GG03</div>
	</div>

        <div class="view">
            <div id="table1"></div>
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>
    
<div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>작업일보</h2>
    <form id="corrForm" autocomplete="off">
      <label>설비</label>
      <input type="text" name="mch_name" value="G-600">
      <input type="text" name="mch_code" value="G03-GG03"style="display:none;">
 	  
 	  <label>날짜</label>
      <input type="text" name="input_date">

      <label>주간 / 야간</label>
      <select name="gb">
        <option value="주간">주간</option>
        <option value="야간">야간</option>
      </select>

      <label>점도(45±10초)</label>
      <input type="text" name="visc">

      <label>예열존온도(설정값±10℃)</label>
      <input type="text" name="pre_temp">

      <label>가열존온도(설정값±10℃)</label>
      <input type="text" name="heat_temp">

      <label>액온도(38℃ 이하)</label>
      <input type="text" name="liq_temp">

      <label>비중(1.43±0.05)</label>
      <input type="text" name="sg">

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>


<script>



  function loadWorkDailyData() {
      let s_time = $("#s_time").val().replaceAll("-", "");
      let e_time = s_time;
      let m_code = $("#m_code").text().trim();

      console.log("보내는 값:", { s_time, e_time, m_code });

      $.ajax({
        type: "POST",
        url: "/geomet/work/monitoringStatus/list",
        contentType: "application/json",
        data: JSON.stringify({ s_time, e_time, m_code }),
        success: function(response) {
//        	console.log(response);

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
    	    height: "420px",
    	    layout: "fitColumns",
    	    headerHozAlign: "center",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	        { title: "설비", field: "tong_day", hozAlign: "center", headerSort: false },
    	        { title: "설비코드", field: "weight_day", hozAlign: "center", headerSort: false },
    	        { title: "투입중량", field: "avg_day", hozAlign: "center", headerSort: false },
    	        { title: "C/T", field: "tong_sum", hozAlign: "center", headerSort: false },
    	        { title: "분할<br>횟수", field: "weight_sum", hozAlign: "center", headerSort: false },
    	        { title: "작업횟수<br>(코팅)", field: "avg_sum", hozAlign: "center", headerSort: false },
    	        { title: "가동일수", field: "work_time", hozAlign: "center", headerSort: false },
    	        { title: "부여시간<br>(hr)", field: "work_percent", hozAlign: "center", headerSort: false },
    	        { title: "목표 가동시간", field: "sum_time", hozAlign: "center", headerSort: false },
    	        {
    	            title: "일 생산실적 현황<br>(ton)",
    	            columns: [
    	                { title: "CAPA_일", field: "sum_percent", hozAlign: "center", headerSort: false },
    	                { title: "생산실적", field: "uph", hozAlign: "center", headerSort: false },
    	                { title: "달성율", field: "uph_day_rate", hozAlign: "center", headerSort: false },
    	                { title: "과부족량", field: "uph_day_gap", hozAlign: "center", headerSort: false }
    	            ]
    	        },
    	        {
    	            title: "진도일(율) 대비 생산실적<br>(ton)",
    	            columns: [
    	                { title: "CAPA_월", field: "month_capa", hozAlign: "center", headerSort: false },
    	                { title: "누적<br>capa", field: "capa_acc", hozAlign: "center", headerSort: false },
    	                { title: "누적<br>생산실적", field: "prod_acc", hozAlign: "center", headerSort: false },
    	                { title: "달성율", field: "prod_rate", hozAlign: "center", headerSort: false },
    	                { title: "누적<br>과부족량", field: "prod_gap", hozAlign: "center", headerSort: false }
    	            ]
    	        }
    	    ]
    	});



    	
    	table3 = new Tabulator("#table3", {
    	    height: "400px",
    	    layout: "fitColumns",
    	    headerHozAlign: "center",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	        {
    	            title: "목표",
    	            columns: [
    	                { title: "가동시간", field: "b", headerSort: false },
    	                { title: "통/HR", field: "c", headerSort: false },
    	                { title: "통/Shift", field: "d", headerSort: false },
    	                { title: "계획량/일", field: "e", headerSort: false }
    	            ]
    	        },
    	        {
    	            title: "운영계획</br>(실제 가동시간 기준)",
    	            columns: [
    	                { title: "비가동시간", field: "f", headerSort: false },
    	                { title: "실 가동시간", field: "g", headerSort: false },
    	                { title: "목표", field: "h", headerSort: false }
    	            ]
    	        },
    	        {
    	            title: "실적(통)",
    	            columns: [
    	                { title: "주간", field: "i", headerSort: false },
    	                { title: "야간", field: "j", headerSort: false },
    	                { title: "합계", field: "k", headerSort: false },
    	                {
    	                    title: "달성율",
    	                    columns: [
    	                        { title: "목표", field: "l", headerSort: false },
    	                        { title: "운영계획", field: "m", headerSort: false }
    	                    ]
    	                },
    	                {
    	                    title: "과부족",
    	                    columns: [
    	                        { title: "목표", field: "n", headerSort: false },
    	                        { title: "운영계획", field: "o", headerSort: false }
    	                    ]
    	                }
    	            ]
    	        },
    	        {
    	            title: "손실(운영계획 대비)",
    	            columns: [
    	                { title: "통", field: "p", headerSort: false },
    	                { title: "중량(톤)", field: "q", headerSort: false },
    	                {
    	                    title: "손실시간",
    	                    columns: [
    	                        { title: "시간", field: "r", headerSort: false },
    	                        { title: "분", field: "s", headerSort: false }
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
