<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쇼트 (5호기)</title>
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
	}		    	@media (max-width: 600px) {
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
<div id="excelOverlay"></div>
<div id="excelLoading">엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...</div>
  
  <main>
     <div class="tab">
	     <h2>쇼트(5호기)</h2>
	    <div class="tab-controls">
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	         <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
            </button>
	    </div>
	    <div id="m_code">S0500</div>
	</div>

        <div class="view">
           <!--  <div id="table1"></div> -->
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>

<script>
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
//          	console.log(response);
          	console.log(response.table1);
     
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
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
            layout: "fitColumns",
            headerHozAlign: "center",
            columns: [
              { title: "주간/야간", field: "gb",hozAlign: "center" },
              { title: "점도", field: "visc" ,hozAlign: "center"},
              { title: "점도", field: "visc",hozAlign: "center" },
              { title: "예열존온도", field: "pre_temp" ,hozAlign: "center"},
              { title: "가열존온도", field: "heat_temp" ,hozAlign: "center"},
              { title: "액온도", field: "liq_temp" ,hozAlign: "center"},
              { title: "비중", field: "sg",hozAlign: "center" }
            ]
          });

          table2 = new Tabulator("#table2", {
              height: "115px",
              layout: "fitColumns",
              columnHeaderVertAlign: "middle",
              rowVertAlign: "middle",
              headerHozAlign: "center",
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
              height: "522px",
              layout: "fitColumns",
              columnHeaderVertAlign: "middle",
              rowVertAlign: "middle",
              headerHozAlign: "center",
              columns: [
      	        { title: "순서", field: "r_num", hozAlign: "center", headerSort: false, width: 50 },       // 조금 줄임
      	        { title: "투입시간", field: "start_time", hozAlign: "center", headerSort: false, width: 140  },
      	        { title: "완료시간", field: "end_time", hozAlign: "center", headerSort: false, width: 140  },
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
    	    let ex_mch_name  = "쇼트2호기 작업일보";

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
