<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>세척기준정보</title>
 
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
    background-color: #f1f1f1;
    padding: 12px 20px;
    margin: 15px 20px 5px 20px;
    border-left: 5px solid #5b9bd5;
    font-size: 14px;
    color: #333;
    line-height: 1.6;
    border-radius: 4px;
    width: 1230px;
    margin-left: 190px;
}
.info-box .highlight {
    color: #d9534f;
    font-weight: bold;
}
.insert-button {
    margin-top: 13px;
    margin-left: 1400px;
    height: 40px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
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
				

            </div>
            </div>
      
		<div class="info-box">
		    <strong>※ 입력 유의사항</strong><br>
		    • <b>투입비중</b>: NO 2~7의 합계는 <span class="highlight">100 이하</span><br>
		    • <b>투입제한</b>: NO 3~5의 합계는 <span class="highlight">136 이하</span>
		      <!-- <b></b><span class="highlight"></span> -->
		</div>
		
        		<button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">저장
                </button>
        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	
	<div id="modalContainer" class="modal" >
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>기준 정보 등록</h2>
        <form id="corrForm" autocomplete="off">
        	<input type="text" name="plac_cd" placeholder="" value="JH_KR_01" style="display:none;">
        	<input type="text" name="plnt_cd" placeholder="" value="02" style="display:none;">
            <label>그룹ID</label>
            <input type="text" name="group_id" placeholder="">
        
            <label>도금 품번</label>
            <input type="text" name="item_cd" placeholder="">
           
            <label>품명</label>
            <input type="text" name="item_nm" placeholder="">
           
            <label>메인설비</label>
            <input type="text" name="mach_main" placeholder="">
            
            <label>메인 장입기준 (kg)</label>
            <input type="text" name="mach_main_weight" placeholder="">
            
             <label>표면처리 사양</label>
            <input type="text" name="coating_nm" placeholder="">
            
            
            <label>보조 설비</label>
            <input type="text" name="mach_sub" placeholder="">
            
          <label for="mach_sub_weight">보조 장입기준 (kg)</label>
		  <input
		    type="text"
		    id="mach_sub_weight"
		    name="mach_sub_weight"
		    placeholder="예: 100"
		    pattern="\d{3}"
		    maxlength="3"
		    inputmode="numeric"
		    title="3자리 숫자를 입력하세요"
		    required
		  >
		
		  <label for="mlpl_weight">공용설비 (kg)</label>
		  <input
		    type="text"
		    id="mlpl_weight"
		    name="mlpl_weight"
		    placeholder="예: 200"
		    pattern="\d{3}"
		    maxlength="3"
		    inputmode="numeric"
		    title="3자리 숫자를 입력하세요"
		    required
		  >
		
		  <label for="kblack_weight">K-BLACK (kg)</label>
		  <input
		    type="text"
		    id="kblack_weight"
		    name="kblack_weight"
		    placeholder="예: 300"
		    pattern="\d{3}"
		    maxlength="3"
		    inputmode="numeric"
		    title="3자리 숫자를 입력하세요"
		    required
		  >
            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>





<script>
let now_page_code = "c06";
let dataTable;
let selectedRow = null;
let updatedRows = [];  // 수정된 행 누적 저장

$(document).ready(function () {
    initDataTable();
    loadData();
    $(".select-button").click(loadData);

    // 저장 버튼 클릭 시 업데이트
    $(".insert-button").click(function () {
        if (updatedRows.length === 0) {
            alert("변경된 데이터가 없습니다.");
            return;
        }

        // 중복 제거 (code_name 기준)
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
                    updatedRows = []; // 초기화
                    loadData();
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
        height: "500px",
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
            { title: "설비코드", field: "option01", sorter: "string", width: 160, hozAlign: "center" },
            { title: "설비명", field: "code_name", sorter: "string", width: 160, hozAlign: "center" },
            {
                title: "투입비중", field: "option02", sorter: "string", width: 180,
                hozAlign: "center", editor: "input"
            },
            {
                title: "투입제한", field: "option03", sorter: "string", width: 360,
                hozAlign: "center", editor: "input"
            },
            { title: "투입제한 합계", field: "sum_val", sorter: "string", width: 360, hozAlign: "center" }
        ],

        cellEditing: function(cell) {
            const field = cell.getField();
            const value = cell.getRow().getData()[field];
            if ((field === "option02" || field === "option03") &&
                (value == null || value === "" || Number(value) < 0)) {
                return false;
            }
        },

        cellEdited: function(cell) {
            const field = cell.getField();
            const rowData = cell.getRow().getData();
            const allRows = dataTable.getRows();

            // 투입비중 총합 검사 (NO 2~7 = index 1~6)
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

            // 투입제한 총합 검사 (NO 3~5 = index 2~4)
            if (field === "option03") {
                let total = 0;
                for (let i = 2; i <= 4; i++) {
                    const val = parseFloat(allRows[i]?.getData().option03);
                    if (!isNaN(val)) total += val;
                }
                if (total > 136) {
                    alert("투입제한 총합이 136을 초과할 수 없습니다.");
                    cell.restoreOldValue();
                    return;
                }
            }

            // 중복 방지 위해 code_name 기준으로 수정 목록 유지
            const existingIndex = updatedRows.findIndex(row => row.code_name === rowData.code_name);
            if (existingIndex !== -1) {
                updatedRows[existingIndex] = { ...rowData };
            } else {
                updatedRows.push({ ...rowData });
            }
        },

        rowSelected: function(row) {
            selectedRow = row;
        },
        rowDeselected: function(row) {
            if (selectedRow === row) selectedRow = null;
        },
    });
}

function loadData() {
    $.ajax({
        url: "/geomet/condition/divisionWashing/list",
        type: "POST",
        dataType: "json",
        success: function(data) {
            if (data.status === "success") {
                dataTable.replaceData(data.data);
                updatedRows = []; // 데이터 다시 불러오면 초기화
            } else {
                alert("데이터 조회 실패: " + data.message);
            }
        },
        error: function() {
            alert("데이터 조회 실패");
        }
    });
}
</script>


</body>
</html>
