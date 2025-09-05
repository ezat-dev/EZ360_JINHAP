<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>월간 약품 사용</title>
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
        margin-top: 66px;
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
        width: 100%;
        max-width: 1120px;
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
        margin-right:-60px;
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
.del-button {
    position: absolute;
    right: 42px;
    top: 26px;
        margin-right: 24px;
}
.ins-button{
    position: absolute;
    right: 118px;
    top: 26px;
        margin-right: 24px;
}
.dataTable{
  margin-top: 30px;
}
</style>

    
  <body>

  <main class="main">
    <div class="tab">

      <div class="button-container">

        <div class="box1">
          <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>

          <label class="monthlabel">월간 약품 사용 :</label>
          <input type="text" autocomplete="off" class="monthSet" id="start_date" 
                 style="font-size: 16px; margin-bottom:10px;" placeholder="월 선택">

      
        </div>

        <button class="select-button">
          <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
        </button>
        <button class="insert-button">
          <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">약품정보
        </button>

        <button class="excel-button">
          <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
        </button>
        <button class="page-button">
          <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">약품 재고관리
        </button>

      </div>
    </div>
    <div class="view">
      <div id="dataTable_main"></div>
    </div>

  </main>


  <!-- 약품 정보 변경 모달 -->
  <div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
        <button class="ins-button">
				    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image"> 추가
		</button>
        <button class="del-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
		</button>
    <div class="view">
      <div id="dataTable"></div>
    </div>
  </div>
</div>


<script>
let now_page_code = "b05";

$(".page-button").click(function() {
    window.location.href = "/geomet/work/inventoryStatus";
  });


$(document).on('click', '.insert-button', function() {
    console.log("함수 호출됨");
    selectedRowData = null;
    $('#modalContainer').show().addClass('show');
    getDataList();
});
$(".close, #closeModal").click(function () {
    let modal = $("#modalContainer");
    modal.removeClass("show").hide();
});


$(document).ready(function () {

	$(".select-button").on("click", function() {
	    getDataList_main();
	});

	let today = new Date();
	let year  = today.getFullYear();
	let month = String(today.getMonth() + 1).padStart(2, "0"); // 0~11 → 1~12

	let startMonth = year + "-" + month; // 예: "2025-11"
	$("#start_date").val(startMonth);    // input에 세팅

	// 페이지 로드 시 바로 데이터 조회
	getDataList_main();



    const now = new Date();
    const yearMonth = now.getFullYear() + "-" + String(now.getMonth() + 1).padStart(2, "0");



    $("#startDate")
        .val(yearMonth)
        .attr("placeholder", yearMonth);

    $(".del-button").click(function () {
        console.log("삭제");
        let selectedData = dataTable.getSelectedData();
        console.log("삭제할 데이터", selectedData.map(row => row.m_id));

        if (selectedData.length === 0) {
            alert("삭제할 데이터를 선택해주세요.");
            return;
        }

        let selectedMId = selectedData[0].m_id;
        console.log("삭제할 데이터 m_id:", selectedMId);

        if (!confirm("정말 삭제하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: "/geomet/work/medicineInfo/delete",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ m_id: selectedMId }),
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

    $(".ins-button").click(function () {
        if (!confirm("데이터 추가하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: "/geomet/work/medicineInfo/insert",
            type: "POST",
            contentType: "application/json",
            success: function (res) {
                if (res === true || res.success) {
                    alert("추가 완료되었습니다.");
                    dataTable.replaceData();
                } else {
                    alert("추가 실패: " + (res.message || "알 수 없는 오류"));
                }
            },
            error: function () {
                alert("서버 오류로 추가하지 못했습니다.");
            }
        });
    });
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

    dataTable.setData("/geomet/work/getMedicineInfo/list", {
        "startDate": startDate,
        "medicine_name": medicine_name,
    });
}

let dataTable = null;
function getDataList() {
    dataTable = new Tabulator("#dataTable", {
        height: "530px",
        layout: "fitDataFill",
        headerSort: false,
        selectable: 1,
        headerHozAlign: "center",

        ajaxConfig: "GET",
        ajaxLoader: false,
        ajaxURL: "/geomet/work/getMedicineInfo/list",

        placeholder: "조회된 데이터가 없습니다.",

        ajaxResponse: function (url, params, response) {
            return response;
        },

        dataLoaded: function (data) {
            $("#dataTable .tabulator-col.tabulator-sortable").css("height", "29px");
        },

        columns: [
            { formatter: "rowSelection", titleFormatter: "rowSelection", hozAlign: "center", headerSort: false, width: 60 },
            { title: "m_id", field: "m_id", visible: false, headerHozAlign: "center" },
            { title: "약품명", field: "medicine_name", editor: "input", hozAlign: "center", minWidth: 140 },
            {
                title: "Kg당 금액",
                field: "kg_price",
                editor: "input",
                minWidth: 200,
                hozAlign: "center",
                formatter: function (cell) {
                    const value = cell.getValue();
                    if (value === null || value === undefined) {
                        return "";
                    }
                    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
            },
            { title: "통당 중량", field: "barrel_weight", editor: "input", minWidth: 150, hozAlign: "right" },
            { title: "단위", field: "unit", hozAlign: "left", editor: "input", minWidth: 80 },
            {
                title: "통당 금액",
                field: "barrel_price",
                editor: "input",
                minWidth: 200,
                hozAlign: "center",
                formatter: function (cell) {
                    const value = cell.getValue();
                    if (value === null || value === undefined) {
                        return "";
                    }
                    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
            },
            { title: "부착량 규격", field: "attachment_spec", hozAlign: "center", editor: "input", minWidth: 150 },
            { title: "y_n", field: "y_n", visible: false },
        ],

        cellEdited: function (cell) {
            const row = cell.getRow().getData();
            $.ajax({
                url: "/geomet/work/medicineInfo/update",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(row),
                success: function (res) {
                    if (res === true) {
                        console.log("업데이트 성공");
                        dataTable.replaceData();
                    } else {
                        alert("업데이트 실패: " + res.message);
                        cell.restoreOldValue();
                    }
                },
                error: function () {
                    alert("서버 오류");
                    cell.restoreOldValue();
                }
            });
        }
    });
}

$('#saveCorrStatus').click(function (event) {
    event.preventDefault();

    var data = {};
    $('#corrForm').serializeArray().forEach(function (field) {
        if (field.name !== 'medicine_name') {
            data[field.name] = field.value;
        }
    });

    var selectedMedicine = $("#medicine_name_select").val();
    if (selectedMedicine === "기타") {
        selectedMedicine = $("#medicine_name_input").val();
    }
    data.medicine_name = selectedMedicine;

    console.log("전송 데이터:", data);

    $.ajax({
        url: "/geomet/work/inventoryStatus/insert",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function () {
            alert("저장되었습니다!");
            $('#modalContainer').hide();
            dataTable.setData("/geomet/work/inventoryStatus/list", { startDate: $('.dayselect').val() || 'ALL' });
            handleSelectButtonClick();
        },
        error: function () {
            alert('저장 중 오류가 발생했습니다.');
        }
    });
});

const select = document.getElementById('medicine_name_select');
const input = document.getElementById('medicine_name_input');

select.addEventListener('change', function () {
    if (this.value === '기타') {
        input.style.display = 'block';
        input.required = true;
    } else {
        input.style.display = 'none';
        input.required = false;
        input.value = '';
    }
});

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





//-----------------------
let dataTable_main = null;
function getDataList_main() {
	let startDateInput = $("#start_date").val(); // 예: "2025-11"
	if (!startDateInput) {
	    alert("월을 선택해주세요.");
	    return;
	}

	// start_date: yyyyMM + "01080000"
	let parts = startDateInput.split("-"); // ["2025", "11"]
	let year  = parseInt(parts[0]);
	let month = parseInt(parts[1]);

	let start_date = parts[0] + parts[1].padStart(2, "0") + "01080000";

	// end_date: start_date + 1개월
	let endYear  = year;
	let endMonth = month + 1;
	if (endMonth > 12) { 
	    endMonth = 1; 
	    endYear += 1; 
	}
	let end_date = endYear.toString() + String(endMonth).padStart(2, "0") + "01080000";

	// month_ym: yyyy-MM
	let month_ym = startDateInput;

	console.log("start_date:", start_date, "end_date:", end_date, "month_ym:", month_ym);


    
    dataTable_main = new Tabulator("#dataTable_main", {
        height: "630px",
        layout: "fitDataFill",
        headerSort: false,
        selectable: 1,
        headerHozAlign: "center",

        ajaxConfig: "GET",
        ajaxLoader: false,
        ajaxURL: "/geomet/work/getMedicineInfo_main/list",

        ajaxParams: {  // ★ 여기에 파라미터 추가
            start_date: start_date,
            end_date: end_date,
            month_ym: month_ym
        },

        placeholder: "조회된 데이터가 없습니다.",

        ajaxResponse: function (url, params, response) {
            return response;
        },

        dataLoaded: function (data) {
            $("#dataTable_main .tabulator-col.tabulator-sortable").css("height", "29px");
        },

        columns: [
            // --- Integer ---
           // { title: "약품 ID", field: "m_id", hozAlign: "center" },
          { title: "약품명", field: "medicine_name", hozAlign: "left", width: 200 },
          { 
        	    title: "①월 생산실적<br>(Kg)", 
        	    field: "month_kg_1", 
        	    hozAlign: "right", 
        	    width: 120,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "②이월 약품<br>통수(EA/DM)", 
        	    field: "opening_balance_2", 
        	    hozAlign: "right", 
        	    width: 140,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "③Kg당<br>약품금액(원)", 
        	    field: "kg_price_3", 
        	    hozAlign: "right", 
        	    width: 120,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "④통당 약품금액<br>(원)", 
        	    field: "barrel_price_4", 
        	    hozAlign: "right", 
        	    width: 140,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "⑤통당 중량<br>(kg)/(L)", 
        	    field: "barrel_weight_5", 
        	    hozAlign: "right", 
        	    width: 140,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "⑥금월 입고<br>통수(EA/DM)", 
        	    field: "total_in_6", 
        	    hozAlign: "right", 
        	    width: 140,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "⑦금월 사용량<br>(EA/DM)", 
        	    field: "total_usage_7", 
        	    hozAlign: "right", 
        	    width: 140,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "⑧금월 약품<br>사용금액(원)(⑦*④)", 
        	    field: "use_price_8", 
        	    hozAlign: "right", 
        	    width: 160,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "⑨Kg당 약품 사용량<br>(Kg)(①/⑤*⑦)", 
        	    field: "kg_use_9", 
        	    hozAlign: "right", 
        	    width: 160,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},
        	{ 
        	    title: "약품 이월 통수<br>(EA/DM)(②+⑥)-⑦)", 
        	    field: "medicine_tong_10", 
        	    hozAlign: "right", 
        	    width: 160,
        	    formatter: "money",
        	    formatterParams: { thousand: ",", precision: 0 }
        	},



/*             { title: "총 사용량", field: "total_usage", hozAlign: "right" },
            { title: "증감량", field: "net_change", hozAlign: "right" },
            { title: "기말 재고", field: "end_balance", hozAlign: "right" }, */

            // --- String ---
        
           /*  { title: "설비 코드 그룹", field: "m_mach_code", hozAlign: "center" },
            { title: "첨부 규격", field: "attachment_spec_11", hozAlign: "left" },
            { title: "사용 여부 (Y/N)", field: "y_n", hozAlign: "center" },
            { title: "월 시작일", field: "month_start", hozAlign: "center" },

            // --- 추가 필드 ---
            { title: "등록일", field: "reg_date", hozAlign: "center" },
            { title: "업체명", field: "company_name", hozAlign: "left" },
            { title: "약품명(중복?)", field: "medicine_name", hozAlign: "left" },
            { title: "LOT 번호", field: "lot_no", hozAlign: "center" },
            { title: "입고", field: "stock_in", hozAlign: "right" },
            { title: "일일 사용량", field: "daily_usage", hozAlign: "right" },
            { title: "일일 합계", field: "day_sum", hozAlign: "right" } */
        ],


    });
}



</script>


</body>
</html>
