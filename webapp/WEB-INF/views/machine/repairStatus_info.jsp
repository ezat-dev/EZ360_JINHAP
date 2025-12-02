<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비이력카드_기준정보</title>
<%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>
    <style>
    #saveCorrStatus {
     width: 120px;
    }
            .move-button{
		    height: 40px;
		    padding: 0 11px;
		    border: 1px solid rgb(53, 53, 53);
		    border-radius: 4px;
		    background-color: #ffffff;
		    cursor: pointer;
		    display: flex;
		    align-items: center;
		}
    #closeModal{
    width: 120px;
    }
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
            width: 94%;
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
            width: 25%;
            text-align: center;
            font-size: 14px;
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
        .row_select {
	    background-color: #ffeeba !important;
	    }
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	          <!--  <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">검색일자 :</label>
				<input type="text" autocomplete="off" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid"  style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택"> -->
	
	
		         <label class="daylabel">검색 :</label>
		
		
		
<!-- 		<input type="text" autocomplete="off" class="monthSet" id="startDate"
		       style="font-size: 16px; height: 28px; width: 150px; 
				margin-bottom: 10px;
		              border: 1px solid #ccc; border-radius: 4px; "
		       placeholder="시작 날짜 선택"> -->


	

	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect mch_name">
	            <option value="">전체</option>
            	  <option value="ALL">전체</option>
			    <option value="600톤">600톤</option>
			    <option value="800톤">800톤</option>
			    <option value="G800">G800</option>
			    <option value="K-BLACK">K-BLACK</option>
			    <option value="공용설비">공용설비</option>
			    <option value="기타">기타</option>
			    <option value="설비추가">설비추가</option>
			    <option value="쇼트 1호기">쇼트 1호기</option>
			    <option value="쇼트 2호기">쇼트 2호기</option>
			    <option value="쇼트 3호기">쇼트 3호기</option>
			    <option value="쇼트 4호기">쇼트 4호기</option>
			    <option value="쇼트 5호기">쇼트 5호기</option>
			    <option value="쇼트 6호기">쇼트 6호기</option>
			    <option value="쇼트 자동화 레일">쇼트 자동화 레일</option>
			    <option value="지오메트 자동화 레일">지오메트 자동화 레일</option>

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
				<button class="move-button" onclick="location.href='/geomet/machine/repairStatus'">
				    <img src="/geomet/css/tabBar/move.png" alt="move" class="button-image"> 설비 이력관리
				</button>
                
                
       <!--          <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button> -->
                
            </div>
        </div>

        <div class="view">
            <div id="dataTable"></div>
        </div>
    </main>
	
<div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>설비 이력 등록</h2>
<form id="corrForm" autocomplete="off">
  <input type="text" id="idx" name="idx" readonly style="width: 80px;">
  <!-- 설비명 -->
  <label for="i_equipment_name">설비명</label>
  <select name="i_equipment_name" id="i_equipment_name" required>
   <option value="ALL">전체</option>
					    <option value="600톤">600톤</option>
					    <option value="800톤">800톤</option>
					    <option value="G800">G800</option>
					    <option value="K-BLACK">K-BLACK</option>
					    <option value="공용설비">공용설비</option>
					    <option value="기타">기타</option>
					    <option value="설비추가">설비추가</option>
					    <option value="쇼트 1호기">쇼트 1호기</option>
					    <option value="쇼트 2호기">쇼트 2호기</option>
					    <option value="쇼트 3호기">쇼트 3호기</option>
					    <option value="쇼트 4호기">쇼트 4호기</option>
					    <option value="쇼트 5호기">쇼트 5호기</option>
					    <option value="쇼트 6호기">쇼트 6호기</option>
					    <option value="쇼트 자동화 레일">쇼트 자동화 레일</option>
					    <option value="지오메트 자동화 레일">지오메트 자동화 레일</option>

    <option value="기타">기타</option>
  </select>
<input type="text" id="i_equipment_name_other" name="i_equipment_name_other" placeholder="직접 입력" style="display:none; margin-top:5px; width: 200px;">
  <!-- 중분류 -->
  <label for="i_category_mid">중분류</label>
  <input type="text" id="i_category_mid" name="i_category_mid">

  <!-- 소분류-조치부품 -->
  <label for="i_category_sub">소분류-조치부품</label>
  <input type="text" id="i_category_sub" name="i_category_sub">

  <!-- 규격(부품명) -->
  <label for="i_part_name">규격(부품명)</label>
  <input type="text" id="i_part_name" name="i_part_name">

  <!-- 구분(스페어/소모품) -->
<label for="i_part_status">구분(스페어/소모품)</label>
<select id="i_part_status" name="i_part_status">

    <option value="스페어">스페어</option>
    <option value="소모품">소모품</option>
</select>

  <!-- 안전재고 -->
  <label for="i_safety_stock">안전재고</label>
  <input type="number" id="i_safety_stock" name="i_safety_stock">

  <!-- 제작업체 -->
  <label for="i_manufacturer">제작업체</label>
  <input type="text" id="i_manufacturer" name="i_manufacturer">

  <!-- 담당자 -->
  <label for="i_manager_name">담당자</label>
  <input type="text" id="i_manager_name" name="i_manager_name">

  <!-- 연락처 -->
  <label for="i_contact">연락처</label>
  <input type="text" id="i_contact" name="i_contact">

  <!-- 납기 -->
  <label for="i_due_date">납기</label>
  <input type="text" id="i_due_date" name="i_due_date">

  <!-- 버튼 -->
  <div class="modal-buttons">
    <button type="submit" id="saveCorrStatus">저장</button>
    <button type="button" id="closeModal">닫기</button>
  </div>
</form>
  </div>
</div>
<script>
let now_page_code = "h03";
var dataTable;
var selectedRowData = null;

$(document).ready(function() {
    $('#i_equipment_name').on('change', function() {
        const selected = $(this).val();
        if (selected === '기타') {
            $('#i_equipment_name_other').show().focus();
        } else {
            $('#i_equipment_name_other').hide().val('');
        }
    });
});

// yyyy-MM 포맷 함수
function formatYearMonth(date) {
    return date.getFullYear() + "-" + String(date.getMonth() + 1).padStart(2, '0');
}

// 오늘 날짜 (yyyy-MM-dd)
function getTodayStr() {
    const today = new Date();
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
}
$('#i_due_date').val(getTodayStr());


// Tabulator 데이터 로드 함수: 설비명 + 시작월
function loadTableData() {
    const mch_name = $('.dayselect').val();
    const s_date = $('#startDate').val();   // yyyy-MM

    console.log("보내는 파라미터:", { mch_name, startDate: s_date });

    if(dataTable){
        dataTable.setData("/geomet/machine/repairStatus_info/list", { 
        	i_equipment_name: mch_name,
            startDate: s_date
        });
    }
}

$(document).ready(function() {

	

    // startDate input에 이번 달 세팅
    $("#startDate").val(formatYearMonth(new Date()));

    
    // Tabulator 초기화
    dataTable = new Tabulator('#dataTable', {
        height: '790px',
        layout: 'fitDataFill',
        headerSort: false,
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        reactiveData: true,
        headerHozAlign: 'center',
        ajaxConfig: { method: 'POST' },
        ajaxContentType: "json", 
        placeholder: "조회된 데이터가 없습니다.",
        placeholder: "조회된 데이터가 없습니다.",
        columns: [
            { title: "순번", hozAlign: "center", width: 80, formatter: function(cell){
                return cell.getRow().getPosition(true) + 1;
            }},
            { title: "idx", field: "idx", headerFilter: "input" },
            { title: "설비명", field: "i_equipment_name", width: 220, headerFilter: "input" },
            { title: "중분류", field: "i_category_mid", width: 220, headerFilter: "input" },
            { title: "소분류-조치부품", field: "i_category_sub", width: 220, headerFilter: "input" },
            { title: "규격(부품명)", field: "i_part_name", width: 220, headerFilter: "input" },
            { title: "구분(스페어/소모품)", field: "i_part_status", hozAlign: "center", width: 150, headerFilter: "input" },
            { title: "안전재고", field: "i_safety_stock", hozAlign: "right", width: 100, headerFilter: "input" },
            { title: "제작업체", field: "i_manufacturer", hozAlign: "center", width: 150, headerFilter: "input" },
            { title: "담당자", field: "i_manager_name", hozAlign: "center", width: 130, headerFilter: "input" },
            { title: "연락처", field: "i_contact", hozAlign: "center", width: 130, headerFilter: "input" },
            { title: "납기", field: "i_due_date", hozAlign: "center", width: 130, headerFilter: "input" }
        ],



        rowClick: function(e, row) {
            $('#dataTable .tabulator-row').removeClass('row_select');
            row.getElement().classList.add('row_select');
            selectedRowData = row.getData();
        },

        rowDblClick: function(e, row) {
            var d = row.getData();
            selectedRowData = d;

            // 폼 초기화
            $('#corrForm')[0].reset();

            // 모달 내 모든 input, textarea, select 요소에 값 넣기
            $('#corrForm').find('input, textarea, select').each(function() {
                var fieldId = $(this).attr('id');
                if (fieldId && d.hasOwnProperty(fieldId)) {
                    $(this).val(d[fieldId]);
                }
                // date input은 오늘 날짜로 초기화 (값이 없을 경우)
                if ($(this).attr('type') === 'date' && !d[fieldId]) {
                    $(this).val(getTodayStr());
                }
            });

            $('#modalContainer').show().addClass('show');
        }
    });

    // 초기 조회
    loadTableData();

    // 조회 버튼
    $('.select-button').click(loadTableData);

    // 셀렉트/날짜 변경 시 자동 조회
    $('.dayselect, #startDate').on('change', loadTableData);



    function getTodayStr() {
        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');
        return `${yyyy}-${mm}-${dd}`;
    }
    // 추가 버튼
// 추가 버튼
$('.insert-button').off('click').on('click', function(){
    selectedRowData = null;
    $('#corrForm')[0].reset();
    $('#idx').val('');
    $('#work_date').val(getTodayStr());


    // 오늘 날짜 세팅
    const today = new Date();
    const yyyy = today.getFullYear();
    let mm = today.getMonth() + 1;
    let dd = today.getDate();
    if (mm < 10) mm = '0' + mm;
    if (dd < 10) dd = '0' + dd;
    $('#work_date').val(`${yyyy}-${mm}-${dd}`);

    // 모달 표시
    $('#modalContainer').show().addClass('show');
});



    // 삭제 버튼
    $('.delete-button').click(function(){
        if(!selectedRowData){
            alert('삭제할 행을 먼저 클릭해 주세요.');
            return;
        }
        if(!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;

        $.ajax({
            url: "/geomet/machine/repairStatus_info/delete",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ idx: selectedRowData.idx }),
            success: function(){
                alert('삭제되었습니다.');
                selectedRowData = null;
                loadTableData();
            },
            error: function(){
                alert('삭제 중 오류가 발생했습니다.');
            }
        });

    });

    // 모달 닫기
    $('.close, #closeModal').click(function(){
        $('#modalContainer').removeClass('show').hide();
    });

    $('#saveCorrStatus').click(function(event){
        event.preventDefault();
        var formData = new FormData($('#corrForm')[0]);

        // 기타 선택 시 실제 입력값으로 대체
        if ($('#i_equipment_name').val() === '기타') {
            const otherVal = $('#i_equipment_name_other').val().trim();
            if (otherVal) {
                formData.set('i_equipment_name', otherVal);
            } else {
                alert('설비명을 입력해주세요.');
                return;
            }
        }

        // insert/update 구분
        var url = $('#idx').val() ? "/geomet/machine/repairStatus_info/update"
                                  : "/geomet/machine/repairStatus_info/insert";

        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(){
                alert('저장되었습니다!');
                $('#modalContainer').hide();
                selectedRowData = null;
                loadTableData();
            },
            error: function(){
                alert('저장 중 오류가 발생했습니다.');
            }
        });
    });


});
</script>

</body>
</html>
