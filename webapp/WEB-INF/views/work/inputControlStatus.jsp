<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>생산설비 시간 정보</title>
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
        }
		.tab {
		    width: 90%;
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
		    width: 800px;
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
	
	     

			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
             
			<button class="excel-button" style="width:90px;">
			    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
			</button>



            </div>
        </div>

        <div class="view">
            <div id="dataList" style="margin-top:50px;"></div>
           
        </div>
       <div class="view">       
         <div id="dataList2" style="margin-top:10px;"></div>
       </div>
    </main>
	


   <script>
let now_page_code = "f02";

$(function() {
    var today = new Date();

    // 한 달 전 날짜 계산
    var oneMonthAgo = new Date(today);
    oneMonthAgo.setMonth(today.getMonth() - 1);

    function formatDate(date) {
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "-" + month + "-" + day;
    }

    $('#startDate').val(formatDate(oneMonthAgo)); // 오늘 기준 한 달 전
    $('#endDate').val(formatDate(today));         // 오늘

    getDataList();
    getDataList2();
});




function getDataList() {
    var mach_code = $('.mach_code').val() || ""; // mach_code가 없으면 빈 문자열

    if (window.dataTable) {
        dataTable.setData("/geomet/work/inputControlStatusUp", {
           
        });
        return;
    }

    dataTable = new Tabulator("#dataList", {
        height: "100px",
        layout: "fitColumns",
        ajaxConfig: "POST",
        ajaxURL: "/geomet/work/inputControlStatusUp",
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
            { title: "세척1호기", field: "w1", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "세척2호기", field: "w2", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "쇼트1호기", field: "s1", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            // 나머지 컬럼도 동일하게 작성 (필요하면 복사 붙여넣기)
            { title: "쇼트2호기", field: "s2", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "쇼트3호기", field: "s3", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "쇼트4호기", field: "s4", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "쇼트5호기", field: "s5", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "쇼트6호기", field: "s6", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "G-600", field: "g6", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "G-800", field: "g8", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "K-BLACK", field: "kb", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            },
            { title: "공용설비", field: "mlpl", headerSort: false, width: 110, hozAlign: "center",
                formatter: function(cell) {
                    const value = cell.getValue();
                    return value === "가동"
                        ? "<span style='color:green;'>" + value + "</span>"
                        : "<span style='color:red;'>" + value + "</span>";
                }
            }
        ],
        rowFormatter: function(row){
            row.getElement().style.fontWeight = "700";
            row.getElement().style.backgroundColor = "#FFFFFF";
        },
        rowClick: function(e, row){
            $("#dataList .tabulator-row").removeClass("row_select");
            row.getElement().classList.add("row_select");
        }
    });
}

const order = [
	  "세척1",
	  "세척2",
	  "쇼트1호기",
	  "쇼트2호기",
	  "쇼트3호기",
	  "쇼트4호기",
	  "G-600",
	  "G-800",
	  "K-BLACK",
	  "공용설비"
	];

	function getDataList2() {
	  if (window.dataTable2) {
	    dataTable2.setData("/geomet/work/inputControlStatusDown", {
	      startDate: $('#startDate').val(),
	      endDate: $('#endDate').val()
	    });
	    return;
	  }
	  dataTable2 = new Tabulator("#dataList2", {
	    height: "500px",
	    layout: "fitColumns",
	    ajaxURL: "/geomet/work/inputControlStatusDown",
	    ajaxConfig: {
	      method: "POST",
	      headers: {
	        "Content-Type": "application/json"
	      }
	    },
	    ajaxParams: {
	      startDate: $('#startDate').val(),
	      endDate: $('#endDate').val()
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
	      { title: "순번", formatter: "rownum", hozAlign: "center", width: 100 },
	      { title: "설비코드", field: "resourceId", hozAlign: "center", width: 310 },
	      {
	        title: "설비명",
	        field: "resourceName",
	        hozAlign: "center",
	        width: 310,
	        sorter: function(a, b, aRow, bRow, column, dir, sorterParams) {
	          const indexA = order.indexOf(a);
	          const indexB = order.indexOf(b);
	          const posA = indexA === -1 ? order.length : indexA;
	          const posB = indexB === -1 ? order.length : indexB;
	          return posA - posB;
	        }
	      },
	      { title: "발생 시간(분)", field: "downtime", hozAlign: "center", width: 310 },
	      { title: "발생 카운트", field: "cc", hozAlign: "center", width: 300 },
	    ],
	    ajaxResponse: function (url, params, response) {
	      console.log("dataList2 서버에서 받은 응답:", response);

	      // order 배열 기준으로 resourceName 정렬
	      response.sort((a, b) => {
	        const indexA = order.indexOf(a.resourceName);
	        const indexB = order.indexOf(b.resourceName);
	        const posA = indexA === -1 ? order.length : indexA;
	        const posB = indexB === -1 ? order.length : indexB;
	        return posA - posB;
	      });

	      return response;
	    }
	  });
	}

// 공통 포맷터
function colorFormatter(cell) {
    const value = cell.getValue();
    return value === "가동"
        ? "<span style='color:green;'>" + value + "</span>"
        : "<span style='color:red;'>" + value + "</span>";
}

// 조회 버튼 클릭 시 두 테이블 모두 조회
$('.select-button').on('click', function() {
    getDataList();
    getDataList2();
});
</script>
</body>
</html>