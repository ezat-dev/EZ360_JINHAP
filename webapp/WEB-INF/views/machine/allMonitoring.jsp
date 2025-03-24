<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통합 모니터링</title>

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
            flex-direction: column; /* 세로 배치 */
		    align-items: center; /* 중앙 정렬 */
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
		    width: 1000px;
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
        
		.status {
		    display: flex;
		    align-items: center;
		    font-size: 18px; 
		    margin-right: 15px;
		    margin-bottom: 13px;
		}
		
		.status span {
		    width: 17px; 
		    height: 17px; 
		    border-radius: 50%;
		    display: inline-block;
		    margin-right: 8px;
		   
		}
		.running {
		    background-color: green;
		}
		
		.changing {
		    background-color: orange;
		}
		
		.stopped {
		    background-color: red;
		}
		
		.unit {
		    margin-left: 10px;
		    font-size: 18px; 
		    color: gray;
		     margin-bottom: 17px;
		}

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
           <div class="box1">
           
           
             <div class="status">
		        <span class="running"></span> 운전중
		    </div>
		    <div class="status">
		        <span class="changing"></span> 변경
		    </div>
		    <div class="status">
		        <span class="stopped"></span> 정지
		    </div>
		    <div class="unit">단위: ton, %</div>
           
        
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
           <label class="daylabel">교체일자 :</label>
			<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" autocomplete="off"class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

           
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
            <div id="dataList2"></div>
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
	
	            <label>존 구분</label>
	            <input type="text" name="location" value="소입1존">
	
	            <label>시리얼 번호</label>
	            <input type="text" name="serialNumber" placeholder="시리얼 번호">
	
	            <label>교체일자</label>
	            <input type="date"class="daySet" name="replacementDate" placeholder="조치완료일 선택" style="text-align: left;">

	
	            <label>차기 교체일자</label>
	            <input type="text" name="nextDate">
	            
	            <label>교체 주기</label>
	            <input type="text" name="replacementCycle">
	
	            <label>비고</label>
	            <textarea name="remarks" rows="3"></textarea>
	
	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


    <script>
        $(function() {
            getDataList();
            getDataList2();
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "360px",
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
                    {title: "설비", field: "equipment", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
                    {title: "설비 상태", field: "status", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "시간당 생산 통수", field: "production_per_hour", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "보유 시간", field: "holding_time", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "장입 통수", field: "charge_count", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "평균 장입 통수", field: "avg_charge_count", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "통당 간격", field: "interval_per_ton", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "생산 LOSS 시간(비가동)", field: "loss_time", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "가동 시간", field: "operation_time", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
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






        function getDataList2() {
            dataTable = new Tabulator("#dataList2", {
                height: "360px",
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
                    {title: "현 생산 실적", field: "current_production", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
                    {title: "현 생산 목표", field: "current_target", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
                    {title: "실적 - 생산", field: "actual_production", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
                    {title: "실적 - 과부족", field: "over_shortage", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
                    {title: "달성률(%)", field: "achievement_rate", sorter: "string", width: 150, hozAlign: "center", headerSort: false},
                    {title: "누적실적 - 생산량", field: "cumulative_production", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "누적실적 - 생산 통수", field: "cumulative_count", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "누적실적 - 과부족량", field: "cumulative_over_shortage", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "누적실적 - 과부족 통수", field: "cumulative_over_shortage_count", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "누적실적 - 달성률", field: "cumulative_achievement_rate", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
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

