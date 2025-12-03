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
    #saveCorrStatus {
     width: 120px;
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
    height: 90vh;
    overflow-y: auto;
    margin: 0%;
    margin-left: 550px;
    padding: 20px;
    border-radius: 10px;
    position: relative;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
    transform: scale(0.8);
    transition: transform 0.3s 
ease-in-out, opacity 0.3s 
ease-in-out;
    opacity: 0;
}


.modal_info {
    display: none;
    position: fixed;
    right: 0;
    top: 0;

    height: 100%;

    z-index: 20000;       /* 최상단 */
}
.modal-content_info {
    background: #ffffff;
    height: 80%;
    padding: 20px;
    overflow-y: auto;
    border-radius: 20px;   /* ← 둥글게 */
    box-shadow: -3px 0px 10px rgba(0, 0, 0, 0.3);
    transform: translateX(100%);
    transition: transform 0.3s ease-in-out;
}


.modal_info.show .modal-content_info {
    transform: translateX(0);
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
	    .close_info {
    font-size: 28px;        /* 크기 키움 */
    font-weight: bold;      /* 굵게 */
    cursor: pointer;        /* 마우스 손가락 모양 */
    color: #333;
    position: absolute;
    right: 20px;
    top: 15px;
    transition: transform 0.2s ease, color 0.2s ease;
}

/* 마우스 올리면 효과 */
.close_info:hover {
    color: #ff4d4d;         /* 빨간 느낌 */
    transform: scale(1.2);  /* 약간 커짐 */
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
		<input type="text" autocomplete="off" class="monthSet" id="startDate"
		       style="font-size: 16px; height: 28px; width: 150px; 
				margin-bottom: 10px;
		              border: 1px solid #ccc; border-radius: 4px; "
		       placeholder="시작 날짜 선택">


	

	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect mch_name">
	            <option value="">전체</option>
           
  					   
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
                
                
              <!--   <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
	                </button> -->
				<button class="move-button" onclick="location.href='/geomet/machine/repairStatus_info'">
				    <img src="/geomet/css/tabBar/move.png" alt="move" class="button-image"> 설비 이력관리 기준정보
				</button>


                
            </div>
            
            
            
        </div>

        <div class="view">
            <div id="dataTable"></div>
        </div>
    </main>
    
    
<div id="infoModal" class="modal_info">
  <div class="modal-content_info">
    <span class="close_info">&times;</span>
    <h3>기준정보 선택</h3>
    <div id="dataTable_info"></div>
  </div>
</div>
	
	
<div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>설비 이력 등록</h2>
    <form id="corrForm" autocomplete="off">
  <input type="text" id="id" name="id" required style="display:none;">

      <!-- 일자 -->
      <label for="work_date">일자</label>
      <input type="date" id="work_date" name="work_date" required>

      <!-- 조치자 -->
      <label for="operator">조치자</label>
      <input type="text" id="operator" name="operator" placeholder="이름 입력">

	 <button type="button" id="addTaskBtn" style="margin: 5px 0;">기준정보 불러오기</button>

      <!-- 설비명 -->
     <label for="equipment_name">설비명</label>
	<input type="text" id="equipment_name" name="equipment_name" placeholder="설비명 입력" required>

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
      <label for="part_flag">유/무</label>
      <select name="part_flag" id="part_flag">
        <option value="유">유</option>
        <option value="무">무</option>
      </select>

      <!-- 조치 -->

    <label for="action">조치</label>
      <select name="action" id="action">
        <option value="교체">교체</option>
        <option value="수리">수리</option>
         <option value="교정">교정</option>
      </select>


      <!-- 교체 사유 -->
      <label for="action_detail">교체 사유</label>
      <textarea id="action_detail" name="action_detail" rows="2" placeholder="상세 내용 입력"></textarea>

      <label for="action_detail_2">개선 필요사항</label>
      <input type="text" id="action_detail_2" name="action_detail_2" >


      <!-- 교체 주관 -->
      <label for="replacement_type">외주/자체</label>
      <select name="replacement_type" id="replacement_type">
        <option value="외주">외주</option>
        <option value="자체">자체</option>

      </select>
    <!-- 압체명 -->
      <label for="replacement_name">업체명</label>
      <input type="text" id="replacement_name" name="replacement_name" >


      <!-- 부품명 -->
      <label for="part_name">부품명</label>
      <input type="text" id="part_name" name="part_name" placeholder="예: UF10">

      <!-- 교체 유무 -->
      <label for="part_replacement_flag">부품 교체 유무</label>
      <select name="part_replacement_flag" id="part_replacement_flag">
        <option value="유">유</option>
        <option value="무">무</option>
      </select>

      <!-- 수량 -->
      <label for="quantity">수량</label>
      <input type="number" id="quantity" name="quantity" min="0">

      <!-- 납기 -->
      <label for="due_date">납기</label>
      <input type="text" id="due_date" name="due_date">

      <!-- 교체 일자 -->
      <label for="replacement_date">기존 교체 일자</label>
      <input type="date" id="replacement_date" name="replacement_date">

      <!-- 기존 교체 일자 -->
      <label for="prev_replacement_date">차기 교체 일자</label>
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
      <input type="tel" id="contact" name="contact" placeholder="010-000-000">

      <!-- 부품 상태 -->
      <label for="part_status">부품 유무</label>
      <select name="part_status" id="part_status">
        <option value="스페어">스페어</option>
        <option value="소모품">소모품</option>
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
$(document).ready(function() {
    // -------------------------------
    // 전역 변수
    // -------------------------------
    let now_page_code = "h03";
    let dataTable = null;
    let selectedRowData = null;

    // -------------------------------
    // 유틸 함수
    // -------------------------------
    function formatYearMonth(date) {
        return date.getFullYear() + "-" + String(date.getMonth() + 1).padStart(2, '0');
    }

    const todayStr = new Date().toISOString().slice(0, 10);
    console.log(todayStr); // 예: 2025-12-01

    function calcPurchaseQty() {
        const safety = parseInt($('#safety_stock').val()) || 0;
        const current = parseInt($('#current_stock').val()) || 0;
        $('#purchase_qty').val(safety - current);
    }

    function loadTableData() {
        const mch_name = $('.dayselect').val();
        const startDate = $('#startDate').val();

        console.log("보내는 파라미터:", { mch_name, startDate });

        if(dataTable){
            dataTable.setData("/geomet/machine/repairStatus/list", { 
                equipmentName: mch_name,
                startDate: startDate
            });
        }
    }

    // -------------------------------
    // 이벤트 등록
    // -------------------------------
    $('#safety_stock, #current_stock').on('input', calcPurchaseQty);

    $('.select-button').click(loadTableData);
    $('.dayselect, #startDate').on('change', loadTableData);

    $('.insert-button').on('click', function () {
        selectedRowData = null;
        const corrForm = $('#corrForm')[0];
        corrForm.reset();
        $('#id').val('');
        $('#work_date').val(todayStr);
        $('#modalContainer').show().addClass('show');
    });

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

    $('#saveCorrStatus').click(function(event){
        event.preventDefault();
        const formData = new FormData($('#corrForm')[0]);

        if(!$('#id').val()) formData.delete('id');
        if(selectedRowData && selectedRowData.no) formData.append('no', selectedRowData.no);

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

    $('#closeModal, .close').click(function(){
        $('#modalContainer').removeClass('show').hide();
    });

    // -------------------------------
    // Tabulator 초기화
    // -------------------------------
    $("#startDate").val(formatYearMonth(new Date()));

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
            { 
                title: "일자", 
                field: "work_date", 
                hozAlign: "center", 
                width: 130, 
                editor: "input",
                mutator: function(value, data){
                    return value || todayStr;
                }
            },
            { title: "조치자", field: "operator", hozAlign: "center", width: 130 },
            { title: "설비명", field: "equipment_name", hozAlign: "center", width: 180 },
            { title: "점검</br>일상/돌발/예방", field: "inspection_type", hozAlign: "center" , width: 180},
            {
                title: "설비 비가동 유무",
                columns: [
                    { title: "유 / 무", field: "downtime_flag", hozAlign: "center", width: 130 },
                    { title: "시간(분)", field: "downtime_minutes", hozAlign: "right", width: 130 }
                ]
            },
            {
                title: "구분",
                columns: [
                    { title: "중분류", field: "category_mid", hozAlign: "center", width: 180 },
                    { title: "소분류", field: "category_sub", hozAlign: "center", width: 180 }
                ]
            },
            {
                title: "개선 필요",
                columns: [
                    { title: "유 / 무", field: "part_flag", hozAlign: "center", width: 130 },
                    { title: "조치</br>교체/수리/교정", field: "action", hozAlign: "center", width: 180 },
                    { title: "교체 사유", field: "action_detail", hozAlign: "left", width: 200 },
                    { title: "개선 필요사항", field: "action_detail_2", hozAlign: "left", width: 200 }
                ]
            },
            {
                title: "교체 주관",
                columns: [
                    { title: "외주 / 자체", field: "replacement_type", hozAlign: "center", width: 130 },
                    { title: "업체명", field: "replacement_name", hozAlign: "center", width: 130 }
                ]
            },
            { title: "부품명", field: "part_name", hozAlign: "center", width: 130 },
            { title: "교체 유무", field: "part_replacement_flag", hozAlign: "center", width: 130 },
            { title: "수량", field: "quantity", hozAlign: "right", width: 130 },
            { title: "납기", field: "due_date", hozAlign: "center", width: 130 },
            { title: "기존 교체 일자", field: "replacement_date", hozAlign: "center" , width: 130},
            { title: "차기 교체 일자", field: "prev_replacement_date", hozAlign: "center", width: 130 },
            { title: "사용일", field: "usage_days", hozAlign: "right" , width: 130},
            { title: "제작업체", field: "manufacturer", hozAlign: "center", width: 130 },
            { title: "담당자", field: "manager_name", hozAlign: "center", width: 130 },
            { title: "연락처", field: "contact", hozAlign: "center", width: 130 },
            { title: "부품 유무", field: "part_status", hozAlign: "center" , width: 130},
            { title: "안전재고", field: "safety_stock", hozAlign: "right", width: 130 },
            { title: "현재고", field: "current_stock", hozAlign: "right" , width: 130},
            { title: "구매 필요 수량",   field: "purchase_qty", 
                hozAlign: "right", 
                width: 130,
                formatter: function(cell, formatterParams, onRendered){
                    const value = cell.getValue();
                    if(value > 0){
                        cell.getElement().style.color = "blue"; // 양수면 파란 글씨
                    } else {
                        cell.getElement().style.color = "red"; // 나머지는 검정
                    }
                    return value;
                }
            }
        ],

        rowDblClick: function(e, row) {
            const d = row.getData();
            selectedRowData = d;

            const corrForm = $('#corrForm')[0];
            corrForm.reset(); // 기존 값 초기화

            $('#corrForm').find('input, textarea, select').each(function() {
                const fieldId = $(this).attr('id');
                if(!fieldId) return;

                // 데이터가 있으면 채우기
                if(d.hasOwnProperty(fieldId) && d[fieldId] !== null && d[fieldId] !== undefined) {
                    $(this).val(d[fieldId]);
                }

                // date 타입인데 값이 없으면 오늘 날짜
                if($(this).attr('type') === 'date' && !$(this).val()) {
                    $(this).val(todayStr);
                }
            });

            $('#modalContainer').show().addClass('show');
        }

    });



    

 // 기준정보 불러오기 버튼 클릭
    $('#addTaskBtn').on('click', function () {
        // 기존 메인 모달 닫기
        $('#modalContainer').hide().removeClass('show');

        // 기준정보 모달 열기
        $('#infoModal').show().addClass('show');

        // 닫기 버튼 클릭 시 모달 닫기
        $('.close_info').off('click').on('click', function () {
            $('#infoModal').hide().removeClass('show');
        });

        // 기준정보 Tabulator 초기화 (최초 한 번만)
        if (!$('#dataTable_info').data('tabulator-initialized')) {
            const infoTable = new Tabulator('#dataTable_info', {
                height: '660px',
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
                    { title: "순번", hozAlign: "center", width: 80, formatter: cell => cell.getRow().getPosition(true) + 1 },
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

                rowDblClick: function(e, row){
                    const d = row.getData();
                    // 선택한 값 폼에 채우기
                    $('#equipment_name').val(d.i_equipment_name);
                    $('#category_mid').val(d.i_category_mid);
                    $('#category_sub').val(d.i_category_sub);
                    $('#part_name').val(d.i_part_name);
                    $('#part_status').val(d.i_part_status);
                    $('#safety_stock').val(d.i_safety_stock);
                    $('#manufacturer').val(d.i_manufacturer);
                    $('#manager_name').val(d.i_manager_name);
                    $('#contact').val(d.i_contact);
                    $('#due_date').val(d.i_due_date);

                    // 모달 닫고 원래 모달 다시 열기
                    $('#infoModal').hide().removeClass('show');
                    $('#modalContainer').show().addClass('show');
                }
            });

            // 데이터 로드
            infoTable.setData('/geomet/machine/repairStatus_info/list');

            // Tabulator 초기화 여부 기록
            $('#dataTable_info').data('tabulator-initialized', true);
        }
    });


    
    // 초기 조회
    loadTableData();
});
</script>

</body>
</html>
