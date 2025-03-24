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
           <label class="daylabel">교체일자 :</label>
			<input type="text"autocomplete="off" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" autocomplete="off"class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

            <label class="daylabel">설비명 :</label>
            <select class="dayselect">
             
               <option value="탈유탈지1호기">탈유탈지 1호기</option>
			    <option value="탈유탈지2호기">탈유탈지 2호기</option>
			    <option value="쇼트1호기">쇼트 1호기</option>
			    <option value="쇼트2호기">쇼트 2호기</option>
			    <option value="쇼트3호기">쇼트 3호기</option>
			    <option value="쇼트4호기">쇼트 4호기</option>
			    <option value="쇼트5호기">쇼트 5호기</option>
			    <option value="쇼트6호기">쇼트 6호기</option>
			    <option value="G600">G-600</option>
			    <option value="G800">G-800</option>
			    <option value="공용설비">공용설비</option>
			    <option value="K-BLACK">K-BLACK</option>
			    <option value="E코팅1호기">E코팅 1호기</option>
			    <option value="E코팅2호기">E코팅 2호기</option>
			    <option value="방청">방청</option>
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
		        <option value="탈유탈지1호기">탈유탈지 1호기</option>
		        <option value="탈유탈지2호기">탈유탈지 2호기</option>
		        <option value="쇼트1호기">쇼트 1호기</option>
		        <option value="쇼트2호기">쇼트 2호기</option>
		        <option value="쇼트3호기">쇼트 3호기</option>
		        <option value="쇼트4호기">쇼트 4호기</option>
		        <option value="쇼트5호기">쇼트 5호기</option>
		        <option value="쇼트6호기">쇼트 6호기</option>
		        <option value="G600">G-600</option>
		        <option value="G800">G-800</option>
		        <option value="공용설비">공용설비</option>
		        <option value="K-BLACK">K-BLACK</option>
		        <option value="E코팅1호기">E코팅 1호기</option>
		        <option value="E코팅2호기">E코팅 2호기</option>
		        <option value="방청">방청</option>
		    </select>
		

		    <label>점검날짜</label>
		    <input type="date" class="daySet" name="replacementDate" placeholder="조치완료일 선택" style="text-align: left;">
		
		    <label>항목</label>
		    <select name="select2">
		        <option value="1">계획</option>
		        <option value="2">실적</option>
		    </select>
		    
		    
			<label>점검 월</label>
			  <div class="checkbox-container">
				    <label><input type="checkbox" name="Jan" value="1"><span></span> 1월</label>
				    <label><input type="checkbox" name="Feb" value="2"><span></span> 2월</label>
				    <label><input type="checkbox" name="Mar" value="3"><span></span> 3월</label>
				    <label><input type="checkbox" name="Apr" value="4"><span></span> 4월</label>
				    <label><input type="checkbox" name="May" value="5"><span></span> 5월</label>
				    <label><input type="checkbox" name="Jun" value="6"><span></span> 6월</label>
				    <label><input type="checkbox" name="Jul" value="7"><span></span> 7월</label>
				    <label><input type="checkbox" name="Aug" value="8"><span></span> 8월</label>
				    <label><input type="checkbox" name="Sep" value="9"><span></span> 9월</label>
				    <label><input type="checkbox" name="Oct" value="10"><span></span> 10월</label>
				    <label><input type="checkbox" name="Nov" value="11"><span></span> 11월</label>
				    <label><input type="checkbox" name="Dec" value="12"><span></span> 12월</label>
				</div>
		
		
		
		    <label>차기 교체일자</label>
		    <input type="text" name="nextDate">
		
		    <label>첨부(점검완료보고서)</label>
		    <input type="text" name="replacementCycle">
		
		    <label>비고</label>
		    <textarea name="remarks" rows="3"></textarea>
		

		
		   <button type="submit" id="saveCorrStatus" style="font-weight: bold;">저장</button>
			<button type="button" id="closeModal" style="font-weight: bold;">닫기</button>

		</form>

	    </div>
	</div>


    <script>
        $(function() {
            getDataList();
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "700px",
     
                layout: "fitColumns",
                selectable: true,
                tooltips: true,
                selectableRangeMode: "click",
                reactiveData: true,
                headerHozAlign: "center",
                placeholder: "조회된 데이터가 없습니다.",
                paginationSize: 20,
                columns: [
                	 { title: "설비", field: "설비", width: 150, hozAlign: "center" },
                     { title: "점검날짜", field: "점검 날짜", width: 180, hozAlign: "center" },
                     { title: "항목", field: "항목", width: 100, hozAlign: "center" },
                     { title: "1월", field: "1월", width: 70, hozAlign: "center" },
                     { title: "2월", field: "2월", width: 70, hozAlign: "center" },
                     { title: "3월", field: "3월", width: 70, hozAlign: "center" },
                     { title: "4월", field: "4월", width: 70, hozAlign: "center" },
                     { title: "5월", field: "5월", width: 70, hozAlign: "center" },
                     { title: "6월", field: "6월", width: 70, hozAlign: "center" },
                     { title: "7월", field: "7월", width: 70, hozAlign: "center" },
                     { title: "8월", field: "8월", width: 70, hozAlign: "center" },
                     { title: "9월", field: "9월", width: 70, hozAlign: "center" },
                     { title: "10월", field: "10월", width: 70, hozAlign: "center" },
                     { title: "11월", field: "11월", width: 70, hozAlign: "center" },
                     { title: "12월", field: "12월", width: 70, hozAlign: "center" },
                     { title: "첨부 (점검완료보고서)", field: "첨부", width: 200, hozAlign: "center" },
                     { title: "비고", field: "비고", width: 150, hozAlign: "center" }
                     ],
            });
           
            dataTable.setData(tableData);
        }


        const tableData = [
            { 설비: "탈유탈지 1호기", 점검 : "2024-02-15", 항목: "계획", "1월": "", "2월": "", "3월": "○", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "탈유탈지 2호기", 점검 : "2024-02-10", 항목: "계획", "1월": "", "2월": "○", "3월": "", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "쇼트 1호기", 점검 : "2024-01-20", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "○", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "쇼트 2호기", 점검 : "2023-12-25", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "○", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "쇼트 3호기", 점검 : "2023-12-10", 항목: "계획", "1월": "○", "2월": "", "3월": "", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "쇼트 4호기", 점검 : "2023-11-30", 항목: "계획", "1월": "", "2월": "", "3월": "○", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "쇼트 5호기", 점검 : "2023-11-15", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "", "6월": "○", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "쇼트 6호기", 점검 : "2023-10-25", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "", "6월": "", "7월": "○", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "G-600", 점검 : "2023-10-05", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "○", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "G-800", 점검 : "2023-09-20", 항목: "계획", "1월": "", "2월": "○", "3월": "", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "공용설비", 점검 : "2023-09-10", 항목: "계획", "1월": "", "2월": "", "3월": "○", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "K-BLACK", 점검 : "2023-08-30", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "○", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "E코팅 1호기", 점검 : "2023-08-10", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "○", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "E코팅 2호기", 점검 : "2023-07-25", 항목: "계획", "1월": "", "2월": "", "3월": "○", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" },
            { 설비: "방청", 점검 : "2023-07-10", 항목: "계획", "1월": "", "2월": "", "3월": "", "4월": "", "5월": "", "6월": "", "7월": "", "8월": "", "9월": "○", "10월": "", "11월": "", "12월": "", "첨부": "", "비고": "" }
        ];




        
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
