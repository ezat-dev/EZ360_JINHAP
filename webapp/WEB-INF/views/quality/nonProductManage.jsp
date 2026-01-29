<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>품질관리-부적합품 관리</title>
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
            width: 95%;
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
		
		.modal-content {
		    background: white;
		    width: 40%; /* 가로 길이를 50%로 설정 */
		    max-width: 400px; /* 최대 너비를 설정하여 너무 커지지 않도록 */
		    max-height: 880px; /* 화면 높이에 맞게 제한 */
		    overflow-y: auto;
		    margin: 2% auto; /* 수평 중앙 정렬 */
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
		
		/* 헤더 필터가 있는 컬럼의 높이 자동 조정 */
		#dataList .tabulator-col {
		    height: auto !important;
		    min-height: 60px;
		}
		
		/* 헤더 타이틀과 필터를 세로 배치 */
		#dataList .tabulator-col-content {
		    display: flex;
		    flex-direction: column;
		    gap: 5px;
		}
		
		/* 필터 입력창 스타일 */
		#dataList .tabulator-header-filter input {
		    width: 100%;
		    padding: 4px;
		    box-sizing: border-box;
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
			<input type="text" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" class="daySet daySetToday" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

            <label class="daylabel">설비명 :</label>
            <select class="dayselect" id="equipment_name">
            <option value="ALL">전체</option>
    			<option value="세척 1호기">세척 1호기</option>
			    <option value="세척 2호기"">세척 2호기</option>
			    <option value="쇼트1호기">쇼트1호기</option>
			    <option value="쇼트2호기">쇼트2호기</option>
			    <option value="쇼트3호기">쇼트3호기</option>
			    <option value="쇼트4호기">쇼트4호기</option>
			    <option value="쇼트5호기">쇼트5호기</option>
			    <option value="쇼트6호기">쇼트6호기</option>
			    <option value="G-600">G-600</option>
			    <option value="G-800">G-800</option>
			    <option value="공용설비">공용설비</option>
			    <option value="K-BLACK">K-BLACK</option>
			    <option value="E코팅 1호기">E코팅 1호기</option>
			    <option value="E코팅 2호기">E코팅 2호기</option>
			    <option value="방청">방청</option>
            </select>
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
            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>


<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>부적합품 등록</h2>
        <form  id="corrForm"  autocomplete="off">
            <label>발생일</label>
            <input type="text"name="defect_date"  class="daySet daySetToday" placeholder="날짜 선택" style="text-align: left;">
           
           
                <label>발생 위치</label>
            <input type="text"  name=defect_place placeholder="발생 위치 입력">
            
           
           
            <label>불량유형</label>
			<select name="defect_type">
			    <option value="액고임">액고임</option>
			    <option value="이종혼입">이종혼입</option>
			    <option value="녹 발생">녹 발생</option>
			    <option value="코팅 문제">코팅 문제</option>
			    <option value="이물질">이물질</option>
			    <option value="색상 이상">색상 이상</option>
			    <option value="크랙">크랙</option>
			    <option value="찍힘">찍힘</option>
			    <option value="기타">기타</option>
			</select>


            <label>발생설비</label>
			<select name="equipment" >
			    <option value="세척 1호기">세척 1호기</option>
			    <option value="세척 2호기"">세척 2호기</option>
			    <option value="쇼트1호기">쇼트1호기</option>
			    <option value="쇼트2호기">쇼트2호기</option>
			    <option value="쇼트3호기">쇼트3호기</option>
			    <option value="쇼트4호기">쇼트4호기</option>
			    <option value="쇼트5호기">쇼트5호기</option>
			    <option value="쇼트6호기">쇼트6호기</option>
			    <option value="G-600">G-600</option>
			    <option value="G-800">G-800</option>
			    <option value="공용설비">공용설비</option>
			    <option value="K-BLACK">K-BLACK</option>
			    <option value="E코팅 1호기">E코팅 1호기</option>
			    <option value="E코팅 2호기">E코팅 2호기</option>
			    <option value="방청">방청</option>
			</select>


            <label>품번</label>
            <input type="text"  name="product_no" placeholder="품번 입력">

            <label>품명</label>
            <input type="text"  name="product_name" placeholder="품명 입력">

            <label>불량로트</label>
            <input type="text" name="defect_lot" placeholder="불량로트 입력">

            <label>작업자</label>
            <input type="text"  name="worker" placeholder="작업자 입력">

            <label>조치사항</label>
            <textarea rows="3"  name="action"placeholder="조치사항 입력"></textarea>

            <label>선별방법</label>
            <input type="text"   name="selection_method" placeholder="선별방법 입력">

            <label>조치완료일(검색 기준)</label>
   			<input type="text"  name="action_date" class="daySet daySetToday" placeholder="조치완료일 선택" style="text-align: left;">
   			
   			
            <label>불량수량(EA)</label>
            <input type="number"  name="defect_quantity" placeholder="불량수량 입력">

            <label>발생원인</label>
            <input type="text"  name="cause" placeholder="발생원인 입력">

            <label>개선대책</label>
            <input type="text"  name="improvement" placeholder="개선대책 입력">
            
			<label>대상유무</label>
			<div class="radio-group">
			  <label><input type="radio" name="yn_a" value="Y"> Y</label>
			  <label><input type="radio" name="yn_a" value="N"> N</label>
			</div>
			
			<label>실시유무</label>
			<div class="radio-group">
			  <label><input type="radio" name="yn_b" value="Y"> Y</label>
			  <label><input type="radio" name="yn_b" value="N"> N</label>
			</div>


             <label>진행일자</label>  
			<input type="text"  name="start_date" class="daySet daySetToday" placeholder="진행일자 선택" style="text-align: left;">

            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

<script>

let now_page_code = "d05";
let dataTable; // 전역 변수로 선언
let selectedRow; // selectedRow도 전역으로 선언

$(document).ready(function () {
    
    function setTodayToDateInputs() {
        const today = new Date();
        $(".daySetToday").val(today.toISOString().split('T')[0]);
    }
    
    // 🔥 검색 날짜 초기화를 먼저
    const today = new Date();
    const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
    $('#startDate').val(firstDay.toISOString().split('T')[0]);
    $('#endDate').val(today.toISOString().split('T')[0]);

    // 🔥 테이블 생성 (빈 테이블로)
    getDataList();
    
    // 🔥 테이블 생성 직후 데이터 로드
    setTimeout(function() {
        refreshData();
    }, 100);
    
    // 모달 열기
    $(".insert-button").click(function () {
        let modal = $("#modalContainer");
        modal.show();
        modal.addClass("show");

        $("#corrForm")[0].reset();
        $("input[name='no']").remove();
        $("#modalContainer h2").text("부적합품 등록");
        
        setTodayToDateInputs();
    });

    // 모달 닫기
    $(".close, #closeModal").click(function () {
        $("#modalContainer").removeClass("show").hide();
        
        $("#corrForm")[0].reset();
        $("input[name='no']").remove();
        $("#modalContainer h2").text("부적합품 등록");
    });

    $("#equipment_name").on("change", function () {
        console.log("선택된 설비명:", $(this).val());
    });

    // 검색 버튼 클릭 시 데이터 다시 불러오기
    $(".select-button").click(function () {
        refreshData();
    });

    // 저장 버튼 클릭 시
    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();

        var corrForm = new FormData($("#corrForm")[0]);
        
        var isUpdate = corrForm.get('no') ? true : false;
        var ajaxUrl = isUpdate ? "/geomet/quality/nonProductManage/update" : "/geomet/quality/nonProductManage/insert";

        $.ajax({
            url: ajaxUrl,
            type: "POST",
            data: corrForm,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.result === "success") {
                    alert(isUpdate ? "수정이 완료되었습니다!" : "부적합품 관리가 성공적으로 저장되었습니다!");
                    $("#modalContainer").removeClass("show").hide();
                    
                    $("#corrForm")[0].reset();
                    $("input[name='no']").remove();
                    $("#modalContainer h2").text("부적합품 등록");
                    
                    refreshData();
                } else {
                    alert("저장 실패: " + (response.message || "알 수 없는 오류"));
                }
            },
            error: function () {
                alert("서버 오류 발생!");
            }
        });
    });

    // 🔥 데이터만 새로고침하는 함수
    function refreshData() {
        const equipmentName = $("#equipment_name").val() || "";
        const startDate = $("#startDate").val() || "";
        const endDate = $("#endDate").val() || "";

        console.log("refreshData 호출:", { equipmentName, startDate, endDate });

        $.ajax({
            url: "/geomet/quality/nonProductManage/list",
            type: "POST",
            data: {
                equipment_name: equipmentName,
                startDate: startDate,
                endDate: endDate,
            },
            dataType: "json",
            success: function(response) {
                console.log("받은 데이터:", response);
                
                if (response.status === "success" && response.data) {
                    dataTable.replaceData(response.data);
                } else {
                    console.error("데이터 로드 실패:", response);
                    alert("데이터를 불러올 수 없습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("데이터 로드 오류:", error);
                alert("데이터를 불러오는 중 오류가 발생했습니다.");
            }
        });
    }

    // 🔥 데이터 목록 로딩 함수 정의 (빈 테이블 생성만)
    function getDataList() {
        dataTable = new Tabulator("#dataList", {
            height: "760px",
            layout: "fitColumns",
            selectable: true,
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
            tooltips: true,
            selectableRangeMode: "click",
            reactiveData: true,
            headerHozAlign: "center",
            placeholder: "조회된 데이터가 없습니다.",
            columns: [
                { title: "NO2", field: "no", visible: false },
                { title: "No", formatter: "rownum", hozAlign: "center", width: 70, headerSort: false },
                { title: "발생일", field: "defect_date", width: 120, hozAlign: "center" },
                { title: "발생 위치", field: "defect_place", width: 120, hozAlign: "center" },
                { 
                    title: "불량유형", 
                    field: "defect_type", 
                    width: 120, 
                    hozAlign: "center",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { title: "발생설비", field: "equipment", width: 120, hozAlign: "center" },
                { 
                    title: "품번", 
                    field: "product_no", 
                    width: 120, 
                    hozAlign: "center",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { 
                    title: "품명", 
                    field: "product_name", 
                    width: 350, 
                    hozAlign: "left",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { 
                    title: "불량로트", 
                    field: "defect_lot", 
                    width: 120, 
                    hozAlign: "center",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { 
                    title: "작업자", 
                    field: "worker", 
                    width: 120, 
                    hozAlign: "center",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { title: "조치사항", field: "action", width: 120, hozAlign: "center" },
                { title: "선별방법", field: "selection_method", width: 120, hozAlign: "center" },
                { title: "조치완료일", field: "action_date", width: 120, hozAlign: "center" },
                { title: "불량수량(EA)", field: "defect_quantity", width: 120, hozAlign: "center" },
                { 
                    title: "발생원인", 
                    field: "cause", 
                    width: 350, 
                    hozAlign: "left",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { 
                    title: "개선대책", 
                    field: "improvement", 
                    width: 350, 
                    hozAlign: "left",
                    headerFilter: "input",
                    headerFilterPlaceholder: "검색..."
                },
                { title: "대상유무", field: "yn_a", width: 110, hozAlign: "center" },
                { title: "실시유무", field: "yn_b", width: 110, hozAlign: "center" },
                { title: "진행일자", field: "start_date", width: 120, hozAlign: "center" },
            ],
            rowClick: function (e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");
                row.getElement().classList.add("row_select");
                selectedRow = row;
                console.log("선택된 row no:", selectedRow.getData().no);
            },
            rowDblClick: function(e, row) {
                var rowData = row.getData();
                
                $("#modalContainer").show().addClass("show");
                $("#modalContainer h2").text("부적합품 수정");
                
                $("input[name='defect_date']").val(rowData.defect_date || "");
                $("input[name='defect_place']").val(rowData.defect_place || "");
                $("select[name='defect_type']").val(rowData.defect_type || "");
                $("select[name='equipment']").val(rowData.equipment || "");
                $("input[name='product_no']").val(rowData.product_no || "");
                $("input[name='product_name']").val(rowData.product_name || "");
                $("input[name='defect_lot']").val(rowData.defect_lot || "");
                $("input[name='worker']").val(rowData.worker || "");
                $("textarea[name='action']").val(rowData.action || "");
                $("input[name='selection_method']").val(rowData.selection_method || "");
                $("input[name='action_date']").val(rowData.action_date || "");
                $("input[name='defect_quantity']").val(rowData.defect_quantity || "");
                $("input[name='cause']").val(rowData.cause || "");
                $("input[name='improvement']").val(rowData.improvement || "");
                
                if(rowData.yn_a) {
                    $("input[name='yn_a'][value='" + rowData.yn_a + "']").prop("checked", true);
                }
                if(rowData.yn_b) {
                    $("input[name='yn_b'][value='" + rowData.yn_b + "']").prop("checked", true);
                }
                
                $("input[name='start_date']").val(rowData.start_date || "");
                
                if($("input[name='no']").length === 0) {
                    $("#corrForm").prepend('<input type="hidden" name="no">');
                }
                $("input[name='no']").val(rowData.no);
            }
        });
    }

    $(".delete-button").click(function(event) {
        event.preventDefault();

        if (!selectedRow) {
            alert("삭제할 행을 선택하세요.");
            return;
        }

        var no = selectedRow.getData().no;

        if (!no) {
            alert("삭제할 항목이 없습니다.");
            return;
        }

        var requestData = JSON.stringify({ "no": no });

        $.ajax({
            url: "/geomet/quality/nonProductManage/del",
            type: "POST",
            contentType: "application/json", 
            data: requestData,
            dataType: "json",
            success: function(response) {
                alert("행 삭제 완료");
                selectedRow.delete();
                selectedRow = null;
            },
            error: function(xhr, status, error) {
                console.error("삭제 오류:", xhr.responseText);
                alert("삭제 중 오류가 발생했습니다: " + error);
            }
        });
    });

    $(".excel-button").on("click", function () {
        dataTable.download("xlsx", "부적합품관리.xlsx", {
            sheetName: "부적합품 관리",
            columnCalcs: false,
            columnGroups: false,
            rowGroups: false,
            columnHeaders: true,
            documentProcessing: function(workbook) {
                var sheet = workbook.Sheets[workbook.SheetNames[0]];
                
                var wscols = [
                    {wch: 8}, {wch: 12}, {wch: 12}, {wch: 12}, {wch: 12},
                    {wch: 20}, {wch: 30}, {wch: 15}, {wch: 10}, {wch: 15},
                    {wch: 15}, {wch: 12}, {wch: 15}, {wch: 60}, {wch: 60},
                    {wch: 12}, {wch: 12}, {wch: 12}
                ];
                
                sheet['!cols'] = wscols;
                return workbook;
            }
        });
    });
    
});

</script>

</body>
</html>
