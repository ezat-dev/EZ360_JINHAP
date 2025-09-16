<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후처리 액투입 관리일지</title>
<%@include file="../include/pluginpage.jsp" %>   
<jsp:include page="../include/tabBar.jsp"/> 

    
<style>


	.tab {
	    width: 99%;
	    margin-bottom: 37px;
	    margin-top: 5px;
	    height: 55px;
	    display: flex;
	    align-items: center;
	
	   
	    justify-content: flex-end;
	    gap: 20px;
	    padding-right: 20px;
	}


    .tab-header {
        display: flex;
        align-items: center;
        font-size: 20px;
        font-weight: bold;
    }



	.tab label {
	    margin-right: 5px;
	    font-weight: 500;
	   	font-size: 20px;
	   	margin-top: 2px;
	}
	
.tab input.daySet {
    
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 150px;
    text-align: center;
    height: 25px;
}
.tab select.mch_name {
    
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 330px;
    text-align: center;
    height: 39px;
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
        .modal.show .modal-content2 { opacity:1; transform: scale(1); }
        
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
        
       .modal-content2 form {
            display: flex;
            flex-direction: column;
        }
        .modal-content2 label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content2 input, .modal-content2 textarea {
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
          .modal-content2 button {
       
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
          
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
		    width: 1422px;
		}
		.box1 {
		    display: flex;
		    justify-content: right;
		    align-items: center;
		    width: 1400px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
        	width: 30%;
      		text-align: center;
            height: 21px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 17px;
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
        .row_select {
	    background-color: #ffeeba !important;
	    }
.modal-content2 {
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

.modal.show .modal-content2 {
    transform: scale(1);
    opacity: 1;
}

.close2 {
    background-color: white;
    position: absolute;
    right: 15px;
    top: 10px;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
}
.navigate-button {
  background-color: #e0e0e0;
  color: #333;
  border: none;
  border-radius: 5px;
  padding: 5px 20px;
  font-size: 14px;
  height: 30px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.navigate-button:hover {
  background-color: #cfcfcf;
}

.button-container-2 {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
	margin-bottom:10px;
    margin-right:33px;
}

</style>



</head>
<body>
  <main>
     <div class="tab">

	   <div class="button-container">
	        
		
	        <label for="in_date">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="in_date" placeholder="시작 날짜 선택">
	        <input type="text" autocomplete="off" class="daySet" id="endDate" placeholder="시작 날짜 선택">
	  <label for="mch_name" class="daylabel">설비명 :</label>
			<select id="mch_name" class="mch_name" onchange="toggleTable()">
           
                <option value="G600">G600</option>
    			<option value="G800">G800</option>
                <option value="K_BLACK">후처리 액투입(K_BLACK)</option>
                <option value="ML">후처리 액투입(ML)</option> 
                <option value="PL">후처리 액투입(PL)</option>
               
            </select>
	        
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	          <button class="insert-button bt2">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                   <button class="insert-button bt3">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                        </button>
                      <button class="delete-button bt2_2">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				            
                      <button class="delete-button bt3_3">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
			    <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
				
                
	    </div>
	
	</div>



	

       <div class="view">
<!--     <div id="table1"></div>

    <div id="table3" style="display: none;"></div>

    버튼들 여기로 옮김
    <div class="button-container-2">
        <button class="insert-button bt2">
            <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image"> 추가
        </button>
        <button class="delete-button bt2_2">
            <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
        </button>
    </div> -->

    <div id="table2"></div>
</div>

    </main>
    

  <div id="modalContainer1" class="modal" style="display:none;">
  <div class="modal-content modal-content1">
    <span class="close close1">&times;</span>
    <h2>지오메트</h2>
 <form id="corrForm1" autocomplete="off">
    
      <input type="hidden" name="id">

     
        <label>날짜</label>
      <input type="text" class="daySet" name="in_date" style="text-align: left; font-size: 14px;">
     
      <label>설비명</label>
      <select name="mch_name">
        <option value="지오메트">지오메트</option>
  
      </select>

     
        <label>교반기NO</label>
        <input type="text" name="m68_mixer_no">
  
     
        <label>G1 온도 (20±5℃)</label>
        <input type="text" name="m68_g1_temp">
     
     
        <label>G2 온도 (20±5℃)</label>
        <input type="text" name="m68_g2_temp">
  
     
        <label>G1 LOT NO.</label>
        <input type="text" name="m68_g1_lot_no">
    
     
        <label>G2 LOT NO.</label>
        <input type="text" name="m68_g2_lot_no">
   
     
        <label>증점제 투입시간</label>
        <input type="text" name="m68_thickener_time">
   
     
        <label>증점제 투입(220±40g)</label>
        <input type="text" name="m68_thickener_g">
   
     
        <label>증점제 LOT NO.</label>
        <input type="text" name="m68_thickener_lot">
    
     
        <label>투입 후 rpm</label>
        <input type="text" name="m68_post_rpm">
   
     
        <label>교반 시작 시간</label>
        <input type="text" name="m68_mixing_start_time">
    
     
        <label>교반 시간</label>
        <input type="text" name="m68_mixing_time">
  
     
        <label>확인자</label>
        <input type="text" name="m68_checker">
  
     
        <label>온도 (25℃ 이하)</label>
        <input type="text" name="m68_mch_temp">
  
     
        <label>습도 (20% 이상)</label>
        <input type="text" name="m68_humidity">

     
        <label>점도 (48±7초)</label>
        <input type="text" name="m68_viscosity">
  
     
        <label>약품 출고시간</label>
        <input type="text" name="m68_out_time">
    

      <button type="submit" id="saveCorrStatus1" class="saveCorrStatus1">저장</button>
      <button type="button" id="closeModal1"class="closeModal1">닫기</button>
    </form>
  </div>
</div>




<!-- Modal for Table2 -->
<div id="modalContainer2" class="modal" style="display:none;">
  <div class="modal-content2">
    <span class="close close2">&times;</span>

    <h2>액투입 및 탱크 일지</h2>
    <form id="corrForm2" autocomplete="off">
      <input type="hidden" name="id">

      <label>설비명</label>
      <select name="mch_name">
           
                <option value="G600">G600</option>
     			<option value="G800">G800</option>
                <option value="K_BLACK">K_BLACK</option>
                <option value="ML">ML</option>
                <option value="PL">PL</option>
               
      </select>

      <label>날짜</label>
      <input type="text" class="daySet" name="in_date" style="text-align: left; font-size: 14px;">
      <label>TANK 번호</label>
      <input type="text" name="tank_no">
      
      <label>측정시간</label>
      <input type="text" name="ck_time2">
      
            <label>점도</label>
      <input type="text" name="ck_time">

      <label>비중</label>
      <input type="text" name="specific_gravity">
     
      <label>측정자(작업자)</label>
      <input type="text" name="operator">
     
      <label>신액 Lot No.</label>
      <input type="text" name="liquid_lot_no">

      <label>신액 점도</label>
      <input type="text" name="liquid_viscosity">
      
      <label>신액 투입량</label>
      <input type="text" name="liquid_in">

      <label>증류수 투입량</label>
      <input type="text" name="distilles_in">

      <label>조치 1시간 후 점도</label>
      <input type="text" name="viscosity_after">


      <button type="submit" id="saveCorrStatus2" class="saveCorrStatus2">저장</button>
      <button type="button" id="closeModal2" class="closeModal2">닫기</button>
    </form>
  </div>
</div>

<!-- Modal for Table3 -->
<div id="modalContainer3" class="modal" style="display:none;">
  <div class="modal-content">
    <span class="close" id="closeModal3">&times;</span>
    <h2>ML/PL/K_BALCK</h2>
    <form id="corrForm3" autocomplete="off">
      <input type="hidden" name="id">
			
      <label>날짜</label>
	<input type="text" class="daySet" name="in_date" style="text-align: left; font-size: 14px;">


      <label>설비명</label>
      <select name="mch_name">
           

                <option value="K_BLACK">K_BLACK</option>
                <option value="ML">ML</option>
                <option value="PL">PL</option>
               
      </select>


      <label>교반룸 습도 (15% 이상)</label>
      <input type="text" name="kmp_humidity">

      <label>교반룸 온도 (25℃ 이하)</label>
      <input type="text" name="kmp_mixing_temp">

      <label>KB 온도 (20±10℃)</label>
      <input type="text" name="kmp_mch_temp">

      <label>신액 Lot No.</label>
      <input type="text" name="kmp_liquid_lot_no">

      <label>교반 시작 시간</label>
      <input type="text" name="kmp_mixing_start_time">

      <label>교반 시간 (최소 1시간 이상)</label>
      <input type="text" name="kmp_mixing_time">

      <label>점도 (35~55초)</label>
      <input type="text" name="kmp_mch_visc">

      <label>약품 출고 시간</label>
      <input type="text" name="kmp_out_time">

      <label>확인자(작업자)</label>
      <input type="text" name="kmp_checker">

      <button type="submit" id="saveCorrStatus3">저장</button>
      <button type="button" id="closeModal3">닫기</button>
    </form>
  </div>
</div>




<script>
  let table1, table2, table3, selectedRowData;
  let now_page_code = "c07";

//yyyy-MM-dd 포맷 함수
  function fmtDate(d) {
    const y = d.getFullYear();
    const m = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return y + '-' + m + '-' + day;
  }

  $(function() {
	  const now = new Date();
	  console.log("now: ", now);
	  console.log("now 변환: ", fmtDate(now));
	  const first = new Date(now.getFullYear(), now.getMonth(), 1);
	  console.log("first: ", first);
	  console.log("first 변환: ", fmtDate(first));

	  // 페이지 진입 시 기본값 세팅
	  $('#in_date').val(fmtDate(first));
	  $('#endDate').val(fmtDate(now));
    initTables();
    loadWorkDailyData();


    const today = new Date().toISOString().split('T')[0];

    $('.bt1').on('click', function(){
    	 $('#corrForm1').find('input[type="hidden"], input[type="text"]').val('');
      $('#corrForm1').find('input[name="in_date"]').val(today);
      $('#modalContainer1').addClass('show').show();
    });

    $('.bt2').on('click', function() {
    	
    	  $('#corrForm2')[0].reset();
	  	  $('#corrForm2').find('input[type="hidden"], input[type="text"]').val('');
    	  $('#corrForm2').find('input[name="in_date"]').val(today);
    	  const mch_name = $("#mch_name").val();
    	  $('#corrForm2').find('select[name="mch_name"]').val(mch_name);

    	  $('#modalContainer2').addClass('show').show();
    	});


    $('.bt3').on('click', function(){
      if ($('#corrForm3')[0].reset) $('#corrForm3')[0].reset();
      $('#corrForm3').find('input[name="in_date"]').val(today);
      $('#modalContainer3').addClass('show').show();
    });
  });

  $('.close1, #closeModal1').click(function() {
    $('#modalContainer1').removeClass('show').hide();
  });
  $('.close3, #closeModal3').click(function() {
    $('#modalContainer3').removeClass('show').hide();
  });

  $('#saveCorrStatus1').click(function(event) {
    event.preventDefault();
    const formData = {};
    $('#corrForm1').find('input[name], select[name]').each(function() {
      formData[this.name] = $(this).val();
    });
    if (formData.id === "") {
        formData.id = null;
      }

    console.log("테이블 1전송 데이터:", formData);
    $.ajax({
      url: "/geomet/condition/machineliquidmanage/insert",
      method: "POST",
      data: formData,
      success: function() {
        alert('저장되었습니다.');
        $('#modalContainer1').removeClass('show').hide();
        loadWorkDailyData();
      },
      error: function() {
        alert('저장 중 오류가 발생했습니다.');
      }
    });
  });

  $('#saveCorrStatus2').click(function(e) {
    e.preventDefault();
    const formData = {};
    $('#corrForm2').find('input[name], select[name]').each(function() {
        formData[this.name] = $(this).val();
      });
      if (formData.id === "") {
          formData.id = null;
        }

    console.log("테이블 2전송 데이터:", formData);
    $.ajax({
      url: '/geomet/condition/machineliquidmanage2/insert',
      method: "POST",
      data: formData,
      success: function() {
    	    alert('저장되었습니다.');
        $('#modalContainer2').removeClass('show').hide();
        loadWorkDailyData();
      },
      error: function() {
          alert('저장 중 오류가 발생했습니다.');
      }
    });
  });

  $('#saveCorrStatus3').click(function(e) {
    e.preventDefault();
    const formData = {};
    $('#corrForm3').find('input[name], select[name]').each(function() {
      formData[this.name] = $(this).val();
    });
    $.ajax({
      url: '/geomet/condition/machineliquidmanage/insert',
      method: "POST",
      data: formData,
      success: function() {
        alert('저장되었습니다.');
        $('#modalContainer3').removeClass('show').hide();
        table3.updateRow(formData.id, formData);
        loadWorkDailyData();
      },
      error: function() {
        alert('저장 중 오류가 발생했습니다.');
      }
    });
  });

  function loadWorkDailyData() {
    const in_date = $("#in_date").val();
    const mch_name = $("#mch_name").val();
    const endDate = $('#endDate').val();
    console.log("in_date", in_date);
    console.log("mch_name", mch_name);
    console.log("endDate", endDate);
    $.ajax({
      type: "POST",
      url: "/geomet/condition/machineliquidmanage/list",
      contentType: "application/json",
      data: JSON.stringify({ in_date, mch_name, endDate }),
      success: function(response) {
        //table1.setData(response.table1);
        table2.setData(response.table2);
        //table3.setData(response.table1);
      },
      error: function(xhr) {
        alert("조회에 실패했습니다.");
      }
    });
  }

  function toggleTable() {
	  const value = $("#mch_name").val();
	  const group1 = ["G800", "G600"];
	  const group2 = ["K_BLACK", "ML", "PL"];

	  if (group1.includes(value)) {
	    $("#table1").show();
	    $("#table3").hide();
	    $(".bt1").show();
	    $(".bt3").hide();

	    $(".bt1_1").show();
	    $(".bt3_3").hide();
	    
	  } else if (group2.includes(value)) {
	    $("#table1").hide();
	    $("#table3").show();
	    $(".bt1").hide();
	    //$(".bt3").show();

	    $(".bt1_1").hide();
	    //$(".bt3_3").show();
	    
	  } else {
	    $("#table1, #table3").hide();
	    $(".bt1, .bt3").hide();
	  }

	  loadWorkDailyData();
	}



  window.addEventListener("DOMContentLoaded", () => {
    $("#mch_name").val("G600");
    toggleTable();
  });

  function initTables() {


    table2 = new Tabulator("#table2", {
      height: "720px",
      layout: "fitColumns",
      selectable: true,
      columnHeaderVertAlign: "middle",
      rowVertAlign: "middle",
      headerHozAlign: "center",
      columnDefaults: {
        hozAlign: "center",
        headerTooltip: false
      },
      columns: [
        { title: "구분", field: "id", visible: false },
        { title: "날짜", field: "in_date" },
        { title: "설비", field: "mch_name", width: 90 },
        { title: "TANK번호", field: "tank_no" },
        { title: "측정시간", field: "ck_time2" },
        { title: "점도", field: "ck_time" },
        { title: "비중", field: "specific_gravity" },
        { title: "측정자", field: "operator" },
        { title: "신액 Lot No.", field: "liquid_lot_no" },
        { title: "신액 점도", field: "liquid_viscosity" },
        { title: "신액 투입량", field: "liquid_in" },
        { title: "증류수 투입량", field: "distilles_in" },
        { title: "조치 1시간</br>후 점도", field: "viscosity_after" }
      ],
      rowDblClick: function(e, row) {
        const data = row.getData();
        const $form = $('#corrForm2');
        if ($form[0].reset) $form[0].reset();
        $form.find('input[name="id"]').val(data.id);
        $('select[name="mch_name"]').val(data.mch_name);
        $form.find('input[name="mch_name"]').val(data.mch_name);
        $form.find('input[name="in_date"]').val(data.in_date);
        $form.find('input[name="tank_no"]').val(data.tank_no);
        $form.find('input[name="liquid_lot_no"]').val(data.liquid_lot_no);
        $form.find('input[name="liquid_in"]').val(data.liquid_in);
        $form.find('input[name="distilles_in"]').val(data.distilles_in);
        $form.find('input[name="liquid_viscosity"]').val(data.liquid_viscosity);
        $form.find('input[name="specific_gravity"]').val(data.specific_gravity);
        $form.find('input[name="viscosity_after"]').val(data.viscosity_after);
        $form.find('input[name="ck_time"]').val(data.ck_time);
        $form.find('input[name="ck_time2"]').val(data.ck_time2);
        $form.find('input[name="operator"]').val(data.operator);
        $('#modalContainer2').addClass('show').show();
      }
    });
    $('#modalContainer2').on('click', '.close2, #closeModal2', function() {
      $('#modalContainer2').removeClass('show').hide();
    });

/*     table3 = new Tabulator("#table3", {
      height: "365px",
      layout: "fitColumns",
      selectable: true,
      headerHozAlign: "center",
      headerVertAlign: "middle",
      columnDefaults: {
        hozAlign: "center",
        vertAlign: "middle",
        headerTooltip: false
      },
      columns: [
    	    { title: "NO",            field: "id",              headerSort: false, hozAlign: "center", visible: false },
    	    { title: "날짜",          field: "in_date",         headerSort: false, visible: false },
    	    { title: "설비",          field: "mch_name",        headerSort: false, visible: false },
        { title: "교반룸 습도<br>(15% 이상)", field: "kmp_humidity" },
        { title: "교반룸 온도<br>(25℃ 이하)", field: "kmp_mixing_temp" },
        { title: "KB 온도<br>(20±10℃)", field: "kmp_mch_temp" },
        { title: "신액 Lot No.", field: "kmp_liquid_lot_no" },
        { title: "교반 시작 시간", field: "kmp_mixing_start_time" },
        { title: "교반 시간<br>(최소 1시간 이상)", field: "kmp_mixing_time" },
        { title: "점도<br>(35~55초)", field: "kmp_mch_visc" },
        { title: "약품 출고 시간", field: "kmp_out_time" },
        { title: "확인자(작업자)", field: "kmp_checker" }
      ],
      rowDblClick: function(e, row) {
        const data = row.getData();
        const $form = $('#corrForm3');
        if ($form[0].reset) $form[0].reset();
        $form.find('input[name="id"]').val(data.id);
        $('select[name="mch_name"]').val(data.mch_name);
        $form.find('input[name="in_date"]').val(data.in_date);
        $form.find('input[name="kmp_humidity"]').val(data.kmp_humidity);
        $form.find('input[name="kmp_mixing_temp"]').val(data.kmp_mixing_temp);
        $form.find('input[name="kmp_mch_temp"]').val(data.kmp_mch_temp);
        $form.find('input[name="kmp_liquid_lot_no"]').val(data.kmp_liquid_lot_no);
        $form.find('input[name="kmp_mixing_start_time"]').val(data.kmp_mixing_start_time);
        $form.find('input[name="kmp_mixing_time"]').val(data.kmp_mixing_time);
        $form.find('input[name="kmp_mch_visc"]').val(data.kmp_mch_visc);
        $form.find('input[name="kmp_out_time"]').val(data.kmp_out_time);
        $form.find('input[name="kmp_checker"]').val(data.kmp_checker);
        $('#modalContainer3').addClass('show').show();
      }
    }); */
  }




  $('.bt1_1').on('click', function () {
    const selectedRows = table1.getSelectedData();
    if (selectedRows.length === 0) {
      alert('삭제할 행을 선택해주세요.');
      return;
    }

    if (!confirm('정말 삭제하시겠습니까?')) return;

    selectedRows.forEach(row => {
      $.ajax({
        url: '/geomet/condition/machineliquidmanage/del',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ id: row.id }),
        success: function () {
          table1.deleteRow(row.id); // 성공 시 테이블에서 삭제
          loadWorkDailyData();
          },
        error: function () {
          alert('삭제 중 오류가 발생했습니다.');
        }
      });
    });
  });








  $('.bt3_3').on('click', function () {
	  const selectedRows = table3.getSelectedData();
	  if (selectedRows.length === 0) {
	    alert('삭제할 행을 선택해주세요.');
	    return;
	  }

	  if (!confirm('정말 삭제하시겠습니까?')) return;

	  selectedRows.forEach(row => {
	    console.log('삭제 요청 보낼 데이터:', row);  // 콘솔에 데이터 출력
	    $.ajax({
	      url: '/geomet/condition/machineliquidmanage/del',
	      type: 'POST',
	      contentType: 'application/json',
	      data: JSON.stringify({ id: row.id }),
	      success: function () {
	        table1.deleteRow(row.id);
	        loadWorkDailyData();
	      },
	      error: function () {
	        alert('삭제 중 오류가 발생했습니다.');
	      }
	    });
	  });
	});



  // 테이블2 삭제 버튼 (.bt2_2)
  $('.bt2_2').on('click', function () {
    const selectedRows = table2.getSelectedData();
    if (selectedRows.length === 0) {
      alert('삭제할 행을 선택해주세요.');
      return;
    }

    if (!confirm('정말 삭제하시겠습니까?')) return;

    selectedRows.forEach(row => {
    	 console.log('삭제2222 요청 보낼 데이터:', row);
      $.ajax({
        url: '/geomet/condition/machineliquidmanage2/del',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ id: row.id }),
        success: function () {
          table2.deleteRow(row.id); 
          loadWorkDailyData();
           },
        error: function () {
          alert('삭제 중 오류가 발생했습니다.');
        }
      });
    });
  });

  //엑셀
  $(".excel-button").on("click", function () {
	    $("#excelOverlay, #excelLoading").show();
	    
	    const in_date = $("#in_date").val();
	    const mch_name = $("#mch_name").val();
	    const endDate = $('#endDate').val();
	    console.log("in_date", in_date);
	    console.log("mch_name", mch_name);
	    console.log("endDate", endDate);

	    console.log("▶ 엑셀 생성 요청 파라미터:", { in_date, mch_name, endDate });

	    // 2) AJAX 호출
	    $.ajax({
	        url: "/geomet/condition/afterLiquidManage/excel",
	        method: "POST",
	        contentType: "application/json",
	        data: JSON.stringify({ in_date, mch_name, endDate }),
	        dataType: "json",

	        success: function (result) {
	            console.log("▶ 서버가 돌려준 result:", result);

	            if (result && result.downloadPath) {
                             const a = document.createElement('a');
                             a.href = result.downloadPath;
                             a.style.display = 'none';
                             document.body.appendChild(a);
                             a.click();
                             document.body.removeChild(a);

	                alert("액투입 관리일지 엑셀 저장 완료되었습니다.");
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

  
</script>

</body>
</html>
