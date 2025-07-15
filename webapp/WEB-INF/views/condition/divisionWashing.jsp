<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>세척 투입제어</title>
 
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
        .view2 {
            display: flex;
            justify-content: center;
            margin-top: 1%;
        }
        .tab {
            width: 100%;
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
		    /* justify-content: right; */
		    margin-left: 20px;
		    align-items: center;
		    width: 270px;
		    margin-right: 20px;
		    margin-top: 4px;
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


     
        .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }

    .checkbox-group {
        display: flex;
        gap: 20px;
        margin-bottom: 10px;
    }
    .checkbox1{
    margin-top:20px;
    margin-right:10px;
    
    }

    .checkbox-group label {
        font-size: 16px;
    }

    .checkbox-group input[type="checkbox"] {
        transform: scale(1.7); 
    }
	.delete-button {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	}
	
	.delete-button:hover {
	    background-color: #f0f0f0;
	}
	
	.excel-import-button {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	}
	/* CSS */
.form-row {
  display: flex;
  align-items: center;
  gap: 16px;           /* 레이블–인풋 간격 */
  flex-wrap: wrap;     /* 화면 좁아지면 줄 바꿈 */
  margin-bottom: 12px; /* 각 행 간 간격 */
}

.form-label {
  white-space: nowrap;
  font-weight: 600;
  font-size: 14px;
  color: #333;
  margin-right: 4px;
}

	.form-input {
	    flex: 1;
	    width: 160px;
	    min-width: 100px;
	    padding: 8px 12px;
	    font-size: 14px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    transition: border-color 0.2s, box-shadow 0.2s;
	}
		
	.form-input:focus {
	  outline: none;
	  border-color: #409eff;    /* 블루 톤 */
	  box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.2);
	}
	
	
	@media (max-width: 600px) {
	  .form-row {
	    flex-direction: column;
	    align-items: stretch;
	  }
	  .form-label {
	    margin-bottom: 4px;
	  }
	}
	
	.excel-import-button:hover {
	    background-color: #f0f0f0;
	}
	
	#excelOverlay {
	  display: none;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0,0,0,0.4);
	  z-index: 9998;
	}
	
	/* 로딩 박스 */
	#excelLoading {
	  display: none;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: white;
	  padding: 20px 30px;
	  border-radius: 10px;
	  box-shadow: 0 0 20px rgba(0,0,0,0.2);
	  font-size: 16px;
	  font-weight: bold;
	  z-index: 9999;
	  text-align: center;
	}
	
	/* 로딩 스피너 */
	#excelLoading::before {
	  content: "";
	  display: block;
	  margin: 0 auto 10px;
	  width: 30px;
	  height: 30px;
	  border: 4px solid #ccc;
	  border-top: 4px solid #4caf50;
	  border-radius: 50%;
	  animation: spin 1s linear infinite;
	}
	
	/* 애니메이션 */
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
	}
	  .tabulator .tabulator-row.tabulator-selected {
    background-color: #e6f7ff !important;
  }
.info-box {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    background-color: #f1f1f1;
    padding: 12px 20px;
    margin: 15px auto 5px auto;
    border-left: 5px solid #5b9bd5;
    font-size: 14px;
    color: #333;
    line-height: 1.6;
    border-radius: 4px;
    width: 90%;
    max-width: 1220px;
    gap: 30px; /* 유의사항과 표 사이 간격 */
}

.info-left {
    flex: 1;
    min-width: 280px;
    font-size: 17px;
    margin-top: 3px;
}

/* 우측 표 */
.info-right {
    flex-shrink: 0;
}

.info-table {
    border-collapse: collapse;
    font-size: 13px;
    background-color: white;
    min-width: 480px;
}

.info-table th,
.info-table td {
    border: 1px solid #ccc;
    padding: 6px 10px;
    text-align: center;
}

.info-table th {
    background-color: #5b9bd5;
    color: white;
    font-weight: bold;
}

.insert-button {
    margin-top: 13px;
    margin-left: 83%;
    height: 40px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
}
.text-red {
    color: red;
    font-weight: bold;
}
    </style>
</head>

<body>
    <main class="main">

        
		<div class="info-box">
	    <!-- 좌측: 유의사항 -->
	    <div class="info-left">
	        <strong>※ 입력 유의사항</strong><br>
	       • <b>투입비중</b>: NO 2~7의 합계는 <span class="text-red">100</span> 이하<br>
<!--     	   • <b>투입제한</b>: NO 3~5의 합계는 <span class="text-red">136</span> 이하<br> -->
    	   • <b>수정 후 저장 버튼 눌러주세요.</b>
	    </div>

		    <!-- 우측: 표 -->
		    <div class="info-right">
		        <table class="info-table">
		            <thead>
		                <tr>
		                    <th colspan="4">최초 투입비중</th>
		                    <th colspan="2">최초 투입제한</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td>방청</td>
		                    <td>3%</td>
		                    <td>KB</td>
		                    <td>30%</td>
		                    <td>KB</td>
		                    <td>48</td>
		                </tr>
		                <tr>
		                    <td>은백</td>
		                    <td>3%</td>
		                    <td>ML</td>
		                    <td>30%</td>
		                    <td>ML</td>
		                    <td>44</td>
		                </tr>
		                <tr>
		                    <td>일반세척</td>
		                    <td>10%</td>
		                    <td>PL</td>
		                    <td>24%</td>
		                    <td>PL</td>
		                    <td>44</td>
		                </tr>
		            </tbody>
		        </table>
		    </div>
		</div>

				

        <button class="insert-button">
            <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">저장
        </button>

        <div class="view">
            <div id="dataList"></div>
        </div>

        <div class="view2">
            <div id="dataListLog" style="width: 1280px;"></div>
        </div>

    </main>

<script>
let now_page_code = "c06";
let dataTable;
let logTable;
let selectedRow = null;
let updatedRows = [];

$(document).ready(function () {
    initDataTable();
    initLogTable();
    loadData();
    loadLogData();

    $(".select-button").click(function () {
        loadData();
        loadLogData();
    });

    $(".insert-button").click(function () {
        if (updatedRows.length === 0) {
            alert("변경된 데이터가 없습니다.");
            return;
        }

        const uniquePayload = Object.values(
            updatedRows.reduce((acc, cur) => {
                acc[cur.code_name] = cur;
                return acc;
            }, {})
        );

        $.ajax({
            url: "/geomet/condition/divisionWashing/updateBatch",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(uniquePayload),
            dataType: "json",
            success: function (res) {
                if (res.status === "success") {
                    alert("저장되었습니다.");
                    updatedRows = [];
                    loadData();
                    loadLogData();
                } else {
                    console.error("저장 실패:", res.message);
                }
            },
            error: function (xhr, status, err) {
                console.error("통신 오류:", err);
            }
        });
    });
});

function initDataTable() {
    dataTable = new Tabulator("#dataList", {
        height: "300px",
        layout: "fitColumns",
        reactiveData: true,
        selectable: 1,
        tooltips: true,
        paginationSize: 20,
        placeholder: "조회된 데이터가 없습니다.",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        headerHozAlign: "center",
        columns: [
            { title: 'NO', formatter: 'rownum', width: 60, hozAlign: 'center' },
            { title: "설비코드", field: "option01", width: 190, hozAlign: "center" },
            { title: "설비명", field: "code_name", width: 190, hozAlign: "center" },
            {
                title: "투입비중", field: "option02", width: 190,
                hozAlign: "center", editor: "input"
            },
            {
                title: "투입제한", field: "option03", width: 190,
                hozAlign: "center", editor: "input"
            },
            {
                title: "가용 버퍼 수", field: "option04", width: 190,
                hozAlign: "center", editor: "input"
            }, 
            {
                title: "설비 사용 유무", field: "option05", width: 190,
                hozAlign: "center",
                editor: "select",
                editorParams: {
                    values: { "N": "N", "Y": "Y" }
                }
            }
        ],
        cellEditing: function (cell) {
            const field = cell.getField();
            const value = cell.getRow().getData()[field];
            if ((field === "option02" || field === "option03") &&
                (value == null || value === "" || Number(value) < 0)) {
                return false;
            }
        },
        cellEdited: function (cell) {
            const field = cell.getField();
            const rowData = cell.getRow().getData();
            const allRows = dataTable.getRows();
            const oldValue = cell.getOldValue();

            if (field === "option02") {
                let total = 0;
                for (let i = 1; i <= 6; i++) {
                    const val = parseFloat(allRows[i]?.getData().option02);
                    if (!isNaN(val)) total += val;
                }
                if (total > 100) {
                    alert("투입비중 총합이 100을 초과할 수 없습니다.");
                    cell.restoreOldValue();
                    return;
                }
            }

            if (field === "option03") {
                let total = 0;
                for (let i = 2; i <= 4; i++) {
                    const val = parseFloat(allRows[i]?.getData().option03);
                    if (!isNaN(val)) total += val;
                }
                if (total > 1360) {
                    alert("투입제한 총합이 1000을 초과할 수 없습니다.");
                    cell.restoreOldValue();
                    return;
                }
            }

            const existingIndex = updatedRows.findIndex(row => row.code_name === rowData.code_name);
            const oldObj = updatedRows[existingIndex] || {};
            const updatedObj = {
                ...rowData,
                op2_old: field === 'option02' ? oldValue : oldObj.op2_old ?? null,
                op3_old: field === 'option03' ? oldValue : oldObj.op3_old ?? null,
                op4_old: field === 'option04' ? oldValue : oldObj.op4_old ?? null,
                op5_old: field === 'option05' ? oldValue : oldObj.op5_old ?? null
            };

            if (existingIndex !== -1) {
                updatedRows[existingIndex] = updatedObj;
            } else {
                updatedRows.push(updatedObj);
            }
        },
        rowSelected: function (row) {
            selectedRow = row;
        },
        rowDeselected: function (row) {
            if (selectedRow === row) selectedRow = null;
        }
    });
}

function loadData() {
    $.ajax({
        url: "/geomet/condition/divisionWashing/list",
        type: "POST",
        dataType: "json",
        success: function (data) {
            if (data.status === "success") {
                dataTable.replaceData(data.data);
                updatedRows = [];
            } else {
                alert("데이터 조회 실패: " + data.message);
            }
        },
        error: function () {
            alert("데이터 조회 실패");
        }
    });
}

function initLogTable() {
    logTable = new Tabulator("#dataListLog", {
        height: "300px",
        layout: "fitColumns",
        placeholder: "로그 내역이 없습니다.",
        paginationSize: 10,
        columns: [
            { title: "ID", field: "id", width: 70, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "설비명", field: "code_name", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "투입비중", field: "option02", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "변경 전</br>투입비중", field: "op2_old", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "투입제한", field: "option03", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "변경 전</br>투입제한", field: "op3_old", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },

             { title: "가용 버퍼 수", field: "option04", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "변경 전</br>가용 버퍼 수", field: "op4_old", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false }, 
            { title: "설비 사용 유무", field: "option05", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "변경 전</br>설비 사용 유무", field: "op5_old", width: 120, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "수정자", field: "user_id", width: 140, hozAlign: "center", headerHozAlign: "center", headerSort: false },
            { title: "수정일시", field: "log_dt", width: 200, hozAlign: "center", headerHozAlign: "center", headerSort: false }
        ]
    });
}


function loadLogData() {
    $.ajax({
        url: "/geomet/condition/divisionWashing/log",
        type: "POST",
        dataType: "json",
        success: function (res) {
            if (res.status === "success") {
                logTable.setData(res.data);
            } else {
                console.error("로그 데이터 조회 실패:", res.message);
            }
        },
        error: function () {
            console.error("로그 데이터 조회 실패 (통신 오류)");
        }
    });
}
</script>

</body>

</html>
