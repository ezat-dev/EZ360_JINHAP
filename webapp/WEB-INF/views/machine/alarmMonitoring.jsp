<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경보 모니터링</title>
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
        .mach_code {
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
	           <label class="daylabel">검색일자 :</label>
				<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
	
	            <label class="daylabel">설비명 :</label>
            <select class="mach_code">
              	<option value="ALL">전체</option>
               	<option value="G03-GG01">G800</option>
				<option value="G03-GG03">G600</option>
				<option value="G04-GG05">K-BLACK</option>
				<option value="G04-GG07">공용설비</option>
			
				<option value="W0100">세척1호기</option>
				<option value="W0200">세척2호기</option>
				<option value="S0100">쇼트1호기</option>
				<option value="S0200">쇼트2호기</option>
				<option value="S0300">쇼트3호기</option>
				<option value="S0400">쇼트4호기</option>
				<option value="S0500">쇼트5호기</option>
				<option value="S0600">쇼트6호기</option>
<!-- 				<option value="PL">PLUS</option>
				<option value="ML">ML</option> -->

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
            <div id="dataList"></div>
        </div>
    </main>
	


    <script>

    let now_page_code = "a03";
    $(function() {
        var today = new Date();
        var yesterday = new Date(today);
        yesterday.setDate(today.getDate() - 1);

        function formatDate(date) {
            var year = date.getFullYear();
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);
            return year + "-" + month + "-" + day;
        }

        $('#startDate').val(formatDate(yesterday));
        $('#endDate').val(formatDate(today));
        getDataList();
    });


    function getDataList() {
        // 기존 dataTable이 있으면 데이터만 재설정
        if (window.dataTable) {
            dataTable.setData("/geomet/machine/alarmMonitoring/list", {
                start_time: $('#startDate').val(),
                end_time: $('#endDate').val(),
                mach_code: $('.mach_code').val()
            });
            return;
        }

        dataTable = new Tabulator("#dataList", {
            height: "780px",
            layout: "fitColumns",
            ajaxConfig: "POST",
            ajaxURL: "/geomet/machine/alarmMonitoring/list",
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
            headerHozAlign: "center",   // ← 이 옵션을 전역으로 추가
            ajaxParams: {
              start_time: $('#startDate').val(),
              end_time:   $('#endDate').val(),
              mach_code:  $('.mach_code').val()
            },
            placeholder: "조회된 데이터가 없습니다.",
            ajaxResponse: function(url, params, response){
              console.log("서버에서 받은 응답 데이터:", response);
              return response;
            },
            columns: [
              {title: "NO.",       formatter: "rownum", hozAlign: "center", headerSort: false, width: 50},
              {title: "설비코드",   field: "mach_code", hozAlign: "center", headerSort: false, width: 140},
              {title: "설비명",     field: "facility_name", hozAlign: "center", headerSort: false, width: 150},
              {title: "라인코드",   field: "line_cd", hozAlign: "center", headerSort: false, width: 130},
              {title: "에러코드",   field: "err_code", hozAlign: "center", headerSort: false, width: 130},
              {title: "알람내용",     field: "err_name", hozAlign: "center", headerSort: false, width: 300},
              {title: "시작시간",   field: "start_time_formatted", hozAlign: "center", headerSort: false, width: 200},
              {title: "종료시간",   field: "end_time_formatted",   hozAlign: "center", headerSort: false, width: 200},
              {title: "비고",       field: "remark", hozAlign: "center", headerSort: false, width: 240}
            ],
            rowFormatter: function(row){
              row.getElement().style.fontWeight = "700";
              row.getElement().style.backgroundColor = "#FFFFFF";
            },
            rowClick: function(e, row){
              $("#dataList .tabulator-row").removeClass("row_select");
              row.getElement().classList.add("row_select");
            },
        });

    }

   
    $('.select-button').on('click', function() {
        getDataList();
    });
        	
    // 엑셀 다운로드 버튼
    $(".excel-button").on("click", function () {
         $("#excelOverlay, #excelLoading").show();

         const start_time = $('#startDate').val();
         const end_time =   $('#endDate').val();
         const mach_code =  $('.mach_code').val();

                 $.ajax({
                     url: "/geomet/machine/alarmMonitoring/excel",
                     method: "POST",
                     contentType: "application/json",
                     data: JSON.stringify({ start_time: start_time, end_time: end_time, mach_code: mach_code }), // 컨트롤러에서 데이터 조회
                     dataType: "json",
                      success: function (result) {
                         if (result && result.downloadPath) {
                             const a = document.createElement('a');
                             a.href = result.downloadPath;
                             a.style.display = 'none';
                             document.body.appendChild(a);
                             a.click();
                             document.body.removeChild(a);
                         }
                          console.log(result);
                          //alert("엑셀 저장 완료되었습니다.");
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