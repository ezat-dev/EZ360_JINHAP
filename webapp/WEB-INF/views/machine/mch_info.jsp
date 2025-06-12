<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비 기준정보</title>
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
	


			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
<!--                 <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button> -->
                
                
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
    <h2>설비 기준정보</h2>
    <form id="corrForm" autocomplete="off">
    
     
	<label>설비번호</label>
	<input type="number" name="facility_code" readonly>
	
	<label>설비명</label>
	<input type="text" name="facility_name">
	
	<label>설비코드</label>
	<input type="text" name="facility_mach_code" readonly>
	
	<label>설비 표현 순서</label>
	<input type="text" name="ch_idx" placeholder="안쓰는 설비는 999 입력해주세요">

 
      <label>C_T</label>
      <input type="text"name="c_t">

      <label>CAPA</label>
      <input type="text"name="capa">
      
      <label>표준 중량</label>
      <input type="text"name="std_weight">
      


      <label>설비 특이사항</label>
      <textarea name="facility_comment" rows="3"></textarea>

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>



<script>

let now_page_code = "h08";

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
    ajaxURL: '/geomet/machine/mch_info/list',
    ajaxParams: {
      gong_date: currentYear,
      mch_name: 'ALL'
    },
    placeholder: '조회된 데이터가 없습니다.',
    columns: [
    	  { 
    	    title: 'NO', 
    		formatter: "rownum", 
    		hozAlign: 'center', 
    		width: 120 
    	  },
    	  { title: 'no', field: 'facility_code', hozAlign: 'center',visible: false   },
    	  { title: '설비명', field: 'facility_name', width: 250, hozAlign: 'left' },
    	  { title: '설비코드', field: 'facility_mach_code', width: 250, hozAlign: 'left' },
    	  { title: '설비 표현 순서', field: 'ch_idx', width: 150, hozAlign: 'center' },
    	  { title: 'C_T', field: 'c_t', width: 150, hozAlign: 'center' },
    	  { title: 'CAPA', field: 'capa', width: 150, hozAlign: 'center' },
    	  { title: '표준 중량', field: 'std_weight', width: 150, hozAlign: 'center' },
    	  { title: '설비 특이사항', field: 'facility_comment', width: 380, hozAlign: 'center' }
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

    	  $('input[name="facility_code"]').val(d.facility_code);
    	  $('input[name="facility_name"]').val(d.facility_name);
    	  $('input[name="facility_mach_code"]').val(d.facility_mach_code);
    	  $('input[name="ch_idx"]').val(d.ch_idx);
    	  $('input[name="c_t"]').val(d.c_t);
    	  $('input[name="capa"]').val(d.capa);
    	  $('textarea[name="facility_comment"]').val(d.facility_comment);

    	  $('#modalContainer').show().addClass('show');
    	}
  });

  $('.select-button').click(function() {
    var year = $('.yearSet').val();
    var mch  = $('.dayselect').val();
    console.log({ gong_date: year, mch_name: mch });
    dataTable.setData(
      '/geomet/machine/mch_info/list',
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
      url: '/geomet/machine/mch_info/delete',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({ facility_code: selectedRowData.facility_code }),
      success: function() {
        alert('삭제되었습니다.');
      
        dataTable.setData(
          '/geomet/machine/mch_info/list'
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
	  $.ajax({
	    url: '/geomet/machine/mch_info/insert',
	    type: 'POST',
	    data: formData,
	    processData: false,
	    contentType: false,
	    success: function() {
	      alert('저장되었습니다!');
	      $('#modalContainer').hide();	    
	      dataTable.setData(
	        '/geomet/machine/mch_info/list'
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
