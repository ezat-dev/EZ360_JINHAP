<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비별 모니터링</title>
<link rel="stylesheet" href="/geomet/css/searchBar/searchBar.css">
<%@include file="../include/pluginpage.jsp" %> 
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
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.3s ease-in-out;
        }
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	       
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
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover {
            background-color: #a9a9a9;
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
        
        
.legend {
  position: absolute;
  top: 20px;
  right: 40px;
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 6px;
  padding: 10px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  
  display: flex;         
  gap: 12px;              
}

.legend-item {
  display: flex;
  align-items: center;
  margin: 0;               
}

.legend-color {
  width: 14px;
  height: 14px;
  border-radius: 2px;
  margin-right: 6px;
}

    .color-red        { background: red;        }
    .color-orange     { background: orange;     }
    .color-yellow     { background: yellow;     }
    .color-lightgreen { background: #13ac13; }
        
   #dataList .tabulator-tableHolder .tabulator-row {
    height: 37px !important;
     font-size: 17px !important;
  }

  #dataList .tabulator-tableHolder .tabulator-cell {
    line-height: 37px !important;
     font-size: 17px !important;
  }

  #dataList .tabulator-tableHolder .tabulator-header .tabulator-col {
    height: 37px !important;
    line-height: 37px !important;
     font-size: 17px !important;
  }
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

	<div class="legend">
	  <div class="legend-item">
	    <div class="legend-color color-red"></div> 0~25%
	  </div>
	  <div class="legend-item">
	    <div class="legend-color color-orange"></div> 26~50%
	  </div>
	  <div class="legend-item">
	    <div class="legend-color color-yellow"></div> 51~75%
	  </div>
	  <div class="legend-item">
	    <div class="legend-color color-lightgreen"></div> 76~100%
	  </div>
	</div>


        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	
	 


    <script>

    let now_page_code = "a02";
    $(function() {
        getDataList();
    });

    function getDataList() {
        dataTable = new Tabulator("#dataList", {
            height: "760px",
            layout: "fitColumns",
            rowHeight: 44, // 행 높이 추가
            selectable: true,
            tooltips: true,
            selectableRangeMode: "click",
            reactiveData: true,
            headerHozAlign: "center",
            ajaxConfig: "POST",
            ajaxLoader: false,
            ajaxURL: "/geomet/quality/tustest/selectList",
            ajaxProgressiveLoad: "scroll",
            ajaxParams: {},
            placeholder: "조회된 데이터가 없습니다.",
            paginationSize: 20,
            ajaxResponse: function(url, params, response) {
                $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                return response;
            },
            columns: [
            	  // 1) 일일 생산 현황 그룹
            	  {
            	    title: "일일 생산 현황",
            	    hozAlign: "center",
            	    headerSort: false,
            	    colspan: 6, // 묶을 서브 컬럼 수
            	    columns: [
            	      { title: "설비명",     field: "field1", hozAlign: "center", width: 110 },
            	      { title: "목표 생산량", field: "field2", hozAlign: "center", width: 120 },
            	      { title: "현재 생산량", field: "field3", hozAlign: "center", width: 120 },
            	      { 
            	    	    title: "진도율%", 
            	    	    field: "field4", 
            	    	    formatter: "progress", 
            	    	    formatterParams: {
            	    	      min: 0,
            	    	      max: 100,
            	    	      color: function(value){
            	    	        if(value <= 25)   { return "red";    }  // 0~25 : 빨강
            	    	        else if(value <= 50) { return "orange"; }  // 26~50 : 주황
            	    	        else if(value <= 75) { return "yellow"; }  // 51~75 : 노랑
            	    	        else                { return "#13ac13";  }  // 76~100 : 초록
            	    	      }
            	    	    },
            	    	   
            	    	    width: 200 
            	    	  },
            	    	  { 
            	    	    title: "달성률%", 
            	    	    field: "field5", 
            	    	    formatter: "progress", 
            	    	    formatterParams: {
            	    	      min: 0,
            	    	      max: 100,
            	    	      color: function(value){
            	    	        if(value <= 25)   { return "red";    }
            	    	        else if(value <= 50) { return "orange"; }
            	    	        else if(value <= 75) { return "yellow"; }
            	    	        else                { return "#13ac13";  }
            	    	      }
            	    	    },
            	    	
            	    	    width: 200 
            	    	  },
            	    	  { 
            	    	    title: "버스켓효율%", 
            	    	    field: "field6", 
            	    	    formatter: "progress", 
            	    	    formatterParams: {
            	    	      min: 0,
            	    	      max: 100,
            	    	      color: function(value){
            	    	        if(value <= 25)   { return "red";    }
            	    	        else if(value <= 50) { return "orange"; }
            	    	        else if(value <= 75) { return "yellow"; }
            	    	        else                { return "#13ac13";  }
            	    	      }
            	    	    },
            	    	 
            	    	    width: 200 
            	    	  },
            	    ]
            	  },

            	  // 2) 제품 투입 그룹
            	  {
            	    title: "제품 투입",
            	    hozAlign: "center",
            	    headerSort: false,
            	    colspan: 3,
            	    columns: [
            	      { title: "바코드",      field: "field7", hozAlign: "center", width: 130 },
            	      { title: "투입 시간",   field: "field8", hozAlign: "center", width: 160 },
            	      { title: "기준 장입량", field: "field9", hozAlign: "center", width: 120 },
            	    ]
            	  },

            	  // 3) 제품 퇴출 그룹
            	  {
            	    title: "제품 퇴출",
            	    hozAlign: "center",
            	    headerSort: false,
            	    colspan: 4,
            	    columns: [
            	      { title: "분할 기준량",  field: "field10", hozAlign: "center", width: 130 },
            	      { title: "바코드(퇴출)", field: "field11", hozAlign: "center", width: 130 },
            	      { title: "코팅횟수",     field: "field12", hozAlign: "center", width: 95 },
            	      { title: "합 중량",      field: "field13", hozAlign: "center", width:  90 },
            	    ]
            	  }
            	],


           
            
            rowFormatter: function(row) {
                var data = row.getData();
                row.getElement().style.fontWeight = "700";
                row.getElement().style.backgroundColor = "#FFFFFF";
            },
            rowClick: function(e, row) {
                $("#dataList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item) {
                    if ($(this).hasClass("row_select")) {
                        $(this).removeClass('row_select');
                        row.getElement().className += " row_select";
                    } else {
                        $("#dataList div.row_select").removeClass("row_select");
                        row.getElement().className += " row_select";
                    }
                });
            },
            data: [
                { field1: "세척1호기", field2: 100, field3: 950, field4: 45, field5: 90, field6: 92, field7: "123456", field8: "2025-05-01 10:00", field9: 500, field10: 200, field11: "654321", field12: 3, field13: 200 },
                { field1: "세척2호기", field2: 110, field3: 1050, field4: 87, field5: 91, field6: 85, field7: "234567", field8: "2025-05-01 11:00", field9: 600, field10: 250, field11: "765432", field12: 4, field13: 220 },
                { field1: "쇼트1호기", field2: 90, field3: 1180, field4: 20, field5: 85, field6: 95, field7: "345678", field8: "2025-05-01 12:00", field9: 700, field10: 300, field11: "876543", field12: 2, field13: 240 },
                { field1: "쇼트2호기", field2: 120, field3: 1280, field4: 78, field5: 93, field6: 87, field7: "456789", field8: "2025-05-01 13:00", field9: 800, field10: 350, field11: "987654", field12: 5, field13: 260 },
                { field1: "쇼트3호기", field2: 75, field3: 1370, field4: 82, field5: 88, field6: 90, field7: "567890", field8: "2025-05-01 14:00", field9: 900, field10: 400, field11: "109876", field12: 6, field13: 280 },
                { field1: "쇼트4호기", field2: 95, field3: 1400, field4: 92, field5: 91, field6: 44, field7: "678901", field8: "2025-05-01 15:00", field9: 950, field10: 450, field11: "210987", field12: 7, field13: 300 },
                { field1: "쇼트5호기", field2: 80, field3: 1480, field4: 70, field5: 84, field6: 55, field7: "789012", field8: "2025-05-01 16:00", field9: 1000, field10: 500, field11: "321098", field12: 8, field13: 320 },
                { field1: "쇼트6호기", field2: 90, field3: 1560, field4: 85, field5: 92, field6: 37, field7: "890123", field8: "2025-05-01 17:00", field9: 1050, field10: 550, field11: "432109", field12: 9, field13: 340 },
             
                { field1: "G-800", field2: 85, field3: 1750, field4: 93, field5: 89, field6: 97, field7: "112233", field8: "2025-05-01 19:00", field9: 1150, field10: 650, field11: "654321", field12: 11, field13: 380 },
                { field1: "G-600", field2: 105, field3: 1850, field4: 97, field5: 90, field6: 93, field7: "223344", field8: "2025-05-01 20:00", field9: 1200, field10: 700, field11: "765432", field12: 12, field13: 400 },
                { field1: "PLUS", field2: 70, field3: 1300, field4: 83, field5: 88, field6: 92, field7: "334455", field8: "2025-05-01 21:00", field9: 1300, field10: 750, field11: "876543", field12: 13, field13: 420 },
                { field1: "ML", field2: 60, field3: 1400, field4: 89, field5: 95, field6: 94, field7: "445566", field8: "2025-05-01 22:00", field9: 1400, field10: 800, field11: "987654", field12: 14, field13: 440 },
                { field1: "K-BLACK", field2: 95, field3: 1500, field4: 92, field5: 97, field6: 90, field7: "556677", field8: "2025-05-01 23:00", field9: 1500, field10: 850, field11: "109876", field12: 15, field13: 460 },
               
                { field1: "방청", field2: 90, field3: 1800, field4: 85, field5: 89, field6: 90, field7: "889900", field8: "2025-05-02 02:00", field9: 1800, field10: 1000, field11: "432109", field12: 18, field13: 520 }
                
            ]
        });
    }
</script>


</body>
</html>
