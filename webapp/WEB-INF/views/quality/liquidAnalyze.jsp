<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>욕액분석</title>
<style>
    .tab {
        width: 99%;
        margin-bottom: 37px;
        margin-top: 5px;
        height: 55px;
        border-radius: 6px 6px 0px 0px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .tab-header {
        display: flex;
        align-items: center;
        font-size: 20px;
        font-weight: bold;
    }

	.tab-controls {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	    font-size: 16px;
	    margin-left: auto;
	    width: 1300px;
	}

	.tab-controls label {
	    margin-right: 5px;
	    font-weight: 500;
	   	font-size: 19px;
	}
	
.tab-controls input.daySet {
    margin-top: 10px;
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 150px;
    text-align: center;
    height: 25px;
}



    .button-image {
        width: 16px;
        height: 16px;
        margin-right: 5px;
    }

    #m_code {
        display: none;
    }
    h2 {
    margin-left: 20px;
	}
   .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
        
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
       
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
          
        }
        .modal-content button:hover {
  
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
        margin-top: 12px;
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
        .row_select {
	    background-color: #ffeeba !important;
	    }
	    
	    	@media (max-width: 600px) {
	  .form-row {
	    flex-direction: column;
	    align-items: stretch;
	  }
	  .form-label {
	    margin-bottom: 4px;
	  }
	}
	
	.excel-import-button:hover {
	    background-color: #f0f0f0;
	}
	
	#excelOverlay {
	  display: none;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0,0,0,0.4);
	  z-index: 9998;
	}
	
	/* 로딩 박스 */
	#excelLoading {
	  display: none;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: white;
	  padding: 20px 30px;
	  border-radius: 10px;
	  box-shadow: 0 0 20px rgba(0,0,0,0.2);
	  font-size: 16px;
	  font-weight: bold;
	  z-index: 9999;
	  text-align: center;
	}
	
	/* 로딩 스피너 */
	#excelLoading::before {
	  content: "";
	  display: block;
	  margin: 0 auto 10px;
	  width: 30px;
	  height: 30px;
	  border: 4px solid #ccc;
	  border-top: 4px solid #4caf50;
	  border-radius: 50%;
	  animation: spin 1s linear infinite;
	}
	
	/* 애니메이션 */
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
	}
	    
	            		.modal-content1 {
    background: white;
    width: 24%;
    max-width: 625px;
    max-height: 700px;
    overflow-y: auto;
    margin: 2% auto;
    padding: 20px;
    border-radius: 10px;
    position: relative;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
    transform: scale(0.8);
    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
    opacity: 0;
    z-index: 10001;
		}
		.modal.show .modal-content1 {
		    transform: scale(1);
		    opacity: 1;
		}
				.modal-content1 form {
		    display: flex;
		    flex-direction: column;
		}
		
		.modal-content1 label {
            font-weight: bold;
            margin: 10px 0 5px;
		}
		
		.modal-content1 input, .modal-content1 textarea {
    		width: 78%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}
				.modal-content1 button {
		    background-color: #d3d3d3;
		    color: black;
		    padding: 10px;
		    border: none;
		    border-radius: 5px;
		    margin-top: 10px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		.modal-content1 button:hover {
		    background-color: #a9a9a9;
		}
		
			            		.modal-content2 {
    background: white;
    width: 24%;
    max-width: 625px;
    max-height: 700px;
    overflow-y: auto;
    margin: 2% auto;
    padding: 20px;
    border-radius: 10px;
    position: relative;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
    transform: scale(0.8);
    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
    opacity: 0;
    z-index: 10001;
		}
		.modal.show .modal-content2 {
		    transform: scale(1);
		    opacity: 1;
		}
				.modal-content2 form {
		    display: flex;
		    flex-direction: column;
		}
		
		.modal-content2 label {
            font-weight: bold;
            margin: 10px 0 5px;
		}
		
		.modal-content2 input, .modal-content2 textarea {
    		width: 78%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}
				.modal-content2 button {
		    background-color: #d3d3d3;
		    color: black;
		    padding: 10px;
		    border: none;
		    border-radius: 5px;
		    margin-top: 10px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		.modal-content2 button:hover {
		    background-color: #a9a9a9;
		}
		.bt_box {
		    height: 40px;
		    padding: 0 11px;
		    border: 1px solid rgb(53, 53, 53);
		    border-radius: 4px;
		    background-color: #ffffff;
		    cursor: pointer;
		    display: flex;
		    align-items: center;
		    margin-right: 10px;
		}
		.view{
		width: 1200px;
		margin-left: 150px;
		}
</style>



</head>
<body>
  <main>
<div id="excelOverlay"></div>
<div id="excelLoading">엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...</div>
  
  
  
     <div class="tab">
	    <div class="tab-controls">
	    	         <button class="insert-button_1 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">MEQ 추가
                </button>
                	         <button class="insert-button_2 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">pH 추가
                </button>
                	         <button class="insert-button_3 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">전도도 추가
                </button>
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        
	        			<label class="daylabel">이코팅 :</label>
			<select name="mch_name"id="table_code" class="dayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>
	        
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
<!-- 	          <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button> -->
                      <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				 <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button>
                
	    </div>
	    <div id="m_code">G03-GG03</div>
	</div>

        <div class="view">
        <div id="table4"></div>
        <div id="table5"></div>
            <div id="table1"></div>
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>
    <!-- 3번 모달창 -->
<div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>전도도</h2>
    <form id="corrForm" autocomplete="off">
 	  
 	  <label>날짜</label>
      <!-- <input type="text" name="input_date">  -->
		<input type="text" autocomplete="off" class="daySet" name="date" id="date" placeholder="날짜 선택">
	      <label class="daylabel">이코팅 :</label>
			<select name="table_code"id="table_code" class="dayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>
      <label>전도도 측정 후 입력</label>
      <input type="text" name="conductivity_input">

      <label>최소 Spec</label>
      <input type="text" name="conductivity_min_spec" value="1000">

      <label>최대 Spec</label>
      <input type="text" name="conductivity_max_spec" value="1800">

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>

		<!--1번 모달창 -->
		<div id="modalContainer1" class="modal">
    <div class="modal-content1">
        <span class="close">&times;</span>
        <h2>가열잔분 탱크액 관리기준 정보</h2>
        <form  id="corrForm1"  autocomplete="off">
        
 	  <label>날짜</label>
      <!-- <input type="text" name="input_date">  -->
		<input type="text" autocomplete="off" class="daySet" id="date" name="date" placeholder="날짜 선택">

	      <label class="daylabel">이코팅 :</label>
			<select name="table_code"id="table_code" class="dayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>

      <label>전위차 자동 측정</label>
      <input type="text" name="auto_track">

<!--       <label>분석결과(합,부) 판정</label>
      <input type="text" name="result"> -->

      <label>최소 Spec</label>
      <input type="text" name="meq_min_spec" value="36">

      <label>최대 Spec</label>
      <input type="text" name="meq_max_spec" value="45">

            <button type="submit" id="saveCorrStatus1">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

		<!--2번 모달창 -->
		<div id="modalContainer2" class="modal">
    <div class="modal-content2">
        <span class="close">&times;</span>
        <h2>가열잔분 탱크액 관리기준 정보</h2>
        <form  id="corrForm2"  autocomplete="off">
        
 	  <label>날짜</label>
      <!-- <input type="text" name="input_date">  -->
		<input type="text" autocomplete="off" class="daySet" id="date" name="date" placeholder="날짜 선택">

	      <label class="daylabel">이코팅 :</label>
			<select name="table_code"id="table_code" class="dayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>

      <label>pH 측정 후 입력</label>
      <input type="text" name="ph_input">

      <label>최소 Spec</label>
      <input type="text" name="ph_min_spec" value="5.5">

      <label>최대 Spec</label>
      <input type="text" name="ph_max_spec" value="6.2">

            <button type="submit" id="saveCorrStatus2">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

		<!-- 3번 모달창 -->
		<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>가열잔분 탱크액 관리기준 정보</h2>
        <form  id="corrForm"  autocomplete="off">
            <label>테스트 시험일자</label>
           <input type="text" name="date" class="daySet" placeholder="날짜 선택" style="text-align: left; width: 120px; margin-left: 5%;">


      <label>pH 측정 후 입력</label>
      <input type="text" name="conductivity_input">

      <label>최소 Spec</label>
      <input type="text" name="onductivity_min_spec" value="1000">

      <label>최대 Spec</label>
      <input type="text" name="onductivity_max_spec" value="1800">
            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>
<script>
  let table1, table2, table3, selectedRowData;
  let now_page_code = "d04";

  // 1번모달 열기
  $(".insert-button_1").click(function () {
  	$('#corrForm1')[0].reset();
      let modal = $("#modalContainer1");
      modal.show();
      modal.addClass("show");
  });

  // 2번모달 열기
  $(".insert-button_2").click(function () {
  	$('#corrForm2')[0].reset();
      let modal = $("#modalContainer2");
      modal.show();
      modal.addClass("show");
  });
  
  // 3번모달 열기
  $(".insert-button_3").click(function () {
  	$('#corrForm')[0].reset();
      let modal = $("#modalContainer");
      modal.show();
      modal.addClass("show");
  });

  // 모달 닫기
  $(".close, #closeModal").click(function () {
      $("#modalContainer1").removeClass("show").hide();
      $("#modalContainer").removeClass("show").hide();
      $("#modalContainer2").removeClass("show").hide();
  });
  
  $('.insert-button').click(function() {
	  const startDate = $('#s_time').val();

	  selectedRowData = null;
	  $('#corrForm')[0].reset(); 

	  if (startDate) {
	    const formattedDate = startDate.replace(/-/g, '') + '0900';
	    $('input[name="input_date"]').val(formattedDate); 
	  }

	  $('#modalContainer').show().addClass('show');
	});


  $('.close, #closeModal').click(function() {
      $('#modalContainer').removeClass('show').hide();
    });
  
 /*  $('#saveCorrStatus').click(function(event) {
	  event.preventDefault();

	  let valid = true, message = '';
	  const visc     = parseFloat($('input[name="visc"]').val());
	  const preTemp  = parseFloat($('input[name="pre_temp"]').val());
	  const heatTemp = parseFloat($('input[name="heat_temp"]').val());
	  const liqTemp  = parseFloat($('input[name="liq_temp"]').val());
	  const sg       = parseFloat($('input[name="sg"]').val());

	  $('#corrForm input').css('color', '');

 	  if (isNaN(visc)     || visc     < 35 || visc     > 55) { $('input[name="visc"]').css('color','red');     valid=false; message+='점도는 35~55초 사이여야 합니다.\n'; }
	  if (isNaN(preTemp)  || preTemp  < 30 || preTemp  > 70) { $('input[name="pre_temp"]').css('color','red');  valid=false; message+='예열존온도는 30~70℃ 사이여야 합니다.\n'; }
	  if (isNaN(heatTemp) || heatTemp < 30 || heatTemp > 70) { $('input[name="heat_temp"]').css('color','red'); valid=false; message+='가열존온도는 30~70℃ 사이여야 합니다.\n'; }
	  if (isNaN(liqTemp)  || liqTemp  > 38)                   { $('input[name="liq_temp"]').css('color','red');  valid=false; message+='액온도는 38℃ 이하이어야 합니다.\n'; }
	  if (isNaN(sg)       || sg       <1.38|| sg       >1.48) { $('input[name="sg"]').css('color','red');       valid=false; message+='비중은 1.38~1.48 사이여야 합니다.\n'; }

	  if (!valid) {
	    alert("입력값에 문제가 있습니다:\n\n" + message);
	    return;
	  }

	  const formData = new FormData($('#corrForm')[0]);

	  if (selectedRowData && selectedRowData.idx) {
	    formData.append('idx', selectedRowData.idx);
	  }

	  for (let [key, value] of formData.entries()) {
	    console.log(`${key}: ${value}`);
	  }

	  $.ajax({
		  url: "/geomet/work/workDailyReport/insert",
		  method: "POST",
		  data: formData,
		  processData: false,
		  contentType: false,
		  success: () => {
		    alert('저장되었습니다.');
		    $('#modalContainer').removeClass('show').hide(); // 모달 닫기
		    loadWorkDailyData(); // 테이블 새로고침
		  },
		  error: () => {
		    alert('저장 중 오류가 발생했습니다.');
		  }
		});

	}); */


	 $(".delete-button").click(function(event) {
		    event.preventDefault();

		    if (!selectedRow) {
		        alert("삭제할 행을 선택하세요.");
		        return;
		    }

		    var id = selectedRow.getData().id;

		    if (!id) {
		        alert("삭제할 항목이 없습니다.");
		        return;
		    }

		    if (!confirm("정말 삭제하시겠습니까?")) {
		        return;
		    }

		    var requestData = JSON.stringify({ "id": id });

		    $.ajax({
		        url: "/geomet/quality/liquidAnalyze/del",
		        type: "POST",
		        contentType: "application/json",
		        data: requestData,
		        dataType: "json",
		        success: function(response) {
		            alert("삭제가 완료되었습니다.");
		            loadWorkDailyData();
		        },
		        error: function(xhr, status, error) {
		            alert("삭제 중 오류가 발생했습니다: " + error);
		        }
		    });
		});




  function loadWorkDailyData() {
      let table_code = $("#table_code").val();
      let date = $("#s_time").val();
      console.log("보내는 값:", {table_code, date});

      $.ajax({
        type: "POST",
        url: "/geomet/quality/liquidAnalyze/list",
        contentType: "application/json",
        data: JSON.stringify({ table_code, date }),
        success: function(response) {
//        	console.log(response);
        	console.log(response.table1);
        	console.log(response.table3);
          table1.setData(response.table1);
          table2.setData(response.table2);
          table3.setData(response.table3);
        },
        error: function(xhr, status, error) {
          console.error("에러 응답:", xhr.responseText);
          alert("조회에 실패했습니다.");
        }
      });
    }

    $(function() {
        const today = new Date().toISOString().split('T')[0];
        $('#s_time').val(today);
        initTables();
        loadWorkDailyData();
    });



    function initTables() {
    	 
    	table1 = new Tabulator("#table1", {
    	    height: "145px",
    	    layout: "fitColumns",
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
    	    headerHozAlign: "center",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false},
    	        { title: "날짜", field: "date", headerSort: false,hozAlign: "center", width: 150  },
    	      
    	        { title: "전위차  자동 측정(자동PC 프로그램 있음)", field: "auto_track", hozAlign: "center", headerSort: false, width: 270 },
    	        { title: "분석결과(합.부)판정", field: "result", hozAlign: "center", headerSort: false, width: 270 },
    	        { title: "조치사항", field: "action", hozAlign: "center", headerSort: false, width: 270 },
    	        { 
    	            title: "Spec", // <-- 열 제목 변경
    	            hozAlign: "center", 
    	            width: 240,
    	            headerSort: false,
    	            formatter: function(cell, formatterParams, onRendered){ // <-- formatter 추가
    	                var data = cell.getData();
    	                return data.meq_min_spec + " ~ " + data.meq_max_spec;
    	            }
    	        }
    	    ],
            rowClick: function (e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");  
                //row.getElement().classList.add("row_select");
                 row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
                selectedRow = row;
                console.log("선택된 row id:", selectedRow.getData().id);
            }

/*     	    rowDblClick: function (e, row) {
    	        const d = row.getData();
    	        $('#corrForm')[0].reset();
    	        $('input[name="mch_name"]').val(d.mch_name);
    	        $('input[name="mch_code"]').val(d.mch_code);
    	        $('input[name="input_date"]').val(d.input_date);
    	        $('select[name="gb"]').val(d.gb);
    	        $('input[name="visc"]').val(d.visc);
    	        $('input[name="pre_temp"]').val(d.pre_temp);
    	        $('input[name="heat_temp"]').val(d.heat_temp);
    	        $('input[name="liq_temp"]').val(d.liq_temp);
    	        $('input[name="sg"]').val(d.sg);
    	        $('#modalContainer').show().addClass('show');
    	    } */
    	});


    	table2 = new Tabulator("#table2", {
    	    height: "120px",
    	    layout: "fitColumns",
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
    	    headerHozAlign: "center",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false},
    	    	{ title: "날짜", field: "date", hozAlign: "center",headerSort: false, width: 150 },
    	        { title: "pH 측정 후 입력", field: "ph_input", hozAlign: "center",headerSort: false  },
    	        { 
    	            title: "Spec", // <-- 열 제목 변경
    	            hozAlign: "center", 
    	            headerSort: false,
    	            formatter: function(cell, formatterParams, onRendered){ // <-- formatter 추가
    	                var data = cell.getData();
    	                return data.ph_min_spec + " ~ " + data.ph_max_spec;
    	            }
    	        }
    	    ],
            rowClick: function (e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");  
                //row.getElement().classList.add("row_select");
                 row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
                selectedRow = row;
                console.log("선택된 row id:", selectedRow.getData().id);
            }
    	});

    	table3 = new Tabulator("#table3", {
    	    height: "370px",
    	    layout: "fitColumns",
    	    headerHozAlign: "center",
    	    columnHeaderVertAlign: "middle",
    	    rowVertAlign: "middle",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false},
    	        { title: "날짜", field: "date", hozAlign: "center", headerSort: false, width: 150 },       // 조금 줄임
    	        { title: "전도도 측정 후 입력", field: "conductivity_input", hozAlign: "center", headerSort: false, width: 525},
    	        { 
    	            title: "Spec", // <-- 열 제목 변경
    	            hozAlign: "center", 
    	            width: 525,
    	            headerSort: false,
    	            formatter: function(cell, formatterParams, onRendered){ // <-- formatter 추가
    	                var data = cell.getData();
    	                return data.conductivity_min_spec + " ~ " + data.conductivity_max_spec;
    	            }
    	        }
    	      
    	    ],
            rowClick: function (e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");  
                //row.getElement().classList.add("row_select");
                 row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
                selectedRow = row;
                console.log("선택된 row id:", selectedRow.getData().id);
            }
    	});

    	// ... (기존 코드)

    	// table1 변수에 데이터 로드
    	var table4 = new Tabulator("#table4", {
    	    height: "145px",
    	    layout: "fitColumns",
    	    columnHeaderVertAlign: "middle",
    	    rowVertAlign: "middle",
    	    headerHozAlign: "center",
    	    data: [{
    	        id: 1,
    	        date: "2025-09-10",
    	        baking: "500",
    	        dodo: "100",
    	        sample: "200",
    	        calc: "30",
    	        result: "합격",
    	        meq_min_spec: 10,
    	        meq_max_spec: 15,
    	        action: "조치사항"
    	    }], // 여기에 실제 데이터를 JSON 배열 형태로 추가
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	        {
    	            title: "id",
    	            field: "id",
    	            headerSort: false,
    	            hozAlign: "center",
    	            visible: false
    	        },
    	        {
    	            title: "날짜",
    	            field: "date",
    	            headerSort: false,
    	            hozAlign: "center",
    	            width: 150
    	        },
    	        {
    	            title: "baking후의 무게",
    	            field: "baking",
    	            hozAlign: "center",
    	            headerSort: false,
    	            width: 150
    	        },
    	        {
    	            title: "도가니 무게",
    	            field: "dodo",
    	            hozAlign: "center",
    	            headerSort: false,
    	            width: 150
    	        },
    	        {
    	            title: "도료 sample의 무게",
    	            field: "sample",
    	            hozAlign: "center",
    	            headerSort: false,
    	            width: 150
    	        },
    	        {
	            title: "(① -② )/(③*(NV/100)*100",
	            field: "calc",
	            hozAlign: "center",
	            headerSort: false,
	            width: 150
	        },
	        {
            title: "분석결과(합,부)판정",
            field: "result",
            hozAlign: "center",
            headerSort: false,
            width: 150
        },
        {
        title: "조치사항",
        field: "action",
        hozAlign: "center",
        headerSort: false,
        width: 150
    },
    	        {
    	            title: "Spec",
    	            hozAlign: "center",
    	            width: 150,
    	            headerSort: false,
    	            formatter: function(cell, formatterParams, onRendered) {
    	                var data = cell.getData();
    	                return data.meq_min_spec + " ~ " + data.meq_max_spec;
    	            }
    	        }
    	    ],
    	    rowClick: function(e, row) {
    	        $("#dataList .tabulator-row").removeClass("row_select");
    	        row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
    	        selectedRow = row;
    	        console.log("선택된 row id:", selectedRow.getData().id);
    	    }
    	});

    	var table5 = new Tabulator("#table5", {
    	    height: "145px",
    	    layout: "fitColumns",
    	    columnHeaderVertAlign: "middle",
    	    rowVertAlign: "middle",
    	    headerHozAlign: "center",
    	    data: [{
    	        id: 1,
    	        date: "2025-09-10",
    	        baking: "500",
    	        hoil: "100",
    	        sample: "200",
    	        calc: "30",
    	        result: "합격",
    	        meq_min_spec: 15,
    	        meq_max_spec: 20,
    	        action: "조치사항"
    	    }], // 여기에 실제 데이터를 JSON 배열 형태로 추가
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	        {
    	            title: "id",
    	            field: "id",
    	            headerSort: false,
    	            hozAlign: "center",
    	            visible: false
    	        },
    	        {
    	            title: "날짜",
    	            field: "date",
    	            headerSort: false,
    	            hozAlign: "center",
    	            width: 150
    	        },
    	        {
    	            title: "호일 무게(g)",
    	            field: "hoil",
    	            hozAlign: "center",
    	            headerSort: false,
    	            width: 175
    	        },
    	        {
    	            title: "도료 sample의 무게",
    	            field: "sample",
    	            hozAlign: "center",
    	            headerSort: false,
    	            width: 175
    	        },
    	        {
	            title: "(①-②)/③*100",
	            field: "calc",
	            hozAlign: "center",
	            headerSort: false,
	            width: 175
	        },
	        {
            title: "분석결과(합,부)판정",
            field: "result",
            hozAlign: "center",
            headerSort: false,
            width: 175
        },
        {
        title: "조치사항",
        field: "action",
        hozAlign: "center",
        headerSort: false,
        width: 175
    },
    	        {
    	            title: "Spec",
    	            hozAlign: "center",
    	            width: 175,
    	            headerSort: false,
    	            formatter: function(cell, formatterParams, onRendered) {
    	                var data = cell.getData();
    	                return data.meq_min_spec + " ~ " + data.meq_max_spec;
    	            }
    	        }
    	    ],
    	    rowClick: function(e, row) {
    	        $("#dataList .tabulator-row").removeClass("row_select");
    	        row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
    	        selectedRow = row;
    	        console.log("선택된 row id:", selectedRow.getData().id);
    	    }
    	});

    }

  $(function() {
    $('#s_time').val(new Date().toISOString().split('T')[0]);
    initTables();
    loadWorkDailyData();
  });







  $(".excel-button").on("click", function () {
	    $("#excelOverlay, #excelLoading").show();

	    // 1) 파라미터 준비
	    let s_time = $("#s_time").val().replaceAll("-", "");
	    let e_time = s_time;
	    let m_code = $("#m_code").text().trim();
	    let ex_mch_name  = "GEOMET 600톤 작업일보";

	    console.log("▶ 엑셀 생성 요청 파라미터:", { s_time, e_time, m_code, ex_mch_name });

	    // 2) AJAX 호출
	    $.ajax({
	        url: "/geomet/work/workDailyReport_600/excel",
	        method: "POST",
	        contentType: "application/json",
	        data: JSON.stringify({ s_time, e_time, m_code, ex_mch_name }),
	        dataType: "json",

	        success: function (result) {
	            console.log("▶ 서버가 돌려준 result:", result);

	            if (result && result.downloadPath) {
	                // 서버에서 완성된 downloadPath 를 그대로 사용
	                const downloadUrl = result.downloadPath;
	                console.log("▶ 다운로드 URL:", downloadUrl);

	                const a = document.createElement('a');
	                a.href = downloadUrl;
	                a.style.display = 'none';
	                document.body.appendChild(a);
	                a.click();
	                document.body.removeChild(a);

	                alert("작업일보 엑셀 저장 완료되었습니다.");
	            } else {
	                console.warn("✋ downloadPath 키가 없습니다!", result);
	                alert("엑셀 생성 오류: 다운로드 경로가 전달되지 않았습니다.");
	            }
	        },

	        error: function (xhr, status, error) {
	            console.error("▶ 엑셀 생성/다운로드 중 오류:", {
	                status: status,
	                error: error,
	                responseText: xhr.responseText
	            });
	            alert("엑셀 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
	        },

	        complete: function () {
	            $("#excelOverlay, #excelLoading").hide();
	        }
	    });
	});

    // 첫 번째 모달창 저장 버튼 클릭 시
    $("#saveCorrStatus1").click(function (event) {

        const formElement = document.getElementById("corrForm1");
        const formData = new FormData(formElement);

        // id 값이 비어 있으면 제거
        if (!formData.get("id") || formData.get("id").trim() === "") {
            formData.delete("id");
        }

        const mch_name = "meq"; 

     formData.append("mch_name", mch_name);

        // 디버깅 로그
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }
            
                $.ajax({
                    url: "/geomet/quality/liquidAnalyze/insert",
                    type: "POST",
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function(response) {
                    	console.log("▶ 서버가 돌려준 result:", response);
                        if (response === true) {
                            successfulRequests++;
                            console.log("데이터 저장 성공");
                        } else {
                            console.error(`${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}`);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(`${mch_name} 서버 오류 발생!`, textStatus, errorThrown);
                    },
                    complete: function() {
                        // 모든 요청이 완료된 후 최종 알림
                        if (index === totalRequests - 1) {
                            alert("저장 완료되었습니다.");
                            $("#modalContainer1").hide();
                            getDataList();
                        }
                    } 
                });
    });

    // 2번 모달창 저장 버튼 클릭 시
    $("#saveCorrStatus2").click(function (event) {

        const formElement = document.getElementById("corrForm2");
        const formData = new FormData(formElement);

        // id 값이 비어 있으면 제거
        if (!formData.get("id") || formData.get("id").trim() === "") {
            formData.delete("id");
        }

        const mch_name = "ph"; 

     formData.append("mch_name", mch_name);

        // 디버깅 로그
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }
            
                $.ajax({
                    url: "/geomet/quality/liquidAnalyze/insert",
                    type: "POST",
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function(response) {
                    	console.log("▶ 서버가 돌려준 result:", response);
                        if (response === true) {
                            successfulRequests++;
                            console.log("데이터 저장 성공");
                        } else {
                            console.error(`${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}`);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(`${mch_name} 서버 오류 발생!`, textStatus, errorThrown);
                    },
                    complete: function() {
                        // 모든 요청이 완료된 후 최종 알림
                        if (index === totalRequests - 1) {
                            alert("저장 완료되었습니다.");
                            $("#modalContainer1").hide();
                            getDataList();
                        }
                    } 
                });
    });

    // 3번 모달창 저장 버튼 클릭 시
    $("#saveCorrStatus").click(function (event) {

        const formElement = document.getElementById("corrForm");
        const formData = new FormData(formElement);

        // id 값이 비어 있으면 제거
        if (!formData.get("id") || formData.get("id").trim() === "") {
            formData.delete("id");
        }

        const mch_name = "conductivity"; 

     formData.append("mch_name", mch_name);

        // 디버깅 로그
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }
            
                $.ajax({
                    url: "/geomet/quality/liquidAnalyze/insert",
                    type: "POST",
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function(response) {
                    	console.log("▶ 서버가 돌려준 result:", response);
                        if (response === true) {
                            successfulRequests++;
                            console.log("데이터 저장 성공");
                        } else {
                            console.error(`${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}`);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(`${mch_name} 서버 오류 발생!`, textStatus, errorThrown);
                    },
                    complete: function() {
                        // 모든 요청이 완료된 후 최종 알림
                        if (index === totalRequests - 1) {
                            alert("저장 완료되었습니다.");
                            $("#modalContainer1").hide();
                            getDataList();
                        }
                    } 
                });
    });
    

  
 
</script>

</body>
</html>
