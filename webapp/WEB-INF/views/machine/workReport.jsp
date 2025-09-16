<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업무 보고서</title>

    <%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>
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

    .view {
        width: 80%;
        margin-left: 150px;

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
        	width: 88%;
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

    <main class="main">

        <div class="tab">
        

            <div class="button-container">
            
           <div class="box1">
           
       
           
         </div>
                              <label class="daylabel">검색일자 :</label>
                    <input type="text" 
                           autocomplete="off" 
                           class="daySet" 
                           id="startDate" 
                           style="font-size: 16px; margin-bottom:10px;" 
                           placeholder="날짜 선택">
     

                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
          <button class="excel-button">
               <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
            </button>
         
            </div>
        </div>

        <div class="view">
            <div id="dataList1"></div>
            <div id="dataList2"></div>
            <div id="dataList3"></div>
            <div id="dataList4"></div>
            
        </div>
    </main>
   
    


    <script>

    let now_page_code = "a06";
    let dataTable3;
    getDataList3();
    // 조회 버튼 클릭 시
    $('.select-button').click(function() {
        const selectedDate = $('#startDate').val();
        getDataList3();
    });


    document.addEventListener("DOMContentLoaded", function() {
    	   $('#startDate').val(new Date().toISOString().split('T')[0]);
    	 let selectedDate = $('#startDate').val();
    	    if (!selectedDate) {
    	        alert("날짜를 선택해주세요.");
    	        return;
    	    }

    	    let startDate = selectedDate.replace(/-/g, "");
    	    let dateObj = new Date(selectedDate);
    	    dateObj.setDate(dateObj.getDate() + 1);
    	    let nextDate = dateObj.toISOString().split('T')[0].replace(/-/g, "");
    	    let e_time = nextDate;
    	    getDataList3();

    	
        // 깡통 데이터
        const dummyData = [
            { facility: "세척 1호기", part: "", qty: "", due: "" },
            { facility: "세척 2호기", part: "", qty: "", due: "" },
            { facility: "세척 합계", part: "", qty: "", due: "" },
            { facility: "쇼드 1호기", part: "", qty: "", due: "" },
            { facility: "쇼드 2호기", part: "", qty: "", due: "" },
            { facility: "쇼드 3호기", part: "", qty: "", due: "" },
            { facility: "쇼드 4호기", part: "", qty: "", due: "" },
            { facility: "쇼드 5호기", part: "", qty: "", due: "" },
            { facility: "쇼드 6호기", part: "", qty: "", due: "" },
            { facility: "쇼드 합계", part: "", qty: "", due: "" },
            { facility: "G600", part: "", qty: "", due: "" },
            { facility: "G800", part: "", qty: "", due: "" },
            { facility: "GEO 합계", part: "", qty: "", due: "" },
            { facility: "공용설비", part: "", qty: "", due: "" },
            { facility: "K-BLACK", part: "", qty: "", due: "" }
        ];

        // Tabulator 생성
        const table = new Tabulator("#dataList4", {
            height: "500px",
            data: dummyData,
            layout: "fitColumns",
            columns: [
                { title: "설비", field: "facility", hozAlign: "center" },
                { title: "부품", field: "part", hozAlign: "center" },
                { title: "수량", field: "qty", hozAlign: "center" },
                { title: "납기", field: "due", hozAlign: "center" }
            ]
        });

    });





    

    
        function getDataList3() {
  	      dataTable3 = new Tabulator("#dataList3", {
	          height: "200px",
	          width: "600px",
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/work/workReport/list3",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              start_time: $("#startDate").val() || "",
	              //endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              $("#dataList3 .tabulator-col.tabulator-sortable");
	              return response.data3;
	          },
	          columns: [
	              { title: "id", field: "id", visible: false },
	              { title: "test_num", field: "test_num", visible: false },             
	              { title: "설비코드", field: "mach_code", hozAlign: "center", width: 200, headerSort: false },
	              { title: "설비명", field: "facility_name", hozAlign: "center", width: 200, headerSort: false },
	              { title: "에러 내용", field: "err_name", hozAlign: "center",  headerSort: false },
	              { title: "에러 횟수", field: "err_count", hozAlign: "center", width: 200, headerSort: false },
	              { title: "총 시간(초)", field: "total_seconds", hozAlign: "center", width: 200, headerSort: false },
	              { title: "총 시간(시분초)", field: "total_time_hms", hozAlign: "center", width: 200, headerSort: false }
	          ],
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_test_num = row.getData().test_num;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              dataTable3.getRows().forEach(function(r) {
	                  if (r.getData().test_num === clicked_test_num) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList3 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 test_num:", clicked_test_num);
	          }
	      });
        }


        
    </script>

</body>
</html>

