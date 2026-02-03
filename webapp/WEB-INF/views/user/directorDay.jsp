<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스팀</title>
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
          .button-container {
    		display: flex;
		    gap: 10px;
		    margin-left: auto;
		    margin-right: 10px;
		    margin-top: 40px;
		}
.box1 {
    display: flex;
    justify-content: flex-start;  /* right에서 flex-start로 변경 */
    align-items: center;
    margin-right: auto;  /* 왼쪽으로 밀기 */
    margin-left: 20px;   /* 왼쪽 여백 */
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
    margin-bottom: 17px;
    font-size: 20px;
    margin-left: 20px;
}
        button-container.button{
        height: 16px;
        }
        
        
        
        /*모달css  */
		   .modal {
		    display: none;
		    position: fixed;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.5);
		    transition: opacity 0.3s ease-in-out;
		    overflow: auto;
		}
		.row_select {
		    background-color: #d0d0d0 !important;
		}
		
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	        height: 30vh; 
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
		    background-color: white;
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
		    width: 100%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}

		select {
		    width: 104%;
		    height: 38px;
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
		 .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        
        .radio-group {
		  display: flex;
		  gap: 20px;
		  margin-bottom: 15px;
		  align-items: center;
		}
		
		.radio-group label {
		  display: flex;
		
		  gap: 5px;
		  font-size: 18px;
		  padding: 4px 8px;
		  border: 1px solid #ccc;
		  border-radius: 6px;
		  cursor: pointer;
		  transition: all 0.2s;
		}
		
		.radio-group input[type="radio"] {
		  accent-color: #007bff; /* 파란색 포인트 */
		  cursor: pointer;
		}
		
		.radio-group label:hover {
		  background-color: #f0f0f0;
		  border-color: #007bff;
		}
.legend {
    position: absolute;
    left: 0px;
    top: 16px;
    background: #f9f9f9;
    padding: 10px 20px;
    border-radius: 6px;
    margin: 10px 20px;
    border: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.legend-items {
  display: flex;
  gap: 40px;
  flex-wrap: nowrap;
  justify-content: flex-start;
  align-items: center; /* 세로 정렬 */
}

.legend-item {
  white-space: nowrap;
  font-size: 15px;
}

.legend-item h3 {
  margin: 0;
  font-weight: 800;
  font-size: 18px;
  color: #333;
}
.legend-item strong {
  color: #222;
  margin-right: 6px;
  font-weight: 700;
}

.edit-button {
    height: 40px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
}/* 행 높이 자동 조정 */
.tabulator-row {
    height: auto !important;
}

/* 모든 셀 수직 중앙 정렬 */
.tabulator-cell {
    vertical-align: middle !important;
}

.tabulator-cell {
    font-size: 16px;
}


.legend {
    background: #f9f9f9;
    padding: 10px 20px;
    border-radius: 6px;
    margin: 10px 20px;
    border: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.legend-items {
    display: flex;
    gap: 30px;
    flex-wrap: wrap;
    align-items: center;
}

.legend-item {
    font-size: 15px;
    color: #333;
}

.legend-item strong {
    color: #000;
    margin-right: 5px;
    font-weight: 700;
    font-size: 16px;
}
    </style>
</head>
<body>

 <main class="main">


<div class="tab">
    
    <!-- 범례 추가 -->
    <div class="legend">
        <div class="legend-items">
            <div class="legend-item"><strong>O</strong> : 양호</div>
            <div class="legend-item"><strong>△</strong> : 미흡</div>
            <div class="legend-item"><strong>X</strong> : 불량</div>
            <div class="legend-item"><strong>－</strong> : 해당없음</div>
        </div>
    </div>

    <div class="button-container">
        
        <div class="box1">
            <label class="daylabel">검색 월 :</label>
            <input type="text" class="monthSet month-search" id="y_m"
                   placeholder="시작 연도 선택"
                   style="width: 170px; font-size: 16px; height: 33px; text-align: center; margin-bottom: 13px; border: 1px solid #ccc; border-radius: 5px;">
        </div>
        
        <button class="select-button">
            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
        </button>
        <button class="insert-button">
            <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">행 추가
        </button>
        <button class="delete-button">
            <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image">행 삭제
        </button>
        <button class="excel-button" id="btnExcel">
            <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
        </button>
    </div>
</div>



        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>


<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>추가</h2>
       <form id="corrForm" autocomplete="off" enctype="multipart/form-data">
            
 			<input type="hidden" name="id" id="id">
 			<input type="hidden" name="year" id="year">
	
	      <label>년/월</label>
	      <input type="text"  class="monthSet month-modal" name="y_month" placeholder="예: 2024/06" style="text-align: left;">
	

	
	
            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>



    <div id="pdfViewerModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); justify-content:center; align-items:center;">
    <div style="position:relative; background:#fff; padding:10px;">
        <span 
    onclick="document.getElementById('pdfViewerModal').style.display='none';" 
    style="
        position: absolute; 
        top: 10px; 
        right: 15px; 
        cursor: pointer; 
        font-size: 24px;      /* 글자 크기 크게 */
        font-weight: bold;     /* 두껍게 */
        padding: 5px 10px;     /* 클릭 영역 확대 */
        background-color:rgb(199 199 199 / 80%); /* 배경 추가 */
        border-radius: 5px;    /* 테두리 둥글게 */
    ">X</span>

        <iframe id="pdfFrame" style="width:1000px; height:800px;"></iframe>
    </div>
</div>
<script>
let now_page_code = "e03";
let dataTable = null;

$(document).ready(function () {

    /* ===============================
     * 1. 현재 년-월 세팅
     * =============================== */
    const now = new Date();
    const ym =
        now.getFullYear() +
        "-" +
        String(now.getMonth() + 1).padStart(2, "0");

    // 검색용
    $("#y_m").val(ym);

    // 모달 기본값
    $("input[name='y_month']").val(ym);

    /* ===============================
     * 2. Tabulator 생성
     * =============================== */
    getDataList();

    /* ===============================
     * 3. 행 추가 (모달 열기)
     * =============================== */
    $(".insert-button").click(function () {
        $("#corrForm")[0].reset();
        $("input[name='y_month']").val($("#y_m").val()); // 검색 월 복사
        $("#modalContainer").show().addClass("show");
    });

    $(".close, #closeModal").click(function () {
        $("#modalContainer").removeClass("show").hide();
    });

    /* ===============================
     * 4. 조회
     * =============================== */
    $(".select-button").click(function () {
        if (!dataTable) return;

        const y_m = $("#y_m").val();
        dataTable.setData("/geomet/user/day/list", {
            y_m: y_m,
            page_code: "dir"
        });

    });



    /* ===============================
     * 6. 저장 (행 추가)
     * =============================== */
     $("#saveCorrStatus").click(function (event) {
    	    event.preventDefault();

    	    const y_m = $("input[name='y_month']").val();
    	    const page_code = "dir"; // ⭐ 여기서 결정

    	    if (!y_m) {
    	        alert("년/월을 선택하세요.");
    	        return;
    	    }

    	    $.ajax({
    	        url: "/geomet/user/day/insert",
    	        type: "POST",
    	        data: {
    	            y_m: y_m,
    	            page_code: "dir" 
    	        },
    	        dataType: "json",
    	        success: function (res) {
    	            if (res.result === "success") {
    	                alert("행이 성공적으로 추가되었습니다.");
    	                $("#modalContainer").removeClass("show").hide();
    	                dataTable.replaceData();
    	            } else {
    	                alert("저장 실패: " + (res.message || ""));
    	            }
    	        },
    	        error: function () {
    	            alert("서버 오류 발생");
    	        }
    	    });
    	});


    /* ===============================
     * 7. 삭제
     * =============================== */
    $(".delete-button").click(function (event) {
        event.preventDefault();

        if (!dataTable) {
            alert("테이블이 준비되지 않았습니다.");
            return;
        }

        const rows = dataTable.getSelectedRows();
        if (!rows.length) {
            alert("삭제할 행을 선택하세요.");
            return;
        }

        const id = rows[0].getData().id;
        if (!confirm("정말 삭제하시겠습니까?")) return;

        $.ajax({
            url: "/geomet/user/day/del",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ id: id }),
            success: function () {
                alert("삭제 완료");
                dataTable.replaceData();
            },
            error: function () {
                alert("삭제 중 오류 발생");
            }
        });
    });

});

/* ===============================
 * Tabulator 생성
 * =============================== */
 /* ===============================
  * Tabulator 생성
  * =============================== */
 function getDataList() {

     const dayColumns = [];
     for (let i = 1; i <= 31; i++) {
         dayColumns.push({
             title: i + "일",
             vertAlign: "middle",
             rowHeight: "auto",
             field: "m_" + i,
             hozAlign: "center",
             width: 76,
             editor: "select",
             editorParams: { values: ["O", "X","△","-"] },
             headerSort: false
         });
     }

     const columns = [
           { title: "ID", field: "id", visible: false , frozen: true},
           { title: "No", formatter: "rownum", width: 50, hozAlign: "center", vertAlign: "middle", headerSort: false , frozen: true},
           { title: "년/월", field: "y_m", width: 120, hozAlign: "center", vertAlign: "middle", headerSort: false , frozen: true},

           { title: "점검사항", field: "box1", width: 520, editor: "input", vertAlign: "middle", hozAlign: "left", headerSort: false , frozen: true},

           { title: "비고", field: "box4", width: 320, editor: "input", vertAlign: "middle", headerSort: false },
         {
             title: "이미지",
             width: 100,
             vertAlign: "middle",
             hozAlign: "center",
             formatter: function(cell){
                 return `<button class="img-upload-btn">업로드</button>`;
             },
             cellClick: function(e, cell){
                 const rowData = cell.getRow().getData();
                 const id = rowData.id;

                 const input = document.createElement("input");
                 input.type = "file";
                 input.accept = "image/*,application/pdf";
                 input.onchange = function(event){
                     const file = event.target.files[0];
                     if(!file) return;

                     const formData = new FormData();
                     formData.append("cnt", id);
                     formData.append("file", file);

                     $.ajax({
                         url: "/geomet/user/day/uploadImage",
                         type: "POST",
                         data: formData,
                         processData: false,
                         contentType: false,
                         success: function(res){
                             if(res && res.result === 'success'){
                                 cell.getRow().update({ img_url: res.fileName });
                                 alert("이미지 업로드 완료");
                             } else {
                                 alert("업로드 실패: " + (res && res.message ? res.message : 'unknown'));
                             }
                         },
                         error: function(xhr){
                             alert("업로드 실패: " + xhr.statusText);
                         }
                     });
                 };
                 input.click();
             }
         },

       
         {
             title: "이미지",
             field: "img_url",
             hozAlign: "center",
             width: 300,
             formatter: function (cell) {
                 const fn = cell.getValue();
                 if (!fn) return "";
                 
                 setTimeout(() => {
                     cell.getRow().normalizeHeight();
                 }, 100);
                 
                 return '<img src="/geomet/user/day/viewImage?fileName=' + encodeURIComponent(fn) + '" style="max-width: 280px; max-height: 200px; width: auto; height: auto; display: block; margin: 5px auto;" onload="this.closest(\'.tabulator-cell\').style.height = \'auto\'; this.closest(\'.tabulator-row\').style.height = \'auto\';" />';
             }
         },

         ...dayColumns
     ];

     dataTable = new Tabulator("#dataList", {
         height: "810px",
         layout: "fitColumns",
         headerHozAlign: "center",
         columnHeaderVertAlign: "middle",
         rowVertAlign: "middle",
         selectable: 1,
         ajaxConfig: "POST",
         ajaxURL: "/geomet/user/day/list",
         ajaxParams: {
             y_m: $("#y_m").val(),
             page_code: "dir"
         },

         placeholder: "데이터가 없습니다.",
         columns: columns,

         cellEdited: function (cell) {
        	    const rowData = cell.getRow().getData();
        	    const field = cell.getField();
        	    const newValue = cell.getValue();
        	    
        	    // m_1 ~ m_31 필드인 경우 같은 컬럼의 빈 값들을 "O"로 변경
        	    if (field.startsWith("m_") && newValue) {
        	        const allRows = dataTable.getRows();
        	        
        	        allRows.forEach(row => {
        	            const data = row.getData();
        	            // 같은 필드가 비어있으면 "O"로 설정
        	            if (!data[field] || data[field] === "") {
        	                row.update({ [field]: "O" });
        	                
        	                // 개별 저장 요청
        	                $.ajax({
        	                    url: "/geomet/user/day/save",
        	                    type: "POST",
        	                    contentType: "application/json",
        	                    data: JSON.stringify({
        	                        id: data.id,
        	                        column: field,
        	                        value: "O"
        	                    }),
        	                    error: function () {
        	                        console.error("행 ID " + data.id + " 업데이트 실패");
        	                    }
        	                });
        	            }
        	        });
        	    }
        	    
        	    // 현재 셀 저장
        	    const payload = {
        	        id: rowData.id,
        	        column: field,
        	        value: newValue
        	    };

        	    $.ajax({
        	        url: "/geomet/user/day/save",
        	        type: "POST",
        	        contentType: "application/json",
        	        data: JSON.stringify(payload),
        	        success: function (res) {
        	            if (res.result !== "success") {
        	                cell.restoreOldValue();
        	            }
        	        },
        	        error: function () {
        	            cell.restoreOldValue();
        	        }
        	    });
        	}
     });
 }

/* ===============================
 * 5. 엑셀 다운로드 (Tabulator 기능 사용)
 * =============================== */
$("#btnExcel").click(function (event) {
    event.preventDefault();

    if (!dataTable) {
        alert("테이블이 준비되지 않았습니다.");
        return;
    }

    const y_m = $("#y_m").val();
    if (!y_m) {
        alert("년/월을 선택하세요.");
        return;
    }

    // 엑셀 다운로드 전에 데이터 가공
    const data = dataTable.getData();
    const processedData = data.map((row, index) => {
        const newRow = {};
        
        // No 필드에 순번 추가
        newRow['No'] = index + 1;
        
        // 나머지 필드 처리 (null을 공백으로)
        Object.keys(row).forEach(key => {
            if (key !== 'id') { // id는 제외
                newRow[key] = row[key] === null || row[key] === undefined || row[key] === 'null' ? '' : row[key];
            }
        });
        
        return newRow;
    });

    // 임시 테이블 생성하여 다운로드
    const tempDiv = document.createElement('div');
    tempDiv.style.display = 'none';
    document.body.appendChild(tempDiv);
    
    const tempTable = new Tabulator(tempDiv, {
        data: processedData,
        columns: [
            { title: "No", field: "No", width: 50 },
            { title: "년/월", field: "y_m", width: 120 },
            { title: "점검사항", field: "box1", width: 620 },
          
            { title: "비고", field: "box4", width: 120 },
            ...Array.from({length: 31}, (_, i) => ({
                title: (i + 1) + "일",
                field: "m_" + (i + 1),
                width: 56
            }))
        ]
    });

    setTimeout(() => {
        tempTable.download("xlsx", "관리감독자 일상점검_" + y_m + ".xlsx", {
            sheetName: "관리감독자"
        });
        
        // 다운로드 후 임시 요소 제거
        setTimeout(() => {
            document.body.removeChild(tempDiv);
        }, 1000);
    }, 100);
});


//openPdf 함수
function openPdf(encodedName) {
    console.log(">>> openPdf called with:", encodedName);
    if (!encodedName) {
        alert("파일명이 없습니다!");
        return;
    }

    // 컨트롤러 경로와 맞춤
    document.getElementById('pdfFrame').src = 
        '/geomet/user/day/viewImage?fileName=' + encodedName;

    document.getElementById('pdfViewerModal').style.display = 'flex';
}

</script>


</body>
</html>
