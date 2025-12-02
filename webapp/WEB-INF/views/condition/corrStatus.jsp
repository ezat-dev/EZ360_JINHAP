<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TC교체이력</title>
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
		    width: 800px;
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
           <label class="daylabel">교체일자 :</label>
			<input type="text" class="daySet" autocomplete="off" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" class="daySet" autocomplete="off" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

            <label class="daylabel">설비명 :</label>
            <select class="equipment_name equipment_name_select" id="equipment_name">
             
            </select>
			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
<!--                 <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button> -->
                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
<!--         		<button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button> -->

            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>TC/조절계 이력</h2>
	        <form id="corrForm" autocomplete="off">
	            <label>설비명</label>
	            
	            <input type="text" name="equipment_name" placeholder="설비명" readonly>

	      
	
	            <label>위치 구분</label>
	            <input type="text" name="location" readonly>
	
	            <label>시리얼 번호</label>
	            <input type="text" name="serial_number" placeholder="시리얼 번호">
	
				<label>교체일자</label>
				<input type="text" class="daySet" name="replacement_date" placeholder="조치완료일 선택" style="text-align: left;" autocomplete="off">
								
				<label>교체 주기</label>
		   		<select name="replacement_cycle">
		   		<option value="x">선택</option>
			     <option value="1년">1년</option>
			     <option value="2년">2년</option>    
			             
			    </select>
				
				
				<label>차기 교체일자</label>
				<input type="text" name="next_date" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off" readonly>
				
				
	            <label>비고</label>
	            <textarea name="remarks" rows="3"></textarea>
				<input type="hidden" name="no">
	
	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


    <script>
    let now_page_code = "c01";

    $(function() {
       
        function calcNextDate() {
          var dateStr = $('input[name="replacement_date"]').val();    // 교체일자
          var cycle   = $('select[name="replacement_cycle"]').val();  // 교체 주기

          if (dateStr && cycle !== 'x') {
          
            var parts = dateStr.split('-');
            if (parts.length === 3) {
              var y = parseInt(parts[0], 10),
                  m = parseInt(parts[1], 10) - 1, 
                  d = parseInt(parts[2], 10);

              var dt = new Date(y, m, d);

              var addYears = parseInt(cycle, 10);
              dt.setFullYear(dt.getFullYear() + addYears);

             
              var ny = dt.getFullYear(),
                  nm = ('0' + (dt.getMonth() + 1)).slice(-2),
                  nd = ('0' + dt.getDate()).slice(-2);

              $('input[name="next_date"]').val(ny + '-' + nm + '-' + nd);
            }
          } else {
    
            $('input[name="next_date"]').val('');
          }
        }

      
        $('input[name="replacement_date"], select[name="replacement_cycle"]')
          .on('change', calcNextDate);

        function formatDate(date) {
            const offset = date.getTimezoneOffset() * 60000;
            const localDate = new Date(date.getTime() - offset);

            const year = localDate.getFullYear();
            const month = String(localDate.getMonth() + 1).padStart(2, '0');
            const day = String(localDate.getDate()).padStart(2, '0');

            return year + "-" + month + "-" + day;
        }

        const now = new Date();
        // 오늘
        const ed = formatDate(now);

        // 시작일: 해당 연도 1월 1일
        const startOfYear = new Date(now.getFullYear(), 0, 1); // month는 0부터 시작
        const sd = formatDate(startOfYear);

        $("#startDate").val(sd);
        $("#endDate").val(ed);

        getDataList();
        $(".select-button").click(); 
    });


    
    $(document).ready(function () {
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

	    $("#equipment_name").on("change", function () {
	        console.log("선택된 설비명:", $(this).val());
	    });
  
    });


	    $(".select-button").click(function () {
	        let equipmentName = $("#equipment_name").val() || "";
	        let startDate = $("#startDate").val() || "";
	        let endDate = $("#endDate").val() || "";
	
	        console.log("검색 요청 값 =>", {
	            equipment_name: equipmentName,
	            startDate: startDate,
	            endDate: endDate
	        });
	
	        dataTable.setData("/geomet/condition/corrStatus/list", {
	            "equipment_name": equipmentName,
	            "startDate": startDate,
	            "endDate": endDate,
	        });
	    });
	    

        var selectedRow = null;
        function getDataList() {
        	dataTable = new Tabulator("#dataList", {
        	    height: "830px",
        	    layout: "fitColumns",
        	    selectable: true,
        	    tooltips: true,
                columnHeaderVertAlign: "middle",
                rowVertAlign: "middle",
        	    selectableRangeMode: "click",
        	    reactiveData: true,
        	    headerHozAlign: "center",
        	    ajaxConfig: "POST",
        	    ajaxLoader: false,
        	    ajaxURL: "/geomet/condition/corrStatus/list",
        	    ajaxProgressiveLoad: "scroll",
        	    ajaxParams: {
        	        "equipment_name": $("#equipment_name").val() || "",
        	        "startDate": $("#startDate").val() || "",
        	        "endDate": $("#endDate").val() || "",
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
        	        {title: "NO", field: "no", sorter: "string", width: 100, hozAlign: "center", headerSort: false,visible: false},
        	        {
        	            title: "순번", 
        	            formatter: "rownum", 
        	            hozAlign: "center", 
        	            width: 80, 
        	            headerSort: false  // ✅ 자동 순번 추가
        	          },
        	        {title: "설비명", field: "equipment_name", sorter: "string", width: 190, hozAlign: "center", headerSort: false},
        	        {title: "위치 구분", field: "location", sorter: "string", width: 140, hozAlign: "center", headerSort: false},
        	        {title: "시리얼 번호", field: "serial_number", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	       
        	        {title: "교체일자", field: "replacement_date", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	     
        	        {title: "교체주기", field: "replacement_cycle", sorter: "string", width: 200, hozAlign: "center", headerSort: false},

        	        {title: "차기 교체일자", field: "next_date", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	        {title: "비고", field: "remarks", sorter: "string", width: 250, hozAlign: "center", headerSort: false},
        	    ],
        	    rowClick: function(e, row) {
        	        $("#dataList .tabulator-row").removeClass("row_select");
        	        row.getElement().classList.add("row_select");

        	        selectedRow = row; 
        	        console.log("no:", selectedRow.getData().no);
        	    },
                rowDblClick: function (e, row) {
                    const rowData = row.getData();
                    
                    // 모달 열기
                    let modal = $("#modalContainer");
                    modal.show(); 
                    modal.addClass("show");

                    // 값 세팅
                    $("#modalContainer input[name='no']").val(rowData.no);
                    $("#modalContainer input[name='equipment_name']").val(rowData.equipment_name);
                    $("#modalContainer input[name='location']").val(rowData.location);
                    $("#modalContainer input[name='serial_number']").val(rowData.serial_number);
                    $("#modalContainer input[name='replacement_date']").val(rowData.replacement_date);
                    $("#modalContainer input[name='next_date']").val(rowData.next_date);
                    $("#modalContainer input[name='replacement_cycle']").val(rowData.replacement_cycle);
                    $("#modalContainer textarea[name='remarks']").val(rowData.remarks);

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
                    url: "/geomet/condition/corrStatus/insert",
                    type: "POST",
                    data: corrForm,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response.result === "success") {
                            alert("TC/조절계 이력 성공적으로 저장되었습니다!");
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
                url: "/geomet/condition/corrStatus/del",
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

        	  const equipmentName = $("#equipment_name").val() || "";
            const startDate = $("#startDate").val() || "";
            const endDate = $("#endDate").val() || "";

            console.log("엑셀 다운로드 요청 값 =>", {
                equipment_name: equipmentName,
                startDate: startDate,
                endDate: endDate
            });
          	  
              
            $.ajax({
                url: "/geomet/condition/corrStatus/excel",
                type: "post",
                data: {
                    equipment_name: equipmentName,
                    startDate: startDate,
                    endDate: endDate
                },
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    alert("D:\\GEOMET양식\\T/C조절 저장 완료되었습니다.");
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
