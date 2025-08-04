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
		    width: 880px;
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
           <label class="daylabel">기간 선택 :</label>
			<input type="text" class="daySet" autocomplete="off" id="start_time" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" class="daySet" autocomplete="off" id="end_time" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

            <label class="daylabel">LOT 번호 :</label>
        	<input class="barcode_no" id="barcode_no" style="width:170px; height:28px; border:1px solid #ccc; border-radius:4px; margin-bottom:8px;">

        
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
	



    <script>
    let now_page_code = "g01";

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

	    $("#barcode_no").on("change", function () {
	        console.log("선택된 설비명:", $(this).val());
	    });
  
    });


	    $(".select-button").click(function () {
	        let barcode_no = $("#barcode_no").val() || "";
	        let start_time = $("#start_time").val() || "";
	        let end_time = $("#end_time").val() || "";
	
	        console.log("검색 요청 값 =>", {
	        	barcode_no: barcode_no,
	            start_time: start_time,
	            end_time: end_time
	        });
	
	        dataTable.setData("/geomet/work/lotReport/list", {
	            "barcode_no": barcode_no,
	            "start_time": start_time,
	            "end_time": barcode_no,
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
        	    ajaxURL: "/geomet/work/lotReport/list",
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
        	        {title: "LOT 번호", field: "barcode_no", sorter: "string", width: 190, hozAlign: "center", headerSort: false},
        	        {title: "제품 번호", field: "item_cd", sorter: "string", width: 140, hozAlign: "center", headerSort: false},
        	        {title: "제품명", field: "item_nm", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	       
        	        {title: "세척 투입", field: "w_s", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	        {title: "세척 추출", field: "w_e", sorter: "string", width: 200, hozAlign: "center", headerSort: false},

        	        {title: "쇼트 투입", field: "s_s", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	        {title: "쇼트 추출", field: "s_e", sorter: "string", width: 230, hozAlign: "center", headerSort: false},

        	        {title: "GEOMET 투입", field: "G03_s", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	        {title: "GEOMET 투입", field: "G03_e", sorter: "string", width: 230, hozAlign: "center", headerSort: false},

        	        {title: "공용설비 투입", field: "G04_s", sorter: "string", width: 230, hozAlign: "center", headerSort: false},
        	        {title: "공용설비 투입", field: "G04_e", sorter: "string", width: 230, hozAlign: "center", headerSort: false}
        	       
        	    ],
        	    rowClick: function(e, row) {
        	        $("#dataList .tabulator-row").removeClass("row_select");
        	        row.getElement().classList.add("row_select");

        	        selectedRow = row; 
        	        console.log("no:", selectedRow.getData().no);
        	    },

        	});

        }



        $(document).ready(function () {

   

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
                url: "/geomet/work/lotReport/excel",
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
