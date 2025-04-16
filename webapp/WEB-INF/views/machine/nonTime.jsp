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
             
               	<select class="equipment_name_select" id="equipment_name">
             
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

            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
            <div id="dataView"></div>
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>교체이력 등록</h2>
	        <form id="corrForm">
	            <label>설비명</label>
            <select class="equipment_name_select" name="equipment_name">
             
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
	            <input type="text"class="timeSet" name="start_time" value="">
	
	            <label>조치시간</label>
	            <input type="text" class="timeSet" name="end_time" placeholder="">
	
	          	<label>비고</label>
	            <textarea name="non_time_memo" rows="3"></textarea>
				
	            
	       
	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


    <script>

    var dataTable;

    
        $(function() {
            getDataList();
            getDataList2();
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
                ajaxURL: "/geomet/machine/nonTime/list",
                ajaxProgressiveLoad: "scroll",
                ajaxParams: {
                    equipment_name: $("#equipment_name").val() || "",
                    startDate: $("#startDate").val() || "",
                    endDate: $("#endDate").val() || "",
                },
                
                placeholder: "조회된 데이터가 없습니다.",
                ajaxResponse: function(url, params, response) {
                    // 객체로 받은 data와 count를 사용하여 Tabulator가 처리할 수 있도록 변환
                    if (response.status === "success") {
                        return {
                            last_page: Math.ceil(response.count / params.pageSize),  // 전체 페이지 수
                            data: response.data  // 데이터를 직접 전달
                        };
                    }
                    return [];  // 실패 시 빈 배열 반환
                },
                columns: [
                    {title: "설비", field: "equipment_name", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "정보LIST", field: "info_list", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "발생시간", field: "start_time", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "조치시간", field: "end_time", sorter: "string", width: 200, hozAlign: "center", headerSort: false},
                    {title: "비고", field: "non_time_memo", sorter: "string", width: 250, hozAlign: "center", headerSort: false},
                    
                    {title: "machine_code", field: "machine_code", sorter: "string", width: 250, hozAlign: "center", headerSort: false, visible: false },
                ],
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

        $(".select-button").click(function () {
            var equipment_name = $("#equipment_name").val();
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();

         
            console.log("보내는 값:");
            console.log("equipment_name:", equipment_name);
            console.log("startDate:", startDate);
            console.log("endDate:", endDate);

            dataTable.setData("/geomet/machine/nonTime/list", {
                equipment_name: equipment_name,
                startDate: startDate,
                endDate: endDate
            }).then(function(responseData) {
               
            }).catch(function(error) {
                console.error("❌ 데이터 로드 중 오류 발생:", error);
            });

        });



        function getDataList2() {
            dataTable = new Tabulator("#dataView", {
                height: "560px",
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
                ajaxParams: {
                    equipment_name: $("#equipment_name").val() || "",
                   
                },
                
                placeholder: "조회된 데이터가 없습니다.",
                ajaxResponse: function(url, params, response) {
                    // 객체로 받은 data와 count를 사용하여 Tabulator가 처리할 수 있도록 변환
                    if (response.status === "success") {
                        return {
                            last_page: Math.ceil(response.count / params.pageSize),  // 전체 페이지 수
                            data: response.data  // 데이터를 직접 전달
                        };
                    }
                    return [];  // 실패 시 빈 배열 반환
                },
                columns: [
                    {title: "순위", field: "sum_time", sorter: "string", width: 50, hozAlign: "center", headerSort: false},
                    {title: "비가동 내역", field: "info_list_v", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    {title: "설비", field: "equipment_name", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    {title: "비가동 시간", field: "sum_time_ch", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    {title: "일/발생 건수", field: "day_count", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    {title: "월/발생 건수", field: "month_count", sorter: "string", width: 100, hozAlign: "center", headerSort: false},
                    
                  
                ],
            });
        }





        
        $(document).ready(function () {
            $("#saveCorrStatus").click(function (event) {
                event.preventDefault();

                var corrForm = new FormData($("#corrForm")[0]);  // 폼 데이터를 FormData 객체로 생성

                // FormData의 값을 콘솔에 출력
                corrForm.forEach(function(value, key){
                    console.log(key + ": " + value);  // key와 value를 콘솔에 출력
                });

                $.ajax({
                    url: "/geomet/machine/nonTime/insert",
                    type: "POST",
                    data: corrForm,
                    dataType: "json",
                    processData: false,  
                    contentType: false,  
                    success: function (response) {
                        if (response.result === "success") {
                            alert("비가동 내역이 성공적으로 저장되었습니다!");
                            $("#modalContainer").hide();

                          
                            var equipment_name = $("#equipment_name").val();
                            var startDate = $("#startDate").val();
                            var endDate = $("#endDate").val();

                           
                            dataTable.setData("/geomet/machine/nonTime/list", {
                                equipment_name: equipment_name,
                                startDate: startDate,
                                endDate: endDate
                            });
                            dataTable.setData("/geomet/machine/nonTime/view", {
                                equipment_name: equipment_name
        
                            });
                        } else {
                            alert("저장 실패: " + response.message);
                        }
                    }
,
                    error: function (xhr, status, error) {
                        alert("서버 오류: " + error);
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
