<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>세척(1호기)</title>
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
	    padding: 6px 12px;
	    font-size: 19px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    width: 150px;
	    text-align: center;
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
	    .modal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0; top: 0;
    width: 100%; height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}
        /*모달css  */
		   .modal {
		    display: none;
		    position: fixed;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.5);
		    transition: opacity 0.3s ease-in-out;
		    overflow: auto;
		}
		.row_select {
		    background-color: #d0d0d0 !important;
		}
		
	  .modal-content {
        background: white;
        width: 27%;
        max-width: 500px;
        height: 81vh; 
        overflow-y: auto; 
        margin: 0% auto 0;
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
        width: 25%;
        padding: 8px;
        margin-bottom: -9px;
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
    .yearselect {
        width: 20%;
        text-align: center;
        font-size: 15px;
    }
    .yearSet {
        width: 20%;
        text-align: center;
        height: 16px;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }
    .yearlabel {
        margin-right: 10px;
        margin-bottom: 13px;
        font-size: 18px;
        margin-left: 20px;
    }
    button-container.button {
        height: 16px;
    }
      #openModalBtn {
    background-color: white;
    border: 1px solid #666;         /* 더 진한 테두리 */
    color: #222;                    /* 더 진한 글씨 */
    font-weight: 500;				 /* 글씨 두께 추가 */
    font-size: 13px;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
  }

  #openModalBtn:hover {
    background-color: #f0f0f0;
  }
  
  .day_s{
    margin-top: 19px;
  
  }
  
</style>



</head>
<body>
<div id="excelOverlay"></div>
<div id="excelLoading">엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...</div>
  
  
  <main>
     <div class="tab">
	     <h2>세척(1호기)</h2>
	    <div class="tab-controls">
	    
        <button id="openModalBtn">엑셀 전체 다운로드</button>
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	        <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
            </button>
	    </div>
	    <div id="m_code">W0100</div>
	</div>

        <div class="view">
          
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>
    
    
    
<!--     <div id="modalContainer" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        
	        <label>검색일자 :</label>
	        <input type="text" id="modal_date" name="t_day" class="yearSet" placeholder="날짜 선택" style="text-align: left;">
	        
	        <form id="corrForm">
	
	            <button type="submit" id="saveCorrStatus">다운로드</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div> -->





   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	    <div>
	      <span class="close">&times;</span>
	    </div> 
	        <div class="day_s">
	        <label>검색일자 :</label>
	        <input type="date" id="modal_date" name="t_day" placeholder="날짜 선택" style="text-align: left;">
	      </div>
	      				<!-- 날짜 선택 후 보여줄 영역 -->
				<div id="fileNameList" style="margin-top: 10px;"></div>
	        <form id="corrForm">
	
	            <button type="submit" id="saveCorrStatus">전체 다운로드</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>

<script>

$("#openModalBtn").click(function () {
	  //오늘날짜
	  const today = new Date();
	  const yyyy = today.getFullYear();
	  const mm = String(today.getMonth() + 1).padStart(2, '0');
	  const dd = String(today.getDate()).padStart(2, '0');
	  const todayStr = `\${yyyy}-\${mm}-\${dd}`;

	  // 어제 날짜
	  today.setDate(today.getDate() - 1);
	  const yyy = today.getFullYear();
	  const mmm = String(today.getMonth() + 1).padStart(2, '0');
	  const ddd = String(today.getDate()).padStart(2, '0');
	  const yesterdayStr = `\${yyy}-\${mmm}-\${ddd}`;

	  // 날짜 입력값에 설정
	  $('#modal_date').val(yesterdayStr).trigger("change"); // 변경 이벤트도 같이 발생시켜서 파일명 뜨게 함
	  $('#modal_date').attr('max', todayStr);      // 오늘까지만 선택 가능

    // 폼 초기화
    $("#corrForm")[0].reset(); 
    $("#id").val(""); // 숨겨진 id 필드도 비워주기

    let modal = $("#modalContainer");
    modal.show();
    modal.addClass("show");
});
$("#closeModal, .close").click(function () {
 $("#modalContainer").hide();
});

$(document).ready(function () {
	  // 날짜 선택 시 → 파일명 화면에 표시
	  $('#modal_date').on('change', function () {
		  console.log("날짜 선택됨");
	    const selectedDate = $(this).val();
	    console.log("selectedDate: ", typeof selectedDate);
	    console.log("selectedDate: ", selectedDate);
	    if (!selectedDate) return;

	    const fileDate = selectedDate.replace(/-/g, "");
	    
	    filenames = [
	        `작업일보_\${fileDate}_세척1호기.xlsx`,
	        `작업일보_\${fileDate}_세척2호기.xlsx`,
	        `작업일보_\${fileDate}_쇼트1호기.xlsx`,
	        `작업일보_\${fileDate}_쇼트2호기.xlsx`,
	        `작업일보_\${fileDate}_쇼트3호기.xlsx`,
	        `작업일보_\${fileDate}_쇼트4호기.xlsx`,
	        `작업일보_\${fileDate}_쇼트5호기.xlsx`,
	        `작업일보_\${fileDate}_쇼트6호기.xlsx`,
	        `작업일보_\${fileDate}_GEOMET600톤.xlsx`,
	        `작업일보_\${fileDate}_GEOMET800톤.xlsx`,
	        `작업일보_\${fileDate}_KBLACK.xlsx`,
	        `작업일보_\${fileDate}_공용설비.xlsx`
	      ];
	    let html = "";
	    filenames.forEach(f => {
	      html += "<p>" + f + "</p>";
	    });
	    $('#fileNameList').html(html);
	  });

 	  // 폼 제출 시 파일 다운로드
	  $('#corrForm').submit(function (e) {
	    e.preventDefault();

	    const selectedDate = $('#modal_date').val();
	    if (!selectedDate) {
	      alert("날짜를 선택하세요.");
	      return;
	    }

	    const firstHalf = filenames.slice(0, 6);   // 앞 6개
	    const secondHalf = filenames.slice(6);     // 나머지 6개
	    
	    triggerDownloads(firstHalf);               // 먼저 6개 요청
	    // 2초 뒤 나머지 6개 요청
	    setTimeout(() => {
	      triggerDownloads(secondHalf);
	    }, 2000);
	    
	    function triggerDownloads(array) {
	    	  array.forEach(filename => {
	    	    if (!filename || filename.trim() === "") return;

	    	    const encoded = encodeURIComponent(filename);
	    	    const link = document.createElement("a");
	    	    link.href = "/geomet/work/workDaily/AllExcel?filename=" + encoded;
	    	    link.download = filename;
	    	    document.body.appendChild(link);
	    	    link.click();
	    	    document.body.removeChild(link);
	    	  });
	    	}
	    
	  });
});

    let table1, table2, table3;
    let now_page_code = "b04";
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
//          table1.setData(response.table1);
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
        height: "115px",
	    layout: "fitColumns",
	    headerHozAlign: "center",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
	    columnDefaults: {
	        hozAlign: "center",
	        headerTooltip: false
	    },
        columns: [
          { title: "근무조", field: "gb" ,headerSort: false},
          { title: "점도", field: "visc",headerSort: false },
          { title: "점도", field: "visc",headerSort: false },
          { title: "예열존온도", field: "pre_temp",headerSort: false },
          { title: "가열존온도", field: "heat_temp" ,headerSort: false},
          { title: "액온도", field: "liq_temp" ,headerSort: false},
          { title: "비중", field: "sg",headerSort: false }
        ]
      });

      table2 = new Tabulator("#table2", {
        height: "150px",
	    layout: "fitColumns",
	    headerHozAlign: "center",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
	    columnDefaults: {
	        hozAlign: "center",
	        headerTooltip: false
	    },
        columns: [
          { title: "일 작업통수", field: "tong_day",headerSort: false },
          { title: "생산량", field: "weight_day",headerSort: false },
          { title: "평균중량", field: "avg_day" ,headerSort: false},
        
        /*   { title: "평균중량", field: "avg_sum" ,headerSort: false}, */
          { title: "가동시간", field: "work_time" ,headerSort: false},
          { title: "가동률", field: "work_percent" ,headerSort: false},
          { title: "UPH", field: "uph" },
          { title: "월누적", columns: [
        	  { title: "누적 생산통수", field: "tong_sum" ,headerSort: false},
              { title: "누적 생산량", field: "weight_sum" ,headerSort: false},
              { title: "가동시간", field: "sum_time" ,headerSort: false},
              { title: "가동율", field: "sum_percent" ,headerSort: false},

              { title: "UPH(월누적)", field: "uph_sum" ,headerSort: false}
            ]
          }
        ]
      });

      table3 = new Tabulator("#table3", {
        height: "460px",
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
	        { title: "투입시간", field: "start_time", hozAlign: "center", headerSort: false, width: 130  },
	        { title: "완료시간", field: "end_time", hozAlign: "center", headerSort: false, width: 130  },
	        { title: "투입통수", field: "tong_day", hozAlign: "center", headerSort: false, width: 140 },
	        { title: "작업중량(kg)", field: "weight_day", hozAlign: "center", headerSort: false,width: 140  },
	      //  { title: "분할횟수", field: "a", hozAlign: "center", headerSort: false , width: 150 },
	        { title: "품번", field: "group_id", hozAlign: "left", headerSort: false, width: 210 },
	        { title: "작업오더", field: "wrk_ord_no", hozAlign: "left", headerSort: false, width: 210 },   
    	    { title: "도금품번", field: "item_cd", hozAlign: "left", headerSort: false, width: 220 },
	        { title: "품명", field: "item_nm", hozAlign: "left", headerSort: false, width: 250 },
	       // { title: "후처리 사양", field: "next_facility",  headerSort: false, width: 200 },
	        { title: "구분</br>(신규/재작업)", field: "e", headerSort: false, width: 140, hozAlign: "center" }
	      
	    ]
      });
    }


    $(".excel-button").on("click", function () {
  	    $("#excelOverlay, #excelLoading").show();

  	    // 1) 파라미터 준비
  	    let s_time = $("#s_time").val().replaceAll("-", "");
  	    let e_time = s_time;
  	    let m_code = $("#m_code").text().trim();
  	    let ex_mch_name  = "세척1호기 작업일보";

  	    console.log("▶ 엑셀 생성 요청 파라미터:", { s_time, e_time, m_code, ex_mch_name });

  	    // 2) AJAX 호출
  	    $.ajax({
  	        url: "/geomet/work/workDailyReport_oil/excel",
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
