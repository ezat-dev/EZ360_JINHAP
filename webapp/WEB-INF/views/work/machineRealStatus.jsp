<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>투입제어 및 모니터링</title>
<%@include file="../include/pluginpage.jsp" %>    
      <%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>
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
            width: 89%;
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
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
  			<div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>

			
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
  			<div id="dataList2" style="margin-top: 25px;"></div>
		</div>
        
        <div class="view">
            <div id="dataList"></div>
        </div>
        

    </main>
	
	 

    <script>

    let now_page_code = "f01";

    
        $(function() {

           
            getDataList();
            getDataList2();
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "590px",
                layout: "fitColumns",
                ajaxConfig: "POST",
                ajaxURL: "/geomet/work/machineRealStatusDown",
                columnHeaderVertAlign: "middle",
                headerHozAlign: "center",
                ajaxParams: {
                   
                },
                placeholder: "조회된 데이터가 없습니다.",
                ajaxResponse: function(url, params, response) {
                    console.log("dataList 서버에서 받은 응답:", response);
                    return response;
                },
                columns: [
                	{title: "순번", formatter: "rownum", hozAlign: "center", width: 60, headerSort: false},
                	{title: "라인코드", field: "line_cd", sorter: "string", width: 170, hozAlign: "left", headerSort: false},
                    {title: "라인명", field: "mch_name", sorter: "string", width: 130, hozAlign: "left", headerSort: false},
                    {title: "총 투입 가능", field: "total_cnt", sorter: "string", width: 130, hozAlign: "center", headerSort: false},
                    {title: "현재 투입 진행", field: "prod_cnt", sorter: "string", width: 130, hozAlign: "center", headerSort: false},
                    {title: "ML", field: "ml", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "PL", field: "pl", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "K-BLACK", field: "kb", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    {title: "은백", field: "sv", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "방청", field: "ar", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "세척", field: "ws", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "기타", field: "no", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                   
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
            });
        }

        document.querySelector(".insert-button").addEventListener("click", function() {
            let modal = document.getElementById("modalContainer");
            modal.classList.add("show");
        });

        document.querySelector(".close").addEventListener("click", function() {
            let modal = document.getElementById("modalContainer");
            modal.classList.remove("show");
        });
        document.getElementById("closeModal").addEventListener("click", function() {
            document.getElementById("modalContainer").classList.remove("show");
        });


        $(document).ready(function () {

        });

        	
        function getDataList2() {
            dataTable = new Tabulator("#dataList2", {
                height: "120px",
                layout: "fitColumns",
                ajaxConfig: "POST",
                ajaxURL: "/geomet/work/machineRealStatusUp",
                columnHeaderVertAlign: "middle",
                headerHozAlign: "center",
                ajaxParams: {
                   
                },
                placeholder: "조회된 데이터가 없습니다.",
                ajaxResponse: function(url, params, response) {
                    console.log("dataList 서버에서 받은 응답:", response);
                    return response;
                },
                columns: [
                	{title: "Total", field: "total", hozAlign: "center", width: 144, headerSort: false},
                    {title: "현재 진행 수량", field: "prod", sorter: "string", width: 144, hozAlign: "center", headerSort: false},
                    {title: "ML", field: "ml", sorter: "string", width: 138, hozAlign: "center", headerSort: false},
                    {title: "PL", field: "pl", sorter: "string", width: 138, hozAlign: "center", headerSort: false},
                    {title: "K-BALCK", field: "kb", sorter: "string", width: 144, hozAlign: "center", headerSort: false},
                    {title: "은백", field: "sv", sorter: "string", width: 138, hozAlign: "center", headerSort: false},
                    {title: "방청", field: "ar", sorter: "string", width: 138, hozAlign: "center", headerSort: false},
                    {title: "세척", field: "ws", sorter: "string", width: 138, hozAlign: "center", headerSort: false},
                    {title: "기타", field: "no", sorter: "string", width: 138, hozAlign: "center", headerSort: false},
                    
                   
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
            });
        }


        
    </script>

</body>
</html>
