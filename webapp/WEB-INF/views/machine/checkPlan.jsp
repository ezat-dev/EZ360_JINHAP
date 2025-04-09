<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정기점검 계획</title>
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

</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
            <div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
           <label class="yearlabel">점검 연도 선택 :</label>
			<input type="text"autocomplete="off" class="yearSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">

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
		<div id="dataList" style="width: 96%;"></div>

        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        
	        
	        
	        
	       
			<form id="corrForm" enctype="multipart/form-data" autocomplete="off">
			 <h2 class="hName"></h2>	
			    <label>설비명</label>
			    <input type="text" name="equipment_name" readonly>
			
			    <label>항목</label>
			    <input type="text" name="item_type" readonly>
			
			    <label>최근 점검일</label>
			    <div class="checkbox-container">
			        <input type="text" class="daySet" name="updated_at" placeholder="점검일 선택" style="text-align: left;"readonly>
			    </div>
			
			    <label class="hName2">(변수)월 정검일</label>
			    <input type="text" class="monthDaySet" name="0m"  placeholder="(변수)월 정검일" >
			
			    <label>첨부(점검완료보고서)</label>
			
			  	<input type="text" name="save_url" id="save_url" readonly>
			   <input type="file" name="files" id="files" accept="application/pdf">
			    <label>비고</label>
			    <textarea name="remark" rows="10"></textarea>
			
			    <button type="submit" id="saveCorrStatus" style="font-weight: bold;">저장</button>
			    <button type="button" id="closeModal" style="font-weight: bold;">닫기</button>
			</form>


	    </div>
	</div>


     <script>
    $(document).ready(function () {

    	const currentYear = new Date().getFullYear();

    	
	    getDataList();
	    // 모달 열기 버튼 이벤트
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
        .val(currentYear) 
        .attr("placeholder", currentYear); 
	  
  
    });


	    $(".select-button").click(function () {
	       
	        let startDate = $("#startDate").val() || "";

	
	        console.log("검색 요청 값 =>", {
	            startDate: startDate
	        });


	        if (!startDate || startDate.trim() === "") {
	            const today = new Date();
	            startDate = today.getFullYear().toString();  
	        }
	        
	        dataTable.setData("/geomet/machine/checkPlan/list", {

	            "startDate": startDate,
	   
	        });
	    });




	    $("#files").on("change", function () {
	        const files = this.files;

	        if (files.length > 0) {
	            const file = files[0]; 
	            const ext = file.name.split('.').pop().toLowerCase();

	            if (ext !== 'pdf') {
	                alert("⚠️ PDF 파일만 업로드할 수 있습니다.");
	                this.value = ''; 
	                $("#save_url").val("");
	                return;
	            }

	            console.log("파일 이름:", file.name);
	            $("#save_url").val(file.name);

	        } else {
	            console.log("⚠️ 파일이 선택되지 않았습니다.");
	            $("#save_url").val("");
	        }
	    });




	    
	    var selectedRow = null;

	    function getDataList() {
	        dataTable = new Tabulator("#dataList", {
	            height: "830px",
	            layout: "fitColumns",
	            responsiveLayout: "collapse",
	            selectable: true,
	            tooltips: true,
	            selectableRangeMode: "click",
	            reactiveData: true,
	            headerHozAlign: "center",
	            ajaxConfig: "POST",
	            ajaxLoader: false,
	            ajaxURL: "/geomet/machine/checkPlan/list",
	            ajaxProgressiveLoad: "scroll",
	            ajaxParams: {
	                "startDate": $("#startDate").val() || "",
	            },
	            placeholder: "조회된 데이터가 없습니다.",
	            paginationSize: 20,
	            groupBy: "equipment_name",
	            groupStartOpen: true,
	            groupHeader: function(value, count, data) {
	                return `<span style="font-weight:bold; font-size:16px;">${value}</span>`;
	            },
	            ajaxResponse: function(url, params, response) {
	                $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
	                return response;
	            },
	            columns: [
	                { title: "설비", field: "equipment_name", width: 130, hozAlign: "center" },
	                { title: "점검일", field: "updated_at", width: 100, hozAlign: "center" },
	                { title: "항목", field: "item_type", hozAlign: "center" },
	                { title: "1월", field: "m1", hozAlign: "center" },
	                { title: "2월", field: "m2", hozAlign: "center" },
	                { title: "3월", field: "m3", hozAlign: "center" },
	                { title: "4월", field: "m4", hozAlign: "center" },
	                { title: "5월", field: "m5", hozAlign: "center" },
	                { title: "6월", field: "m6", hozAlign: "center" },
	                { title: "7월", field: "m7", hozAlign: "center" },
	                { title: "8월", field: "m8", hozAlign: "center" },
	                { title: "9월", field: "m9", hozAlign: "center" },
	                { title: "10월", field: "m10", hozAlign: "center" },
	                { title: "11월", field: "m11", hozAlign: "center" },
	                { title: "12월", field: "m12", hozAlign: "center" },
	                {
	                    title: "첨부 파일",
	                    field: "save_url",
	                    hozAlign: "center",
	                    width: 250,
	                    formatter: function(cell, formatterParams, onRendered) {
	                        const fileName = cell.getValue();
	                        if (!fileName) return "";
	                        return '<a href="/geomet/download?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
	                    }

	                },
	                { title: "비고", field: "remark", hozAlign: "left", width: 330 },
	            ],
	            cellClick: function (e, cell) {
	                const field = cell.getField();
	                const value = cell.getValue();
	                const rowData = cell.getRow().getData();

	                console.log("✅ 클릭한 필드명:", field);
	                console.log("✅ 클릭한 값:", value);
	                console.table(rowData);
	            },
	            cellDblClick: function(e, cell) {
	                const field = cell.getField();
	                const value = cell.getValue();
	                const rowData = cell.getRow().getData();
	                const monthNumber = field.replace("m", "");

	                if (monthNumber >= 1 && monthNumber <= 12) {
	                    const modal = $("#modalContainer");
	                    modal.show().addClass("show");

	                    $(".hName").text(monthNumber + "월 점검일 입력");
	                    $(".hName2").text(monthNumber + "월 정검일");

	                    const $monthInput = $(".monthDaySet");
	                    const newName = "m" + monthNumber;

	                    $monthInput.attr("name", newName);
	                    $monthInput.attr("placeholder", `${monthNumber}월 정검일`);
	                    $monthInput.val(value);

	                    $("input[name='equipment_name']").val(rowData.equipment_name);
	                    $("input[name='item_type']").val(rowData.item_type);
	                    $("input[name='updated_at']").val(rowData.updated_at);
	                    $("input[name='save_url']").val(rowData.save_url);
	                    $("textarea[name='remark']").val(rowData.remark);
	                }
	            }
	        });
	    }


        $(document).ready(function () {
            $("#saveCorrStatus").click(function (event) {
                event.preventDefault();
                
                var corrForm = new FormData($("#corrForm")[0]);

          
                corrForm.forEach(function(value, key){
                    console.log(key + ": " + value);
                });

                $.ajax({
                    url: "/geomet/machine/checkPlan/update",
                    type: "POST",
                    data: corrForm,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response.result === "success") {
                            alert("정기점검 계획 성공적으로 저장되었습니다!");
                            $("#modalContainer").hide();
                            getDataList(); 
                        } else {
                            alert("저장 실패: " + response.message);
                        }
                    },
                    error: function () {
                        alert("서버 오류 발생!");
                    }
                });
            });

            // 모달 닫기 버튼
            $("#closeModal").click(function () {
                $("#modalContainer").hide();
            });
        });



    	
        $(".delete-button").click(function(event) {
            event.preventDefault();
            
            console.log("삭제 버튼 클릭됨");

            if (!selectedRow) {
                alert("삭제할 행을 선택하세요.");
                return;
            }

            var no = selectedRow.getData().no;
            
            console.log("no", no);

            if (!no) {
                alert("삭제할 항목이 없습니다.");
                return;
            }

            var requestData = JSON.stringify({ "no": no });
            console.log("전송된 데이터:", requestData);

            $.ajax({
                url: "/geomet/machine/checkPlan/del",
                type: "POST",
                contentType: "application/json",
                data: requestData,
                dataType: "json",
                success: function(response) {
                    console.log("삭제 성공:", response);
                    alert("TC/조절계 이력 성공적으로 삭제되었습니다!");
                    selectedRow.delete();
                    selectedRow = null;  
                    getDataList();
                },
                error: function(xhr, status, error) {
                    console.log("삭제 오류 발생:", xhr.responseText);
                    alert("삭제 중 오류가 발생했습니다: " + error);
                }
            });
        });

   

        $(".excel-button").on("click", function () {
        	  console.log("엑셀 다운로드 버튼 클릭됨");  	
            const startDate = $("#startDate").val() || "";
  
            console.log("엑셀 다운로드 요청 값 =>", {
                startDate: startDate
            });
          	  
              
            $.ajax({
                url: "/geomet/machine/checkPlan/excel",
                type: "post",
                data: {
                    startDate: startDate
                },
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    alert("D:\\GEOMET양식\\정기점검 계획 저장 완료되었습니다.");
                },
                error: function (xhr, status, error) {
                    alert("엑셀 다운로드 중 오류가 발생했습니다. 다시 시도해주세요.");
                    console.error("Error:", error);
                }
            });
        });

                
    </script>

</body>
</html>
