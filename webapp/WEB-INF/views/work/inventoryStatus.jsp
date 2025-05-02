<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>재고관리</title>
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
        margin-top: 60px;
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
        height: 70vh; 
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
        margin-top: 4px;
    }
    .monthselect {
        width: 20%;
        text-align: center;
        font-size: 15px;
    }
    .monthSet {
        width: 20%;
        text-align: center;
        height: 16px;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }
    .monthlabel {
        margin-right: 10px;
        margin-bottom: 13px;
        font-size: 18px;
        margin-left: 20px;
    }
    button-container.button {
        height: 16px;
    }

    /* ✅ 체크박스 스타일 개선 */
    .checkbox-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    .checkbox-container label {
        display: flex;
        align-items: center;
        cursor: pointer;
        font-size: 16px;
    }
    .checkbox-container input[type="checkbox"] {
        display: none;
    }
    .checkbox-container input[type="checkbox"] + span {
        display: inline-block;
        width: 18px;
        height: 18px;
        border: 2px solid #007bff;
        border-radius: 4px;
        margin-right: 8px;
        position: relative;
    }
    .checkbox-container input[type="checkbox"]:checked + span {
        background-color: #007bff;
    }
    .checkbox-container input[type="checkbox"]:checked + span::after {
        content: '✔';
        color: white;
        font-size: 14px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
     .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
</style>

    
    
<body>

  <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
            <div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
           <label class="monthlabel">약품 및 부자재 월 선택 :</label>
			<input type="text"autocomplete="off" class="monthSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">

			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>

                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>

            </div>
        </div>

        <div class="view">
		<div id="dataTable" style="width: 96%;"></div>

        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	               
			<form id="corrForm" enctype="multipart/form-data" autocomplete="off">
			 <h2 class="hName">약품 및 부자재</h2>	
			 
			 
			    <label>약품명</label>
			    <input type="text" name="drug_name" readonly>
			
			    
			    <label>최근 점검일</label>
			    <div class="checkbox-container">
			        <input type="text" class="daySet" name="date" placeholder="점검일 선택" style="text-align: left;"readonly>
			    </div>
			
			    <label class="hName2">-상태-</label>
			    <input type="text"  name="status" readonly placeholder="(변수)월 정검일" >
				
				<label>이월 수량</label>
			    <input type="text" name="next_month" >
			
				<label>입고량</label>
			    <input type="text" name="stock_cnt" >
			
				
				<label>내용</label>
			    <input type="text" name="filed_name">
			
			 	<label style="display: none;">숨길 id</label>
				<input type="text" name="id" readonly style="display: none;">

			
			
			    <button type="submit" id="saveCorrStatus" style="font-weight: bold;">저장</button>
			    <button type="button" id="closeModal" style="font-weight: bold;">닫기</button>
			</form>


	    </div>
	</div>

<script>

	$(document).ready(function () {

	  $(".headerP").text("생산관리 - 재고관리");

	  const now = new Date();
	  const yearMonth = now.getFullYear() + "-" + String(now.getMonth() + 1).padStart(2, "0");

	  $(".insert-button").click(function () {
	    let modal = $("#modalContainer");
	    modal.show(); 
	    modal.addClass("show");
	  });

	  // 모달 닫기 버튼 이벤트
	  $(".close, #closeModal").click(function () {
	    let modal = $("#modalContainer");
	    modal.removeClass("show").hide(); 
	  });

	  $("#startDate")
	    .val(yearMonth)
	    .attr("placeholder", yearMonth);

	  getDataList();
	  handleSelectButtonClick();
	});


	function handleSelectButtonClick() {
	    let startDate = $("#startDate").val() || "";

	    console.log("검색 요청 값 =>", {
	        startDate: startDate
	    });

	    // 날짜가 없으면 현재 년-월로 기본 설정
	    if (!startDate || startDate.trim() === "") {
	        const today = new Date();
	        const year = today.getFullYear();
	        const month = String(today.getMonth() + 1).padStart(2, "0"); // 0부터 시작하므로 +1
	        startDate = `${year}-${month}`;
	    }

	    dataTable.setData("/geomet/work/inventoryStatus/list", {
	        "startDate": startDate,
	    });
	}

	// 클릭 이벤트 연결
	$(".select-button").click(handleSelectButtonClick);






	
	function getDataList() {
		  dataTable = new Tabulator("#dataTable", {
		    height: "830px",
		    layout: "fitDataFill",
		    layoutColumnsOnNewData: true,
		    headerSort: false,
		    selectable: true,
		    tooltips: true,
		    selectableRangeMode: "click",
		    reactiveData: true,
		    headerHozAlign: "center",

		    ajaxConfig: "POST",
		    ajaxLoader: false,
		    ajaxURL: "/geomet/work/inventoryStatus/list",
		    ajaxProgressiveLoad: false,
		    ajaxParams: {
		      startDate: (() => {
		        const v = $("#startDate").val();
		        return v ? v + "-01" : "";
		      })(),
		    },

		    placeholder: "조회된 데이터가 없습니다.",
		    paginationSize: false,

		    groupBy: "date",
		    groupStartOpen: true,
		    groupHeader: function (value, count) {
		      return `<strong>${value}</strong>`;
		    },

		    ajaxResponse: function (url, params, response) {
		      return response;
		    },

		    dataLoaded: function (data) {
		      $("#dataTable .tabulator-col.tabulator-sortable").css("height", "29px");
		    },

		    columns: [
		      { title: "id", field: "id", visible: false },
		      { title: "날짜", field: "date", hozAlign: "center", minWidth: 110 },
		      { title: "주간 야간 재고", field: "status", hozAlign: "center", minWidth: 110 },
		      { title: "이월 수량", field: "next_month", hozAlign: "center", minWidth: 110 },
		      { title: "입고 수량", field: "stock_cnt", hozAlign: "center", minWidth: 120 },
		      { title: "GEOMET G1", field: "geomet_g1", hozAlign: "center", minWidth: 130 },
		      { title: "GEOMET G2", field: "geomet_g2", hozAlign: "center", minWidth: 130 },
		      { title: "지오메트 첨가제", field: "geomet_adding", hozAlign: "center", minWidth: 140 },
		      { title: "PLUS", field: "pluse", hozAlign: "center", minWidth: 110 },
		      { title: "ML(H)", field: "ml_h", hozAlign: "center", minWidth: 110 },
		      { title: "ML(G)", field: "ml_g", hozAlign: "center", minWidth: 110 },
		      { title: "K-BLACK", field: "k_black", hozAlign: "center", minWidth: 130 },
		      { title: "NaOH 99%", field: "naoh_99", hozAlign: "center", minWidth: 130 },
		      { title: "SC-300A", field: "sc_300a", hozAlign: "center", minWidth: 130 },
		      { title: "SC330B 3X", field: "sc330b_3x", hozAlign: "center", minWidth: 140 },
		      { title: "SC330농축액", field: "sc330_liquid", hozAlign: "center", minWidth: 150 },
		      { title: "쇼트볼(SUS)", field: "geomet_sus", hozAlign: "center", minWidth: 150 },
		      { title: "도료ED2800-A-BACK(E)", field: "ed2800_a_black", hozAlign: "center", minWidth: 180 },
		      { title: "수지ED2800-B(E)", field: "ed2800_b", hozAlign: "center", minWidth: 180 },
		      { title: "신 나 (005)", field: "geomet_005", hozAlign: "center", minWidth: 150 },
		      { title: "중화제 (069)", field: "geomet_069", hozAlign: "center", minWidth: 150 },
		      { title: "방 청 유(P-210)", field: "geomet_p_210", hozAlign: "center", minWidth: 160 },
		      { title: "열처리유(SQ-70)", field: "geomet_sq_70", hozAlign: "center", minWidth: 160 }
		    ],

		    cellClick: function (e, cell) {
		      // 클릭 이벤트
		    },

		    cellDblClick: function (e, cell) {
		        const rowData = cell.getRow().getData();
		        const modal = $("#modalContainer");
		        const form = $("#corrForm");

		     
		        const columnTitle = cell.getColumn().getDefinition().title;
		        const fieldName = cell.getField();

		  
		        modal.show().addClass("show");

		 
		        form.find("input[name='drug_name']").val(columnTitle);

		        form.find("input[name='date']").val(rowData.date);
		        form.find("input[name='status']").val(rowData.status);
		        form.find("input[name='next_month']").val(rowData.next_month);
		        form.find("input[name='stock_cnt']").val(rowData.stock_cnt);
		        form.find("input[name='id']").val(rowData.id);
		        const cellValue = cell.getValue();
		        form.find("input[name='filed_name']").val(cellValue);

		    }

		  }); 
		}

	$('#saveCorrStatus').click(function(event){
		  event.preventDefault();

		  // 폼 데이터를 직접 객체로 구성해서 쉼표 제거 부분 삭제
		  var data = {};
		  $('#corrForm').serializeArray().forEach(function(field){
		    // stock_cnt의 쉼표 제거 없이 그대로 전송
		    data[field.name] = field.value;
		  });

		  console.log("전송 데이터:", data);

		  $.ajax({
			  url: "/geomet/work/inventoryStatus/insert",
			  type: "POST",
			  contentType: "application/json",
			  data: JSON.stringify(data),
			  success: function(){
			    alert("저장되었습니다!");
			    $('#modalContainer').hide();
			    // 요청이 완료된 후에 테이블 데이터 갱신
			    var currentFilter = $('.dayselect').val() || 'ALL';
			    dataTable.setData("/geomet/work/inventoryStatus/list", { startDate: currentFilter });
			  },
			  error: function(){
			    alert('저장 중 오류가 발생했습니다.');
			  }
			});

		});

</script>

</body>
</html>
