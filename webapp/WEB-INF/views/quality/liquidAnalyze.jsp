<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>액분석관리</title>
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
	    gap: 2px;
	    font-size: 16px;
	    margin-left: auto;
	    width: 1615px;
	}

	.tab-controls label {
	    font-weight: 500;
	   	font-size: 16px;
	}
	
.tab-controls input.daySet {
    margin-top: 10px;
    padding: 6px 12px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 100px;
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
                .firstDayselect {
        margin-top: 12px;
            width: 5%;
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
				.kccDiv{
		width: 1590px;
		margin-left: 10px;
		}
			.modal-content5 {
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
		.modal.show .modal-content5 {
		    transform: scale(1);
		    opacity: 1;
		}
				.modal-content5 form {
		    display: flex;
		    flex-direction: column;
		}
		
		.modal-content5 label {
            font-weight: bold;
            margin: 10px 0 5px;
		}
		
		.modal-content5 input, .modal-content5 textarea {
    		width: 78%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}
				.modal-content5 button {
		    background-color: #d3d3d3;
		    color: black;
		    padding: 10px;
		    border: none;
		    border-radius: 5px;
		    margin-top: 10px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		.modal-content5 button:hover {
		    background-color: #a9a9a9;
		}
					.modal-content4 {
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
		.modal.show .modal-content4 {
		    transform: scale(1);
		    opacity: 1;
		}
				.modal-content4 form {
		    display: flex;
		    flex-direction: column;
		}
		
		.modal-content4 label {
            font-weight: bold;
            margin: 10px 0 5px;
		}
		
		.modal-content4 input, .modal-content4 textarea {
    		width: 78%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}
				.modal-content4 button {
		    background-color: #d3d3d3;
		    color: black;
		    padding: 10px;
		    border: none;
		    border-radius: 5px;
		    margin-top: 10px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		.modal-content4 button:hover {
		    background-color: #a9a9a9;
		}
	.kccModalContent {
    background: white;
    width: 97%;
    max-width: 3000px;
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
		.modal.show .kccModalContent {
		    transform: scale(1);
		    opacity: 1;
		}
				.kccModalContent form {
		    display: flex;
		    flex-direction: column;
		}
		
		.kccModalContent label {
            font-weight: bold;
            margin: 10px 0 5px;
            width: 130px;
            font-size: 19px;
		}
		
		.kccModalContent input, .kccModalContent textarea {
    		width: 30%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    margin-bottom: -7px;
		}

		.kccModalContent button:hover {
		    background-color: #a9a9a9;
		}
		/* 제목과 검색 조건을 담는 최상위 컨테이너 */
.header-and-search {
    display: flex; /* 자식 요소들을 가로로 배치 */
    align-items: center; /* 세로 방향 중앙 정렬 */
    margin-bottom: 15px; /* 아래 테이블과의 간격 */
    width: 50%; /* 모달 콘텐츠의 전체 너비 사용 */
}

/* 검색 조건 요소들을 담는 컨테이너 */
.search-controls {
    display: flex; /* 내부 요소들도 가로로 배치 */
    align-items: center;
    gap: 15px; /* 요소들 사이의 간격 조정 */
    width: 75%;
    margin-left: 3%;
}
.kcc-select-button {
    height: 35px;
    width: 90px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-bottom: -7px;
}
.kcc-excel-button {
    height: 35px;
    width: 90px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-bottom: -7px;
}
select-button {
    height: 35px;
    width: 90px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-bottom: -7px;
}
</style>



</head>
<body>
  <main>
<div id="excelOverlay"></div>
<div id="excelLoading">엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...</div>
  
  
  
     <div class="tab">
	    <div class="tab-controls">
	    	    <button class="kccButton boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">KCC 분석비교
                </button>
	    	    <button class="insert-button_4 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">Ash 추가
                </button>
                <button class="insert-button_5 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">N.V 추가
                </button>
	    	    <button class="insert-button_1 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">MEQ 추가
                </button>
                <button class="insert-button_2 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">pH 추가
                </button>
                <button class="insert-button_3 boxCss bt_box">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">Conductivity 추가
                </button>
	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	                   
			   <input type="text" autocomplete="off" class="daySet" id="endDate">
	        			<label class="daylabel">이코팅 :</label>
			<select name="mch_name"id="table_code" class="firstDayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>
	        
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
<!-- 	          <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button> -->
                <button class="excel-button">
    				<img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >엑셀
				</button>
                      <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				 <button class="select-button" id="kccChartPage">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">KCC 차트
                </button>
                <button class="select-button" id="liquidChartPage">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">이코팅 분석 차트
                </button>
                
	    </div>
	    <div id="m_code">G03-GG03</div>
	</div>

        <div class="view">
        <p>Ash</p>
        <div id="table4"></div>
        <p>N.V</p>
        <div id="table5"></div>
        <p>MEQ</p>
            <div id="table1"></div>
            <p>pH</p>
            <div id="table2"></div>
            <p>Conductivity</p>
            <div id="table3"></div>
        </div>
    </main>
    <!-- 3번 모달창 -->
<div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Conductivity(㎲/㎝)</h2>
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
      <label>조치사항</label>
      <input type="text" name="action">

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
        <h2>MEQ(mmol)</h2>
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
      <label>조치사항</label>
      <input type="text" name="action">

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
        <h2>pH</h2>
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
      <label>조치사항</label>
      <input type="text" name="action">
      <label>최소 Spec</label>
      <input type="text" name="ph_min_spec" value="5.5">

      <label>최대 Spec</label>
      <input type="text" name="ph_max_spec" value="6.2">

            <button type="submit" id="saveCorrStatus2">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

		<!-- 3번 모달창? -->
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

<!-- 5번 모달창 -->
<div id="modalContainer5" class="modal">
  <div class="modal-content5">
    <span class="close">&times;</span>
    <h2>N.V(%)</h2>
    <form id="corrForm5" autocomplete="off">
 	  
 	  <label>날짜</label>
      <!-- <input type="text" name="input_date">  -->
		<input type="text" autocomplete="off" class="daySet" name="date" id="date" placeholder="날짜 선택">
	      <label class="daylabel">이코팅 :</label>
			<select name="table_code"id="table_code" class="dayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>
      <label>Baking 후의 무게</label>
      <input type="text" name="nv_baking">
      <label>호일 무게</label>
      <input type="text" name="nv_foil">
      <label>도료 sample의 중량</label>
      <input type="text" name="nv_paint">
      
            <label>조치사항</label>
      <input type="text" name="action">

      <label>최소 Spec</label>
      <input type="text" name="meq_min_spec" value="15">

      <label>최대 Spec</label>
      <input type="text" name="meq_max_spec" value="20">
      
      <button type="submit" id="saveCorrStatus5">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>

<!-- 4번 모달창 -->
<div id="modalContainer4" class="modal">
  <div class="modal-content4">
    <span class="close">&times;</span>
    <h2>Ash(%)</h2>
    <form id="corrForm4" autocomplete="off">
 	  
 	  <label>날짜</label>
      <!-- <input type="text" name="input_date">  -->
		<input type="text" autocomplete="off" class="daySet" name="date" id="date" placeholder="날짜 선택">
	      <label class="daylabel">이코팅 :</label>
			<select name="table_code"id="table_code" class="dayselect">
			    <option value="1">1호기</option>
			    <option value="2">2호기</option>
			</select>
      <label>Baking 후의 무게</label>
      <input type="text" name="ash_baking">
      <label>도가니 무게(g)</label>
      <input type="text" name="ash_do">
      <label>도료 sample의 중량(g)</label>
      <input type="text" name="ash_paint">
      
      <label>조치사항</label>
      <input type="text" name="action">

      <label>최소 Spec</label>
      <input type="text" name="meq_min_spec" value="10">

      <label>최대 Spec</label>
      <input type="text" name="meq_max_spec" value="15">
      
      <button type="submit" id="saveCorrStatus4">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>
<!-- KCC 모달창 -->
<div id="kccModal" class="modal">
  <div class="kccModalContent">
    <span class="close">&times;</span>
<div class="header-and-search"> 
            
            <h2>KCC 분석 비교</h2>
            
            <div class="search-controls"> <label for="s_time">검색일자 :</label>
                <input type="text" autocomplete="off" class="daySet" id="kcc_s_time" placeholder="시작 날짜 선택">
                <span class="date-separator">~</span> 
  			  <input type="text" autocomplete="off" class="daySet" id="kcc_e_time" placeholder="종료 날짜 선택">
                	        <button class="kcc-select-button" onclick="loadKccData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	                        <button class="kcc-excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
            </div>
            
        </div>
<div class="kccDiv">
<div id="kccTable"></div>
</div>
<script>
  let table1, table2, table3, selectedRowData, table4, table5, kccTable;
  let now_page_code = "d04";
  let today;

  // 1번모달 열기
  $(".insert-button_1").click(function () {
  	$('#corrForm1')[0].reset();
      let modal = $("#modalContainer1");
      $('.daySet').val(today);
      modal.show();
      modal.addClass("show");
  });

  // 2번모달 열기
  $(".insert-button_2").click(function () {
  	$('#corrForm2')[0].reset();
      let modal = $("#modalContainer2");
      $('.daySet').val(today);
      modal.show();
      modal.addClass("show");
  });
  
  // 3번모달 열기
  $(".insert-button_3").click(function () {
  	$('#corrForm')[0].reset();
      let modal = $("#modalContainer");
      $('.daySet').val(today);
      modal.show();
      modal.addClass("show");
  });
  // 5번모달 열기
  $(".insert-button_5").click(function () {
  	$('#corrForm5')[0].reset();
      let modal = $("#modalContainer5");
      $('.daySet').val(today);
      modal.show();
      modal.addClass("show");
  });
  // 4번모달 열기
  $(".insert-button_4").click(function () {
  	$('#corrForm4')[0].reset();
      let modal = $("#modalContainer4");
      $('.daySet').val(today);
      modal.show();
      modal.addClass("show");
  });
  // kcc모달 열기
  $(".kccButton").click(function () {
	  const oneMonthAgo = new Date(); 
		oneMonthAgo.setMonth(oneMonthAgo.getMonth() - 1);
		$('#kcc_s_time').val(oneMonthAgo.toISOString().split('T')[0]);
      $('#kcc_e_time').val(new Date().toISOString().split('T')[0]);
      let modal = $("#kccModal");
      loadKccData();
      modal.show();
      modal.addClass("show");
  });

  // 모달 닫기
  $(".close, #closeModal").click(function () {
      $("#modalContainer1").removeClass("show").hide();
      $("#modalContainer").removeClass("show").hide();
      $("#modalContainer2").removeClass("show").hide();
      $("#modalContainer5").removeClass("show").hide();
      $("#modalContainer4").removeClass("show").hide();
      $("#kccModal").removeClass("show").hide();
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
      const endDate = $("#endDate").val();
      console.log("보내는 값:", {table_code, date, endDate});

      $.ajax({
        type: "POST",
        url: "/geomet/quality/liquidAnalyze/list",
        contentType: "application/json",
        data: JSON.stringify({ table_code, date, endDate }),
        success: function(response) {
//        	console.log(response);
        	console.log(response.table1);
        	console.log(response.table3);
          table1.setData(response.table1);
          table2.setData(response.table2);
          table3.setData(response.table3);
          table5.setData(response.table5);
          table4.setData(response.table4);
        },
        error: function(xhr, status, error) {
          console.error("에러 응답:", xhr.responseText);
          alert("조회에 실패했습니다.");
        }
      });
    }

  function loadKccData() {
      let date = $("#kcc_s_time").val();
      let endDate = $("#kcc_e_time").val();
      console.log("보내는 값:", {table_code, date, endDate});

      $.ajax({
        type: "POST",
        url: "/geomet/quality/liquidAnalyze/kccList",
        contentType: "application/json",
        data: JSON.stringify({ date, endDate }),
        success: function(response) {
          kccTable.setData(response.data);
        },
        error: function(xhr, status, error) {
          console.error("에러 응답:", xhr.responseText);
          alert("조회에 실패했습니다.");
        }
      });
    }

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
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false, download: false},
    	        { title: "날짜", field: "date", headerSort: false,hozAlign: "center", width: 150  },
    	      
    	        { title: "전위차  자동 측정(자동PC 프로그램 있음)", field: "auto_track", hozAlign: "center", headerSort: false, width: 270 },
    	        { title: "분석결과(합.부)판정", field: "result", hozAlign: "center", headerSort: false, width: 270,
    	        	formatter: function(cell, formatterParams) {
    	                const data = cell.getRow().getData();
    	                let resultValue = data.auto_track;
    	                let minSpec = data.meq_min_spec;
    	                let maxSpec = data.meq_max_spec;
    	                resultValue = parseFloat(resultValue);
    	                minSpec = parseFloat(minSpec);
    	                maxSpec = parseFloat(maxSpec);
    	                if (resultValue === undefined || minSpec === undefined || maxSpec === undefined) {
    	                    return "데이터 오류";
    	                }
    	                const isPass = resultValue >= minSpec && resultValue <= maxSpec;

    	                if (isPass) {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'black';
    	                    return "합격";
    	                } else {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'red'; //
    	                    return "불합격";
    	                }
    	            } },
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
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false, download: false},
    	    	{ title: "날짜", field: "date", hozAlign: "center",headerSort: false, width: 150 },
    	        { title: "pH 측정 후 입력", field: "ph_input", hozAlign: "center",headerSort: false, width:270  },
    	        { title: "분석결과(합.부)판정", field: "result", hozAlign: "center", headerSort: false, width: 270,
    	        	formatter: function(cell, formatterParams) {
    	                const data = cell.getRow().getData();
    	                let resultValue = data.ph_input;
    	                let minSpec = data.ph_min_spec;
    	                let maxSpec = data.ph_max_spec;
    	                resultValue = parseFloat(resultValue);
    	                minSpec = parseFloat(minSpec);
    	                maxSpec = parseFloat(maxSpec);
    	                if (resultValue === undefined || minSpec === undefined || maxSpec === undefined) {
    	                    return "데이터 오류";
    	                }
    	                const isPass = resultValue >= minSpec && resultValue <= maxSpec;

    	                if (isPass) {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'black';
    	                    return "합격";
    	                } else {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'red'; //
    	                    return "불합격";
    	                }
    	            } },
    	        { title: "조치사항", field: "action", hozAlign: "center",headerSort: false  },
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
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false, download: false},
    	        { title: "날짜", field: "date", hozAlign: "center", headerSort: false, width: 150 },       // 조금 줄임
    	        { title: "전도도 측정 후 입력", field: "conductivity_input", hozAlign: "center", headerSort: false, width: 270},
    	        { title: "분석결과(합.부)판정", field: "result", hozAlign: "center", headerSort: false, width: 270,
    	        	formatter: function(cell, formatterParams) {
    	                const data = cell.getRow().getData();
    	                let resultValue = data.conductivity_input;
    	                let minSpec = data.conductivity_min_spec;
    	                let maxSpec = data.conductivity_max_spec;
    	                resultValue = parseFloat(resultValue);
    	                minSpec = parseFloat(minSpec);
    	                maxSpec = parseFloat(maxSpec);
    	                if (resultValue === undefined || minSpec === undefined || maxSpec === undefined) {
    	                    return "데이터 오류";
    	                }
    	                const isPass = resultValue >= minSpec && resultValue <= maxSpec;

    	                if (isPass) {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'black';
    	                    return "합격";
    	                } else {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'red'; //
    	                    return "불합격";
    	                }
    	            } },
    	        { title: "조치사항", field: "action", hozAlign: "center",headerSort: false  },
    	        { 
    	            title: "Spec", // <-- 열 제목 변경
    	            hozAlign: "center", 
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

    	table4 = new Tabulator("#table4", {
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
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false, download: false},
    	        { title: "날짜", field: "date", hozAlign: "center", headerSort: false, width: 150 },       // 조금 줄임
    	        { title: "① Baking후의 무게 ", field: "ash_baking", hozAlign: "center",headerSort: false, width: 150},
    	        { title: "② 도가니 무게", field: "ash_do", hozAlign: "center", headerSort: false, width: 140},
    	        { title: "③도료 sample의 무게", field: "ash_paint", hozAlign: "center", headerSort: false, width: 170},
    	        { title: "④((①-②)/(NV/100)*③)*100", field: "result", hozAlign: "center", headerSort: false, width: 230,
    	        	formatter: function(cell, formatterParams, onRender){
    	                const value = cell.getValue(); 
    	                
    	                if (value === null || value === undefined || isNaN(value)) {
    	                    return "";
    	                }
    	                return parseFloat(value).toFixed(2);
    	        	}
        	        },
    	        { title: "분석결과(합.부)판정", field: "result", hozAlign: "center", headerSort: false,width: 140,
    	        	formatter: function(cell, formatterParams) {
    	                const data = cell.getRow().getData();
    	                let resultValue = data.result;
    	                let minSpec = data.meq_min_spec;
    	                let maxSpec = data.meq_max_spec;
    	                resultValue = parseFloat(resultValue);
    	                minSpec = parseFloat(minSpec);
    	                maxSpec = parseFloat(maxSpec);
    	                if (resultValue === undefined || minSpec === undefined || maxSpec === undefined) {
    	                    return "데이터 오류";
    	                }
    	                const isPass = resultValue >= minSpec && resultValue <= maxSpec;

    	                if (isPass) {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'black';
    	                    return "합격";
    	                } else {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'red'; //
    	                    return "불합격";
    	                }
    	            } },
    	        { title: "조치사항", field: "action", hozAlign: "center",headerSort: false  },
    	        { 
    	            title: "Spec", // <-- 열 제목 변경
    	            hozAlign: "center", 
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
    	});

    	table5 = new Tabulator("#table5", {
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
    	    	{ title: "id", field: "id", headerSort: false,hozAlign: "center", visible: false, download: false},
    	        { title: "날짜", field: "date", hozAlign: "center", headerSort: false, width: 150 },       // 조금 줄임
    	        { title: "① Baking후의 무게 ", field: "nv_baking", hozAlign: "center",headerSort: false, width: 150},
    	        { title: "②호일 무게(g)", field: "nv_foil", hozAlign: "center", headerSort: false, width: 140},
    	        { title: "③도료sample의 중량(g)", field: "nv_paint", hozAlign: "center", headerSort: false, width: 170},
    	        { title: "④(①-②)/③*100", field: "result", hozAlign: "center", headerSort: false, width: 230,
    	        	formatter: function(cell, formatterParams, onRender){
    	                const value = cell.getValue(); 
    	                
    	                if (value === null || value === undefined || isNaN(value)) {
    	                    return "";
    	                }
    	                return parseFloat(value).toFixed(2);
    	        	}
        	        },
    	        { title: "분석결과(합.부)판정", field: "result", hozAlign: "center", headerSort: false, width: 140,
    	        	formatter: function(cell, formatterParams) {
    	                const data = cell.getRow().getData();
    	                let resultValue = data.result;
    	                let minSpec = data.meq_min_spec;
    	                let maxSpec = data.meq_max_spec;
    	                resultValue = parseFloat(resultValue);
    	                minSpec = parseFloat(minSpec);
    	                maxSpec = parseFloat(maxSpec);
    	                if (resultValue === undefined || minSpec === undefined || maxSpec === undefined) {
    	                    return "데이터 오류";
    	                }
    	                const isPass = resultValue >= minSpec && resultValue <= maxSpec;

    	                if (isPass) {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'black';
    	                    return "합격";
    	                } else {
    	                    cell.getElement().style.backgroundColor = ''; 
    	                    cell.getElement().style.color = 'red'; //
    	                    return "불합격";
    	                }
    	            } },
    	        { title: "조치사항", field: "action", hozAlign: "center",headerSort: false  },
    	        { 
    	            title: "Spec", // <-- 열 제목 변경
    	            hozAlign: "center", 
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
    	});

    	kccTable = new Tabulator("#kccTable", {
    	    height: "550px",
    	    width: "2000px",
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
    	        { title: "날짜", field: "date", hozAlign: "center", headerSort: false, width: 150 }, 
    	        { title: "항목", 
    	        	columns:[
						{title: "관리범위",
							columns:[
								{title:"욕액",field: "table_code", hozAlign: "center", width: 150,
									formatter: function(cell, formatterParams, onRender){
								        const table_code = cell.getValue();
								        return table_code + "호기";
								    }
							    }
								]
							}
						]
				},
    	        { title: "MEQ(mmol)", 
    	        	columns:[
						{title: "36~45",
							columns:[
								{title:"진합",field: "meq_result", hozAlign: "center", width: 100,
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"KCC",field: "meq_kcc", hozAlign: "center", width: 100, editor: "number",
			        	        	formatter: function(cell, formatterParams, onRender){
			        	                const value = cell.getValue(); 
			        	                
			        	                if (value === null || value === undefined || isNaN(value)) {
			        	                    return "";
			        	                }
			        	                return parseFloat(value).toFixed(2);
			        	        	}
		        	        	},
								{title:"편차",field: "d", hozAlign: "center", width: 100,
									formatter: function(cell, formatterParams, onRender){
								        
								        const rowData = cell.getRow().getData();
								        
								        const result = parseFloat(rowData.meq_result) || 0;
								        const kcc = parseFloat(rowData.meq_kcc) || 0;
								        
								        const deviation = result - kcc;

								        const cellElement = cell.getElement();
								        cellElement.style.backgroundColor = "orange";
								        
								        return deviation.toFixed(2); 
								    }
									}
								]
							}
						]
				},
    	        { title: "Ash(%)", 
    	        	columns:[
						{title: "10~15",
							columns:[
								{title:"진합",field: "ash_result", hozAlign: "center", width: 100,
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"KCC",field: "ash_kcc", hozAlign: "center", width: 100, editor: "number",
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"편차",field: "d", hozAlign: "center", width: 100,
									formatter: function(cell, formatterParams, onRender){
								        
								        const rowData = cell.getRow().getData();
								        
								        const result = parseFloat(rowData.ash_result) || 0;
								        const kcc = parseFloat(rowData.ash_kcc) || 0;
								        
								        const deviation = result - kcc;
								        const cellElement = cell.getElement();
								        cellElement.style.backgroundColor = "orange";
								        return deviation.toFixed(2); 
								    }
									}
								]
							}
						]
				},
    	        { title: "N.V(%)", 
    	        	columns:[
						{title: "15~20",
							columns:[
								{title:"진합",field: "nv_result", hozAlign: "center", width: 100,
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"KCC",field: "nv_kcc", hozAlign: "center", width: 100, editor: "number",
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"편차",field: "d", hozAlign: "center", width: 100,
									formatter: function(cell, formatterParams, onRender){
								        
								        const rowData = cell.getRow().getData();
								        
								        const result = parseFloat(rowData.nv_result) || 0;
								        const kcc = parseFloat(rowData.nv_kcc) || 0;
								        
								        const deviation = result - kcc;
								        const cellElement = cell.getElement();
								        cellElement.style.backgroundColor = "orange";
								        return deviation.toFixed(2); 
								    }
									}
								]
							}
						]
				},
    	        { title: "pH", 
    	        	columns:[
						{title: "5.5~6.2",
							columns:[
								{title:"진합",field: "ph_result", hozAlign: "center", width: 100,
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"KCC",field: "ph_kcc", hozAlign: "center", width: 100, editor: "number",
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"편차",field: "d", hozAlign: "center", width: 100,
									formatter: function(cell, formatterParams, onRender){
								        
								        const rowData = cell.getRow().getData();
								        
								        const result = parseFloat(rowData.ph_result) || 0;
								        const kcc = parseFloat(rowData.ph_kcc) || 0;
								        
								        const deviation = result - kcc;
								        const cellElement = cell.getElement();
								        cellElement.style.backgroundColor = "orange";
								        return deviation.toFixed(2); 
								    }
									}
								]
							}
						]
				},
    	        { title: "Conductivity(㎲/㎝)", 
    	        	columns:[
						{title: "1000~1800",
							columns:[
								{title:"진합",field: "conductivity_result", hozAlign: "center", width: 100,
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"KCC",field: "conductivity_kcc", hozAlign: "center", width: 100, editor: "number",
				    	        	formatter: function(cell, formatterParams, onRender){
				    	                const value = cell.getValue(); 
				    	                
				    	                if (value === null || value === undefined || isNaN(value)) {
				    	                    return "";
				    	                }
				    	                return parseFloat(value).toFixed(2);
				    	        	}
			    	        	},
								{title:"편차",field: "d", hozAlign: "center", width: 100,
									formatter: function(cell, formatterParams, onRender){
								        
								        const rowData = cell.getRow().getData();
								        
								        const result = parseFloat(rowData.conductivity_result) || 0;
								        const kcc = parseFloat(rowData.conductivity_kcc) || 0;
								        
								        const deviation = result - kcc;
								        const cellElement = cell.getElement();
								        cellElement.style.backgroundColor = "orange";
								        return deviation.toFixed(2); 
								    }
									}
								]
							}
						]
				}
    	      
    	    ],
            rowClick: function (e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");  
                //row.getElement().classList.add("row_select");
                 row.getElement().style.backgroundColor = "#d3d3d3"; // 클릭된 행 강조 (연회색)
                selectedRow = row;
                console.log("선택된 row id:", selectedRow.getData().id);
            },
            cellEdited: function(cell){
                    const rowData = cell.getRow().getData(); // 수정된 행의 전체 데이터 가져오기
                    const field = cell.getField();
                    const oldValue = cell.getOldValue();     // 수정되기 전의 값
                    const newValue = cell.getValue();        // 새로 수정된 값
                    console.log("수정된 행 데이터", rowData);
                    console.log("수정된 행 날짜", rowData.date);
                    console.log("수정된 열", field);
                    const parts = field.split('_');
                 	const mch_name = parts[0];
                 	console.log("mch_name: ", mch_name);
                 	const date = rowData.date;
                 	const table_code = rowData.table_code;

                    updateKcc(rowData, field, newValue);
            }
    	});

    }
	//kcc 업데이트
	function updateKcc(rowData, field, newValue) {
    
    // 1. 필요한 변수 추출
    const parts = field.split('_');
    const mch_name = parts[0];  
    const date = rowData.date;     
    const table_code = rowData.table_code; 
    
    const data = {
        mch_name: mch_name,
        date: date,
        table_code: table_code,
        [field]: newValue, 
    };

    console.log('--- API로 전송할 최종 JSON 데이터 ---');
    console.log(data);
    console.log('------------------------------------');

    $.ajax({
        url: "/geomet/quality/liquidAnalyze/updateKcc",
        type: 'POST',
        contentType: 'application/json', 
        data: JSON.stringify(data),
        dataType: 'json', 
        success: function(response) {
            if(response === true){
            kccTable.setData(loadKccData());
            console.log("업데이트 성공: ", response);
            } else{
                console.log("업데이트 실패")
                }
        },
        error: function(xhr, status, error) {
            console.error('❌ KCC 업데이트 중 오류 발생 (AJAX):', {
                status: status,
                error: error,
                response: xhr.responseText 
            });
            alert("데이터 업데이트 중 오류가 발생했습니다: " + error);
        }
    });
}
  $(function() {
    today = new Date().toISOString().split('T')[0];
    $('#s_time').val(new Date().toISOString().split('T')[0]);
    $('#endDate').val(new Date().toISOString().split('T')[0]);
    initTables();
    loadWorkDailyData();
  });







/*   $(".excel-button").on("click", function () {
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
	}); */

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
                            alert("저장 완료되었습니다.")
                            console.log("데이터 저장 성공");
                        } else {
                            console.error(`${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}`);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(`${mch_name} 서버 오류 발생!`, textStatus, errorThrown);
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
                            alert("저장 완료되었습니다.")
                            console.log("데이터 저장 성공");
                        } else {
                            console.log("ph 저장 실패");
                            console.error(`${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}`);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(`${mch_name} 서버 오류 발생!`, textStatus, errorThrown);
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
                            alert("저장 완료되었습니다.")
                            console.log("데이터 저장 성공");
                        } else {
                            console.error(`${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}`);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(`${mch_name} 서버 오류 발생!`, textStatus, errorThrown);
                    }
                });
    });

    // 5번 모달창 저장 버튼 클릭 시
    $("#saveCorrStatus5").click(function (event) {

        const formElement = document.getElementById("corrForm5");
        const formData = new FormData(formElement);

        // id 값이 비어 있으면 제거
        if (!formData.get("id") || formData.get("id").trim() === "") {
            formData.delete("id");
        }

        const mch_name = "nv"; 

     formData.append("mch_name", mch_name);

        // 디버깅 로그
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }
            
                $.ajax({
                    url: "/geomet/quality/liquidAnalyze/insertNv",
                    type: "POST",
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function(response) {
                    	console.log("▶ 서버가 돌려준 result:", response);
                    	
                        if (response && response.success === true) {
                            try{
                            console.log("데이터 저장 성공");
                            alert("저장 완료되었습니다.");
                            $("#modalContainer1").hide();
                            loadWorkDailyData();
                            }catch(e){
								console.log("저장 후 에러 발생: ", e);
                                }
                        } else {
                            alert("오류 발생: 해당 날짜에 데이터가 있습니다. 삭제 후 다시 실행해주세요.")
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log("저장 중 에러 발생");
                        alert("저장 중 에러 발생")
                    }
                });
    });
    // 4번 모달창 저장 버튼 클릭 시
    $("#saveCorrStatus4").click(function (event) {

        const formElement = document.getElementById("corrForm4");
        const formData = new FormData(formElement);

        // id 값이 비어 있으면 제거
        if (!formData.get("id") || formData.get("id").trim() === "") {
            formData.delete("id");
        }

        const mch_name = "ash"; 

     formData.append("mch_name", mch_name);

        // 디버깅 로그
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }
            
                $.ajax({
                    url: "/geomet/quality/liquidAnalyze/insertAsh",
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
                            alert("오류 발생: ")
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

    //kcc 엑셀 버튼
    $(".kcc-excel-button").on("click", function () {
        //$("#excelOverlay, #excelLoading").show();

        const date = $("#kcc_s_time").val();
        const endDate = $("#kcc_e_time").val();

                $.ajax({
                    url: "/geomet/quality/liquidAnalyze/kccExcel",
                    method: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({ date, endDate }),
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
  //kcc 차트 버튼 클릭시 페이지 이동
    $('#kccChartPage').click(function() {
    	window.location.href = "/geomet/quality/kccChartPage";
    });
  //이코팅 분석 차트 클릭시
      $('#liquidChartPage').click(function() {
    	window.location.href = "/geomet/quality/liquidChartPage";
    });

    //한 파일에 시트로 나누어 엑셀 생성
      $('.excel-button').click(function() {
          const today = new Date().toISOString().slice(0, 10).replace(/-/g, "");
          const fileName = "액분석관리_" + today + ".xlsx";
          
          // 1. 새 워크북 생성
          const workbook = XLSX.utils.book_new();

          // 2. 테이블을 시트로 변환하고 너비를 조절하는 통합 함수
          function addTableToSheet(tableInstance, sheetName) {
              if (!tableInstance) return; // 테이블이 없으면 스킵

              // (A) 테이블의 현재 데이터와 컬럼 정의 가져오기
              const data = tableInstance.getData("active"); 
              const columns = tableInstance.getColumnDefinitions();
              
              // (B) 다운로드 제외 설정(download: false)을 반영하여 데이터 매핑
              const sheetData = data.map(row => {
                  let obj = {};
                  columns.forEach(col => {
                      // 필드가 있고, download 설정이 false가 아닌 경우만 포함
                      if(col.field && col.download !== false) {
                          //obj[col.title] = row[col.field];
                          let val = row[col.field];

                          if(sheetName === "ASH" || sheetName === "N.V"){
                       // 1. 첫 번째 'result' 컬럼: 소수점 2자리 숫자 처리
                          if (col.field === "result" && col.title.includes("④")) {
                              if (val !== null && val !== undefined && !isNaN(val)) {
                                  val = parseFloat(parseFloat(val).toFixed(2));
                              } else {
                                  val = "";
                              }
                          }

                          // 2. 두 번째 'result' 컬럼: 합격/불합격 판정 처리
                          else if (col.field === "result" && col.title.includes("판정")) {
                              const resVal = parseFloat(row.result);
                              const min = parseFloat(row.meq_min_spec);
                              const max = parseFloat(row.meq_max_spec);
                              
                              if (isNaN(resVal) || isNaN(min) || isNaN(max)) {
                                  val = "데이터 오류";
                              } else {
                                  val = (resVal >= min && resVal <= max) ? "합격" : "불합격";
                              }
                          }
                          }else if(sheetName === "MEQ"){
                        	  if (col.field === "result" && col.title.includes("판정")) {
                                  const resVal = parseFloat(row.auto_track);
                                  const min = parseFloat(row.meq_min_spec);
                                  const max = parseFloat(row.meq_max_spec);
                                  
                                  if (isNaN(resVal) || isNaN(min) || isNaN(max)) {
                                      val = "데이터 오류";
                                  } else {
                                      val = (resVal >= min && resVal <= max) ? "합격" : "불합격";
                                  }
                              }
                          }else if(sheetName === "pH"){
                        	  if (col.field === "result" && col.title.includes("판정")) {
                                  const resVal = parseFloat(row.ph_input);
                                  const min = parseFloat(row.ph_min_spec);
                                  const max = parseFloat(row.ph_max_spec);
                                  
                                  if (isNaN(resVal) || isNaN(min) || isNaN(max)) {
                                      val = "데이터 오류";
                                  } else {
                                      val = (resVal >= min && resVal <= max) ? "합격" : "불합격";
                                  }
                              }
                          }else if(sheetName === "Conductivity"){
                        	  if (col.field === "result" && col.title.includes("판정")) {
                                  const resVal = parseFloat(row.conductivity_input);
                                  const min = parseFloat(row.conductivity_min_spec);
                                  const max = parseFloat(row.conductivity_max_spec);
                                  
                                  if (isNaN(resVal) || isNaN(min) || isNaN(max)) {
                                      val = "데이터 오류";
                                  } else {
                                      val = (resVal >= min && resVal <= max) ? "합격" : "불합격";
                                  }
                              }
                          }

                          // 엑셀 시트 객체에 '컬럼제목: 가공된값' 형태로 저장
                          obj[col.title] = val;
                      }
                  });
                  return obj;
              });

              // (C) 데이터를 시트로 변환
              const sheet = XLSX.utils.json_to_sheet(sheetData);
              
              // (D) [중요] 각 열마다 데이터 길이를 측정하여 너비(wch) 계산 (두 번째 코드 로직)
              if (sheet['!ref']) {
                  const range = XLSX.utils.decode_range(sheet['!ref']);
                  const colWidths = [];

                  for (let C = range.s.c; C <= range.e.c; ++C) {
                      let maxWidth = 12; // 헤더 길이를 고려한 기본 최소 너비
                      for (let R = range.s.r; R <= range.e.r; ++R) {
                          const cell = sheet[XLSX.utils.encode_cell({r: R, c: C})];
                          if (cell && cell.v) {
                              const len = cell.v.toString().length;
                              if (len > maxWidth) maxWidth = len;
                          }
                      }
                      // 한글 깨짐 방지를 위해 1.5배 가중치 적용
                      colWidths.push({ wch: maxWidth * 1.5 });
                  }
                  sheet['!cols'] = colWidths;
              }

              // (E) 워크북에 시트 추가
              XLSX.utils.book_append_sheet(workbook, sheet, sheetName);
          }

          // 3. 실제 테이블 인스턴스와 시트 이름 매칭하여 추가
          addTableToSheet(table4, "ASH");
          addTableToSheet(table5, "N.V");
          addTableToSheet(table1, "MEQ");
          addTableToSheet(table2, "pH");
          addTableToSheet(table3, "Conductivity");

          // 4. 최종 파일 내보내기
          XLSX.writeFile(workbook, fileName);
      });
</script>

</body>
</html>
