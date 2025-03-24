<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>생산모니터링</title>
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
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">교체일자 :</label>
				<input type="text" autocomplete="off" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid"  style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
	
	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect">
             
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
                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
                <button class="printer-button">
                    <img src="/geomet/css/tabBar/printer-icon.png" alt="printer" class="button-image">출력
                </button>
            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>교체이력 등록</h2>
	        <form id="corrForm">
	            <label>설비명</label>
	            <select name="equipmentName">
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
	
	            <label>점검</label>
	              <select name="select1">
	                <option value="일상">일상</option>
	                <option value="정기">정기</option>
	            </select>
	
	            <label>정비</label>
	           	<select name="select2">
	                <option value="예방">예방</option>
	            	<option value="돌발">돌발</option>
	            </select>
	
	            <label>점검 및 정비 내용</label>
	           <input type="text" name="nextDate">

	
	            <label>점검 결과</label>
	            <select name="select3">
	                <option value="양호">예방</option>
	            	<option value="추가보안 필요">돌발</option>
	            </select>
	            
	         
	
	            <label>비고</label>
	            <textarea name="remarks" rows="4"></textarea>
	
	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


    <script>
        $(function() {
            getDataList();
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "560px",
                layout: "fitColumns",
                selectable: true,
                tooltips: true,
                selectableRangeMode: "click",
                reactiveData: true,
                headerHozAlign: "center",
                ajaxConfig: "POST",
                ajaxLoader: false,
                ajaxURL: "/geomet/quality/tustest/selectList",
                ajaxProgressiveLoad: "scroll",
                ajaxParams: {},
                placeholder: "조회된 데이터가 없습니다.",
                paginationSize: 20,
                ajaxResponse: function(url, params, response) {
                    $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                    return response;
                },
                columns: [
                    {title: "설비", field: "1", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    {title: "일 목표 생산량", field: "2", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "현 생산량(kg)", field: "3", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "시간당 생산량(kg)", field: "4", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "누적 진도율(%)", field: "5", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "장입량 준수율(%)", field: "6", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "로트수", field: "6", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "비가동 현황(시간)", field: "6", sorter: "string", width: 280, hozAlign: "center", headerSort: false},
                    ],
                   
              
                rowFormatter: function(row) {
                    var data = row.getData();
                    row.getElement().style.fontWeight = "700";
                    row.getElement().style.backgroundColor = "#FFFFFF";
                },
                rowClick: function(e, row) {
                    $("#dataList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item) {
                        if ($(this).hasClass("row_select")) {
                            $(this).removeClass('row_select');
                            row.getElement().className += " row_select";
                        } else {
                            $("#dataList div.row_select").removeClass("row_select");
                            row.getElement().className += " row_select";
                        }
                    });
                },
            });
        }

        document.querySelector(".insert-button").addEventListener("click", function() {
            let modal = document.getElementById("modalContainer");
            modal.classList.add("show");
        });

        document.querySelector(".close").addEventListener("click", function() {
            let modal = document.getElementById("modalContainer");
            modal.classList.remove("show");
        });
        document.getElementById("closeModal").addEventListener("click", function() {
            document.getElementById("modalContainer").classList.remove("show");
        });


        $(document).ready(function () {
            $("#saveCorrStatus").click(function (event) {
                event.preventDefault();
                
                var corrForm = new FormData($("#corrForm")[0]);  // 폼 데이터를 FormData 객체로 생성

                // FormData의 값을 콘솔에 출력
                corrForm.forEach(function(value, key){
                    console.log(key + ": " + value);  // key와 value를 콘솔에 출력
                });

                $.ajax({
                    url: "/geomet/condition/corrStatus/insert",
                    type: "POST",
                    data: corrForm,
                    dataType: "json",
                    processData: false,  
                    contentType: false,  
                    success: function (response) {
                        alert("교체 이력이 성공적으로 저장되었습니다!");
                        $("#modalContainer").hide(); 
                    }
                });
            });

            // 모달 닫기 버튼 이벤트
            $("#closeModal").click(function () {
                $("#modalContainer").hide();
            });
        });

        	


        
    </script>

</body>
</html>
