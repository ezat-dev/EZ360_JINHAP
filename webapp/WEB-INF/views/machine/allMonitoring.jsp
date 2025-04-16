<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통합 모니터링</title>

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
            flex-direction: column; /* 세로 배치 */
		    align-items: center; /* 중앙 정렬 */
		    margin-top: 1%;
        }
        .tab {
            width: 95%;
            margin-bottom: 37px;
            margin-top: 35px;
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
		    width: 1000px;
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
        
		.status {
		    display: flex;
		    align-items: center;
		    font-size: 18px; 
		    margin-right: 15px;
		    margin-bottom: 13px;
		}
		
		.status span {
		    width: 17px; 
		    height: 17px; 
		    border-radius: 50%;
		    display: inline-block;
		    margin-right: 8px;
		   
		}
		.running {
		    background-color: green;
		}
		
		.changing {
		    background-color: orange;
		}
		
		.stopped {
		    background-color: red;
		}
		
		.unit {
		    margin-left: 10px;
		    font-size: 18px; 
		    color: gray;
		     margin-bottom: 17px;
		}
		
		.tabulator-row .tabulator-cell {

	    padding: 11px;

	}
	#dataList{
	marign-top:50px;
	}
    .tabulator .tabulator-header .tabulator-col {
        font-size: 16pt;
        font-weight: bold;
        height: 38px;
    }

 
    .tabulator .tabulator-cell {
        font-size: 16pt;
        font-weight: bold;
        height: 38px;
        vertical-align: middle;
    }
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
           <div class="box1">
           
           
             <div class="status">
		        <span class="running"></span> 운전중
		    </div>
		    <div class="status">
		        <span class="changing"></span> 변경
		    </div>
		    <div class="status">
		        <span class="stopped"></span> 정지
		    </div>
		    <div class="unit">단위: ton, %</div>
           
        
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
           <label class="daylabel">교체일자 :</label>
			<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" autocomplete="off"class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

           
			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
<!--                 <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button> -->
                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
                <button class="printer-button">
                    <img src="/geomet/css/tabBar/printer-icon.png" alt="printer" class="button-image">출력
                </button>
            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
            <div id="dataList2"></div>
        </div>
    </main>
	
	 


    <script>
        $(function() {
            getDataList();
     
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "660px",
                layout: "fitDataFill", // 여유 공간을 균등 분배
                columnMinWidth: 170, 
                selectable: true,
                tooltips: true,
                selectableRangeMode: "click",
                reactiveData: true,
                headerHozAlign: "center",
                paginationSize: 7,

                ajaxURL: "/geomet/machine/allMonitoring/list",
                ajaxConfig: {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                },

                ajaxResponse: function (url, params, response) {
                    console.log("받아온 데이터:", response.data);
                    const cleanData = response.data.map(item => {
                        const newItem = {};
                        for (let key in item) {
                            newItem[key] = (item[key] === null) ? 0 : item[key];
                        }
                        return newItem;
                    });

                    return cleanData;
                },

                rowFormatter: function(row) {
                    row.getElement().style.height = "42px";
                    row.getElement().style.fontWeight = "bold";
                    row.getElement().style.fontSize = "15pt";
                },

                columns: [
                    { title: "설비", field: "machine_code_ch", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "설비상태", field: "machine_code", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "관리기준 C/T", field: "facility_ct", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "실제생산 C/T", field: "now_ct", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "CAPA", field: "facility_capa", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "현 생산목표", field: "now_target", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "현 생산실적", field: "now_count", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "가동시간", field: "operating_hr", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "생산 LOSS 시간", field: "loss_hr", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "실적-생산(ton)", field: "result_prod_ton", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "실적-과부족(ton)", field: "result_little_ton", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "실적-달성률(%)", field: "result_rate", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "누적-중량", field: "m_result_weight_ton", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "누적-통수", field: "m_result_count", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "과부족량-중량", field: "little_weight_ton", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "과부족량-통수", field: "little_count_ea", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "달성률-중량", field: "rate_weight", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "달성률-통수", field: "rate_count", sorter: "string", hozAlign: "center", headerSort: false },
                ],
            });
        }


        
    </script>

</body>
</html>

