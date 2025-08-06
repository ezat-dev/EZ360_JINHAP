<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>K-BLACK</title>
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
	    
</style>




</head>
<body>
  <main>
     <div class="tab">
	     <h2>K-BLACK</h2>
	    <div class="tab-controls">
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	       	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	          <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                      <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				 <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button>
	    </div>
	    <div id="m_code">G04-GG05</div>
	</div>

        <div class="view">
            <div id="table1"></div>
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>
<div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>작업일보</h2>
    <form id="corrForm" autocomplete="off">
      <label>설비</label>
      <input type="text" name="mch_name" value="k-black">
	<input type="text" name="mch_code" value="G04-GG05" style="display:none;">

 	  <label>날짜</label>
      <input type="text" name="input_date"readonly>

      <label>주간 / 야간</label>
      <select name="gb">
        <option value="주간">주간</option>
        <option value="야간">야간</option>
      </select>

      <label>점도(48±5초)</label>
      <input type="text" name="visc">

      <label>예열존온도(설정값±10℃)</label>
      <input type="text" name="pre_temp">

      <label>가열존온도(설정값±10℃)</label>
      <input type="text" name="heat_temp">

		
		
	
		<input type="text" name="liq_temp" value="0" style="display:none;">
		
	
		<input type="text" name="sg" value="0" style="display:none;">


      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>
<script>
  let table1, table2, table3, selectedRowData;
  let now_page_code = "b04";

  $('.insert-button').click(function() {
	  const startDate = $('#s_time').val();

	  selectedRowData = null;
	  $('#corrForm')[0].reset(); 
	  if (startDate) {
	    const formattedDate = startDate.replace(/-/g, '') + '0900';
	    $('input[name="input_date"]').val(formattedDate); // ✅ 이 후에 값을 넣어야 유지됨
	  }

	  $('#modalContainer').show().addClass('show');
	});

  $('.close, #closeModal').click(function() {
      $('#modalContainer').removeClass('show').hide();
    });
  
  $('#saveCorrStatus').click(function(event) {
	  event.preventDefault();

	  let valid = true, message = '';
	  const visc     = parseFloat($('input[name="visc"]').val());
	  const preTemp  = parseFloat($('input[name="pre_temp"]').val());
	  const heatTemp = parseFloat($('input[name="heat_temp"]').val());


	  $('#corrForm input').css('color', '');

/* 	  if (isNaN(visc)     || visc     < 35 || visc     > 55) { $('input[name="visc"]').css('color','red');     valid=false; message+='점도는 35~55초 사이여야 합니다.\n'; }
	  if (isNaN(preTemp)  || preTemp  < 30 || preTemp  > 70) { $('input[name="pre_temp"]').css('color','red');  valid=false; message+='예열존온도는 30~70℃ 사이여야 합니다.\n'; }
	  if (isNaN(heatTemp) || heatTemp < 30 || heatTemp > 70) { $('input[name="heat_temp"]').css('color','red'); valid=false; message+='가열존온도는 30~70℃ 사이여야 합니다.\n'; }

 */

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

	});


  $('.delete-button').click(function() {
	  if (!selectedRowData) {
	    return alert('삭제할 행을 먼저 클릭해 주세요.');
	  }
	  if (!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;

	  const deleteData = { idx: selectedRowData.idx };
	  console.log("삭제 요청 데이터:", deleteData);

	  $.ajax({
	    url: "/geomet/work/workDailyReport/delete",
	    method: "POST",
	    contentType: "application/json",
	    data: JSON.stringify(deleteData),
	    success: () => loadWorkDailyData(),
	    error:   () => alert('삭제 중 오류가 발생했습니다.')
	  });
	});




  function loadWorkDailyData() {
      let s_time = $("#s_time").val().replaceAll("-", "");
      let e_time = s_time;
      let m_code = $("#m_code").text().trim();

      console.log("보내는 값:", { s_time, e_time, m_code });

      $.ajax({
        type: "POST",
        url: "/geomet/work/workDailyReport/list",
        contentType: "application/json",
        data: JSON.stringify({ s_time, e_time, m_code }),
        success: function(response) {
//        	console.log(response);
//        	console.log(response.table1);
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
    	    headerHozAlign: "center",
    	    columnHeaderVertAlign: "middle",
    	    rowVertAlign: "middle",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	        { title: "주간/야간", field: "b_a", headerSort: false,hozAlign: "center", width: 200  },
    	      
    	        { title: "예열존온도</br>(설정값±10°C)", field: "blk_d12000", hozAlign: "center", headerSort: false },
    	        { title: "가열존온도</br>(설정값±10°C)", field: "blk_d12001", hozAlign: "center", headerSort: false },
    	        { 
    	            title: "액탱크 번호", 
    	            field: "p_code", 
    	            hozAlign: "center", 
    	            headerSort: false,
    	            formatter: function(cell) {
    	                const val = cell.getValue();
    	                const map = {
    	                    "p_1": "액탱크1",
    	                    "p_2": "액탱크2",
    	                    "p_3": "액탱크3",
    	                    "p_4": "액탱크4"
    	                };
    	                return map[val] || val;  // 매핑 없으면 원래 값 표시
    	            }
    	        },
    	        { title: "액탱크 온도</br>(38°C 이하)", field: "tank_temp", hozAlign: "center", headerSort: false },
    	        { title: "점도</br>PLUS : 45±10초", field: "visocosity",hozAlign: "center", headerSort: false },
    	        { title: "비중</br>1.43±0.05)", field: "specific_gravity", hozAlign: "center", headerSort: false },
    	        { title: "칠러 온도</br>1.10±2)", field: "chiller_temp", hozAlign: "center", headerSort: false }
    	    ],
    	    rowClick: function (e, row) {
    	        selectedRowData = row.getData();
    	        table1.getRows().forEach(r => r.getElement().style.backgroundColor = ""); // 모두 초기화
    	        row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
    	    },

    	    rowDblClick: function (e, row) {
/*     	        const d = row.getData();
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
    	        $('#modalContainer').show().addClass('show'); */
    	    }
    	});


    	table2 = new Tabulator("#table2", {
    	    height: "120px",
    	    layout: "fitColumns",
    	    headerHozAlign: "center",
    	    columnHeaderVertAlign: "middle",
    	    rowVertAlign: "middle",
    	    columnDefaults: {
    	        hozAlign: "center",
    	        headerTooltip: false
    	    },
    	    columns: [
    	        { title: "일 작업통수", field: "tong_day", hozAlign: "center",headerSort: false  },
    	        { title: "생산량", field: "weight_day", hozAlign: "center",headerSort: false },
    	        { title: "평균중량", field: "avg_day", hozAlign: "center",headerSort: false },
    	      
    	    /*     { title: "평균중량", field: "avg_sum", hozAlign: "center",headerSort: false }, */
    	        { title: "가동시간", field: "work_time", hozAlign: "center",headerSort: false },
    	        { title: "가동률", field: "work_percent", hozAlign: "center" ,headerSort: false},
    	        { title: "UPH", field: "uph", hozAlign: "center",headerSort: false },
    	        { title: "월누적", columns: [
    	        	{ title: "누적 생산통수", field: "tong_sum", hozAlign: "center" ,headerSort: false},
    	    	    { title: "누적 생산량", field: "weight_sum", hozAlign: "center",headerSort: false },
    	            { title: "가동시간", field: "sum_time", hozAlign: "center",headerSort: false },
    	            { title: "가동율", field: "sum_percent", hozAlign: "center",headerSort: false },
    	         
    	            { title: "UPH(월누적)", field: "uph_sum", hozAlign: "center",headerSort: false }
    	        ]}
    	    ]
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
    	        { title: "순서", field: "r_num", hozAlign: "center", headerSort: false, width: 50 },       // 조금 줄임
    	        { title: "투입시간", field: "start_time", hozAlign: "center", headerSort: false, width: 100  },
    	        { title: "완료시간", field: "end_time", hozAlign: "center", headerSort: false, width: 100  },
    	        { title: "투입통수", field: "tong_day", hozAlign: "center", headerSort: false, width: 100 },
    	        { title: "작업중량(kg)", field: "weight_day", hozAlign: "center", headerSort: false,width: 100  },
    	        { title: "분할횟수", field: "a", hozAlign: "center", headerSort: false , width: 100 },
    	        { title: "품번", field: "group_id", hozAlign: "left", headerSort: false, width: 150 },
    	        { title: "작업오더", field: "wrk_ord_no", hozAlign: "left", headerSort: false, width: 150 },   
       	        { title: "도금품번", field: "item_cd", hozAlign: "left", headerSort: false, width: 200 }, 
    	        { title: "품명", field: "item_nm", hozAlign: "left", headerSort: false, width: 250 },
    	        { title: "후처리 사양", field: "next_facility",  headerSort: false, width: 200 },
    	        { title: "구분</br>(신규/재작업)", field: "e", headerSort: false, width: 125, hozAlign: "center" }
    	      
    	    ]
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
	    let ex_mch_name  = "GEOMET K-BLACK 작업일보";

	    console.log("▶ 엑셀 생성 요청 파라미터:", { s_time, e_time, m_code, ex_mch_name });

	    // 2) AJAX 호출
	    $.ajax({
	        url: "/geomet/work/workDailyReport_kb/excel",
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
</script>
</body>
</html>
