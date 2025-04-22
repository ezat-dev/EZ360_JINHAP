<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부품교체 이력관리</title>
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
	
	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect">
	            <option value="ALL">전체</option>
           
                <option value="G800">G800</option>
                <option value="G600">G600</option>
                <option value="k_balck">K-BLACK</option>
                <option value="공용설비">공용설비</option>
                <option value="방청">방청</option>
                <option value="이코팅1호기">이코팅1호기</option>
                <option value="이코팅2호기">이코팅2호기</option>
                <option value="세척 공통">세척 공통 (열병합)</option>
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
    <h2>부품교체 이력 등록</h2>
    <form id="corrForm" autocomplete="off">
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

      <label>교체 항목</label>
      <input type="text" name="chg_item">

      <label>교체일자</label>
      <input type="text" class="daySet" name="chg_date" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off">

      <label>교체사유(문제점)</label>
      <input type="text" name="reason">

      <label>보완필요사항</label>
      <input type="text" name="required_info">

      <label>차기교체 예정일자</label>
      <input type="text" class="daySet" name="target_date" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off">

      <label>교체 주관()</label>
      <select name="change_by">
        <option value="외주">외주</option>
        <option value="자체">자체</option>
      </select>

      <label>업체명</label>
      <input type="text" name="company_name" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off">

      <label>비고</label>
      <textarea name="remark" rows="4"></textarea>

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>



<script>
  var dataTable;
  var selectedRowData = null;

  $(function() {
    dataTable = new Tabulator('#dataTable', {
      height: '790px',
      layout: 'fitDataFill',
      headerSort: false,
      reactiveData: true,
      headerHozAlign: 'center',
      ajaxConfig: { method: 'POST' },
      ajaxURL: "/geomet/machine/partStatus/list",
      ajaxParams: { mch_name: "ALL" },
      placeholder: "조회된 데이터가 없습니다.",
      columns: [
        { title: "NO",                     field: "no",             width: 100, hozAlign: "center" },
        { title: "대상 설비",              field: "mch_name",       width: 150, hozAlign: "center" },
        { title: "교체항목",               field: "chg_item",    width: 140, hozAlign: "center" },
        { title: "교체일자",               field: "chg_date",       width: 140, hozAlign: "center" },
        { title: "교체사유<br>(문제점)",    field: "reason",         width: 250, hozAlign: "center" },
        { title: "보완필요사항",           field: "required_info",  width: 150, hozAlign: "center" },
        { title: "차기교체<br>예정일자",    field: "target_date",    width: 150, hozAlign: "center" },
        { title: "교체주관<br>(외주/자체)", field: "change_by",      width: 150, hozAlign: "center" },
        { title: "업체명",                field: "company_name",   width: 150, hozAlign: "center" },
        { title: "비고",                  field: "remark",         width: 250, hozAlign: "center" }
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

        $('input[name="no"]').val(d.no);
        $('select[name="mch_name"]').val(d.mch_name);
        $('input[name="chg_item"]').val(d.chg_item);
        $('input[name="chg_date"]').val(d.chg_date);
        $('input[name="reason"]').val(d.reason);
        $('input[name="required_info"]').val(d.required_info);
        $('input[name="target_date"]').val(d.target_date);
        $('select[name="change_by"]').val(d.change_by);
        $('input[name="company_name"]').val(d.company_name);
        $('textarea[name="remark"]').val(d.remark);

        $('#modalContainer').show().addClass('show');
      }
    });

    $('.select-button').click(function() {
      var sel = $('.dayselect').val();
      dataTable.setData("/geomet/machine/partStatus/list", { mch_name: sel });
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
        url: "/geomet/machine/partStatus/delete",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ no: selectedRowData.no }),
        success: function(res) {
          alert('삭제되었습니다.');
          var currentFilter = $('.dayselect').val() || 'ALL';
          dataTable.setData("/geomet/machine/partStatus/list", { mch_name: currentFilter });
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
        url: "/geomet/machine/partStatus/insert",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function() {
          alert("저장되었습니다!");
          $('#modalContainer').hide();
          var currentFilter = $('.dayselect').val() || 'ALL';
          dataTable.setData("/geomet/machine/partStatus/list", { mch_name: currentFilter });
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
