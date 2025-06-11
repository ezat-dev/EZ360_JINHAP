<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>분할기준중량관리</title>
 
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
		    width: 1100px;
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

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
  			<div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
				
			<div class="form-row">
			
		      <label for="group_id" class="form-label">표면처리 사양 :</label>
			  <input type="text" id="s_coating_nm" class="form-input" placeholder="표면처리 사양" autocomplete="off">
			
			
			
			  <label for="group_id" class="form-label">그룹ID :</label>
			  <input type="text" id="s_group_id" class="form-input" placeholder="그룹ID" autocomplete="off">
			
			  <label for="item_cd" class="form-label">도금품번 :</label>
			  <input type="text" id="s_item_cd" class="form-input" placeholder="품번" autocomplete="off">
			
			  <label for="item_nm" class="form-label">품명 :</label>
			  <input type="text" id="s_item_nm" class="form-input" placeholder="품명" autocomplete="off">
			</div>

			
			</div>
			
			
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                 <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>

                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button>
                
                <button class="excel-import-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Upload
                </button>
			<input type="file" id="fileInput" style="display: none;">
            </div>
        </div>

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


<div id="excelOverlay"></div>
<div id="excelLoading">엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...</div>



  <script>
  let now_page_code = "c05";

  $(document).ready(function () {
	    getDataList();


	    $(".select-button").click(function () {
	        dataTable.setData("/geomet/condition/divisionWeight/list", {
	            "group_id": $("#s_group_id").val() || "",
	            "item_cd": $("#s_item_cd").val() || "",
	            "item_nm": $("#s_item_nm").val() || "",
	            "coating_nm": $("#s_coating_nm").val() || "",
	        });
	    });

	    // 모달 열기 버튼 이벤트
	    $(".insert-button").click(function () {
	        let modal = $("#modalContainer");
	        modal.find("input[type='text'], input[type='number'], input[type='date'], textarea").val("");
	        
	        modal.show(); 
	        modal.addClass("show");
	    });

	    // 모달 닫기 버튼 이벤트
	    $(".close, #closeModal").click(function () {
	        let modal = $("#modalContainer");
	        modal.removeClass("show").hide(); 
	    });
  
    });




    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();

        var corrForm = new FormData($("#corrForm")[0]);
        for (var pair of corrForm.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }


        
        $.ajax({
            url: "/geomet/condition/divisionWeight/insert",
            type: "POST",
            data: corrForm,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                alert("기준정보 성공적으로 저장되었습니다!");
                $("#modalContainer").hide();
                getDataList();
             
             
            }
        });

    });



    
    $(".delete-button").click(function(event) {
        event.preventDefault();
        
        console.log("삭제 버튼 클릭됨");

        if (!selectedRow) {
            alert("삭제할 행을 선택하세요.");
            return;
        }

        var item_cd = selectedRow.getData().item_cd;
        
        console.log("전송할 plating_no 값:", item_cd);

        if (!item_cd) {
            alert("삭제할 항목이 없습니다.");
            return;
        }

        var requestData = JSON.stringify({ "item_cd": item_cd });
        console.log("전송된 데이터:", requestData);

        $.ajax({
            url: "/geomet/condition/divisionWeight/del",
            type: "POST",
            contentType: "application/json",
            data: requestData,
            dataType: "json",
            success: function(response) {
                console.log("삭제 성공:", response);
                alert("기준정보가 성공적으로 삭제되었습니다!");
                selectedRow.delete();
                selectedRow = null;

                dataTable.setData("/geomet/condition/divisionWeight/list", {
                    "group_id": $("#s_group_id").val() || "",
                    "item_cd": $("#s_item_cd").val() || "",
                    "item_nm": $("#s_item_nm").val() || ""
                });
                getDataList();
            },
            error: function(xhr, status, error) {
                console.log("삭제 오류 발생:", xhr.responseText);
                alert("삭제 중 오류가 발생했습니다: " + error);
            }
        });
    });

    var selectedRow = null;
    function getDataList() {
        dataTable = new Tabulator("#dataList", {
            height: "830px",
            layout: "fitColumns",
            selectable: true,
            tooltips: true,
            selectableRangeMode: "click",
            reactiveData: true,
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
            headerHozAlign: "center",
            ajaxConfig: "POST",
            ajaxLoader: false,
            ajaxURL: "/geomet/condition/divisionWeight/list",
            ajaxProgressiveLoad: "scroll",
            ajaxParams: {
                "group_id": $("#s_group_id").val() || "",
                "item_cd": $("#s_item_cd").val() || "",
                "item_nm": $("#s_item_nm").val() || "",
                "coating_nm": $("#s_coating_nm").val() || "",
            },
            placeholder: "조회된 데이터가 없습니다.",
            paginationSize: 20,
            ajaxResponse: function(url, params, response) {
                $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                return response;
            },
            columns: [
            	  { title: "그룹ID",      field: "group_id",   sorter: "string", width: 160, hozAlign: "center", headerSort: false },
            	  { title: "도금품번",      field: "item_cd",  sorter: "string", width: 180, hozAlign: "center", headerSort: false },
            	  { title: "품명",          field: "item_nm",     sorter: "string", width: 360, hozAlign: "center", headerSort: false },
             	  { title: "메인설비",    field: "mach_main",    sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "메인장입 기준",      field: "mach_main_weight",     sorter: "string", width: 160, hozAlign: "center", headerSort: false },
            	  { title: "표면처리 사양",      field: "coating_nm",     sorter: "string", width: 190, hozAlign: "center", headerSort: false },
            	  { title: "보조설비",       field: "mach_sub",         sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "보조설비 기준",        field: "mach_sub_weight",         sorter: "string", width: 160, hozAlign: "center", headerSort: false },
            	  { title: "공용설비",    field: "mlpl_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "K-BLACK",     field: "kblack_weight",      sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	],

            rowClick: function(e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");
                row.getElement().classList.add("row_select");

                selectedRow = row; 
                console.log("선택된 도금품번:", selectedRow.getData().plating_no);
            },
            rowDblClick: function(e, row) {
                var d = row.getData();
                selectedRowData = d;

                // 폼 초기화
                $('#corrForm')[0].reset();

                // 각 필드에 값 채우기
                var $f = $('#corrForm');

                $f.find('input[name="group_id"]').val(d.group_id);
                $f.find('input[name="item_cd"]').val(d.item_cd);
                $f.find('input[name="item_nm"]').val(d.item_nm);
                $f.find('input[name="mach_main"]').val(d.mach_main);
                $f.find('input[name="mach_main_weight"]').val(d.mach_main_weight);
                $f.find('input[name="mach_sub"]').val(d.mach_sub);
                $f.find('input[name="coating_nm"]').val(d.coating_nm);
                $f.find('input[name="mach_sub_weight"]').val(d.mach_sub_weight);
                $f.find('input[name="mlpl_weight"]').val(d.mlpl_weight);
                $f.find('input[name="kblack_weight"]').val(d.kblack_weight);

              
                if (d.no !== undefined) {
                    $f.find('input[name="no"]').val(d.no);
                }

              
                $('#modalContainer').show().addClass('show');
            }
        });
    }





    $(".excel-button").on("click", function () {
        $("#excelOverlay").show();
        $("#excelLoading").show();

        $.ajax({
            url: "/geomet/condition/divisionWeight/excel",
            type: "post",
            dataType: "json",
            success: function (result) {
                if (!result.error) {
                   
                  
                    const a = document.createElement('a');
                    a.href = "/geomet/download_divisionWeight?filename=기준정보.xlsx";
                    a.style.display = 'none';
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                    alert("기준정보 엑셀 저장 완료되었습니다.");
                    
                } else {
                    alert("엑셀 생성 오류: " + result.error);
                }
            },
            error: function (xhr, status, error) {
                alert("엑셀 다운로드 중 오류가 발생했습니다. 다시 시도해주세요.");
                console.error("Error:", error);
            },
            complete: function () {
                $("#excelOverlay").hide();
                $("#excelLoading").hide();
            }
        });
    });



    
    $(".excel-import-button").on("click", function () {
        $("#fileInput").val(""); 
        $("#fileInput").click(); 
    });

    // 파일 선택 후 업로드 처리
    $("#fileInput").on("change", function () {
        var file = this.files[0];
        if (!file) return;

        // ⬇ 로딩 화면 표시
        $("#excelOverlay").show();
        $("#excelLoading").show();

        var formData = new FormData();
        formData.append("file", file);

        $.ajax({
            url: "/geomet/condition/divisionWeight/excelFileInput",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                if (response.success) {
                    alert(response.message || "엑셀 업로드가 완료되었습니다.");
                    getDataList();
                } else {
                    alert(response.error || "엑셀 업로드 실패");
                }
            },
            error: function (xhr, status, error) {
                alert("서버 오류 발생: " + error);
            },
            complete: function () {
                $("#excelOverlay").hide();
                $("#excelLoading").hide();
            }
        });
    });



    
</script>


</body>
</html>
