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
	    .table-section {
		  margin-bottom: 30px;
		  padding: 15px;
		  background: #fafafa;
		  border: 1px solid #ddd;
		  border-radius: 12px;
		  box-shadow: 0 2px 6px rgba(0,0,0,0.08);
		}
		
		.table-title {
		  font-size: 18px;
		  font-weight: bold;
		  margin-bottom: 12px;
		  color: #333;
		  border-left: 6px solid #4a90e2;
		  padding-left: 10px;
		}
	    
</style>
</head>

<body>
<main class="main">

  <div class="tab">
    <div class="button-container">
      <div class="box1"></div>

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

    <div class="table-section">
      <h3 class="table-title">① 생산실적</h3>
      <div id="dataList1"></div>
    </div>

    <div class="table-section">
      <h3 class="table-title">② 비가동현황</h3>
      <div id="dataList2"></div>
    </div>

    <div class="table-section">
      <h3 class="table-title">③ 설비에러 발생 현황</h3>
      <div id="dataList3"></div>
    </div>

    <div class="table-section">
      <h3 class="table-title">④ SPARE 및 소모품 관리 필요 품목</h3>
      <div id="dataList4"></div>
    </div>

  </div>
</main>



  <script>
let now_page_code = "a06";
let dataTable1;
let dataTable2;
let dataTable3;
let dataTable4;
// DOMContentLoaded 시 초기화
document.addEventListener("DOMContentLoaded", function() {
    $('#startDate').val(new Date().toISOString().split('T')[0]);
    getDataList1();
    getDataList2();
    getDataList3();
    getDataList4();  // 4번 테이블 추가
});

$('.select-button').click(function() {
    getDataList1();
    getDataList2();
    getDataList3();
    getDataList4();  // 4번 테이블 추가
});


// ----------------- 데이터 테이블 1 -----------------
function getDataList1() {
    if (dataTable1) dataTable1.destroy();

    dataTable1 = new Tabulator("#dataList1", {
        height: "400px",
        width: "580px",
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
        ajaxURL: "/geomet/work/workReport/list1",
        ajaxParams: {
            start_time: $("#startDate").val() || "",
        },
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function (url, params, response) {
            return response.data1 || [];
        },
        columns: [
            { title: "ch_idx", field: "ch_idx", visible: false },
            { title: "설비명", field: "facility_name", hozAlign: "center", width: 200 },
            { title: "목표작업 통수", field: "target_weight", hozAlign: "center", width: 200,
              formatter: function(cell) {
                  let value = cell.getValue();
                  return value != null ? value.toLocaleString() : "";
              }
            },
            { title: "일작업 통수", field: "work_tong", hozAlign: "center", width: 200 },
            { title: "일생산 중량(Kg)", field: "now_weight", hozAlign: "center", width: 320,
              formatter: function(cell) {
                  let value = cell.getValue();
                  return value != null ? value.toLocaleString() : "";
              }
            },
            { title: "달성률(%)", field: "per", hozAlign: "left",
              formatter: "progress",
              formatterParams: {
                  min: 0,
                  max: 100,
                  color: ["#FFAAAA", "#B7EB8F"],
                  legend: true,
                  legendFormatter: function(cell) {
                      let value = cell.getValue() * 100;
                      return value.toFixed(1) + "%";
                  }
              }
            }
        ]
    });
}

// ----------------- 데이터 테이블 2 -----------------
function getDataList2() {
    const RESOURCE_ID_MAP = {
        "W0100": "세척 1호기",
        "G01-GW21": "세척 2호기",
        "S0100": "쇼트 1호기",
        "S0200": "쇼트 2호기",
        "S0300": "쇼트 3호기",
        "S0400": "쇼트 4호기",
        "50500": "쇼트 5호기",
        "S0600": "쇼트 6호기",
        "G03-GG03": "G600",
        "G03-GG01": "G800",
        "G04-GG05": "K-BLACK",
        "G04-GG07": "공용설비",
        "G04-GG04": "공용설비"
    };

    if (dataTable2) dataTable2.destroy();

    dataTable2 = new Tabulator("#dataList2", {
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
        ajaxURL: "/geomet/work/workReport/list2",
        ajaxParams: { start_time: $("#startDate").val() || "" },
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function (url, params, response) {
            return response.data3 || [];
        },
        columns: [
            { title: "설비", field: "resourceID", hozAlign: "center", width: 200,
              formatter: function(cell) {
                  const val = cell.getValue();
                  return RESOURCE_ID_MAP[val] || val;
              }
            },
            { title: "발생건수", field: "cnt", hozAlign: "center", width: 200 },
            { title: "발생시간(분)", field: "downtime", hozAlign: "center", width: 200 },
            { title: "내용", field: "downtime_name" }
        ]
    });
}

// ----------------- 데이터 테이블 3 -----------------
function getDataList3() {
    if (dataTable3) dataTable3.destroy();

    dataTable3 = new Tabulator("#dataList3", {
        height: "200px",
        width: "500px",
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
        ajaxParams: { start_time: $("#startDate").val() || "" },
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function (url, params, response) {
            return response.data3 || [];
        },
        columns: [
            { title: "id", field: "id", visible: false },
            { title: "test_num", field: "test_num", visible: false },
            { title: "설비명", field: "facility_name", hozAlign: "center", width: 200 },
            { title: "에러 내용", field: "err_name", width: 400 },
            { title: "에러 횟수", field: "err_count", hozAlign: "center", width: 200 },
            { title: "총 시간(초)", field: "total_seconds", hozAlign: "center", width: 200 },
            { title: "총 시간(시분초)", field: "total_time_hms", hozAlign: "center", width: 200 }
        ]
    });
}

function getDataList4() {
    if (dataTable4) dataTable4.destroy();

    dataTable4 = new Tabulator("#dataList4", {
        height: "440px",
        layout: "fitColumns",
        ajaxURL: "/geomet/work/workReport/list4",
        ajaxConfig: "POST",
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function(url, params, response) {
            console.log("서버 응답:", response);
            if (!response.data4 || !Array.isArray(response.data4)) return [];
            // null이 섞인 경우 제거
            return response.data4.filter(item => item !== null);
        },
        columns: [

            { title: "일자", field: "work_date", hozAlign: "center" },   
            { title: "설비명", field: "equipment_name", hozAlign: "center" },
            { title: "부품명", field: "category_mid", hozAlign: "center" },
            { title: "사용처", field: "category_sub", hozAlign: "center" },
            { title: "규격", field: "part_name", hozAlign: "center" },
            { title: "필요 수량", field: "purchase_qty", hozAlign: "center" }
        ]
    });
}
</script>

</body>
</html>

