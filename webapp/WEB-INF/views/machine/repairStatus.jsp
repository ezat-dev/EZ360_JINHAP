<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비이력카드</title>
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
	
	
		         <label class="daylabel">검색일자 :</label>
				<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
	
	
	
	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect mch_name_s">
	            <option value="">전체</option>
           
  					<option value="G800">G800</option>
	                <option value="G600">G600</option>
	                <option value="K-BLACK">K-BLACK</option>
	                <option value="공용설비">공용설비</option>
	                <option value="방청">방청</option>
	                <option value="이코팅1호기">이코팅1호기</option>
	                <option value="이코팅2호기">이코팅2호기</option>
	                <option value="세척 공통 (열병합)">세척 공통 (열병합)</option>
	                <option value="세척 1호기">세척 1호기</option>
	                <option value="세척 2호기">세척 2호기</option>
	                
	                <option value="쇼트 1호기">쇼트 1호기</option>
					<option value="쇼트 2호기">쇼트 2호기</option>
					<option value="쇼트 3호기">쇼트 3호기</option>
					<option value="쇼트 4호기">쇼트 4호기</option>
					<option value="쇼트 5호기">쇼트 5호기</option>
					<option value="쇼트 6호기">쇼트 6호기</option>
					<option value="쇼트 7호기">쇼트 7호기</option>

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
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
                
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
      <input type="text" id="id" name="id" required>
      <!-- 일자 -->
      <label for="work_date">일자</label>
      <input type="date" id="work_date" name="work_date" required>

      <!-- 조치자 -->
      <label for="operator">조치자</label>
      <input type="text" id="operator" name="operator" placeholder="이름 입력">

      <!-- 설비명 -->
      <label for="equipment_name">설비명</label>
      <select name="equipment_name" id="equipment_name" required>
        <option value="">-- 선택하세요 --</option>
        <option value="G800">G800</option>
        <option value="G600">G600</option>
        <option value="K-BLACK">K-BLACK</option>
        <option value="공용설비">공용설비</option>
        <option value="방청">방청</option>
        <option value="이코팅1호기">이코팅1호기</option>
        <option value="이코팅2호기">이코팅2호기</option>
        <option value="세척 공통 (열병합)">세척 공통 (열병합)</option>
        <option value="세척 1호기">세척 1호기</option>
        <option value="세척 2호기">세척 2호기</option>
        <option value="쇼트 1호기">쇼트 1호기</option>
        <option value="쇼트 2호기">쇼트 2호기</option>
        <option value="쇼트 3호기">쇼트 3호기</option>
        <option value="쇼트 4호기">쇼트 4호기</option>
        <option value="쇼트 5호기">쇼트 5호기</option>
        <option value="쇼트 6호기">쇼트 6호기</option>
        <option value="쇼트 7호기">쇼트 7호기</option>
      </select>

      <!-- 점검 -->
      <label for="inspection_type">점검</label>
      <select name="inspection_type" id="inspection_type" required>
        <option value="일상">일상</option>
        <option value="돌발">돌발</option>
        <option value="예방">예방</option>
      </select>

      <!-- 비가동 유무 -->
      <label for="downtime_flag">비가동 유무</label>
      <select name="downtime_flag" id="downtime_flag">
        <option value="유">유</option>
        <option value="무">무</option>
      </select>

      <!-- 비가동 시간 -->
      <label for="downtime_minutes">비가동 시간(분)</label>
      <input type="number" id="downtime_minutes" name="downtime_minutes" min="0">

      <!-- 중분류 -->
      <label for="category_mid">중분류</label>
      <input type="text" id="category_mid" name="category_mid" placeholder="예: 쏟기 대차">

      <!-- 소분류 -->
      <label for="category_sub">소분류</label>
      <input type="text" id="category_sub" name="category_sub" placeholder="예: 베어링">

      <!-- 부품 유무 -->
      <label for="part_flag">부품 유무</label>
      <select name="part_flag" id="part_flag">
        <option value="유">유</option>
        <option value="무">무</option>
      </select>

      <!-- 조치 -->
      <label for="action">조치</label>
      <input type="text" id="action" name="action" placeholder="예: 교체">

      <!-- 내용 -->
      <label for="action_detail">내용</label>
      <textarea id="action_detail" name="action_detail" rows="2" placeholder="상세 내용 입력"></textarea>

      <!-- 교체 주관 -->
      <label for="replacement_type">교체 주관</label>
      <select name="replacement_type" id="replacement_type">
        <option value="자체">자체</option>
        <option value="외주">외주</option>
      </select>

      <!-- 부품명 -->
      <label for="part_name">부품명</label>
      <input type="text" id="part_name" name="part_name" placeholder="예: UF10">

      <!-- 교체 유무 -->
      <label for="part_replacement_flag">교체 유무</label>
      <select name="part_replacement_flag" id="part_replacement_flag">
        <option value="유">유</option>
        <option value="무">무</option>
      </select>

      <!-- 수량 -->
      <label for="quantity">수량</label>
      <input type="number" id="quantity" name="quantity" min="0">

      <!-- 납기 -->
      <label for="due_date">납기</label>
      <input type="date" id="due_date" name="due_date">

      <!-- 교체 일자 -->
      <label for="replacement_date">교체 일자</label>
      <input type="date" id="replacement_date" name="replacement_date">

      <!-- 기존 교체 일자 -->
      <label for="prev_replacement_date">기존 교체 일자</label>
      <input type="date" id="prev_replacement_date" name="prev_replacement_date">

      <!-- 사용일 -->
      <label for="usage_days">사용일</label>
      <input type="number" id="usage_days" name="usage_days" min="0">

      <!-- 제작업체 -->
      <label for="manufacturer">제작업체</label>
      <input type="text" id="manufacturer" name="manufacturer">

      <!-- 담당자 -->
      <label for="manager_name">담당자</label>
      <input type="text" id="manager_name" name="manager_name" placeholder="이름 입력">

      <!-- 연락처 -->
      <label for="contact">연락처</label>
      <input type="tel" id="contact" name="contact" placeholder="010-0000-0000">

      <!-- 부품 상태 -->
      <label for="part_status">부품 상태</label>
      <select name="part_status" id="part_status">
        <option value="스페어">스페어</option>
        <option value="부품">부품</option>
      </select>

      <!-- 안전재고 -->
      <label for="safety_stock">안전재고</label>
      <input type="number" id="safety_stock" name="safety_stock" min="0">

      <!-- 현재고 -->
      <label for="current_stock">현재고</label>
      <input type="number" id="current_stock" name="current_stock" min="0">

      <!-- 구매 필요 수량 -->
      <label for="purchase_qty">구매 필요 수량</label>
      <input type="number" id="purchase_qty" name="purchase_qty" min="0">

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

// 날짜 포맷 함수: yyyy-MM-dd
function formatDate(date) {
    return date.getFullYear() + "-" 
         + String(date.getMonth() + 1).padStart(2, '0') + "-" 
         + String(date.getDate()).padStart(2, '0');
}

//Tabulator 데이터 로드 함수: 설비명 + 시작일 + 종료일
function loadTableData() {
    const mch_name = $('.dayselect').val();
    const s_date = $('#startDate').val();
    const e_date = $('#endDate').val();

    console.log("보내는 파라미터:", { mch_name, s_date, e_date }); // <-- 여기 추가

    if(dataTable){
    	dataTable.setData("/geomet/machine/repairStatus/list", { 
    	    equipmentName: mch_name,
    	    startDate: s_date,
    	    endDate: e_date
    	});


    }
}


$(function() {
    // 페이지 로드 시 어제/오늘 날짜 자동 입력
    const today = new Date();
    const yesterday = new Date(today);
    yesterday.setDate(today.getDate() - 1);

    $('#startDate').val(formatDate(yesterday));
    $('#endDate').val(formatDate(today));

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
        columns: [
            { title: "NO", field: "id", hozAlign: "center", width: 70 },
            { title: "일자", field: "work_date", hozAlign: "center", width: 130  },
            { title: "조치자", field: "operator", hozAlign: "center", width: 130 },
            { title: "설비명", field: "equipment_name", hozAlign: "center", width: 130 },
            { title: "점검", field: "inspection_type", hozAlign: "center" , width: 130},
            { title: "비가동 유무", field: "downtime_flag", hozAlign: "center" , width: 130},
            { title: "비가동 시간(분)", field: "downtime_minutes", hozAlign: "right" , width: 130},
            { title: "중분류", field: "category_mid", hozAlign: "center", width: 130 },
            { title: "소분류", field: "category_sub", hozAlign: "center", width: 130 },
            { title: "부품 유무", field: "part_flag", hozAlign: "center" , width: 130},
            { title: "조치", field: "action", hozAlign: "center", width: 130 },
            { title: "내용", field: "action_detail", hozAlign: "left" , width: 130},
            { title: "교체 주관", field: "replacement_type", hozAlign: "center" , width: 130},
            { title: "부품명", field: "part_name", hozAlign: "center", width: 130 },
            { title: "교체 유무", field: "part_replacement_flag", hozAlign: "center", width: 130 },
            { title: "수량", field: "quantity", hozAlign: "right", width: 130 },
            { title: "납기", field: "due_date", hozAlign: "center", width: 130 },
            { title: "교체 일자", field: "replacement_date", hozAlign: "center" , width: 130},
            { title: "기존 교체 일자", field: "prev_replacement_date", hozAlign: "center", width: 130 },
            { title: "사용일", field: "usage_days", hozAlign: "right" , width: 130},
            { title: "제작업체", field: "manufacturer", hozAlign: "center", width: 130 },
            { title: "담당자", field: "manager_name", hozAlign: "center", width: 130 },
            { title: "연락처", field: "contact", hozAlign: "center", width: 130 },
            { title: "부품 유무", field: "part_status", hozAlign: "center" , width: 130},
            { title: "안전재고", field: "safety_stock", hozAlign: "right", width: 130 },
            { title: "현재고", field: "current_stock", hozAlign: "right" , width: 130},
            { title: "구매 필요 수량", field: "purchase_qty", hozAlign: "right", width: 130 }
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

        	    // 모달 안 모든 input, textarea, select 요소에 값 넣기
        	    $('#corrForm').find('input, textarea, select').each(function() {
        	        var fieldId = $(this).attr('id');  // input의 id 가져오기
        	        if (fieldId && d.hasOwnProperty(fieldId)) {
        	            $(this).val(d[fieldId]);       // 데이터 객체에서 동일 key 값 가져와 넣기
        	        }
        	    });

        	    // 모달 열기
        	    $('#modalContainer').show().addClass('show');
        }
    });

    // 페이지 로드 시 초기 조회
    loadTableData();

    // 조회 버튼
    $('.select-button').click(function(){
        loadTableData();
    });

    // 셀렉트/날짜 변경 시 자동 조회
    $('.dayselect, #startDate, #endDate').on('change', function(){
        loadTableData();
    });

    // 추가 버튼
    $('.insert-button').click(function(){
        selectedRowData = null;
        $('#corrForm')[0].reset();
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
            url: "/geomet/machine/repairStatus/delete",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ id: selectedRowData.id }),
            beforeSend: function() {
                console.log("삭제 요청 데이터:", { id: selectedRowData.id });
            },
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

    // 저장 (추가/수정)
    $('#saveCorrStatus').click(function(event){
        event.preventDefault();
        var formData = new FormData($('#corrForm')[0]);
        if(selectedRowData && selectedRowData.no){
            formData.append('no', selectedRowData.no);
        }

        $.ajax({
            url: "/geomet/machine/repairStatus/insert",
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
