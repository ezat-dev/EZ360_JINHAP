<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비가동현황</title>
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
        .view {
            display: flex;
            justify-content: center;
            margin-top: 1%;
             gap: 60px;
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
		    width: 900px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .equipmentName {
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
        .equipment_name{
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
	.excel-button {
	    margin-right: 30px;
	}
    </style>
</head>

<body>
<main class="main">
  <div class="tab">
    <div class="button-container">
      <label class="daylabel">시작일 :</label>
      <input type="text" 
             autocomplete="off" 
             class="daySet" 
             id="startDate" 
             style="font-size: 16px; margin-bottom:10px;" 
             placeholder="시작일 선택">

      <label class="daylabel">종료일 :</label>
      <input type="text" 
             autocomplete="off" 
             class="daySet" 
             id="endDate" 
             style="font-size: 16px; margin-bottom:10px;" 
             placeholder="종료일 선택">

      <button class="select-button">
        <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
      </button>
    </div>
  </div>

  <div class="view">
    <div class="table-section">
      <h3 class="table-title">② 비가동현황</h3>
      <div id="dataList2"></div>
    </div>
  </div>
</main>

<script>

$(document).ready(function() {

    // flatpickr 적용 (날짜 선택)
    if(typeof flatpickr !== "undefined"){
        flatpickr("#startDate", { dateFormat: "Y-m-d", defaultDate: new Date(new Date().setDate(new Date().getDate() - 1)) });
        flatpickr("#endDate",   { dateFormat: "Y-m-d", defaultDate: new Date() });
    } else {
        // flatpickr 없으면 기본값 설정
        let yesterday = new Date(); yesterday.setDate(yesterday.getDate() - 1);
        $("#startDate").val(yesterday.toISOString().split("T")[0]);
        $("#endDate").val(new Date().toISOString().split("T")[0]);
    }

    // 초기 데이터 로드
    getDataList3();

    // 조회 버튼 클릭 시
    $(".select-button").click(function() {
        getDataList3();
    });
});

// ======== dataTable3 ========
function getDataList3() {
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

    let startInput = $("#startDate").val();
    let endInput   = $("#endDate").val();

    if(!startInput || !endInput){
        alert("시작일과 종료일을 선택해주세요.");
        return;
    }

    // YYYYMMDDHHMMSS 형식
    let start_time = startInput.replace(/-/g,"") + "000000";
    let end_time   = endInput.replace(/-/g,"") + "235959";

    dataTable3 = new Tabulator("#dataList2", {
        height: "800px",
        width: "600px",
        layout: "fitColumns",
        selectable: true,
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        tooltips: true,
        reactiveData: true,
        headerHozAlign: "center",
        ajaxConfig: "POST",
        ajaxLoader: false,
        headerSort: false,
        ajaxURL: "/geomet/work/workReport/list2_nontime",
        ajaxParams: { 
            start_time: startInput, // yyyy-MM-dd
            end_time:   endInput    // yyyy-MM-dd
        },
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function(url, params, response) {
            console.log(response.data3);
            return response.data3;
        },
        ajaxRequesting: function(url, params) {
            console.log("dataTable3 URL:", url);
            console.log("보내는 Params:", params);
        },
        columns: [
            { 
                title: "설비", 
                field: "resourceID", 
                hozAlign: "center", 
                width: 200, 
                formatter: function(cell){
                    return RESOURCE_ID_MAP[cell.getValue()] || cell.getValue();
                },
                headerFilter: "select",
                headerFilterParams: Object.values(RESOURCE_ID_MAP),
                headerSort: true
            },
            { 
                title: "시작시간", 
                field: "startTime", 
                hozAlign: "center", 
                width: 200,
                headerSort: true,
                formatter: function(cell){
                    let val = cell.getValue();
                    return val ? val.substring(0,16) : ""; // YYYY-MM-DD HH:MM
                }
            },
            { 
                title: "종료시간", 
                field: "endTime", 
                hozAlign: "center", 
                width: 200,
                headerSort: true,
                formatter: function(cell){
                    let val = cell.getValue();
                    return val ? val.substring(0,16) : ""; // YYYY-MM-DD HH:MM
                }
            },
            { 
                title: "발생시간(분)", 
                field: "downtime", 
                hozAlign: "center", 
                width: 200,
                headerSort: true
            },
            { 
                title: "내용", 
                field: "downtime_name", 
                hozAlign: "center", 
                width: 400,
                headerFilter: "input",
                headerSort: true
            }
        ],
        rowClick: function(e,row){
            const clicked_test_num = row.getData().test_num;
            dataTable3.getRows().forEach(function(r){
                if(r.getData().test_num === clicked_test_num){
                    r.select();
                    r.getElement().classList.add("row_select");
                }
            });
            selectedRow = row;
            console.log("선택된 test_num:", clicked_test_num);
        }
    });
}
</script>


</body>
</html>
