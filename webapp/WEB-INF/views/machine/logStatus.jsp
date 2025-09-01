<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공무일지 관리</title>
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
         .yearselect {
        width: 20%;
        text-align: center;
        font-size: 15px;
    }
    .yearSet {
        width: 20%;
        text-align: center;
        height: 16px;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }
    .yearlabel {
        margin-right: 10px;
        margin-bottom: 13px;
        font-size: 18px;
        margin-left: 20px;
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
	 		<label class="yearlabel">점검 연도 선택 :</label>
			<input type="text"autocomplete="off" class="yearSet" id="gong_date" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
	
	
	
	
	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect">
	            <option value="ALL">전체</option>
           
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
    <h2>공무일지 등록</h2>
    <form id="corrForm" autocomplete="off">
    
      <label>일자</label>
      <input type="text" class="daySet" name="gong_date" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off">
    
    
    
      <label>설비명</label>
      <select name="mch_name">
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
      </select>

      <label>점검 및 정비 결과</label>
      <input type="text"placeholder="(결과 입력)" name="result">

      <label>구분 (점검/정비)</label>
      <select name="g_b">
        <option value="점검">점검</option>
        <option value="정비">정비</option>
      </select>
     

      <label>정비형식(예방/돌발)</label>
     <select name="gong_type">
        <option value="예방">예방</option>
        <option value="돌발">돌발</option>
      </select>

      <label>정비시간</label>
		<input type="number" name="gong_hr" placeholder="(시간 입력)" min="0">

      <label>비고</label>
      <textarea name="remark" rows="3"></textarea>

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>



<script>

let now_page_code = "h06";

$(function() {
  var dataTable;
  var selectedRowData = null;
  var currentYear = new Date().getFullYear().toString();
  $('.yearSet').val(currentYear);

  dataTable = new Tabulator('#dataTable', {
    height: '790px',
    layout: 'fitDataFill',
    headerSort: false,
    reactiveData: true,
    columnHeaderVertAlign: "middle",
    rowVertAlign: "middle",
    headerHozAlign: 'center',
    ajaxConfig: { method: 'POST' },
    ajaxURL: '/geomet/machine/logStatus/list',
    ajaxParams: {
      gong_date: currentYear,
      mch_name: 'ALL'
    },
    placeholder: '조회된 데이터가 없습니다.',
    columns: [
      { title: 'no',             field: 'no',         visible: false },
      { title: 'NO',             formatter: 'rownum', width: 70,  hozAlign: 'center' },
      { title: 'db_NO',          field: 'no',         width: 100, hozAlign: 'center', visible: false },
      { title: '일자',           field: 'gong_date',  width: 150, hozAlign: 'center' },
      { title: '설비',           field: 'mch_name',   width: 140, hozAlign: 'center' },
      { title: '점검 및<br>정비 결과', field: 'result',      width: 300, hozAlign: 'center' },
      { title: '구분<br>(점검/정비)',  field: 'g_b',         width: 140, hozAlign: 'center' },
      { title: '정비형식<br>(예방/돌발)', field: 'gong_type', width: 150, hozAlign: 'center' },
      { 
  	    title: '정비시간<br>(HR)', 
  	    field: 'gong_hr',    
  	    width: 100, 
  	    hozAlign: 'center',
  	    formatter: function(cell) {
  	      var v = cell.getValue();
  	      return v != null && v !== "" ? v + '시간' : '';
  	    }
  	  },
      { title: '비고',            field: 'remark',      width: 380, hozAlign: 'center' }
    ],
    rowClick: function(e, row) {
      $('#dataTable .tabulator-row').removeClass('row_select');
      row.getElement().classList.add('row_select');
      selectedRowData = row.getData();
    },
    rowDblClick: function(e, row) {
      var d = row.getData();
      selectedRowData = d;
      $('#corrForm')[0].reset();
      $('input[name="gong_date"]').val(d.gong_date);
      $('select[name="mch_name"]').val(d.mch_name);
      $('input[name="result"]').val(d.result);
      $('select[name="g_b"]').val(d.g_b);
      $('input[name="standard"]').val(d.standard);
      $('select[name="gong_type"]').val(d.gong_type);
     
      $('input[name="gong_hr"]').val(d.gong_hr);
      $('textarea[name="remark"]').val(d.remark);
      $('#modalContainer').show().addClass('show');
    }
  });

  $('.select-button').click(function() {
    var year = $('.yearSet').val();
    var mch  = $('.dayselect').val();
    console.log({ gong_date: year, mch_name: mch });
    dataTable.setData(
      '/geomet/machine/logStatus/list',
      { gong_date: year, mch_name: mch }
    );
  });

  $('.insert-button').click(function() {
    selectedRowData = null;
    $('#corrForm')[0].reset();
    $('#modalContainer').show().addClass('show');
  });

  $('.delete-button').click(function() {
    if (!selectedRowData) {
      alert('삭제할 행을 먼저 클릭해 주세요.');
      return;
    }
    if (!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;

    $.ajax({
      url: '/geomet/machine/logStatus/delete',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({ no: selectedRowData.no }),
      success: function() {
        alert('삭제되었습니다.');
        var year = $('.yearSet').val() || currentYear;
        var mch  = $('.dayselect').val() || 'ALL';
        dataTable.setData(
          '/geomet/machine/logStatus/list',
          { gong_date: year, mch_name: mch }
        );
        selectedRowData = null;
      },
      error: function() {
        alert('삭제 중 오류가 발생했습니다.');
      }
    });
  });

  $('.close, #closeModal').click(function() {
    $('#modalContainer').removeClass('show').hide();
  });

  $('#saveCorrStatus').click(function(event) {
    event.preventDefault();
    var formData = new FormData($('#corrForm')[0]);
    if (selectedRowData && selectedRowData.no) {
      formData.append('no', selectedRowData.no);
    }
    $.ajax({
      url: '/geomet/machine/logStatus/insert',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function() {
        alert('저장되었습니다!');
        $('#modalContainer').hide();
        var year = $('.yearSet').val() || currentYear;
        var mch  = $('.dayselect').val() || 'ALL';
        dataTable.setData(
          '/geomet/machine/logStatus/list',
          { gong_date: year, mch_name: mch }
        );
        selectedRowData = null;
      },
      error: function() {
        alert('저장 중 오류가 발생했습니다.');
      }
    });
  });
});
</script>



</body>
</html>
