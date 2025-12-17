<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수입검사</title>
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
        width: 33%;
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
    #itemsContainer {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}
.item-box {
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 6px;
  width: 180px;
}
.item-box h4 {
  margin: 0 0 5px 0;
  text-align: center;
}
.item-box label {
  display: inline-block;
  width: 50px;
  font-size: 12px;
}
.item-box input {
  margin-bottom: 5px;
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
        width: 925px;
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
        
        .page-button {
    height: 42px;          /* 버튼 높이 조정 */
    padding: 0 15px;       /* 좌우 여백 조절 */
    display: flex;         /* 이미지와 텍스트 정렬 */
    align-items: center;   /* 세로 중앙 정렬 */
    font-size: 16px;       /* 글씨 크기 */
    cursor: pointer;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f5f5f5;
}

.page-button .button-image {
    height: 24px;          /* 이미지 크기 조정 */
    margin-right: 8px;     /* 이미지와 텍스트 사이 간격 */
}
        
</style>

    
  <body>

  <main class="main">
    <div class="tab">

      <div class="button-container">

        <div class="box1">
          <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
          

          
          <label class="monthlabel">약품 및 부자재 월 선택 :</label>
          <input type="text" autocomplete="off" class="monthSet" id="startDate" 
                 style="width:230px; font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택" >
		
	

        </div>

        <button class="select-button">
          <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
        </button>

 <!--        <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
		</button>
        <button class="excel-button">
          <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
        </button>
 -->

      </div>
    </div>

    <div class="view">
      <div id="dataTable"></div>
    </div>
  </main>

  <div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>

    <form id="corrForm" enctype="multipart/form-data" autocomplete="off">
      <h2 class="hName">수입검사 입력</h2>

  <input type="text" name="id" id="id">
      <!-- 날짜 -->
	<label for="reg_date">날짜</label>
	<input type="text" name="reg_date" id="reg_date" required autocomplete="off" class="daySet">

      <!-- 업체 -->
      <label for="company_name">업체</label>
      <input type="text" name="company_name" id="company_name" required>
	
	<!-- 약품명 -->
	<label for="medicine_name_select">약품명</label>
	<input type="text" id="medicine_name" name="medicine_name" placeholder="약품명을 입력하세요" style=" margin-top:5px;">

      <!-- LOT번호 -->
      <label for="lot_no">LOT번호</label>
      <input type="text" name="lot_no" id="lot_no">
<div id="itemsContainer" style="display: flex; flex-wrap: wrap; gap: 20px;">

  <!-- 항목 1~5 반복 -->
  <div class="item-box">
    <h4>PH</h4>
    <label>최소값</label>
    <input type="number" id="in_1_min" placeholder="최소값" style="width: 80px;">
    <label>최대값</label>
    <input type="number" id="in_1_max" placeholder="최대값" style="width: 80px;">
    <label>값</label>
    <input type="number"name="in_1" id="in_1" placeholder="값 입력" style="width: 100px;">
  </div>

  <div class="item-box">
    <h4>비중</h4>
    <label>최소값</label>
    <input type="number" id="in_2_min" placeholder="최소값" style="width: 80px;">
    <label>최대값</label>
    <input type="number" id="in_2_max" placeholder="최대값" style="width: 80px;">
    <label>값</label>
    <input type="number" name="in_2"id="in_2" placeholder="값 입력" style="width: 100px;">
  </div>

  <div class="item-box">
    <h4>점도</h4>
    <label>최소값</label>
    <input type="number" id="in_3_min" placeholder="최소값" style="width: 80px;">
    <label>최대값</label>
    <input type="number" id="in_3_max" placeholder="최대값" style="width: 80px;">
    <label>값</label>
    <input type="number" name="in_3"id="in_3" placeholder="값 입력" style="width: 100px;">
  </div>

  <div class="item-box">
     <label>색상</label>
  <select id="in_4" name="in_4" style="width: 120px;">
    <option value="">선택</option>
    <option value="오렌지">오렌지</option>
    <option value="검정">검정</option>
    <option value="연한녹색">연한녹색</option>
    <option value="은색">은색</option>
  </select>
  </div>

  <div class="item-box">
    <h4>가열잔분(불휘발분)</h4>
    <label>최소값</label>
    <input type="number" id="in_5_min" placeholder="최소값" style="width: 80px;">
    <label>최대값</label>
    <input type="number" id="in_5_max" placeholder="최대값" style="width: 80px;">
    <label>값</label>
    <input type="number"name="in_5"  id="in_5" placeholder="값 입력" style="width: 100px;">
  </div>

</div>
      <label>비고</label>
      <input type="text" name="in_6" id="in_6">

      <div style="margin-top: 10px;">
		<button type="submit" id="saveCorrStatus" 
		        style="font-weight: bold; width: 90px; height: 40px; margin-left: 200px;">
		    저장
		</button>
		
		<button type="button" id="closeModal" 
		        style="font-weight: bold; width: 90px; height: 40px;">
		    닫기
		</button>

      </div>
    </form>
  </div>
</div>



<script>
let now_page_code = "d03";



$(document).ready(function () {
    $('.insert-button').click(function(){
        selectedRowData = null;
        $('#corrForm')[0].reset();
        $('#modalContainer').show().addClass('show');
    });

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

   
    console.log("검색 요청 값 =>", { startDate });

    if (!startDate || startDate.trim() === "") {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, "0");
        startDate = `${year}-${month}`;
    }

    dataTable.setData("/geomet/work/inTest/list", {
        "startDate": startDate,

    });
}

// 클릭 이벤트 연결
$(".select-button").click(handleSelectButtonClick);
let dataTable;
function getDataList() {


	// --- Tabulator 생성 ---
	dataTable = new Tabulator("#dataTable", {
		 height: "470px",
 	    layout: "fitColumns",
 	    headerHozAlign: "center",
 	    columnHeaderVertAlign: "middle",
 	    rowVertAlign: "middle",
 	   selectable: true,
 	   selectableRangeMode: "click",
	    ajaxConfig: "POST",
	    ajaxLoader: false,
	    ajaxURL: "/geomet/work/inTest/list",
	    ajaxProgressiveLoad: false,
	    ajaxParams: {
	        startDate: (() => {
	            const v = $("#startDate").val();
	            return v ? v + "-01" : "";
	        })()
	    },

	    placeholder: "조회된 데이터가 없습니다.",
	    paginationSize: false,


	    ajaxResponse: function (url, params, response) {
	        return response;
	    },

	    dataLoaded: function (data) {
	        $("#dataTable .tabulator-col.tabulator-sortable").css("height", "29px");
	    },

	    columns: [
	     
	        { title: "No", formatter: "rownum", hozAlign: "center", width: 70, headerSort: false },
	        { title: "ID", field: "id", visible: false, headerSort: false },
	        { title: "날짜", field: "reg_date",  hozAlign: "center", width: 130, headerSort: false },
	        { title: "업체", field: "company_name",  width: 140, headerSort: false },
	        { title: "약품명", field: "medicine_name",  width: 140, headerSort: false },
	        { title: "LOT번호", field: "lot_no",  width: 140 , headerSort: false },
	        { title: "입고수량", field: "stock_in", hozAlign: "center",  width: 140 , headerSort: false },
	        { title: "PH", field: "in_1",  width: 120 , headerSort: false },
	        { title: "비중", field: "in_2",  width: 120 , headerSort: false },
	        { title: "점도", field: "in_3",  width: 120 , headerSort: false },
	        { title: "색상", field: "in_4",  width: 120 , headerSort: false },
	        { title: "가열잔분<br>(불휘발분)", field: "in_5",  width: 120 , headerSort: false },
	        { title: "비고", field: "in_6",  width: 140 , headerSort: false }
	    ],
	    rowDblClick: function (e, row) {
	        const rowData = row.getData();
	        
	        // 모달 열기
	        let modal = $("#modalContainer");
	        modal.show(); 
	        modal.addClass("show");

	        // 값 세팅
	         $("#modalContainer input[name='id']").val(rowData.id);
	        $("#modalContainer input[name='reg_date']").val(rowData.reg_date);
	        $("#modalContainer input[name='company_name']").val(rowData.company_name);
	        $("#modalContainer input[name='medicine_name']").val(rowData.medicine_name);
	        $("#modalContainer input[name='lot_no']").val(rowData.lot_no);
	        $("#modalContainer input[name='in_1']").val(rowData.in_1);
	        $("#modalContainer input[name='in_2']").val(rowData.in_2);
	        $("#modalContainer input[name='in_3']").val(rowData.in_3);
	        $("#modalContainer input[name='in_4']").val(rowData.in_4);
	        $("#modalContainer input[name='in_5']").val(rowData.in_5);
	        $("#modalContainer input[name='in_6']").val(rowData.in_6);
	    }

	});

	
}


$('#saveCorrStatus').click(function(event){
    event.preventDefault();

    var data = {};
    $('#corrForm').serializeArray().forEach(function(field){
        if(field.name !== 'medicine_name') {
            data[field.name] = field.value;
        }
    });

    console.log("전송 데이터:", data);

    $.ajax({
        url: "/geomet/work/inTest/update",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function(){
            alert("저장되었습니다!");
            $('#modalContainer').hide();
            dataTable.setData("/geomet/work/inTest/list", { startDate: $('.dayselect').val() || 'ALL' });
            handleSelectButtonClick();
        },
        error: function(){
            alert('저장 중 오류가 발생했습니다.');
        }
    });
});

const select = document.getElementById('medicine_name_select');


select.addEventListener('change', function() {
    if(this.value === '기타') {
        input.style.display = 'block';
        input.required = true;
    } else {
        input.style.display = 'none';
        input.required = false;
        input.value = '';
    }
});

// 삭제 버튼 클릭 이벤트
$(".delete-button").click(function () {
    let selectedData = dataTable.getSelectedData();

    if (selectedData.length === 0) {
        alert("삭제할 데이터를 선택해주세요.");
        return;
    }

    let ids = selectedData.map(row => row.id);

    if (!confirm(ids.length + "건을 삭제하시겠습니까?")) {
        return;
    }

    $.ajax({
        url: "/geomet/work/inTest/del",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(ids),
        success: function (res) {
            if (res === true || res.success) {
                alert("삭제 완료되었습니다.");
                dataTable.replaceData();
            } else {
                alert("삭제 실패: " + (res.message || "알 수 없는 오류"));
            }
        },
        error: function () {
            alert("서버 오류로 삭제하지 못했습니다.");
        }
    });
});


</script>


</body>
</html>
