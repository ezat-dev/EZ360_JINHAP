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
		    margin-right: -50px;
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
    <h3>실시간으로 프로그램 적용 중입니다 사용하시다가 로그 아웃 되는 경우 양해 부탁드립니다.</h3>
    <h3>기준정보 행번호 추가 및 그룹ID 도금품번 품명 정렬기능 추가했습니다</h3>

        <div class="tab">
        

            <div class="button-container">
            
           <div class="box1">
           
           
             <div class="status">
		        <span class="running"></span> 가동
		    </div>
		    <div class="status">
		        <span class="stopped"></span> 비가동
		    </div>
		    <div class="unit">단위: ton, %</div>
         
           
			</div>

            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
            <div id="dataList2"></div>
            
        </div>
    </main>
	
	 


    <script>

    let now_page_code = "a01";
        $(function() {
            getDataList();

           
            
            var as = "a01";
        
               
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "660px",
                layout: "fitDataFill", // 여유 공간을 균등 분배
                columnMinWidth: 170, 
                selectable: true,
                tooltips: true,
                columnHeaderVertAlign: "middle",
                rowVertAlign: "middle",
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
                 //   console.log("받아온 데이터:", response.data);
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
                	  { title: "설비", field: "facility_name", sorter: "string", hozAlign: "center", headerSort: false },

                	  { title: "설비상태", field: "machine_status", sorter: "string", hozAlign: "center", headerSort: false,
                	    formatter: function(cell) {
                	      const value = cell.getValue();
                	      if (value === "가동") {
                	        return "<span style='color:green; font-weight:bold;'>" + value + "</span>";
                	      } else if (value === "비가동") {
                	        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                	      }
                	      return value;
                	    }
                	  },

                	  { title: "관리기준 C/T", field: "c_t", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "실제생산 C/T", field: "work_ct", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "CAPA", field: "capa", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "현 생산목표", field: "capa_quality", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "현 생산실적", field: "tong_day", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "가동시간", field: "work_time", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "생산 LOSS 시간", field: "work_loss", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "실적-생산(ton)", field: "work_ton", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "실적-과부족(ton)", field: "work_bujok", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "실적-달성률(%)", field: "work_percent", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "누적-중량", field: "weight_sum", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "누적-통수", field: "tong_sum", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "과부족량-중량", field: "work_sum_weight_bujok", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "과부족량-통수", field: "work_sum_ton_bujok", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "달성률-중량", field: "work_sum_weight_percent", sorter: "string", hozAlign: "center", headerSort: false },
                	  { title: "달성률-통수", field: "work_sum_tong_percent", sorter: "string", hozAlign: "center", headerSort: false }
                	],

            });
        }


        
    </script>

</body>
</html>

