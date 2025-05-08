<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쇼트 (4호기)</title>
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
	    padding: 6px 12px;
	    font-size: 19px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    width: 150px;
	    text-align: center;
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
</style>



</head>
<body>
  <main>
     <div class="tab">
	     <h2>쇼트(4호기)</h2>
	    <div class="tab-controls">
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	    </div>
	    <div id="m_code">S0400</div>
	</div>

        <div class="view">
           <!--  <div id="table1"></div> -->
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>

<script>
    let table1, table2, table3;

    function loadWorkDailyData() {
      let s_time = $("#s_time").val().replaceAll("-", "");
      let e_time = s_time;
      let m_code = $("#m_code").text().trim();

      console.log("보내는 값:", { s_time, e_time, m_code });

      $.ajax({
        type: "POST",
        url: "/geomet/work/workDailyReport/list",
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
    	 
      table1 = new Tabulator("#table1", {
        height: "115px",
        layout: "fitColumns",
        columns: [
          { title: "주간/야간", field: "gb" },
          { title: "점도", field: "visc" },
          { title: "점도", field: "visc" },
          { title: "예열존온도", field: "pre_temp" },
          { title: "가열존온도", field: "heat_temp" },
          { title: "액온도", field: "liq_temp" },
          { title: "비중", field: "sg" }
        ]
      });

      table2 = new Tabulator("#table2", {
        height: "115px",
        layout: "fitColumns",
        columns: [
          { title: "일 작업통수", field: "tong_day" },
          { title: "생산량", field: "weight_day" },
          { title: "평균생산중량", field: "avg_day" },
          { title: "누적 생산통수", field: "tong_sum" },
          { title: "누적 생산량", field: "weight_sum" },
          { title: "평균중량", field: "avg_sum" },
          { title: "가동시간", field: "work_time" },
          { title: "가동률", field: "work_percent" },
          { title: "월누적", columns: [
              { title: "가동시간", field: "sum_time" },
              { title: "가동율", field: "sum_percent" },
              { title: "UPH", field: "uph" },
              { title: "UPH(월누적)", field: "uph_sum" }
            ]
          }
        ]
      });

      table3 = new Tabulator("#table3", {
        height: "400px",
        layout: "fitColumns",
        columns: [
          { title: "순서", field: "r_num" },
          { title: "투입시간", field: "start_time" },
          { title: "완료시간", field: "end_time" },
          { title: "투입통수", field: "tong_day" },
          { title: "작업중량(kg)", field: "weight_day" },
      
          { title: "품명", field: "item_nm" },
          { title: "품번", field: "item_cd" },
       
          { title: "구분</br>(신규/재작업)", field: "e" },
          { title: "비고", field: "f" }
        ]
      });
    }

    
</script>

</body>
</html>
