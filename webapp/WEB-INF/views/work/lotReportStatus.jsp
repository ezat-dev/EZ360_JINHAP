<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TC교체이력</title>
<%@include file="../include/pluginpage.jsp" %>  
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
  
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
		    width: 99%;
		    margin-bottom: 3px;
		    margin-top: 25px;
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
		    width: 1000px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .mach_code {
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
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
              <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">검색일자 :</label>
				<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
	  			<label class="daylabel">바코드_NO :</label>
	     		<input type="text" autocomplete="off" class="barcode_no" id="barcode_no"
		       	style="font-size: 16px; margin-bottom:10px; height: 30px; border-radius: 6px; border: 1.5px solid #ccc;" 
		       	placeholder="바코드->lot">


			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
             
                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>

            </div>
        </div>


       <div class="view">       
         <div id="dataList2" style="margin-top:10px;"></div>
       </div>
    </main>
	


   <script>
let now_page_code = "g01";

$(function() {
    var today = new Date();

    // 1일 전 날짜 계산
    var oneDayAgo = new Date(today);
    oneDayAgo.setDate(today.getDate() - 1);

    function formatDate(date) {
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "-" + month + "-" + day;
    }

    $('#startDate').val(formatDate(oneDayAgo)); // 어제
    $('#endDate').val(formatDate(today));       // 오늘

    getDataList2();
});




function getDataList2() {
    if (window.dataTable2) {
        dataTable2.setData("/geomet/work/lotReportStatusList", {
            startDate: $('#startDate').val(),
            endDate: $('#endDate').val(),
            barcode_no: $('#barcode_no').val()
        });
        return;
    }
    dataTable2 = new Tabulator("#dataList2", {
        height: "800px",
        layout: "fitColumns",
        ajaxURL: "/geomet/work/lotReportStatusList", // <- 여기 추가
        ajaxConfig: {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            }
        },
        ajaxParams: {
            startDate: $('#startDate').val(),
            endDate: $('#endDate').val(),
            barcode_no: $('#barcode_no').val()
                
        },
        ajaxRequestFunc: function(url, config, params) {
            return fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(params)
            }).then(response => response.json());
        },
        placeholder: "조회된 데이터가 없습니다.",
        columnHeaderVertAlign: "middle",
        headerHozAlign: "center",
        columns: [
        	  { title: "N", formatter: "rownum", hozAlign: "center", width: 50 },
        	  {
                  title: "barcode_no",
                  field: "barcode_no",
                  hozAlign: "left",
                  width: 120,
                  headerFilter: "input",
                  headerFilterPlaceholder: "바코드 검색"
              },
              {
                  title: "제품CODE",
                  field: "item_cd",
                  hozAlign: "left",
                  width: 140,
                  headerFilter: "input",
                  headerFilterPlaceholder: "제품코드 검색"
              },
        	  { title: "제품명", field: "item_nm", hozAlign: "left", width: 250 },
        	  { title: "세척 시작", field: "w_s", hozAlign: "left", width: 230 },
        	  { title: "세척 종료", field: "w_e", hozAlign: "left", width: 230 },
        	  { title: "쇼트 시작", field: "s_s", hozAlign: "left", width: 230 },
        	  { title: "쇼트 종료", field: "s_e", hozAlign: "left", width: 230 },
        	  { title: "GEOMET 시작", field: "g_s", hozAlign: "left", width: 230 },
        	  { title: "GEOMET 종료", field: "g_e", hozAlign: "left", width: 230 },
        	  { title: "공용설비 시작", field: "mlpl_s", hozAlign: "left", width: 230 },
        	  { title: "공용설비 종료", field: "mlpl_e", hozAlign: "left", width: 230 },
        	],

        ajaxResponse: function (url, params, response) {
            console.log("dataList2 서버에서 받은 응답:", response);
            return response;
        }
    });
}

$(document).on("click", ".excel-button", function () {

    if (!window.dataTable2) {
        alert("엑셀로 다운로드할 데이터가 없습니다.");
        return;
    }

    const startDate = $('#startDate').val();
    const endDate   = $('#endDate').val();

    const fileName = `LOT_리포트_${startDate}_${endDate}.xlsx`;

    dataTable2.download("xlsx", fileName, {
        sheetName: "LOT_REPORT",
    });
});




// 조회 버튼 클릭 시 두 테이블 모두 조회
$('.select-button').on('click', function() {

    getDataList2();
});
</script>
</body>
</html>