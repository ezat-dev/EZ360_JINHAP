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
          <input type="text" autocomplete="off" class="monthSet" id="startDate" 
                 style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">

          <label class="monthlabel">재품 선택 :</label>
          <input list="medicine_name" class="productSet" id="productName" 
                 style="font-size: 16px; margin-bottom:10px; border: 1px solid #ccc; border-radius: 6px; padding: 5px;" 
                 placeholder="재품 이름 선택">

          <datalist id="medicine_name">
            <option value="전체">
            <option value="GEOMET G1">
            <option value="GEOMET G2">
            <option value="지오메트 첨가제">
            <option value="PLUS">
            <option value="ML(H)">
            <option value="ML(G)">
            <option value="K-BLACK">
            <option value="NaOH 99%">
            <option value="SC-300A">
            <option value="SC330B 3X">
            <option value="SC330농축액">
            <option value="쇼트볼(SUS)">
            <option value="도료ED2800-A-BACK(E)">
            <option value="수지ED2800-B(E)">
            <option value="신 나 (005)">
            <option value="중화제 (069)">
            <option value="방 청 유(P-210)">
            <option value="열처리유(SQ-70)">
            <option value="기타">
          </datalist>
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

    <form id="corrForm" enctype="multipart/form-data" autocomplete="off">
      <h2 class="hName">약품 및 부자재 입력</h2>


      <!-- 날짜 -->
      <label for="reg_date">날짜</label>
      <input type="date" name="reg_date" id="reg_date" required autocomplete="off"class="daySet" >

      <!-- 업체 -->
      <label for="company_name">업체</label>
      <input type="text" name="company_name" id="company_name" required>
	
	<!-- 약품명 -->
	<label for="medicine_name_select">약품명</label>
	<select id="medicine_name_select" name="medicine_name">
	  	  <option value="기타">기타</option>
	  <option value="GEOMET G1">GEOMET G1</option>
	  <option value="GEOMET G2">GEOMET G2</option>
	  <option value="지오메트 첨가제">지오메트 첨가제</option>
	  <option value="PLUS">PLUS</option>
	  <option value="ML(H)">ML(H)</option>
	  <option value="ML(G)">ML(G)</option>
	  <option value="K-BLACK">K-BLACK</option>
	  <option value="NaOH 99%">NaOH 99%</option>
	  <option value="SC-300A">SC-300A</option>
	  <option value="SC330B 3X">SC330B 3X</option>
	  <option value="SC330농축액">SC330농축액</option>
	  <option value="쇼트볼(SUS)">쇼트볼(SUS)</option>
	  <option value="도료ED2800-A-BACK(E)">도료ED2800-A-BACK(E)</option>
	  <option value="수지ED2800-B(E)">수지ED2800-B(E)</option>
	  <option value="신 나 (005)">신 나 (005)</option>
	  <option value="중화제 (069)">중화제 (069)</option>
	  <option value="방 청 유(P-210)">방 청 유(P-210)</option>
	  <option value="열처리유(SQ-70)">열처리유(SQ-70)</option>

	</select>
	
	<input type="text" id="medicine_name_input" name="medicine_name" placeholder="약품명을 입력하세요" style="display:none; margin-top:5px;">

      <!-- LOT번호 -->
      <label for="lot_no">LOT번호</label>
      <input type="text" name="lot_no" id="lot_no">

<!-- 입고수량 -->
<label for="stock_in">입고수량</label>
<input type="number" name="stock_in" id="stock_in" min="0" value="0">

<!-- 일간 사용량 -->
<label for="daily_usage">일간 사용량</label>
<input type="number" name="daily_usage" id="daily_usage" min="0" value="0">


      <div style="margin-top: 10px;">
        <button type="submit" id="saveCorrStatus" style="font-weight: bold;">저장</button>
        <button type="button" id="closeModal" style="font-weight: bold;">닫기</button>
      </div>
    </form>
  </div>
</div>



<script>
let now_page_code = "b05";

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
    let medicine_name = $("#productName").val() || "";
    if (medicine_name === "전체") medicine_name = null;

    console.log("검색 요청 값 =>", { startDate, medicine_name });

    if (!startDate || startDate.trim() === "") {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, "0");
        startDate = `${year}-${month}`;
    }

    dataTable.setData("/geomet/work/inventoryStatus/list", {
        "startDate": startDate,
        "medicine_name": medicine_name,
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
        selectable: true, // ✅ 여러 행 선택 가능
        selectableRangeMode: "click",
        tooltips: true,
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
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
            medicine_name: (() => {
                const m = $("#medicine_name").val();
                return m && m !== "전체" ? m : null;
            })()
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
            { formatter: "rowSelection", titleFormatter: "rowSelection", 
              hozAlign: "center", headerSort: false, width: 60 }, // ✅ 체크박스 선택
            { title: "No", formatter: "rownum", hozAlign: "center", width: 80 },
            { title: "ID", field: "id", visible: false },
            { title: "날짜", field: "reg_date", editor: "input", hozAlign: "center", minWidth: 140 },
            { title: "업체", field: "company_name", editor: "input", minWidth: 200, headerFilter: "input" },
            { title: "약품명", field: "medicine_name", editor: "input", minWidth: 200, headerFilter: "input" },
            { title: "LOT번호", field: "lot_no", editor: "input", minWidth: 200, headerFilter: "input" },
            { title: "입고수량", field: "stock_in", hozAlign: "center", editor: "input", minWidth: 150 },
            { title: "일간 사용량", field: "daily_usage", hozAlign: "center", editor: "input", minWidth: 150 },
            { title: "현재고", field: "day_sum", hozAlign: "center", editor: "input", minWidth: 150 },
        ],

        cellEdited: function(cell){
            const row = cell.getRow().getData(); 
            $.ajax({
                url: "/geomet/work/inventoryStatus/update",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(row),
                success: function(res){
                    if(res === true) {
                        console.log("업데이트 성공");
                        dataTable.replaceData();
                    } else { 
                        alert("업데이트 실패: " + res.message); 
                        cell.restoreOldValue(); 
                    }
                },
                error: function(){ 
                    alert("서버 오류"); 
                    cell.restoreOldValue(); 
                }
            });
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

    var selectedMedicine = $("#medicine_name_select").val();
    if(selectedMedicine === "기타") {
        selectedMedicine = $("#medicine_name_input").val();
    }
    data.medicine_name = selectedMedicine;

    console.log("전송 데이터:", data);

    $.ajax({
        url: "/geomet/work/inventoryStatus/insert",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function(){
            alert("저장되었습니다!");
            $('#modalContainer').hide();
            dataTable.setData("/geomet/work/inventoryStatus/list", { startDate: $('.dayselect').val() || 'ALL' });
            handleSelectButtonClick();
        },
        error: function(){
            alert('저장 중 오류가 발생했습니다.');
        }
    });
});

const select = document.getElementById('medicine_name_select');
const input = document.getElementById('medicine_name_input');

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
        url: "/geomet/work/inventoryStatus/del",
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
