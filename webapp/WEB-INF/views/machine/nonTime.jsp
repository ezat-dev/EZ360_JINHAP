<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비가동현황</title>
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
             gap: 60px;
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
		    width: 900px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .equipmentName {
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
        .equipment_name{
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
	.excel-button {
	    margin-right: 30px;
	}
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
              <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">비가동 날짜 :</label>
				<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
	
	            <label class="daylabel">설비명 :</label>
             
              		 <select name="equipment_name"id="equipment_name">
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
          <div id="dataView"></div>
          <div id="dataList"></div>
        
          
      
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>교체이력 등록</h2>
	        <form id="corrForm"autocomplete="off">
	            <label>설비명</label>
   

			 <select name="equipment_name">
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


	            <label>정보LIST</label>
			<select name="info_list">
				<option value="기타">기타(입력)</option>
			    <option value="사각통 대기">사각통 대기</option>
			    <option value="물량 부족">물량 부족</option>
			    <option value="설비 고장">설비 고장</option>
			    <option value="정기보수">정기보수</option>
			    <option value="자동화 테스트">자동화 테스트</option>
			    <option value="3정5행">3정5행</option>
			    <option value="공정창고 고장">공정창고 고장</option>
			    <option value="인력부족">인력부족</option>
			    <option value="탱크 교환">탱크 교환</option>
			    <option value="설비보전(청소)">설비보전(청소)</option>
			    <option value="액탱크청소">액탱크청소</option>
			    <option value="바스켓 청소">바스켓 청소</option>
			    <option value="바스켓교체">바스켓교체</option>
			    <option value="건욕">건욕</option>
			    <option value="조회, 교육">조회, 교육</option>
			    <option value="AGV에러">AGV에러</option>
			    <option value="통신이상">통신이상</option>
			    <option value="생산계획없음">생산계획없음</option>
			    <option value="기타">기타</option>
			    <option value="재고과잉">재고과잉</option>
			    <option value="바코드에러">바코드에러</option>
			</select>


	
	            <label>발생시간</label>
	            <input type="text"class="datetimeSet" name="start_time" value="">
	
	            <label>조치시간</label>
	            <input type="text" class="datetimeSet" name="end_time" placeholder="">
	
	          	<label>비고</label>
	            <textarea name="non_time_memo" rows="12"></textarea>
	            
		<!-- 		<input type="hidden" class="facility_equipment_name" name="equipment_name" value=""> -->
				<input type="hidden" class="facility_machine_code" name="machine_code" value="">
				<input type="hidden" name="non_time_idx" />
	       
	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


<script>

let now_page_code = "h02";


$(document).ready(function() {
    // 화면 로드 시 어제 날짜와 오늘 날짜 자동 설정
    var today = new Date();
    var yesterday = new Date(today);
    yesterday.setDate(today.getDate() - 1); // 어제 날짜

    // 날짜를 yyyy-MM-dd 형식으로 변환하는 함수
    function formatDate(date) {
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "-" + month + "-" + day;
    }

    // 어제 날짜와 오늘 날짜를 각각 입력 필드에 설정
    $("#startDate").val(formatDate(yesterday));
    $("#endDate").val(formatDate(today));

    // 화면 로드 시 데이터 가져오기
    getDataList();
    getDataList2();

    // 조회 버튼 클릭 시 데이터 조회
    $(".select-button").click(function() {
        var equipment_name = $("#equipment_name").val();
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        console.log("서버로 보내는 데이터:", {
            equipment_name: equipment_name,
            startDate: startDate,
            endDate: endDate
        });

        // 두 개의 Tabulator 테이블에 데이터 로드
        dataListTable.setData("/geomet/machine/nonTime/list", {
            equipment_name: equipment_name,
            startDate: startDate,
            endDate: endDate
        });

        dataViewTable.setData("/geomet/machine/nonTime/view", {
            equipment_name: equipment_name,
            startDate: startDate,
            endDate: endDate
        });
    });

    $(".insert-button").click(function() {
        openModal("add");
    });

    $(".delete-button").click(function() {
        deleteCorrStatus();
    });

    $(".close, #closeModal").click(function() {
        closeModal();
    });
});
function openModal(mode, rowData) {
    var $modal = $("#modalContainer");
    var $btn = $("#saveCorrStatus");
    var $form = $("#corrForm");

    $form[0].reset();

    if (mode === "edit") {

        $form.find("select[name='equipment_name']").val(rowData.machine_code);
        $form.find("select[name='info_list']").val(rowData.info_list);
        $form.find("input[name='start_time']").val(rowData.start_time);
        $form.find("input[name='end_time']").val(rowData.end_time);
        $form.find("textarea[name='non_time_memo']").val(rowData.non_time_memo);
        $form.find("input[name='non_time_idx']").val(rowData.non_time_idx);

       
        if ($form.find("input[name='machine_code']").length === 0) {
            $form.append("<input type='hidden' name='machine_code' value='" + rowData.machine_code + "'>");
        } else {
            $form.find("input[name='machine_code']").val(rowData.machine_code);
        }

        $btn.text("수정");

    } else {
      
        const selectedOption = $form.find("select[name='equipment_name'] option:selected");
        const machineCode = selectedOption.data("machine_code");

        if ($form.find("input[name='machine_code']").length === 0) {
            $form.append("<input type='hidden' name='machine_code' value='" + machineCode + "'>");
        } else {
            $form.find("input[name='machine_code']").val(machineCode);
        }

        $btn.text("추가");
    }


    $btn.off("click").on("click", function(event) {
        event.preventDefault();
        if (mode === "edit") {
            updateCorrStatus();
        } else {
            saveCorrStatus();
        }
    });

    $modal.addClass("show");
}

function closeModal() {
    $("#modalContainer").removeClass("show");
}

function getDataList() {
    dataListTable = new Tabulator("#dataList", {
        height: "720px",
        layout: "fitColumns",
        selectable: true,
        tooltips: true,
        selectableRangeMode: "click",
        reactiveData: true,
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        headerHozAlign: "center",
        ajaxConfig: "POST",
        ajaxLoader: false,
        ajaxURL: "/geomet/machine/nonTime/list",
        ajaxProgressiveLoad: "scroll",
        ajaxParams: {
            equipment_name: $("#equipment_name").val() || "",
            startDate: $("#startDate").val() || "",
            endDate: $("#endDate").val() || "",
        },
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function(url, params, response) {
            if (response.status === "success") {
                return {
                    last_page: Math.ceil(response.count / params.pageSize),
                    data: response.data
                };
            }
            return [];
        },
        columns: [
            {title: "설비", field: "equipment_name", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
            {title: "정보LIST", field: "info_list", sorter: "string", width: 170, hozAlign: "center", headerSort: false},
            {title: "발생시간", field: "start_time", sorter: "string", width: 180, hozAlign: "center", headerSort: false},
            {title: "조치시간", field: "end_time", sorter: "string", width: 180, hozAlign: "center", headerSort: false},
            {title: "비고", field: "non_time_memo", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
            {title: "non_time_idx", field: "non_time_idx", sorter: "string", width: 250, hozAlign: "center", headerSort: false, visible: false},
            {title: "machine_code", field: "machine_code", sorter: "string", width: 250, hozAlign: "center", headerSort: false, visible: false},
            ],
            rowDblClick: function(e, row) {
            	 const data = row.getData();
            	 console.log("더블클릭한 rowData:", data);
                 console.log("JSON 문자열:", JSON.stringify(data, null, 2));  // 보기 편하게 포맷팅
                openModal("edit", row.getData());
            }
        });
    }

function getDataList2() {
    dataViewTable = new Tabulator("#dataView", {
        height: "720px",
        layout: "fitColumns",
        selectable: true,
        tooltips: true,
        selectableRangeMode: "click",
        reactiveData: true,
        headerHozAlign: "center",
        ajaxConfig: "POST",
        ajaxLoader: false,
        ajaxURL: "/geomet/machine/nonTime/view",
        ajaxProgressiveLoad: "scroll",
        // 여기에 startDate, endDate, equipment_name 추가
        ajaxParams: {
            equipment_name: $("#equipment_name").val() || "",
            startDate: $("#startDate").val() || "",
            endDate: $("#endDate").val() || ""
        },
        placeholder: "조회된 데이터가 없습니다.",
        ajaxResponse: function(url, params, response) {
            if (response.status === "success") {
                return {
                    last_page: Math.ceil(response.count / params.pageSize),
                    data: response.data
                };
            }
            return [];
        },
        columns: [
            {
                title: "순위",
                field: "rank",
                hozAlign: "center",
                width: 70,
                headerSort: false,
                formatter: function(cell) {
                    return cell.getRow().getPosition(true) + 1;
                }
            },
            {title: "설비", field: "v_equipment_name", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
            {title: "비가동 내역", field: "info_list_v", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
            {title: "비가동 시간", field: "sum_time_ch", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
            {title: "일/발생 건수", field: "day_count", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
            {title: "월/발생 건수", field: "month_count", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
        ],
        rowClick: function(e, row) {
            console.log("클릭한 설비:", row.getData().v_equipment_name);
        }
    });
}
function saveCorrStatus() {
    

	var value = $("#popup_equip :selected").val();
	var text = $("#popup_equip :selected").text();

	console.log("save : "+value, text);


	$(".facility_machine_code").val(value);
//	$(".facility_equipment_name").val(text);

	var corrForm = new FormData($("#corrForm")[0]);
    
    $.ajax({
        url: "/geomet/machine/nonTime/insert",
        type: "POST",
        data: corrForm,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(response) {
            if (response.result === "success") {
                alert("비가동 내역이 성공적으로 저장되었습니다!");
                closeModal();
                refreshData();
            } else {
                alert("저장 실패: " + response.message);
            }
        }
    });
}

function updateCorrStatus() {
    var corrForm = new FormData($("#corrForm")[0]);

    $.ajax({
        url: "/geomet/machine/nonTime/update",
        type: "POST",
        data: corrForm,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(response) {
            if (response.result === "success") {
                alert("비가동 내역이 성공적으로 수정되었습니다!");
                closeModal();
                refreshData();
            } else {
                alert("수정 실패: " + response.message);
            }
        }
    });
}
function deleteCorrStatus() {
    var selectedRows = dataListTable.getSelectedData();
    if (selectedRows.length === 0) {
        alert("삭제할 행을 선택하세요.");
        return;
    }

    if (!confirm("선택한 비가동 내역을 삭제하시겠습니까?")) {
        return;
    }

    var nonTimeIdxList = selectedRows.map(function(row) {
        return row.non_time_idx;
    });

    $.ajax({
        url: "/geomet/machine/nonTime/delete",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ non_time_idx: nonTimeIdxList[0] }), // ← 여기 쉼표 추가!
        
        success: function(response) {
            if (response.result === "success") {
                alert("비가동 내역이 삭제되었습니다.");
                refreshData();
            } else {
                alert("삭제 실패: " + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert("서버 오류: " + error);
        }
    });

}

function refreshData() {
    var equipment_name = $("#equipment_name").val();
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();

    dataListTable.setData("/geomet/machine/nonTime/list", {
        equipment_name: equipment_name,
        startDate: startDate,
        endDate: endDate
    });


    dataViewTable.setData("/geomet/machine/nonTime/view", {
        equipment_name: equipment_name,
        startDate: startDate,
        endDate: endDate
    });
}
</script>


</body>
</html>
