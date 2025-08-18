<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>1호기(G-600)</title>
<style>
	.tab {
	    width: 89%;
	    margin-bottom: 37px;
	    margin-top: 35px;
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
    margin-top: 11px;
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 186px;
    text-align: center;
    height: 38px;
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
        <div id="excelOverlay"></div>
        <div id="excelLoading">
            엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...
        </div>

        <div class="tab">
            <h2></h2>
            <div class="tab-controls">
                <label for="m_code">설비선택 :</label>
				<select id="m_code">
				    <option value="W0100">세척1호기</option>
				    <option value="W0200">세척2호기</option>
				    <option value="S0100">쇼트1호기</option>
				    <option value="S0200">쇼트2호기</option>
				    <option value="S0300">쇼트3호기</option>
				    <option value="S0400">쇼트4호기</option>
				    <option value="S0500">쇼트5호기</option>
				    <option value="S0600">쇼트6호기</option>
				    <option value="G03-GG03">G600</option>
				    <option value="G03-GG01" selected>G800</option> <!-- 🔹 기본 선택값 -->
				    <option value="G04-GG05">K-BLACK</option>
				    <option value="G04-GG07">공용설비</option>
				</select>


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
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">Download
                </button>
            </div>
        </div>

        <div class="view">
        <div style="display: flex; justify-content: center;">
		    <div id="table3"></div>
		</div>
        </div>
    </main>
</body>

<script>
  let table1, table2, table3, selectedRowData;
  let now_page_code = "g01";
  $('.insert-button').click(function() {
	  const startDate = $('#s_time').val();

	  selectedRowData = null;
	  $('#corrForm')[0].reset(); 

	  if (startDate) {
	    const formattedDate = startDate.replace(/-/g, '') + '0900';
	    $('input[name="input_date"]').val(formattedDate); 
	  }

	});


//최상위 레벨에서 정의
  function loadWorkDailyData() {
      let s_time = $("#s_time").val().replaceAll("-", "");
      let e_time = s_time;
      let m_code = $("#m_code").val();

      console.log("보내는 값:", { s_time, e_time, m_code });

      $.ajax({
    	    type: "POST",
    	    url: "/geomet/work/workDailyReport/list_condition",
    	    contentType: "application/json",
    	    data: JSON.stringify({ s_time, e_time, m_code }),
    	    success: function(response) {
    	        let selectedCode = $("#m_code").val();
    	        let allowedCodes = ["G03-GG03", "G03-GG01", "G04-GG05", "G04-GG07"];

    	        if (!allowedCodes.includes(selectedCode)) {
    	            response.table3.forEach(row => {
    	                row.next_facility = "";
    	            });
    	        }

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
        $("#m_code").on("change", function () {
            loadWorkDailyData();
        });
    });



    function initTables() {
    	 

    	table3 = new Tabulator("#table3", {
    	    height: "670px",
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
    	        { title: "완료시간", field: "end_time", hozAlign: "center", headerSort: false, width: 150  }, 
    	        { title: "품명", field: "item_nm", hozAlign: "left", headerSort: false, width: 350 },
    	        { title: "품번", field: "group_id", hozAlign: "left", headerSort: false, width: 170 },
    	        { title: "작업오더", field: "barcode_no", hozAlign: "left", headerSort: false, width: 170 }, 

    	        { title: "후처리 사양", field: "next_facility",  headerSort: false, width: 260 },       
    	        { title: "구분</br>(신규/재작업)", field: "e", headerSort: false, width: 155, hozAlign: "center" }
    	      
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
	    let m_code = $("#m_code").val();
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


  
 
</script>

</body>
</html>
