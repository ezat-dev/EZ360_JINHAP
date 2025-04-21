<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비별 액 관리</title>
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
        .mch_code {
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
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="monthlabel">조건관리 :</label>
				<input type="text"autocomplete="off" class="monthSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">

	            <label class="daylabel">설비명 :</label>
	        <select id="mch_code" class="mch_code">
             
                <option value="G03-GG01">G800조건관리</option>
                <option value="G03-GG03">G600조건관리</option>
                <option value="PL">PLUS조건관리</option>
                <option value="ML">ML조건관리</option>
                <option value="G04-GG05">K-BLACK조건관리</option>

            </select>
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
            <div id="dataTable"></div>
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>조건관리 일지</h2>
	        <form id="corrForm">
	            <label>설비명</label>
	            <select name="equipmentName2">
	                <option value="G800">G800</option>
	                <option value="G600">G600</option>	
	                <option value="PLUS">PLUS</option>	
	                <option value="ML">ML</option>	
	                <option value="K_BLACK">K_BLACK</option>		               
	            </select>
	
				<label>정검 일자</label>
				<input type="text" class="daySet" name="replacementCycle" placeholder="정검 일자 선택" style="text-align: left;" autocomplete="off">
				
				
	            <label>점검 항목</label>
	              <select name="select1">
	                <option value="1">액탱크 온도(38°C이하)</option>
	                <option value="2">점도(40±10초)</option>
	                <option value="3">점도비중(1.43±0.05)</option>
	                <option value="4">칠러(냉각기)온도(10±2 ℃)</option>
	            </select>
	
	          
	
	            <label>내용</label>
	            <textarea name="remarks" rows="17"></textarea>
	
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
            // startDate와 mch_code 값을 변수로 저장
            const startDate = (() => {
                const v = $("#startDate").val();
                return v ? v + "-01" : "";
            })();

            const mch_code = $(".mch_code").val(); // class로 선택

            // 콘솔에 출력
            console.log("📌 startDate:", startDate);
            console.log("📌 mch_code:", mch_code);

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
                ajaxURL: "/geomet/condition/machinePartTemp/list",
                ajaxProgressiveLoad: false,
                ajaxParams: {
                    startDate: startDate,
                    mch_code: mch_code
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
                    { title: "일자", field: "date ", sorter: "string", width: 200, hozAlign: "center", headerSort: false },
                    { title: "액탱크 온도(38°C이하)", field: "tank_temp", sorter: "string", width: 340, hozAlign: "center", headerSort: false },
                    { title: "점도(40±10초)", field: "visocosity", sorter: "string", width: 340, hozAlign: "center", headerSort: false },
                    { title: "비중(1.43±0.05)", field: "specific_gravity", sorter: "string", width: 340, hozAlign: "center", headerSort: false },
                    { title: "칠러(냉각기)온도(10±2 ℃)", field: "chiller_temp", sorter: "string", width: 340, hozAlign: "center", headerSort: false },
                    { title: "id", field: "id", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "mch_code", field: "mch_code", sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "mch_name", field: "mch_name", sorter: "string", hozAlign: "center", headerSort: false },
                ],

                cellClick: function (e, cell) {
      		      // 클릭 이벤트
      		    },

      		    cellDblClick: function (e, cell) {
      		    	  const rowData = cell.getRow().getData(); // 해당 row의 전체 데이터
      		    	  const modal = $("#modalContainer");

      		    	  modal.show().addClass("show");

      		    	  
      		    	  const form = $("#corrForm");
      		    	 
      		    	}
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