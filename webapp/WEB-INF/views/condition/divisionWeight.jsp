<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>분할기준중량관리</title>
 
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
        
            /* 체크박스 스타일 */
 /* 체크박스 스타일 */
    .checkbox-group {
        display: flex;
        gap: 20px;
        margin-bottom: 10px;
    }
    .checkbox1{
    margin-top:20px;
    margin-right:10px;
    
    }

    .checkbox-group label {
        font-size: 16px;
    }

    .checkbox-group input[type="checkbox"] {
        transform: scale(1.7); /* 체크박스 크기 키우기 */
    }
        
        
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
  			<div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
			<label class="daylabel">도금품번 :</label>
			<input type="text" class="plating_no_in" id="plating_no" style="font-size: 16px; margin-bottom:10px;" placeholder="도금품번 선택" autocomplete="off">
			
			<label class="daylabel">품명 :</label>
			<input type="text" class="pum_name" id="pum_name" style="font-size: 16px; margin-bottom:10px;" placeholder="품명 선택" autocomplete="off">
			
			<label class="daylabel">표면처리사양 :</label>
			<input type="text" class="surface_spec_ins" id="surface_spec" style="font-size: 16px; margin-bottom:10px;" placeholder="표면처리사양" autocomplete="off">
			
			
			
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
        </div>
    </main>
	
	<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>기준 정보 등록</h2>
        <form id="corrForm">
        
            <label>도금 품번</label>
            <input type="text" name="plating_no" placeholder="">
        
            <label>자제품번</label>
            <input type="text" name="material_no" placeholder="">
            
            <label>품명</label>
            <input type="text" name="pum_name" placeholder="">

            <label>표면처리 사양</label>
            <select name="surface_spec">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>

            <label>최대중량</label>
            <input type="text" name="max_weight" placeholder="">
            
            <label>최소중량</label>
            <input type="text" name="min_weight" placeholder="">
            
            <label>평균중량</label>
            <input type="text" name="avg_weight" placeholder="">
            
            <label>설비명</label>
            <input type="text" name="equip_1" placeholder="">
            
            <label>장입기준</label>
            <input type="text" name="load_1" placeholder="">
            
            <label>설비명</label>
            <input type="text" name="equip_2" placeholder="">
            
            <label>장입기준분할횟수</label>
            <input type="text" name="split_cnt" placeholder="">
            
            <label>장입량(현재장입량)</label>
            <input type="text" name="avg_load" placeholder="">
            
            <label>G-800 (kg)</label>
            <input type="text" name="g800" placeholder="">
            
            <label>G600 (kg)</label>
            <input type="text" name="g600" placeholder="">
            
            <label>공용설비 (kg)</label>
            <input type="text" name="common_equip" placeholder="">
            
            <label>K-BLACK (kg)</label>
            <input type="text" name="k_black" placeholder="">
            
            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>



    <script>
    $(document).ready(function () {
     
        getDataList();

        
        $(".select-button").click(function () {
            dataTable.setData("/geomet/condition/divisionWeight/list", {
                "plating_no": $("#plating_no").val() || "",
                "pum_name": $("#pum_name").val() || "",
                "surface_spec": $("#surface_spec").val() || "",
            });
        });

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
                ajaxURL: "/geomet/condition/divisionWeight/list",
                ajaxProgressiveLoad: "scroll",
                ajaxParams: {
                	 "plating_no": $("#plating_no").val() || "",
                     "pum_name": $("#pum_name").val() || "",
                     "surface_spec": $("#surface_spec").val() || "",
                },

                placeholder: "조회된 데이터가 없습니다.",
                paginationSize: 20,
                ajaxResponse: function(url, params, response) {
                    $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                    return response;
                },
                columns: [
                	{title: "도금품번", field: "plating_no", sorter: "string", width: 180, hozAlign: "center", headerSort: false},
                    {title: "자제품번", field: "material_no", sorter: "string", width: 180, hozAlign: "center", headerSort: false},
                    {title: "품명", field: "pum_name", sorter: "string", width: 180, hozAlign: "center", headerSort: false},
                    {title: "표면처리 사양", field: "surface_spec", sorter: "string", width: 180, hozAlign: "center", headerSort: false},
                    {title: "최대중량", field: "max_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "최소중량", field: "min_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "평균중량", field: "avg_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "MAIN설비명", field: "equip_1", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "장입기준", field: "load_1", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "SUB설비명", field: "equip_2", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "장입기준", field: "load_2", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "분할횟수", field: "split_cnt", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "장입량", field: "avg_load", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "G-800", field: "g800", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "G600", field: "g600", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "공용설비", field: "common_equip", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    {title: "K-BLACK", field: "k_black", sorter: "string", width: 90, hozAlign: "center", headerSort: false},
                    
                  
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
