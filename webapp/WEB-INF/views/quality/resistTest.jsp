<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>테스트/시험정보</title>
<%@include file="../include/pluginpage.jsp"%>
    <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
<style>
.search {
	height: 40px;
}

.container {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-left: 1008px;
	margin-top: 200px;
}

.search {
	height: 40px;
	display: flex;
	justify-content: flex-end; /* 오른쪽 끝으로 이동 */
	align-items: center; /* 세로 가운데 정렬 */
}

.btn {
	font-size: 18px;
	height: 40px;
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
		      z-index: 50;        
		}
		
		.modal-content {
		    background: white;
			width: 100%;
   			 max-width: 1001px;
		    max-height: 1400px; /* 화면 높이에 맞게 제한 */
		    overflow-y: auto;
		    margin: 2% auto; /* 수평 중앙 정렬 */
		    padding: 20px;
		    border-radius: 10px;
		    position: relative;
		    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		    transform: scale(0.8);
		    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
		    opacity: 0;
		      z-index: 10001;
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
		    margin: 10px 85px 5px;
		}
		
		.modal-content input, .modal-content textarea {
		    width: 85%;
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
		.tank-table input {
		  width: 116px; 
		  }
		.daylabel {
		    margin-right: 10px;
		    margin-bottom: 1px;
		    font-size: 18px;
		    margin-left: 20px;
		}
.box1 {
    display: flex;
    align-items: center;
    width: 906px;
    margin-top: 4px;
    gap: 10px;
}
		.bt_box {
    display: grid;
    grid-template-columns: repeat(3, auto);
    grid-auto-rows: auto;
    gap: 10px;
    margin-top: 35px;
    width: fit-content;
    margin-left: 43px;
    height: 76px;

  /* 오른쪽 정렬 원하면 */
  width: fit-content;
  margin-left: auto;
		}
		/* Tabulator 선택 행 색상 연노랑으로 */
		#dataList .tabulator-row.tabulator-selected {
		  background-color: #fffde7 !important; /* 아주 연한 노랑 */
		}
        .view {
            display: flex;
            justify-content: center;
            margin-top: 0%;
        }

                .daySet {
        	width: 10%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            margin-top: 12px;
        }
        .boxCss{
        width: 250px;
        }

        		.modal-content1 {
    background: white;
    width: 100%;
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
		
		/* 모달 안 테이블 인풋 크기 조정 */
	#modalContainer4 .test-table input[type="number"],
	#modalContainer4 .test-table input[type="text"] {
    width: 170px;
    padding: 3px;
    font-size: 13px;
    text-align: right;
    box-sizing: border-box;
    height: 40px;
	}
			
		
		.modal-content1 label {
		    font-weight: bold;
		    margin: 10px 49px 5px;
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
		
		/* 모달 안 테이블 인풋 크기 조정 */
#modalContainer2 input[type="number"],
#modalContainer2 input[type="text"],
#modalContainer2 select,
#modalContainer2 input[type="date"] {
    width: 160px;
    padding: 3px;
    font-size: 13px;
    text-align: right; /* 숫자는 오른쪽 정렬 */
    box-sizing: border-box;
    height: 40px;
}

#modalContainer7 input[type="number"],
#modalContainer7 input[type="text"],
#modalContainer7 select,
#modalContainer7 input[type="date"] {
    width: 160px;
    padding: 3px;
    font-size: 13px;
    text-align: right; /* 숫자는 오른쪽 정렬 */
    box-sizing: border-box;
    height: 40px;
}
.cleanText{
transform: translate(59px, 100px);
margin-top:-5%;
}
.geometText{
transform: translate(59px, 0px);
}
.attachmentTableClass, .turbidityTableClass{
margin-left: 2%;
}
.graphButton {
    margin-left: 1400px;
    width: 200px;
    font-size: 18px;
    margin-top: -5px;
    height: 40px;
}
</style>
<body>

	<main class="main">
	        <div class="tab">
	        
	        <div class="bt_box">
	         <button class="insert-button_1 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image"> 세척1.2호기  가성소다용액 농도
                </button>
    

                	         <button class="insert-button_3 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image"> 지오메트 가열잔분 탱크액
                </button>
                	         <button class="insert-button_4 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">지오메트 부착량
                </button>
                	         <button class="insert-button_5 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">지오메트 후처리 부착량
                </button>
<!--                 	         <button class="insert-button_6 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">6. 내수밀착성
                </button> -->
                
                 <button class="insert-button_7 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">SST시험성적서
                </button>
                            	         <button class="insert-button_2 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image"> CCT시험성적서
                </button>
              </div>
                
            <div class="button-container">
                <div class="box1">
                    
                    <label class="daylabel">검색일자 :</label>
                    <input type="text" 
                           autocomplete="off" 
                           class="daySet" 
                           id="startDate" 
                           style="font-size: 16px; margin-bottom:10px;" 
                           placeholder="날짜 선택">
                           
               <span class="mid" style="font-size: 20px; font-weight: bold; margin-bottom:10px;"> ~ </span>
				
			   <input type="text" autocomplete="off" class="daySet" id="endDate"
			        style="font-size: 16px; margin: 5px; border-radius: 4px; border: 1px solid #ccc; text-align: center; height: 16px; width:10%;">
     

                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>

                <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				
				<button class="excel-button">
    				<img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >엑셀
				</button>
				
			<button class="btn">세척액 약품투입기준자료</button>

           </div>
                		<!-- 조회조건 표시 -->
	
            </div>
            
        </div>
			<button class="graphButton">차트</button>
<!-- 	        <label for="s_time">검색일자 :</label>
	        <input type="text" autocomplete="off" class="daySet" id="s_time" placeholder="시작 날짜 선택">
	        <button class="select-button" onclick="loadWorkDailyData()">
	            <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	        </button>
	    <button class="insert-button_3">
            <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
        </button> -->
        



		<jsp:include page="../include/tabBar.jsp" />


		<!--1번 모달창 -->
		<div id="modalContainer1" class="modal">
    <div class="modal-content1">
        <span class="close">&times;</span>
        <h2>가성소다용액 농도</h2>
        <form  id="corrForm1"  autocomplete="off">
            <label>테스트 시험일자</label>
           <input type="text" name="date" id="daySet1" class="daySet" placeholder="날짜 선택" style="text-align: left; width: 120px; margin-left: 45px;">
      <table class="clean-table">
        <thead>
          <tr>
            <th style="text-align:left;">설비</th>
            <th style="text-align:left;">0.1N-HCL(염산) 소모량</th>
            <th>최소 Spec(%)</th>
            <th>최대 Spec(%)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1호기 <input type="hidden" name="mch_name" value="1호기"></td>
            <td><input type="number"  name="acid_reduce" required></td>
            <td><input type="text" name="min_spec" value="30"></td>
            <td><input type="text" name="max_spec" value="40"></td>
          </tr>
          <tr>
            <td>2호기 <input type="hidden" name="mch_name" value="2호기"></td>
            <td><input type="number"  name="acid_reduce" required></td>
            <td><input type="text" name="min_spec" value="30"></td>
            <td><input type="text" name="max_spec" value="40"></td>
          </tr>
        </tbody>
      </table>

      <input type="hidden" name="batchId" value="">
			
			<label>기준서(PDF)</label>
			<input type="file" id="fileInput" accept="application/pdf"  name="uploadFile" style="text-align: left; width: 180px; margin-left: 45px;">

			<label style="display: none;">파일 이름</label>
			<input type="text" name="t_url" id="fileName" placeholder="기준서(PDF)" style="text-align: left; width: 120px; margin-left: 45px; display: none;">

            <button type="submit" id="saveCorrStatus1">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

	<!-- 3번 모달창 -->
<div id="modalContainer3" class="modal">
  <div class="modal-content" style="max-width: 1400px; max-height: 1400px; overflow-y: auto;">
    <span class="close">&times;</span>
    <h2>가열잔분 탱크액 관리기준 정보</h2>
    <form id="corrForm" autocomplete="off">
      <label>테스트 시험일자</label>
      <input type="text" name="date" id="daySet2" class="daySet" placeholder="날짜 선택"
             style="text-align: left; width: 120px; margin-left: 5%;">

      <table class="tank-table">
        <thead>
          <tr>
            <th>설비</th>
            <th>가열 후 무게</th>
            <th>빈 접시 무게</th>
            <th>가열 전 무게</th>
            <th>조치사항</th>
            <th>최소 Spec(%)</th>
            <th>최대 Spec(%)</th>
          </tr>
        </thead>
        <tbody>
          <!-- G600 : 3줄 -->
          <tr>
            <td>G600_1 <input type="hidden" name="mch_name" value="G600_1"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>G600_2 <input type="hidden" name="mch_name" value="G600_2"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>G600_3 <input type="hidden" name="mch_name" value="G600_3"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>

          <!-- G800 : 4줄 -->
          <tr>
            <td>G800_1 <input type="hidden" name="mch_name" value="G800_1"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>G800_2 <input type="hidden" name="mch_name" value="G800_2"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>G800_3 <input type="hidden" name="mch_name" value="G800_3"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>G800_4 <input type="hidden" name="mch_name" value="G800_4"></td>
            <td><input type="number" name="hafter_1" required></td>
            <td><input type="number" name="empty_2" required></td>
            <td><input type="number" name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>

          <!-- PLUS : 2줄 -->
          <tr>
            <td>PLUS_1 <input type="hidden" name="mch_name" value="PLUS_1"></td>
            <td><input type="number" name="hafter_1"></td>
            <td><input type="number" name="empty_2"></td>
            <td><input type="number" name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="19.0"></td>
            <td><input type="text" name="max_spec" value="25.0"></td>
          </tr>
          <tr>
            <td>PLUS_2 <input type="hidden" name="mch_name" value="PLUS_2"></td>
            <td><input type="number" name="hafter_1"></td>
            <td><input type="number" name="empty_2"></td>
            <td><input type="number" name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="19.0"></td>
            <td><input type="text" name="max_spec" value="25.0"></td>
          </tr>

          <!-- ML : 2줄 -->
          <tr>
            <td>ML_1 <input type="hidden" name="mch_name" value="ML_1"></td>
            <td><input type="number" name="hafter_1"></td>
            <td><input type="number" name="empty_2"></td>
            <td><input type="number" name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="24.0"></td>
            <td><input type="text" name="max_spec" value="30.0"></td>
          </tr>
          <tr>
            <td>ML_2 <input type="hidden" name="mch_name" value="ML_2"></td>
            <td><input type="number" name="hafter_1"></td>
            <td><input type="number" name="empty_2"></td>
            <td><input type="number" name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="24.0"></td>
            <td><input type="text" name="max_spec" value="30.0"></td>
          </tr>

          <!-- K/B : 2줄 -->
          <tr>
            <td>K/B_1 <input type="hidden" name="mch_name" value="KB_1"></td>
            <td><input type="number" name="hafter_1"></td>
            <td><input type="number" name="empty_2"></td>
            <td><input type="number" name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="24.0"></td>
            <td><input type="text" name="max_spec" value="30.0"></td>
          </tr>
          <tr>
            <td>K/B_2 <input type="hidden" name="mch_name" value="KB_2"></td>
            <td><input type="number" name="hafter_1"></td>
            <td><input type="number" name="empty_2"></td>
            <td><input type="number" name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="24.0"></td>
            <td><input type="text" name="max_spec" value="30.0"></td>
          </tr>
        </tbody>
      </table>

      <input type="hidden" name="batchId" value="">
			
      <label>기준서(PDF)</label>
      <input type="file" id="fileInput3" accept="application/pdf" name="uploadFile"
             style="text-align: left; width: 180px; margin-left: 5%;">

      <label style="display: none;">파일 이름</label>
      <input type="text" name="t_url" id="fileName" placeholder="기준서(PDF)"
             style="text-align: left; width: 120px; margin-left: 5%; display: none;">

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>


<div id="modalContainer5" class="modal">
    <div class="modal-content" style="max-width: 1400px;">
        <span class="close">&times;</span>
        <form id="turbidityForm" autocomplete="off">
        <h2>후처리 부착량 테스트</h2>
      <input type="text" name="date" id="daySet5" class="daySet" placeholder="날짜 선택"
             style="text-align: left; width: 120px; margin-left: 5%;">
        <p>PLUS, ML Spec.20(mg/dm²)↑</p>
        <p>K-BLACK Spec.80(mg/dm²)↑</p>
  <select id="itemSelectBox">
    <option value="">-- 설비명 선택 --</option>
    <option value="PLUS">PLUS</option>
    <option value="ML">ML</option>
    <option value="K/B">K/B</option>
    </select>
            <table class="turbidity-table">
  <thead>
    <tr>
      <th>산출</th>
      <th>GROUP_ID</th>
      <th>품명</th>
      <th>표면처리사양</th>
      <th>① 시료수</th>
      <th>② 시료당 표면적</th>
      <th>③ 가열 전 시료무게</th>
      <th>④ 가열 후 시료무게</th>
      <th>점도</th>
      <th>조치사항</th>
    </tr>
  </thead>
  <tbody>
          <tr data-row-id="1">
            <td>PLUS_1 <input class="mch_name_cell" type="hidden" name="mch_name" value="PLUS_1"></td>
            <td><input type="text" name="part_no" id="part_no_5_1"></td>
            <td><input type="text" name="part_name" id="part_name_5_1"></td>
            <td><input type="text" name="spec" id="spec_5_1"></td>
            <td><input type="number" name="count" id="count_5_1"></td>
            <td><input type="number" name="surface" id="surface_5_1"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
          <tr data-row-id="2">
            <td>PLUS_2 <input class="mch_name_cell" type="hidden" name="mch_name" value="PLUS_2"></td>
            <td><input type="text" name="part_no" id="part_no_5_2"></td>
            <td><input type="text" name="part_name" id="part_name_5_2"></td>
            <td><input type="text" name="spec" id="spec_5_2"></td>
            <td><input type="number" name="count" id="count_5_2"></td>
            <td><input type="number" name="surface" id="surface_5_2"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
  </tbody>
</table>
		<div class="view">
            <div id="StandardDataTableTurbidity"></div>
        </div>
            <button type="submit" id="saveTurbidity">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>











<div id="modalContainer4" class="modal">
<div class="modal-content" style="max-width: 1400px; max-height: 1400px; overflow-y: auto;">

        <span class="close">&times;</span>
     
        <form id="attachmentForm" autocomplete="off">
<!-- 지오메트 부착량 테스트 -->
<h3>4. 지오메트 부착량테스트</h3>
      <input type="text" name="date" id="daySet4" class="daySet" placeholder="날짜 선택"
             style="text-align: left; width: 120px; margin-left: 5%;">
<p>Spec.200(mg/dm²)↑</p>
<table class="attachment-table" border="1" cellspacing="0" cellpadding="5" style="width:100%; text-align:center; border-collapse:collapse;">
  <thead>
    <tr>
      <th>산출</th>
      <th>GROUP_ID</th>
      <th>품명</th>
      <th>표면처리사양</th>
      <th>① 시료수</th>
      <th>② 시료당 표면적</th>
      <th>③ 가열 전 시료무게</th>
      <th>④ 가열 후 시료무게</th>
      <th>점도</th>
      <th>조치사항</th>
<!--       <th>⑤ 총표면적 (③*④)</th>
      <th>⑥ (① - ②)</th>
      <th>⑦ (⑥ / ⑤) * 1000</th> 
      <th>합부판정</th>-->
    </tr>
  </thead>
  <tbody>
          <tr>
            <td>G600_1 <input type="hidden" name="mch_name" value="G600_1"></td>
            <td><input type="text" name="part_no" id="group_id_1"></td>
            <td><input type="text" name="part_name" id="part_name_1"></td>
            <td><input type="text" name="spec" id="spec_1"></td>
            <td><input type="number" name="count" id="count_1"></td>
            <td><input type="number" name="surface" id="surface_1"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
                    <tr>
            <td>G600_2 <input type="hidden" name="mch_name" value="G600_2"></td>
            <td><input type="text" name="part_no" id="group_id_2"></td>
            <td><input type="text" name="part_name" id="part_name_2"></td>
            <td><input type="text" name="spec" id="spec_2"></td>
            <td><input type="number" name="count" id="count_2"></td>
            <td><input type="number" name="surface" id="surface_2"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
                    <tr>
            <td>G600_3 <input type="hidden" name="mch_name" value="G600_3"></td>
            <td><input type="text" name="part_no" id="group_id_3"></td>
            <td><input type="text" name="part_name" id="part_name_3"></td>
            <td><input type="text" name="spec" id="spec_3"></td>
            <td><input type="number" name="count" id="count_3"></td>
            <td><input type="number" name="surface" id="surface_3"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
                    <tr>
            <td>G800_1 <input type="hidden" name="mch_name" value="G800_1"></td>
            <td><input type="text" name="part_no" id="group_id_4"></td>
            <td><input type="text" name="part_name" id="part_name_4"></td>
            <td><input type="text" name="spec" id="spec_4"></td>
            <td><input type="number" name="count" id="count_4"></td>
            <td><input type="number" name="surface" id="surface_4"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
                    <tr>
            <td>G800_2 <input type="hidden" name="mch_name" value="G800_2"></td>
            <td><input type="text" name="part_no" id="group_id_5"></td>
            <td><input type="text" name="part_name" id="part_name_5"></td>
            <td><input type="text" name="spec" id="spec_5"></td>
            <td><input type="number" name="count" id="count_5"></td>
            <td><input type="number" name="surface" id="surface_5"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
                    <tr>
            <td>G800_3 <input type="hidden" name="mch_name" value="G800_3"></td>
            <td><input type="text" name="part_no" id="group_id_6"></td>
            <td><input type="text" name="part_name" id="part_name_6"></td>
            <td><input type="text" name="spec" id="spec_6"></td>
            <td><input type="number" name="count" id="count_6"></td>
            <td><input type="number" name="surface" id="surface_6"></td>
            <td><input type="number" name="before_weight"></td>
            <td><input type="number" name="after_weight"></td>
            <td><input type="number" name="viscosity"></td>
            <td><input type="text" name="action"></td>
          </tr>
<!--    <tr>
     <tr style="background-color:#d8c7e6;">
      <td>분석 결과 (합/부) 판정</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr> 
    <tr>
      <td>조치사항</td>
      <td><input type="text" name="g600_1_action"></td>
      <td><input type="text" name="g600_2_action"></td>
      <td><input type="text" name="g600_3_action"></td>
       <td><input type="text" name="g800_1_action"></td>
       <td><input type="text" name="g800_2_action"></td>
      <td><input type="text" name="g800_3_action"></td>
    </tr>
    -->
  </tbody>
</table>
		<div class="view">
            <div id="StandardDataTableAttachment"></div>
        </div>
            <button type="submit" id="saveAttachment">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>





<div id="modalContainer7" class="modal">
<div class="modal-content" style="max-width: 1450px; max-height: 800px; overflow-y: auto;">
<span class="close">&times;</span>

    <form id="sstForm" autocomplete="off">
      <h3>S.S.T(염수분무시험기 테스트, 2회/주)</h3>

      <table class="sst-table" border="1" cellspacing="0" cellpadding="5" style="width:100%; border-collapse: collapse; text-align:center;">
        <thead>
          <tr>
            <th rowspan="2">시료위치</th>
            <th colspan="6">S.S.T(염수분무시험기 테스트) Spec. 1,000hr.</th>
          </tr>
          <tr>
            <th>GROUP_ID</th>
            <th>품명</th>
            <th>표면처리사양</th>
            <th>투입일</th>
            <th>종료일</th>
            <th>합격 / 불합격</th>
            <th>파일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="text" name="sample"></td>
            <td><input type="text" name="part_no"></td>
            <td><input type="text" name="part_name"></td>
            <td><input type="text" name="spec"></td>
            <td><input type="datetime-local" name="start_date" id="sstStartDate"></td>
            <td><input type="datetime-local" name="end_date" id="sstEndDate"></td>
            <td>
              <select name="result">
                <option value="">선택</option>
                <option value="합격">합격</option>
                <option value="불합격">불합격</option>
              </select>
            </td>
          <td><input type="file" name="file" id="sstFile"></td>
          </tr>
        </tbody>
      </table>
		<div class="view">
            <div id="StandardDataTableSst"></div>
        </div>
      <button type="submit" id="saveSst">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>



<div id="modalContainer2" class="modal">
<div class="modal-content" style="max-width: 1450px; max-height: 800px; overflow-y: auto;">
  <span class="close">&times;</span>

    <form id="cctForm" autocomplete="off">
      <h3>C.C.T(2회/주)</h3>

      <table class="cct-table" border="1" cellspacing="0" cellpadding="5" style="width:100%; border-collapse: collapse; text-align:center;">
        <thead>
          <tr>
            <th rowspan="2">시료위치</th>
            <th colspan="6">C.C.T(염수분무시험기 테스트) Spec.40Cycle</th>
          </tr>
          <tr>
            <th>GROUP_ID</th>
            <th>품명</th>
            <th>표면처리사양</th>
            <th>투입일</th>
            <th>종료일</th>
            <th>합격 / 불합격</th>
            <th>파일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="text" name="sample"></td>
            <td><input type="text" name="part_no"></td>
            <td><input type="text" name="part_name"></td>
            <td><input type="text" name="spec"></td>
            <td><input type="datetime-local" name="start_date" id="cctStartDate"></td>
            <td><input type="datetime-local" name="end_date" id="cctEndDate"></td>
            <td>
              <select name="result">
                <option value="">선택</option>
                <option value="pass">합격</option>
                <option value="fail">불합격</option>
              </select>
            </td>
            <td><input type="file" name="file" id="cctFile"></td>
          </tr>
        </tbody>
      </table>
		    <div class="view">
            <div id="StandardDataTable"></div>
        </div>
      <button type="submit" id="saveCct">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>
<div class="cleanText">세척1,2호기 가성소다용액 농도</div>
		<div class="view">
		    <div id="dataList1" style="margin-top:100px;"></div>
		</div>
<div class="geometText">지오메트 가열잔분 탱크액</div>
        <div class="view">
            <div id="dataList3"></div>
        </div>
        <div class="geometText">지오메트 부착량</div>
        <div class="view">
            <div id="attachmentTable" class="attachmentTableClass"></div>
        </div>
        <div class="geometText">지오메트 후처리 부착량</div>
        <div class="view">
            <div id="turbidityTable" class="turbidityTableClass"></div>
        </div>
        <div class="geometText">SST 시험성적서</div>
        <div class="view">
        <div id="sstTable"></div>
        </div>
        <div class="geometText">CCT 시험성적서</div>
        <div class="view">
            <div id="cctTable"></div>
        </div>
<div id="viewerModal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100%; height:100%; overflow:auto; background-color: rgba(0,0,0,0.4);">
    <div style="background-color: #fefefe; margin: 5% auto; padding: 20px; border: 1px solid #888; width: 80%; height: 80%;">
        <span id="closeViewerModalBtn" style="color: #aaa; float: right; font-size: 28px; font-weight: bold; cursor: pointer;">&times;</span>
        <h2 id="viewerModalTitle"></h2>
        
        <div id="viewerContent" style="width: 100%; height: calc(100% - 60px); display: flex; justify-content: center; align-items: center;">
            <iframe id="pdfViewer" style="width: 100%; height: 100%;" frameborder="0"></iframe>
            <img id="imageViewer" style="max-width: 100%; max-height: 100%; object-fit: contain; display: none;" alt="미리보기 이미지">
        </div>
    </div>
</div>
	</main>
	<script>
	//전역변수
let now_page_code = "d02";
let dataTable1; // Tabulator 전역 변수
let dataTable3;
let clicked;	//클릭 했는지 확인용

//날짜, 시간 변환
function formatToDatetimeLocal(date) {
const year = date.getFullYear();
const month = String(date.getMonth() + 1).padStart(2, '0');
const day = String(date.getDate()).padStart(2, '0');
const hours = String(date.getHours()).padStart(2, '0');
const minutes = String(date.getMinutes()).padStart(2, '0');

return year + "-" + month + "-" + day + "T" + hours + ":" + minutes;
}

//시작 시간이 변경될 때 종료 시간을 1000시간 후로 설정하는 함수
function setEndDateAfter1000Hours() {
const startDateInput = document.getElementById('sstStartDate');
const endDateInput = document.getElementById('sstEndDate');
const startDateValue = startDateInput.value;

// 시작 날짜/시간이 선택되지 않은 경우 종료 날짜를 비웁니다.
if (!startDateValue) {
endDateInput.value = '';
return;
}

// 1. 선택된 시작 날짜/시간 값으로 Date 객체를 생성합니다.
const startDate = new Date(startDateValue);

// 2. 1000시간을 밀리초로 변환합니다. (1000시간 * 60분 * 60초 * 1000밀리초)
const millisecondsToAdd = 1000 * 60 * 60 * 1000;

// 3. 시작 시간에 1000시간을 더하여 새로운 종료 날짜 객체를 생성합니다.
const endDate = new Date(startDate.getTime() + millisecondsToAdd);

// 4. 종료 날짜 입력 필드에 포맷된 값을 설정합니다.
endDateInput.value = formatToDatetimeLocal(endDate);
}

//20일 뒤 세팅
function setEndDateAfter20days() {
const startDateInput = document.getElementById('cctStartDate');
const endDateInput = document.getElementById('cctEndDate');
const startDateValue = startDateInput.value;

// 시작 날짜/시간이 선택되지 않은 경우 종료 날짜를 비웁니다.
if (!startDateValue) {
endDateInput.value = '';
return;
}

// 1. 선택된 시작 날짜/시간 값으로 Date 객체를 생성합니다.
const startDate = new Date(startDateValue);

// 2. 20일을 밀리초로 변환합니다. (20일 * 24시간 * 60분 * 60초 * 1000밀리초)
const millisecondsToAdd = 20 * 24 * 60 * 60 * 1000;

// 3. 시작 시간에 1000시간을 더하여 새로운 종료 날짜 객체를 생성합니다.
const endDate = new Date(startDate.getTime() + millisecondsToAdd);
console.log("endDate: ", endDate);

// 4. 종료 날짜 입력 필드에 포맷된 값을 설정합니다.
endDateInput.value = formatToDatetimeLocal(endDate);
}
const startDateInput = document.getElementById('sstStartDate');
const cctStartDateInput = document.getElementById('cctStartDate');
	//로드
	$(function(){
		$(".headerP").text("품질관리 - 내식성 테스트");
	    // 오늘 날짜 구하기
	    const today = new Date().toISOString().split('T')[0];

	    // input에 오늘 날짜 기본 세팅
	    $('#startDate').val(today);
	    $('#endDate').val(today);
	    const endDate = $('#startDate').val();

	    // Tabulator 테이블 초기 생성
	    //initDataTable();

	    // 페이지 로드 시 데이터 조회
	    getDataList(today, endDate);

	    // 조회 버튼 클릭 시
	    $('.select-button').click(function() {
	        const selectedDate = $('#startDate').val();
	        const endDate = $('#endDate').val();
	        getDataList(selectedDate, endDate);
	    });

	    //후처리 부착량 설비명 선택시
	    $('#itemSelectBox').on('change', function() {
	        const selectedMch = $(this).val(); // 선택된 설비명 (예: "ML")
	        const $table = $('.turbidity-table'); // 대상 테이블

	        if (!selectedMch) {
	            return;
	        }

	        // 1번 행 업데이트
	        // 테이블의 첫 번째 <tr>를 찾습니다. (설비명만 변경할 때는 첫 번째 행/두 번째 행으로 찾는 것이 가장 간단합니다)
	        const $row1 = $table.find('tbody tr').eq(0);
	        const newMchName1 = selectedMch + '_1';
	        const $td1 = $row1.find('td:first');

	     // 1. <td> 내의 텍스트 노드만 변경 (보여지는 값)
	        // <td>의 모든 자식 노드 중 텍스트 노드(nodeType === 3)만 찾아 텍스트를 변경합니다.
	        $td1.contents().filter(function() {
	            return this.nodeType === 3; // 텍스트 노드만 필터링
	        }).first().replaceWith(newMchName1 + ' '); // 기존 텍스트를 새 텍스트로 대체 (뒤에 공백 추가)

	        // 2. hidden input의 value 변경 (전송되는 값)
	        $td1.find('input[name="mch_name"]').val(newMchName1);


	        // 2번 행 업데이트
	        // 테이블의 두 번째 <tr>를 찾습니다.
	        const $row2 = $table.find('tbody tr').eq(1);
	        const newMchName2 = selectedMch + '_2';
	        const $td2 = $row2.find('td:first');

	     	// 1. <td> 내의 텍스트 노드만 변경 (보여지는 값)
	        $td2.contents().filter(function() {
	            return this.nodeType === 3;
	        }).first().replaceWith(newMchName2 + ' ');
	        
	        // 2. hidden input의 value 변경 (전송되는 값)
	        $td2.find('input[name="mch_name"]').val(newMchName2);
	        
	        // 💡 참고: 설비명이 변경되면 GROUP_ID, 품명, 사양 입력 필드도 비워주는 것이 좋습니다.
	        $row1.find('input[name="part_no"], input[name="part_name"], input[name="spec"]').val('');
	        $row2.find('input[name="part_no"], input[name="part_name"], input[name="spec"]').val('');

	    });

	    //지오메트 부착량 테스트 GROUP_ID 값 변경 시
	    $("#group_id_1").on("change", handlePartNoChange);
	    $("#group_id_2").on("change", handlePartNoChange);
	    $("#group_id_3").on("change", handlePartNoChange);
	    $("#group_id_4").on("change", handlePartNoChange);
	    $("#group_id_5").on("change", handlePartNoChange);
	    $("#group_id_6").on("change", handlePartNoChange);
	    
	    function handlePartNoChange() {
	        // 1. part_no 필드의 현재 값 (group_id)을 가져옵니다.
	        const $currentInput = $(this);
	        const currentId = $currentInput.attr('id');
	        const index = currentId.substring(currentId.lastIndexOf('_') + 1);

	        const partNameSelector = "#part_name_" + index;
	        const specSelector = "#spec_" + index;
	        const countSelector = "#count_" + index;
	        const surfaceSelector = "#surface_" + index;

	        var partNo = $currentInput.val();
	        console.log("선택한 group_id: ", partNo);
	        // 값이 비어있으면 조회를 하지 않고 리셋합니다.
			if (!partNo || partNo.trim() === "") {
			        $(partNameSelector).val("");
			        $(specSelector).val("");
			        $(countSelector).val("");
			        $(surfaceSelector).val("");
			        return;
			    }
	        $.ajax({
	            url: "/geomet/quality/getStandardList", 
	            type: "POST",
	            dataType: "json",
	            data: {
	                // group_id 파라미터에 partNo 값을 전송
	                group_id: partNo,
	                item_cd: "",
	                item_nm: "",
	                coating_nm: ""
	            },
	            success: function (data) {
	                if (data.status === "success" && data.data && data.data.length > 0) {
	                    // 3. 데이터 조회 성공: 가장 첫 번째 결과를 사용합니다.
	                    var standardInfo = data.data[0]; 
	                    
	                    $(partNameSelector).val(standardInfo.item_nm || "");
	                    $(specSelector).val(standardInfo.coating_nm || "");
	                    $(countSelector).val(standardInfo.sample_f || "");
	                    $(surfaceSelector).val(standardInfo.area_g || "");
	                    
	                } else {
	                    // 데이터가 없거나 조회 실패 시 필드를 비웁니다.
						$(partNameSelector).val("");
		                $(specSelector).val("");
						$(countSelector).val("");
		                $(surfaceSelector).val("");
	                    alert("일치하는 기준 정보를 찾을 수 없습니다.");
	                }
	            },
	            error: function (xhr, status, error) {
	            	$(partNameSelector).val("");
	                $(specSelector).val("");
					$(countSelector).val("");
	                $(surfaceSelector).val("");
	                console.error("데이터 조회 중 오류 발생:", status, error);
	                alert("기준 정보 조회 중 오류가 발생했습니다.");
	            }
	        });
	    }

	    $("#part_no_5_1").on("change", handlePartNoChange2);
	    $("#part_no_5_2").on("change", handlePartNoChange2);
	    function handlePartNoChange2() {
	        // 1. part_no 필드의 현재 값 (group_id)을 가져옵니다.
	        const $currentInput = $(this);
	        const currentId = $currentInput.attr('id');
	        const index = currentId.substring(currentId.lastIndexOf('_') + 1);

	        const partNameSelector = "#part_name_5_" + index;
	        const specSelector = "#spec_5_" + index;
	        const countSelector = "#count_5_" + index;
	        const surfaceSelector = "#surface_5_" + index;

	        var partNo = $currentInput.val();
	        console.log("선택한 group_id: ", partNo);
	        // 값이 비어있으면 조회를 하지 않고 리셋합니다.
			if (!partNo || partNo.trim() === "") {
			        $(partNameSelector).val("");
			        $(specSelector).val("");
			        return;
			    }
	        $.ajax({
	            url: "/geomet/quality/getStandardList", 
	            type: "POST",
	            dataType: "json",
	            data: {
	                // group_id 파라미터에 partNo 값을 전송
	                group_id: partNo,
	                item_cd: "",
	                item_nm: "",
	                coating_nm: ""
	            },
	            success: function (data) {
	                if (data.status === "success" && data.data && data.data.length > 0) {
	                    // 3. 데이터 조회 성공: 가장 첫 번째 결과를 사용합니다.
	                    var standardInfo = data.data[0]; 
	                    
	                    $(partNameSelector).val(standardInfo.item_nm || "");
	                    $(specSelector).val(standardInfo.coating_nm || "");
	                    $(countSelector).val(standardInfo.sample_f || "");
	                    $(surfaceSelector).val(standardInfo.area_g || "");
	                    
	                } else {
	                    // 데이터가 없거나 조회 실패 시 필드를 비웁니다.
						$(partNameSelector).val("");
		                $(specSelector).val("");
						$(countSelector).val("");
		                $(surfaceSelector).val("");
	                    alert("일치하는 기준 정보를 찾을 수 없습니다.");
	                }
	            },
	            error: function (xhr, status, error) {
	            	$(partNameSelector).val("");
	                $(specSelector).val("");
					$(countSelector).val("");
	                $(surfaceSelector).val("");
	                console.error("데이터 조회 중 오류 발생:", status, error);
	                alert("기준 정보 조회 중 오류가 발생했습니다.");
	            }
	        });
	    }


// 사용자가 날짜/시간을 변경할 때마다 함수가 실행되도록 연결
if (startDateInput) {
    startDateInput.addEventListener('change', setEndDateAfter1000Hours);
    
    // (선택 사항) 페이지 로드 시 시작 날짜가 이미 있다면 한 번 실행하여 종료 날짜를 미리 설정합니다.
    setEndDateAfter1000Hours(); 
}
if (cctStartDateInput) {
	cctStartDateInput.addEventListener('change', setEndDateAfter20days);
    
    // (선택 사항) 페이지 로드 시 시작 날짜가 이미 있다면 한 번 실행하여 종료 날짜를 미리 설정합니다.
    setEndDateAfter1000Hours(); 
}
		
	});
	  $(".btn").on("click", function () {
		    window.location.href = "/geomet/quality/medicineStandard";
		  });
	  $(document).ready(function () {
		    // 페이지 로딩 시 데이터 불러오기

		    const today = new Date().toISOString().split('T')[0];
		    const todayTime = new Date().toISOString().split('T')[0] + 'T00:00';
		    $('#startDate').val(today);
		    $('#endDate').val(today);



		    //getDataList();
		    
		    // 1번모달 열기
		    $(".insert-button_1").click(function () {
		    	$('#corrForm1')[0].reset();
		    	$('#daySet1').val(new Date().toISOString().split('T')[0]);
		        let modal = $("#modalContainer1");
		        modal.show();
		        modal.addClass("show");
		    });

		    // 1번모달 열기
		    $(".insert-button_5").click(function () {
		    	$('#turbidityForm')[0].reset();
		    	$('#daySet5').val(new Date().toISOString().split('T')[0]);
		    	initDataTable();
		    	loadStandardDataTurbidity();
		        let modal = $("#modalContainer5");
		        modal.show();
		        modal.addClass("show");
		    });
		    
		    // 3번모달 열기
		    $(".insert-button_3").click(function () {
		    	$('#corrForm')[0].reset();
			    $('#daySet2').val(new Date().toISOString().split('T')[0]);
		        let modal = $("#modalContainer3");
		        modal.show();
		        modal.addClass("show");
		    });



		    $(".insert-button_4").click(function () {
		    	$('#attachmentForm')[0].reset();
		    	$('#daySet4').val(new Date().toISOString().split('T')[0]);
		    	initDataTable();
		    	loadStandardDataAttachment();
		        let modal = $("#modalContainer4");
		        modal.show();
		        modal.addClass("show");
		    });

/* 
		    $(".insert-button_5").click(function () {
		    	$('#corrForm')[0].reset();
		        let modal = $("#modalContainer5");
		        modal.show();
		        modal.addClass("show");
		    }); */


		    $(".insert-button_6").click(function () {
		    	$('#corrForm')[0].reset();
		        let modal = $("#modalContainer4");
		        modal.show();
		        modal.addClass("show");
		    });

		    $(".insert-button_2").click(function () {
		    	$('#cctForm')[0].reset();
		    	initDataTable();
		    	loadStandardDataCct();
		        let modal = $("#modalContainer2");
		        $('input[name="start_date"]').val(todayTime);
		    	setEndDateAfter20days(); 
		        modal.show();
		        modal.addClass("show");
		    });
		    $(".insert-button_7").click(function () {
		    	$('#sstForm')[0].reset();
		    	initDataTable();
		    	loadStandardDataSst();
		        let modal = $("#modalContainer7");
		        $('input[name="start_date"]').val(todayTime);
		    	setEndDateAfter1000Hours(); 
		        modal.show();
		        modal.addClass("show");
		    });
		    
	          // 모달 닫기
	          $(".close, #closeModal").click(function () {
	              $("#modalContainer1").removeClass("show").hide();
	              $("#modalContainer2").removeClass("show").hide();
	              $("#modalContainer3").removeClass("show").hide();
	              $("#modalContainer4").removeClass("show").hide();
	              $("#modalContainer5").removeClass("show").hide();
	              $("#modalContainer6").removeClass("show").hide();
	              $("#modalContainer7").removeClass("show").hide();
	              $("#modalContainer").removeClass("show").hide();
	              
	          });
		    // 설비명 선택 시 로그
		    $("#equipment_name").on("change", function () {
		        console.log("선택된 설비명:", $(this).val());
		    });

		    // 검색 버튼 클릭 시 데이터 다시 불러오기
		    $(".select-button").click(function () {
		        const equipmentName = $("#equipment_name").val() || "";
		        const startDate = $("#startDate").val() || "";
		        const endDate = $("#endDate").val() || "";

		        console.log("검색 요청 값 =>", {
		            equipment_name: equipmentName,
		            startDate: startDate,
		            endDate: endDate
		        });

		        dataTable1.setData("/geomet/quality/testTank/list", {
		           // equipment_name: equipmentName,
		            date: startDate,
		            endDate: endDate,
		        });
		        dataTable3.setData("/geomet/quality/testTank/list", {
			           // equipment_name: equipmentName,
			            date: startDate,
			            endDate: endDate,
			        });
		    });

		    // 저장 버튼 클릭 시
		    $("#saveCorrStatus").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".tank-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;
		        const baseDelay = 200;
		        let sentRequests = 0;          
		        let completedRequests = 0;  

		        rows.each(function(index, row) {
		            const formData = new FormData();
		            const $row = $(row);

		            // 숨겨진 필드에서 설비 이름(mch_name) 가져오기
		            const mch_name = $row.find("input[name='mch_name']").val();
		            
		            // 각 행의 입력 필드에서 데이터 가져오기
		            const hafter_1 = $row.find("input[name='hafter_1']").val();
		            const empty_2 = $row.find("input[name='empty_2']").val();
		            const hbefore_3 = $row.find("input[name='hbefore_3']").val();
		            const action = $row.find("input[name='action']").val();
		            const min_spec = $row.find("input[name='min_spec']").val();
		            const max_spec = $row.find("input[name='max_spec']").val();

		            // 폼 데이터에 값 추가
		            formData.append("date", $("#corrForm .daySet").val());
		            formData.append("mch_name", mch_name);
		            formData.append("hafter_1", hafter_1);
		            formData.append("empty_2", empty_2);
		            formData.append("hbefore_3", hbefore_3);
		            formData.append("action", action);
		            formData.append("min_spec", min_spec);
		            formData.append("max_spec", max_spec);

		            // 파일 데이터 추가 (모든 요청에 동일하게 포함)
		            const fileInput = $("#fileInput3")[0].files[0];
		            console.log("fileInput: ", fileInput);
		            if (fileInput) {
		                formData.append("uploadFile", fileInput);
		            }
		            formData.append("t_url", $("#fileName").val());
		            
		            // 데이터가 모두 비어있지 않은 경우에만 요청 보내기
		            if (hafter_1 || empty_2 || hbefore_3 || action) {
		            	sentRequests++;
		            	const delay = index * baseDelay;
		            	setTimeout(function() {
		                $.ajax({
		                    url: "/geomet/quality/testTank/insert",
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
		                    	completedRequests++;
		                    	if(completedRequests === sentRequests){
		                            alert("저장 완료되었습니다.");
		                            $("#modalContainer3").hide();
		                            getDataList();
		                    	}
		                    } 
		                });
		            	},delay);
		            }
		        });
		    });

		    //지오메트 부착량 저장버튼 클릭시
		    	$("#saveAttachment").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".attachment-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;

		        rows.each(function(index, row) {
		            const formData = new FormData();
		            const $row = $(row);

		            // 숨겨진 필드에서 설비 이름(mch_name) 가져오기
		            const mch_name = $row.find("input[name='mch_name']").val();
		            
		            // 각 행의 입력 필드에서 데이터 가져오기
		            const before_weight = $row.find("input[name='before_weight']").val();
		            const after_weight = $row.find("input[name='after_weight']").val();
		            const count = $row.find("input[name='count']").val();
		            const surface = $row.find("input[name='surface']").val();
		            const viscosity = $row.find("input[name='viscosity']").val();
		            const action = $row.find("input[name='action']").val();
		            const group_id = $row.find("input[name='part_no']").val();
		            const part_name = $row.find("input[name='part_name']").val();
		            const spec = $row.find("input[name='spec']").val();

		            // 폼 데이터에 값 추가
		            formData.append("date", $("#attachmentForm .daySet").val());
		            formData.append("mch_name", mch_name);
		            formData.append("before_weight", before_weight);
		            formData.append("after_weight", after_weight);
		            formData.append("count", count);
		            formData.append("surface", surface);
		            formData.append("viscosity", viscosity);
		            formData.append("action", action);
		            formData.append("group_id", group_id);
		            formData.append("part_name", part_name);
		            formData.append("spec", spec);

		            // 파일 데이터 추가 (모든 요청에 동일하게 포함)
		            const fileInput = $("#fileInput3")[0].files[0];
		            console.log("fileInput: ", fileInput);
		            if (fileInput) {
		                formData.append("uploadFile", fileInput);
		            }
		            formData.append("t_url", $("#fileName").val());
		            
		                $.ajax({
		                    url: "/geomet/quality/testTank/insertAttachment",
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
		                            $("#modalContainer4").hide();
		                            getDataList();
		                        }
		                    } 
		                });
		        });
		    });

			    //지오메트 후처리 부착량 저장버튼 클릭시
		    	$("#saveTurbidity").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".turbidity-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;

		        rows.each(function(index, row) {
		            const formData = new FormData();
		            const $row = $(row);

		            // 숨겨진 필드에서 설비 이름(mch_name) 가져오기
		            const mch_name = $row.find("input[name='mch_name']").val();
		            
		            // 각 행의 입력 필드에서 데이터 가져오기
		            const group_id = $row.find("input[name='part_no']").val();
		            const part_name = $row.find("input[name='part_name']").val();
		            const spec = $row.find("input[name='spec']").val();
		            const before_weight = $row.find("input[name='before_weight']").val();
		            const after_weight = $row.find("input[name='after_weight']").val();
		            const count = $row.find("input[name='count']").val();
		            const surface = $row.find("input[name='surface']").val();
		            const viscosity = $row.find("input[name='viscosity']").val();
		            const action = $row.find("input[name='action']").val();

		            // 폼 데이터에 값 추가
		            formData.append("date", $("#turbidityForm .daySet").val());
		            formData.append("group_id", group_id);
		            formData.append("part_name", part_name);
		            formData.append("spec", spec);
		            formData.append("mch_name", mch_name);
		            formData.append("before_weight", before_weight);
		            formData.append("after_weight", after_weight);
		            formData.append("count", count);
		            formData.append("surface", surface);
		            formData.append("viscosity", viscosity);
		            formData.append("action", action);

		            // 파일 데이터 추가 (모든 요청에 동일하게 포함)
		            const fileInput = $("#fileInput3")[0].files[0];
		            console.log("fileInput: ", fileInput);
		            if (fileInput) {
		                formData.append("uploadFile", fileInput);
		            }
		            formData.append("t_url", $("#fileName").val());
		            
		                $.ajax({
		                    url: "/geomet/quality/testTank/insertAttachment",
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
		                            $("#modalContainer5").hide();
		                            getDataList();
		                        }
		                    } 
		                });
		        });
		    });

		    //cct 저장버튼 클릭 시
		    	$("#saveCct").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".cct-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;

		        rows.each(function(index, row) {
		            const formData = new FormData();
		            const $row = $(row);

		            // 숨겨진 필드에서 설비 이름(mch_name) 가져오기
		            const sample = $row.find("input[name='sample']").val();
		            
		            // 각 행의 입력 필드에서 데이터 가져오기
		            const part_no = $row.find("input[name='part_no']").val();
		            const part_name = $row.find("input[name='part_name']").val();
		            const spec = $row.find("input[name='spec']").val();
		            const start_date = $row.find("input[name='start_date']").val();
		            const end_date = $row.find("input[name='end_date']").val();
		            const result = $row.find("select[name='result']").val();

		            // 폼 데이터에 값 추가
		            formData.append("sample", sample);
		            formData.append("part_no", part_no);
		            formData.append("part_name", part_name);
		            formData.append("spec", spec);
		            formData.append("start_date", start_date);
		            formData.append("end_date", end_date);
		            formData.append("result", result);

		            // 파일 데이터 추가 (모든 요청에 동일하게 포함)
		            const fileInput = $("#cctFile")[0].files[0];
		            console.log("fileInput: ", fileInput);
		            if (fileInput) {
		                formData.append("uploadFile", fileInput);
			            console.log("파일 담음");
		            }
		            //formData.append("t_url", $("#fileName").val());
		            
		                $.ajax({
		                    url: "/geomet/quality/testTank/insertCct",
		                    type: "POST",
		                    data: formData,
		                    dataType: "json",
		                    processData: false,
		                    contentType: false,
		                    success: function(response) {
		                    	console.log("서버가 돌려준 result:", response);
		                        if (response === true) {
		                            successfulRequests++;
		                            console.log("데이터 저장 성공");
		                            alert("저장 완료되었습니다.");
		                            getDataList();
		                            $("#modalContainer2").removeClass("show").hide();
		                        } else {
		                            console.error("${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}");
		                        }
		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
		                        console.error("${mch_name} 서버 오류 발생!", textStatus, errorThrown);
		                    }
		                });
		        });
		    });

			    //sst 저장버튼 클릭 시
		    	$("#saveSst").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".sst-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;

		        rows.each(function(index, row) {
		            const formData = new FormData();
		            const $row = $(row);

		            // 숨겨진 필드에서 설비 이름(mch_name) 가져오기
		            const sample = $row.find("input[name='sample']").val();
		            
		            // 각 행의 입력 필드에서 데이터 가져오기
		            const part_no = $row.find("input[name='part_no']").val();
		            const part_name = $row.find("input[name='part_name']").val();
		            const spec = $row.find("input[name='spec']").val();
		            const start_date = $row.find("input[name='start_date']").val();
		            const end_date = $row.find("input[name='end_date']").val();
		            const result = $row.find("select[name='result']").val();

		            // 폼 데이터에 값 추가
		            formData.append("sample", sample);
		            formData.append("part_no", part_no);
		            formData.append("part_name", part_name);
		            formData.append("spec", spec);
		            formData.append("start_date", start_date);
		            formData.append("end_date", end_date);
		            formData.append("result", result);

		            // 파일 데이터 추가 (모든 요청에 동일하게 포함)
		            const fileInput = $("#sstFile")[0].files[0];
		            console.log("fileInput: ", fileInput);
		            if (fileInput) {
		                formData.append("uploadFile", fileInput);
			            console.log("파일 담음");
		            }
		            //formData.append("t_url", $("#fileName").val());
		            
		                $.ajax({
		                    url: "/geomet/quality/testTank/insertSst",
		                    type: "POST",
		                    data: formData,
		                    dataType: "json",
		                    processData: false,
		                    contentType: false,
		                    success: function(response) {
		                    	console.log("서버가 돌려준 result:", response);
		                        if (response === true) {
		                            successfulRequests++;
		                            console.log("데이터 저장 성공");
		                            alert("저장 완료되었습니다.");
		                            getDataList();
		                            $("#modalContainer7").removeClass("show").hide();
		                        } else {
		                            console.error("${mch_name} 데이터 저장 실패: ${response.message || '알 수 없는 오류'}");
		                        }
		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
		                        console.error("${mch_name} 서버 오류 발생!", textStatus, errorThrown);
		                    }
		                });
		        });
		    });

		    // 첫 번째 모달창( 세척1,2호기 가성소다용액) 저장 버튼 클릭 시
		    $("#saveCorrStatus1").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".clean-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;

		        rows.each(function(index, row) {
		            const formData = new FormData();
		            const $row = $(row);

		            // 숨겨진 필드에서 설비 이름(mch_name) 가져오기
		            const mch_name = $row.find("input[name='mch_name']").val();
		            
		            // 각 행의 입력 필드에서 데이터 가져오기
		            const acid_reduce = $row.find("input[name='acid_reduce']").val();
		            const min_spec = $row.find("input[name='min_spec']").val();
		            const max_spec = $row.find("input[name='max_spec']").val();
		            console.log('ㅁㅁㅁㅁ acid_reduce: ', acid_reduce);

		            // 폼 데이터에 값 추가
		            formData.append("date", $("#corrForm1 .daySet").val());
		            formData.append("mch_name", mch_name);
		            formData.append("acid_reduce", acid_reduce);
		            formData.append("min_spec", min_spec);
		            formData.append("max_spec", max_spec);

		            // 파일 데이터 추가 (모든 요청에 동일하게 포함)
		            const fileInput = $("#fileInput")[0].files[0];
		            if (fileInput) {
		                formData.append("uploadFile", fileInput);
		            }
		            formData.append("t_url", $("#fileName").val());
		            
		            // 데이터가 모두 비어있지 않은 경우에만 요청 보내기
		            if (acid_reduce || mch_name) {
		                $.ajax({
		                    url: "/geomet/quality/data1/insert",
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
		            }
		        });
		    });





		    $(".delete-button").click(function(event) {
		        event.preventDefault();

		        console.log("삭제 버튼 클릭됨");
		        var test_num = selectedRow.getData().test_num;
		        console.log("test_num: ", test_num);
		        var sample = selectedRow.getData().sample;
		        console.log("sample: ", sample);
		        var cct_id = selectedRow.getData().cct_id;
		        console.log("cct_id: ", cct_id);
		        var sst_id = selectedRow.getData().sst_id;
		        console.log("sst_id: ", sst_id);
		        var attachment_date = selectedRow.getData().date;
		        console.log("attachment_date: ", attachment_date);
		        var attachment_id = selectedRow.getData().attachment_id;
		        var mch_name = selectedRow.getData().mch_name;
		        console.log("mch_name: ", mch_name);

		        if (!selectedRow) {
		            alert("삭제할 행을 선택하세요.");
		            return;
		        }
		        if(cct_id){
			        var requestData = JSON.stringify({ "cct_id": cct_id });
			        console.log("전송된 데이터:", requestData);

			        $.ajax({
			            url: "/geomet/quality/deleteCct",
			            type: "POST",
			            contentType: "application/json", 
			            data: requestData,
			            dataType: "json",
			            success: function(response) {
			                console.log("행 삭제 성공:", response);
			                alert("삭제 완료되었습니다.");
			                getDataList($("#startDate").val());
			                //dataTable1.setData("/geomet/quality/testTank/list", { date: $("#startDate").val() });

			            },
			            error: function(xhr, status, error) {
			                console.error("삭제 오류:", xhr.responseText);
			                alert("삭제 중 오류가 발생했습니다: " + error);
			            }
			        });
			        } else if(sst_id){
				        var requestData = JSON.stringify({ "sst_id": sst_id });
				        console.log("전송된 데이터:", requestData);

				        $.ajax({
				            url: "/geomet/quality/deleteSst",
				            type: "POST",
				            contentType: "application/json", 
				            data: requestData,
				            dataType: "json",
				            success: function(response) {
				                console.log("행 삭제 성공:", response);
				                alert("삭제 완료되었습니다.");
				                getDataList($("#startDate").val());
				                //dataTable1.setData("/geomet/quality/testTank/list", { date: $("#startDate").val() });

				            },
				            error: function(xhr, status, error) {
				                console.error("삭제 오류:", xhr.responseText);
				                alert("삭제 중 오류가 발생했습니다: " + error);
				            }
				        });
			        }else if(test_num && attachment_date){
				        var requestData = JSON.stringify({ "date": attachment_date, "test_num": test_num });
				        console.log("전송된 데이터:", requestData);

				        $.ajax({
				            url: "/geomet/quality/testTank/delete",
				            type: "POST",
				            contentType: "application/json", 
				            data: requestData,
				            dataType: "json",
				            success: function(response) {
				                console.log("행 삭제 성공:", response);
				                alert("삭제 완료되었습니다.");
				                getDataList($("#startDate").val());
				                //dataTable1.setData("/geomet/quality/testTank/list", { date: $("#startDate").val() });

				            },
				            error: function(xhr, status, error) {
				                console.error("삭제 오류:", xhr.responseText);
				                alert("삭제 중 오류가 발생했습니다: " + error);
				            }
				        });
					  }else if(attachment_id){
				        var requestData = JSON.stringify({ "date": attachment_date, "mch_name": mch_name });
				        console.log("전송된 데이터:", requestData);

				        $.ajax({
				            url: "/geomet/quality/deleteAttachment",
				            type: "POST",
				            contentType: "application/json", 
				            data: requestData,
				            dataType: "json",
				            success: function(response) {
				                console.log("행 삭제 성공:", response);
				                alert("삭제 완료되었습니다.");
				                getDataList($("#startDate").val());
				                //dataTable1.setData("/geomet/quality/testTank/list", { date: $("#startDate").val() });

				            },
				            error: function(xhr, status, error) {
				                console.error("삭제 오류:", xhr.responseText);
				                alert("삭제 중 오류가 발생했습니다: " + error);
				            }
				        });
			        }
		    });


/* 		    $(".excel-button").on("click", function () {
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
		          url: "/geomet/quality/nonProductManage/excel",
		          type: "post",
		          data: {
		              equipment_name: equipmentName,
		              startDate: startDate,
		              endDate: endDate
		          },
		          dataType: "json",
		          success: function (result) {
		              console.log(result);
		              alert("D:\\GEOMET양식\\부적합품 관리 저장 완료되었습니다.");
		          },
		          error: function (xhr, status, error) {
		              alert("엑셀 다운로드 중 오류가 발생했습니다. 다시 시도해주세요.");
		              console.error("Error:", error);
		          }
		      });
		  }); */
		    
		});
	// 데이터 목록 로딩 함수 정의
	  function getDataList() {
		  const dd = $("#startDate").val();
		  const ee = $("#endDate").val();
		  console.log("조회 요청 시작날짜: ", dd);
		  console.log("조회 요청 끝날짜: ", ee);
		  //세척 1,2호기 가성소다용액 농도
	      dataTable1 = new Tabulator("#dataList1", {
	          height: "180px",
	       /*    width: "660px", */
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/quality/testTank/list",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              date: $("#startDate").val() || "",
	              endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              $("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.data1;
	          },
	          columns: [
	              { title: "id", field: "id", visible: false, download: false },
	              { title: "test_num", field: "test_num", visible: false, download: false },
	             
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false, download: false },

	              { title: "날짜", field: "date", width: 100, hozAlign: "center" },
	              { title: "설비", field: "mch_name", width: 70, hozAlign: "center" },
	              { title: "①  0.1N-HCL<br>(염산)소모량", field: "acid_reduce", width: 130, hozAlign: "center",
	            	    formatter: function(cell, formatterParams, onRendered){
	            	        const value = cell.getValue();
	            	        // 값이 유효한 숫자인지 확인
	            	        if (typeof value === "number" && !isNaN(value)) {
	            	            // toLocaleString()으로 천 단위 쉼표 포맷 적용
	            	            return value.toLocaleString();
	            	        } else {
	            	            // 숫자가 아니면 원래 값 반환
	            	            return value;
	            	        }
	            	    }
		               },
	              { title: "② Na-OH농도값<br>(① * 0.8)<br>Spec.30~40g/L)", field: "naoh_density", width: 130, hozAlign: "center",
		            	    formatter: function(cell, formatterParams, onRendered){
		            	        const value = cell.getValue();
		            	        // 값이 유효한 숫자인지 확인
		            	        if (typeof value === "number" && !isNaN(value)) {
		            	            // toLocaleString()으로 천 단위 쉼표 포맷 적용
		            	            return value.toLocaleString();
		            	        } else {
		            	            // 숫자가 아니면 원래 값 반환
		            	            return value;
		            	        }
		            	    }
			 	               },
	              { title: "분석 결과(합, 부) 판정", field: "result", width: 150, hozAlign: "center",
			 	            	  formatter: function(cell, formatterParams, onRender){
				            	        const result = cell.getValue();
				            	        if (result === '합격') {
				            	            return result;
				            	        }else{
				            	        	return "<span style='color: red; font-weight: bold;'>" + result + "</span>";
					            	        }
				            	    }
				 		               },
	              { title: "조치사항", 
	                  columns: [
	                      { title: "(Spec.30~40g/L)<br>Na-OH<br>분석결과(g/L)", field: "naoh_result", hozAlign: "center", headerSort: false, width: 120, visible: false },
	                      { title: "1.0N-HCL<br>소모량(mL)", field: "hcl", hozAlign: "center", headerSort: false, width: 120 },
	                      { 
	                          title: "조 용량<br>(liter)", 
	                          field: "liter", 
	                          width: 130, 
	                          hozAlign: "center", 
	                          headerSort: false,
	                          formatter: "money",          // 숫자 포맷 적용
	                          formatterParams: {
	                              precision: 0,            // 소수점 자리수
	                              thousand: ",",           // 천 단위 구분기호
	                              symbol: ""               // 단위 기호 없앰
	                          }
	                      },

	                      { title: "NaOH 0.5포 단위 투입량",
	          				columns: [
	          		            { title: "NaOH<br>(포)", field: "naoh", width: 110, hozAlign: "center", headerSort: false },
	          		            { title: "SC300A<br>(liter)", field: "sc300a", width: 120, hozAlign: "center", headerSort: false },
	          		            { title: "SC300B<br>(liter)", field: "sc300b", width: 120, hozAlign: "center", headerSort: false },
	          		            { title: "농축액<br>(liter)", field: "condense", width: 110, hozAlign: "center", headerSort: false }
	          					]
	                           },
	                           { title: "투입 후<br>NaOH 농도", field: "after_naoh", width: 100, hozAlign: "center", headerSort: false},
	                           { title: "파일", field: "file_name", width: 160, hozAlign: "center",formatter: "link",
	       	         	        cellClick: function(e, cell){
	    	         	            const rowData = cell.getData();
	    	         	            const fileName = rowData.file_name;
	    	         	            
	    	         	            // 쿼리 파라미터 방식으로 URL 생성
	    	         	            const fileUrl = '/geomet/download/clean12Pdf?fileName=' + encodeURIComponent(fileName);
	    	         	            
	    	         	            // 🚨 파일 확장자를 추출하고 타입 결정
	    	         	            const fileExtension = fileName ? fileName.toLowerCase().split('.').pop() : '';
	    	         	            let viewerFileType = '';

	    	         	            if (fileExtension === 'pdf') {
	    	         	                viewerFileType = 'pdf';
	    	         	            } else if (['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'].includes(fileExtension)) {
	    	         	                viewerFileType = 'image';
	    	         	            }

	    	         	            if (viewerFileType) { // 지원하는 파일 타입인 경우에만 모달 열기
	    	         	                openViewerModal(fileUrl, fileName, viewerFileType); // 파일 타입 전달
	    	         	                e.preventDefault(); 
	    	         	            } else if (fileName) {
	    	         	                 alert("지원하지 않는 미리보기 파일 형식입니다.");
	    	         	                 e.preventDefault(); 
	    	         	            }
	    	         	        }
	    	         	         }
	                  ]
				 	                  }
	          ],
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_test_num = row.getData().test_num;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              dataTable1.getRows().forEach(function(r) {
	                  if (r.getData().test_num === clicked_test_num) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList1 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 test_num?:", clicked_test_num);
	          }
	      });

		  //지오메트 후처리 부착량
	      dataTable3 = new Tabulator("#dataList3", {
	          height: "180px",
	          width: "800px",
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/quality/testTank/list",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              date: $("#startDate").val() || "",
	              endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              $("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.data3;
	          },
	          columns: [
	              { title: "id", field: "id", visible: false, download: false },
	              { title: "test_num", field: "test_num", visible: false, download: false },
	             
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false, download: false },

	              { title: "날짜", field: "date", width: 100, hozAlign: "center" },
	              { title: "설비", field: "mch_name", width: 70, hozAlign: "center" },
	              { title: "① 가열 후의<br>은박접시와 시료무게(Kg)", field: "hafter_1", width: 160, hozAlign: "center",
	            	    formatter: function(cell, formatterParams, onRendered){
	            	        const value = cell.getValue();
	            	        // 값이 유효한 숫자인지 확인
	            	        if (typeof value === "number" && !isNaN(value)) {
	            	            // toLocaleString()으로 천 단위 쉼표 포맷 적용
	            	            return value.toLocaleString();
	            	        } else {
	            	            // 숫자가 아니면 원래 값 반환
	            	            return value;
	            	        }
	            	    }
		               },
	              { title: "② 빈 접시의 무게(Kg)", field: "empty_2", width: 160, hozAlign: "center",
		            	    formatter: function(cell, formatterParams, onRendered){
		            	        const value = cell.getValue();
		            	        // 값이 유효한 숫자인지 확인
		            	        if (typeof value === "number" && !isNaN(value)) {
		            	            // toLocaleString()으로 천 단위 쉼표 포맷 적용
		            	            return value.toLocaleString();
		            	        } else {
		            	            // 숫자가 아니면 원래 값 반환
		            	            return value;
		            	        }
		            	    }
			 	               },
	              { title: "③ 가열 전의<br>은박접시와 시료무게(Kg)", field: "hbefore_3", width: 160, hozAlign: "center",
				            	    formatter: function(cell, formatterParams, onRendered){
				            	        const value = cell.getValue();
				            	        // 값이 유효한 숫자인지 확인
				            	        if (typeof value === "number" && !isNaN(value)) {
				            	            // toLocaleString()으로 천 단위 쉼표 포맷 적용
				            	            return value.toLocaleString();
				            	        } else {
				            	            // 숫자가 아니면 원래 값 반환
				            	            return value;
				            	        }
				            	    }
				 		               },
				 		              { 
				 		            	    title: "④ ((1-2)/3) * 100", 
				 		            	    field: "etc1", 
				 		            	    width: 160, 
				 		            	    hozAlign: "center",
				 		            	    formatter: function(cell) {
				 		            	        let value = cell.getValue();
				 		            	        if (value == null) return "";
				 		            	        return Math.floor(value); // 소수점 제거
				 		            	    }
				 		            	},

	              { title: "분석 결과(합, 부) 판정", field: "etc2", width: 150, hozAlign: "center",
	            	    formatter: function(cell, formatterParams, onRendered){
	            	        const value = cell.getValue();
	            	        if (value === '불합격') {
	            	            return "<span style='color: red; font-weight: bold;'>" + value + "</span>";
	            	        } else {
	            	            return value;
	            	        }
	            	    }
		               },
	              { title: "조치사항", field: "action", width: 300, hozAlign: "center" },
	              { title: "Spec(%)", field: "spec", width: 130, hozAlign: "center" },
                  { title: "파일", field: "file_name", width: 130, hozAlign: "center",formatter: "link",
 	         	        cellClick: function(e, cell){
	         	            const rowData = cell.getData();
	         	            const fileName = rowData.file_name;
	         	            
	         	            // 쿼리 파라미터 방식으로 URL 생성
	         	            const fileUrl = '/geomet/download/tankPdf?fileName=' + encodeURIComponent(fileName);
	         	            
	         	            // 🚨 파일 확장자를 추출하고 타입 결정
	         	            const fileExtension = fileName ? fileName.toLowerCase().split('.').pop() : '';
	         	            let viewerFileType = '';

	         	            if (fileExtension === 'pdf') {
	         	                viewerFileType = 'pdf';
	         	            } else if (['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'].includes(fileExtension)) {
	         	                viewerFileType = 'image';
	         	            }

	         	            if (viewerFileType) { // 지원하는 파일 타입인 경우에만 모달 열기
	         	                openViewerModal(fileUrl, fileName, viewerFileType); // 파일 타입 전달
	         	                e.preventDefault(); 
	         	            } else if (fileName) {
	         	                 alert("지원하지 않는 미리보기 파일 형식입니다.");
	         	                 e.preventDefault(); 
	         	            }
	         	        }
	         	         }
	          ],
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_date = row.getData().date;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              dataTable3.getRows().forEach(function(r) {
	                  if (r.getData().date === clicked_date) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList3 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 clicked_date:", clicked_date);
	          }
	      });

	      //cct 시험성적서 테이블
	      cctTable = new Tabulator("#cctTable", {
	          height: "150px",
	          width: "800px",
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/quality/testTank/list",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              date: $("#startDate").val() || "",
	              endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              //$("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.cctList;
	          },
	          columns: [
	              { title: "cct_id", field: "cct_id", visible: false, download: false },
	              { title: "날짜", field: "regdate", visible: false },
	             
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false },

	              { title: "시료위치", field: "sample", width: 100, hozAlign: "center" },
	              { title: "GROUP_ID", field: "part_no", width: 240, hozAlign: "center" },
	              { title: "품명", field: "part_name", width: 320, hozAlign: "center"},
	              { title: "표면처리사양", field: "spec", width: 250, hozAlign: "center"},
	              { title: "투입일", field: "start_date", width: 170, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const value = cell.getValue(); // 셀의 원본 값 (예: "2025-11-11T09:30")
	            	        
	            	        if (typeof value === 'string' && value.includes('T')) {
	            	            return value.split('T')[0] + " " + value.split('T')[1]; 
	            	        }
	            	        return value;
	            	    }
          	    },
				 { title: "종료일", field: "end_date", width: 170, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const value = cell.getValue(); // 셀의 원본 값 (예: "2025-11-11T09:30")
	            	        
	            	        if (typeof value === 'string' && value.includes('T')) {
	            	            return value.split('T')[0] + " " + value.split('T')[1]; 
	            	        }
	            	        return value;
	            	    }
        	     },
				 { title: "합부판정", field: "result", width: 110, hozAlign: "center",
	            	    formatter: function(cell, formatterParams, onRendered){
	            	        const value = cell.getValue();
	            	        if (value === 'fail') {
	            	            return "<span style='color: red; font-weight: bold;'>" + "불합격" + "</span>";
	            	        } else if(value === "pass"){
	            	            return "합격";
	            	        } else{
		            	        return value;
		            	        }
	            	    }
         	     },
		            {
		                title: "첨부 파일",
		                field: "file_name",
		                hozAlign: "center",
		                width: 140,
		                formatter: "link",
	         	        cellClick: function(e, cell){
	         	            const rowData = cell.getData();
	         	            const fileName = rowData.file_name;
	         	            
	         	            // 쿼리 파라미터 방식으로 URL 생성
	         	            const fileUrl = '/geomet/download/cctPdf?fileName=' + encodeURIComponent(fileName);
	         	            
	         	            // 🚨 파일 확장자를 추출하고 타입 결정
	         	            const fileExtension = fileName ? fileName.toLowerCase().split('.').pop() : '';
	         	            let viewerFileType = '';

	         	            if (fileExtension === 'pdf') {
	         	                viewerFileType = 'pdf';
	         	            } else if (['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'].includes(fileExtension)) {
	         	                viewerFileType = 'image';
	         	            }

	         	            if (viewerFileType) { // 지원하는 파일 타입인 경우에만 모달 열기
	         	                openViewerModal(fileUrl, fileName, viewerFileType); // 파일 타입 전달
	         	                e.preventDefault(); 
	         	            } else if (fileName) {
	         	                 alert("지원하지 않는 미리보기 파일 형식입니다.");
	         	                 e.preventDefault(); 
	         	            }
	         	        }

		            }
	          ] ,
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_test_num = row.getData().test_num;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              dataTable1.getRows().forEach(function(r) {
	                  if (r.getData().test_num === clicked_test_num) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList1 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 test_num?:", clicked_test_num);
	          } 
	      });

	      //sst 시험성적서 테이블
	      sstTable = new Tabulator("#sstTable", {
	          height: "150px",
	          width: "800px",
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/quality/testTank/list",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              date: $("#startDate").val() || "",
	              endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              //$("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.sstList;
	          },
	          columns: [
	              { title: "sst_id", field: "sst_id", visible: false, download: false },
	              { title: "날짜", field: "regdate", visible: false },
	             
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false },

	              { title: "시료위치", field: "sample", width: 100, hozAlign: "center" },
	              { title: "GROUP_ID", field: "part_no", width: 240, hozAlign: "center" },
	              { title: "품명", field: "part_name", width: 320, hozAlign: "center"},
	              { title: "표면처리사양", field: "spec", width: 250, hozAlign: "center"},
	              { title: "투입일", field: "start_date", width: 170, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const value = cell.getValue(); // 셀의 원본 값 (예: "2025-11-11T09:30")
	            	        
	            	        if (typeof value === 'string' && value.includes('T')) {
	            	            return value.split('T')[0] + " " + value.split('T')[1]; 
	            	        }
	            	        return value;
	            	    }
          	    },
				 { title: "종료일", field: "end_date", width: 170, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const value = cell.getValue(); // 셀의 원본 값 (예: "2025-11-11T09:30")
	            	        
	            	        if (typeof value === 'string' && value.includes('T')) {
	            	            return value.split('T')[0] + " " + value.split('T')[1]; 
	            	        }
	            	        return value;
	            	    }
        	     },
				 { title: "합부판정", field: "result", width: 110, hozAlign: "center",
	            	    formatter: function(cell, formatterParams, onRendered){
	            	        const value = cell.getValue();
	            	        if (value === '불합격') {
	            	            return "<span style='color: red; font-weight: bold;'>" + "불합격" + "</span>";
	            	        } else if(value === "합격"){
	            	            return "합격";
	            	        } else{
		            	        return value;
		            	        }
	            	    }
         	     },
         	    { 
         	        title: "첨부 파일", 
         	        field: "file_name", 
         	        hozAlign: "center", 
         	        width: 140,
         	        formatter: "link",
         	        cellClick: function(e, cell){
         	            const rowData = cell.getData();
         	            const fileName = rowData.file_name;
         	            
         	            // 쿼리 파라미터 방식으로 URL 생성
         	            const fileUrl = '/geomet/download/sstPdf?fileName=' + encodeURIComponent(fileName);
         	            
         	            // 🚨 파일 확장자를 추출하고 타입 결정
         	            const fileExtension = fileName ? fileName.toLowerCase().split('.').pop() : '';
         	            let viewerFileType = '';

         	            if (fileExtension === 'pdf') {
         	                viewerFileType = 'pdf';
         	            } else if (['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'].includes(fileExtension)) {
         	                viewerFileType = 'image';
         	            }

         	            if (viewerFileType) { // 지원하는 파일 타입인 경우에만 모달 열기
         	                openViewerModal(fileUrl, fileName, viewerFileType); // 파일 타입 전달
         	                e.preventDefault(); 
         	            } else if (fileName) {
         	                 alert("지원하지 않는 미리보기 파일 형식입니다. (파일명: " + fileName + ")");
         	                 e.preventDefault(); 
         	            }
         	        }
         	    }
	          ] ,
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_test_num = row.getData().test_num;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              dataTable1.getRows().forEach(function(r) {
	                  if (r.getData().test_num === clicked_test_num) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList1 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 test_num?:", clicked_test_num);
	          } 
	      });

	      //지오메트 부착량 테이블
	      attachmentTable = new Tabulator("#attachmentTable", {
	          height: "150px",
	          width: "800px",
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/quality/testTank/list",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              date: $("#startDate").val() || "",
	              endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              //$("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.attachmentList;
	          },
	          columns: [
	              { title: "attachment_id", field: "attachment_id", visible:false, download: false},
	              { title: "date", field: "date", visible: false, download: false },
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false },
	              { title: "날짜", field: "date", width: 150, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const dateValue = cell.getValue();
	            	        if (dateValue && typeof dateValue === 'string') {
	            	            return dateValue.substring(0, 10);
	            	        }
	            	        return dateValue;
	            	    }
          	     },
          	   	  { title: "설비", field: "mch_name", width: 120, hozAlign: "center" },
	              { title: "GROUP_ID", field: "group_id", width: 240, hozAlign: "center" },
	              { title: "품명", field: "part_name", width: 320, hozAlign: "center"},
	              { title: "표면처리사양", field: "spec", width: 250, hozAlign: "center"},
	              { title: "① 시료수", field: "count", width: 140, hozAlign: "center"},
	              { title: "② 시료당 표면적", field: "surface", width: 140, hozAlign: "center"},
	              { title: "③ 가열 전의 시료무게", field: "before_weight", width: 180, hozAlign: "center" },
	              { title: "④ 가열 후의 시료무게", field: "after_weight", width: 180, hozAlign: "center" },
	              { title: "⑤ 총표면적 (③*④)", field: "calc1", width: 150, hozAlign: "center"},
	              { title: "⑥ (① - ②)", field: "calc2", width: 150, hozAlign: "center"},
	              { title: "⑦ (⑥ / ⑤) * 1000", field: "calc3", width: 150, hozAlign: "center"},
	              { title: "합부판정", field: "result", width: 120, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const result = cell.getValue();
	            	        if (result === '합격') {
	            	            return result;
	            	        }else{
	            	        	return "<span style='color: red; font-weight: bold;'>" + result + "</span>";
		            	        }
	            	    }
          	    }
	          ] ,
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_date = row.getData().date;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              attachmentTable.getRows().forEach(function(r) {
	                  if (r.getData().date === clicked_date) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList1 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 clicked_date:", clicked_date);
	          } 
	      });
	      //지오메트 후처리 부착량 테이블
	      turbidityTable = new Tabulator("#turbidityTable", {
	          height: "150px",
	          width: "800px",
	          layout: "fitColumns",
	          selectable: true,
	          columnHeaderVertAlign: "middle",
	          rowVertAlign: "middle",
	          tooltips: true,
	          selectableRangeMode: "click",
	          reactiveData: true,
	          headerHozAlign: "center",
	          ajaxConfig: "POST",
	          ajaxLoader: false,
	          headerSort: false,
	          ajaxURL: "/geomet/quality/testTank/list",
	 
	          ajaxParams: {
	              //equipment_name: $("#equipment_name").val() || "",
	              date: $("#startDate").val() || "",
	              endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              //$("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.turbidityList;
	          },
	          columns: [
	              { title: "attachment_id", field: "attachment_id", visible: false, download: false },
	              { title: "date", field: "date", visible: false, download: false },
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false },
	              { title: "날짜", field: "date", width: 150, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const dateValue = cell.getValue();
	            	        if (dateValue && typeof dateValue === 'string') {
	            	            return dateValue.substring(0, 10);
	            	        }
	            	        return dateValue;
	            	    }
          	     },
          	   	  { title: "설비", field: "mch_name", width: 120, hozAlign: "center" },
	              { title: "GROUP_ID", field: "group_id", width: 240, hozAlign: "center" },
	              { title: "품명", field: "part_name", width: 320, hozAlign: "center"},
	              { title: "표면처리사양", field: "spec", width: 250, hozAlign: "center"},
	              { title: "① 시료수", field: "count", width: 140, hozAlign: "center"},
	              { title: "② 시료당 표면적", field: "surface", width: 140, hozAlign: "center"},
	              { title: "③ 가열 전의 시료무게", field: "before_weight", width: 180, hozAlign: "center" },
	              { title: "④ 가열 후의 시료무게", field: "after_weight", width: 180, hozAlign: "center" },
	              { title: "⑤ 총표면적 (③*④)", field: "calc1", width: 150, hozAlign: "center"},
	              { title: "⑥ (① - ②)", field: "calc2", width: 150, hozAlign: "center"},
	              { title: "⑦ (⑥ / ⑤) * 1000", field: "calc3", width: 150, hozAlign: "center"},
	              { title: "합부판정", field: "result", width: 120, hozAlign: "center",
	            	  formatter: function(cell, formatterParams, onRender){
	            	        const result = cell.getValue();
	            	        if (result === '합격') {
	            	            return result;
	            	        }else{
	            	        	return "<span style='color: red; font-weight: bold;'>" + result + "</span>";
		            	        }
	            	    }
          	    }
	          ] ,
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_date = row.getData().date;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              turbidityTable.getRows().forEach(function(r) {
	                  if (r.getData().date === clicked_date) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList1 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 clicked_date:", clicked_date);
	          } 
	      });
	  }

	//cct 모달창에 기준정보 조회
	  function initDataTable() {
		    StandardDataTable = new Tabulator("#StandardDataTable", {
		        height: "380px",
		        layout: "fitColumns",
		        reactiveData: true,
		        tooltips: true,
		        ajaxLoader: false,
		        paginationSize: 20,
		        placeholder: "조회된 데이터가 없습니다.",
		        columnHeaderVertAlign: "middle",
		        rowVertAlign: "middle",
		        headerHozAlign: "center",
		        columns: [
		            { title: 'NO', formatter: 'rownum', width: 160, hozAlign: 'center' },
		            {
		                title: "GROUP_ID",
		                field: "group_id",
		                sorter: "string",
		                width: 300,
		                hozAlign: "center",
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색", // placeholder
		                headerFilterFunc: "like"         // 포함 검색
		            },
		            {
		                title: "품명",
		                field: "item_nm",
		                sorter: "string",
		                width: 600,
		                headerSort: false,
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색",
		                headerFilterFunc: "like"
		            },
		            { title: "표면처리 사양", field: "coating_nm", sorter: "string", width: 300,  headerSort: false },
		        ],
		        rowClick: function (e, row) {
		        	// 1. 선택된 행의 데이터 가져오기
		            const rowData = row.getData();

		            // 2. Modal/Form 내부의 입력 필드 선택
		            // .cct-table 내부의 입력 필드를 타겟으로 합니다.
		            const $modal = $("#modalContainer2"); 
		            
		            // 3. 값 설정
		            $modal.find("input[name='part_no']").val(rowData.group_id);
		            $modal.find("input[name='part_name']").val(rowData.item_nm);
		            $modal.find("input[name='spec']").val(rowData.coating_nm);
		        },
		        rowDblClick: function (e, row) {
		            const d = row.getData();
		            const $f = $('#corrForm');
		            $f[0].reset();
		            $f.find('input[name="group_id"]').val(d.group_id);
		            $f.find('input[name="item_cd"]').val(d.item_cd);
		            $f.find('input[name="item_nm"]').val(d.item_nm);
		            $f.find('input[name="mach_main"]').val(d.mach_main);
		            $f.find('input[name="mach_main_weight"]').val(d.mach_main_weight);
		            $f.find('input[name="mach_sub"]').val(d.mach_sub);
		            $f.find('input[name="coating_nm"]').val(d.coating_nm);
		            $f.find('input[name="mach_sub_weight"]').val(d.mach_sub_weight);
		            $f.find('input[name="mlpl_weight"]').val(d.mlpl_weight);
		            $f.find('input[name="kblack_weight"]').val(d.kblack_weight);
		            if (d.no !== undefined) {
		                $f.find('input[name="no"]').val(d.no);
		            }
		            $('#modalContainer').show().addClass('show');
		        }
		    });
		    StandardDataTableSst = new Tabulator("#StandardDataTableSst", {
		        height: "380px",
		        layout: "fitColumns",
		        reactiveData: true,
		        tooltips: true,
		        ajaxLoader: false,
		        paginationSize: 20,
		        placeholder: "조회된 데이터가 없습니다.",
		        columnHeaderVertAlign: "middle",
		        rowVertAlign: "middle",
		        headerHozAlign: "center",
		        columns: [
		            { title: 'NO', formatter: 'rownum', width: 160, hozAlign: 'center' },
		            {
		                title: "GROUP_ID",
		                field: "group_id",
		                sorter: "string",
		                width: 300,
		                hozAlign: "center",
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색", // placeholder
		                headerFilterFunc: "like"         // 포함 검색
		            },
		            {
		                title: "품명",
		                field: "item_nm",
		                sorter: "string",
		                width: 600,
		                headerSort: false,
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색",
		                headerFilterFunc: "like"
		            },
		            { title: "표면처리 사양", field: "coating_nm", sorter: "string", width: 300,  headerSort: false },
		        ],
		        rowClick: function (e, row) {
		        	// 1. 선택된 행의 데이터 가져오기
		            const rowData = row.getData();

		            // 2. Modal/Form 내부의 입력 필드 선택
		            const $modal7 = $("#modalContainer7"); 
		            
		            $modal7.find("input[name='part_no']").val(rowData.group_id);
		            $modal7.find("input[name='part_name']").val(rowData.item_nm);
		            $modal7.find("input[name='spec']").val(rowData.coating_nm);
		        },
		        rowDblClick: function (e, row) {
		            const d = row.getData();
		            const $f = $('#corrForm');
		            $f[0].reset();
		            $f.find('input[name="group_id"]').val(d.group_id);
		            $f.find('input[name="item_cd"]').val(d.item_cd);
		            $f.find('input[name="item_nm"]').val(d.item_nm);
		            $f.find('input[name="mach_main"]').val(d.mach_main);
		            $f.find('input[name="mach_main_weight"]').val(d.mach_main_weight);
		            $f.find('input[name="mach_sub"]').val(d.mach_sub);
		            $f.find('input[name="coating_nm"]').val(d.coating_nm);
		            $f.find('input[name="mach_sub_weight"]').val(d.mach_sub_weight);
		            $f.find('input[name="mlpl_weight"]').val(d.mlpl_weight);
		            $f.find('input[name="kblack_weight"]').val(d.kblack_weight);
		            if (d.no !== undefined) {
		                $f.find('input[name="no"]').val(d.no);
		            }
		            $('#modalContainer').show().addClass('show');
		        }
		    });
		    StandardDataTableAttachment = new Tabulator("#StandardDataTableAttachment", {
		        height: "380px",
		        layout: "fitColumns",
		        reactiveData: true,
		        tooltips: true,
		        ajaxLoader: false,
		        paginationSize: 20,
		        placeholder: "조회된 데이터가 없습니다.",
		        columnHeaderVertAlign: "middle",
		        rowVertAlign: "middle",
		        headerHozAlign: "center",
		        columns: [
		            { title: 'NO', formatter: 'rownum', width: 160, hozAlign: 'center' },
		            {
		                title: "GROUP_ID",
		                field: "group_id",
		                sorter: "string",
		                width: 300,
		                hozAlign: "center",
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색", // placeholder
		                headerFilterFunc: "like"         // 포함 검색
		            },
		            {
		                title: "품명",
		                field: "item_nm",
		                sorter: "string",
		                width: 400,
		                headerSort: false,
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색",
		                headerFilterFunc: "like"
		            },
		            { title: "표면처리 사양", field: "coating_nm", sorter: "string", width: 300,  headerSort: false },
		            { title: "시료수", field: "sample_f", sorter: "string", width: 100,  headerSort: false },
		            { title: "시료당 표면적", field: "area_g", sorter: "string", width: 100,  headerSort: false }
		        ],
		        rowClick: function (e, row) {
/* 		        	// 1. 선택된 행의 데이터 가져오기
		            const rowData = row.getData();

		            // 2. Modal/Form 내부의 입력 필드 선택
		            // .cct-table 내부의 입력 필드를 타겟으로 합니다.
		            const $modal = $("#modalContainer4"); 
		            
		            // 3. 값 설정
		            $modal.find("input[name='part_no']").val(rowData.group_id);
		            $modal.find("input[name='part_name']").val(rowData.item_nm);
		            $modal.find("input[name='spec']").val(rowData.coating_nm); */
		        },
		        rowDblClick: function (e, row) {
		            const d = row.getData();
		            const $f = $('#corrForm');
		            $f[0].reset();
		            $f.find('input[name="group_id"]').val(d.group_id);
		            $f.find('input[name="item_cd"]').val(d.item_cd);
		            $f.find('input[name="item_nm"]').val(d.item_nm);
		            $f.find('input[name="mach_main"]').val(d.mach_main);
		            $f.find('input[name="mach_main_weight"]').val(d.mach_main_weight);
		            $f.find('input[name="mach_sub"]').val(d.mach_sub);
		            $f.find('input[name="coating_nm"]').val(d.coating_nm);
		            $f.find('input[name="mach_sub_weight"]').val(d.mach_sub_weight);
		            $f.find('input[name="mlpl_weight"]').val(d.mlpl_weight);
		            $f.find('input[name="kblack_weight"]').val(d.kblack_weight);
		            if (d.no !== undefined) {
		                $f.find('input[name="no"]').val(d.no);
		            }
		            $('#modalContainer').show().addClass('show');
		        }
		    });
		    StandardDataTableTurbidity = new Tabulator("#StandardDataTableTurbidity", {
		        height: "380px",
		        layout: "fitColumns",
		        reactiveData: true,
		        tooltips: true,
		        ajaxLoader: false,
		        paginationSize: 20,
		        placeholder: "조회된 데이터가 없습니다.",
		        columnHeaderVertAlign: "middle",
		        rowVertAlign: "middle",
		        headerHozAlign: "center",
		        columns: [
		            { title: 'NO', formatter: 'rownum', width: 160, hozAlign: 'center' },
		            {
		                title: "GROUP_ID",
		                field: "group_id",
		                sorter: "string",
		                width: 300,
		                hozAlign: "center",
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색", // placeholder
		                headerFilterFunc: "like"         // 포함 검색
		            },
		            {
		                title: "품명",
		                field: "item_nm",
		                sorter: "string",
		                width: 400,
		                headerSort: false,
		                headerFilter: "input",           // 검색 상자 추가
		                headerFilterPlaceholder: "검색",
		                headerFilterFunc: "like"
		            },
		            { title: "표면처리 사양", field: "coating_nm", sorter: "string", width: 300,  headerSort: false },
		            { title: "시료수", field: "sample_f", sorter: "string", width: 100,  headerSort: false },
		            { title: "시료당 표면적", field: "area_g", sorter: "string", width: 100,  headerSort: false }
		        ],
		        rowClick: function (e, row) {
/* 		        	// 1. 선택된 행의 데이터 가져오기
		            const rowData = row.getData();

		            // 2. Modal/Form 내부의 입력 필드 선택
		            // .cct-table 내부의 입력 필드를 타겟으로 합니다.
		            const $modal = $("#modalContainer5"); 
		            
		            // 3. 값 설정
		            $modal.find("input[name='part_no']").val(rowData.group_id);
		            $modal.find("input[name='part_name']").val(rowData.item_nm);
		            $modal.find("input[name='spec']").val(rowData.coating_nm); */
		        },
		        rowDblClick: function (e, row) {
		            const d = row.getData();
		            const $f = $('#corrForm');
		            $f[0].reset();
		            $f.find('input[name="group_id"]').val(d.group_id);
		            $f.find('input[name="item_cd"]').val(d.item_cd);
		            $f.find('input[name="item_nm"]').val(d.item_nm);
		            $f.find('input[name="mach_main"]').val(d.mach_main);
		            $f.find('input[name="mach_main_weight"]').val(d.mach_main_weight);
		            $f.find('input[name="mach_sub"]').val(d.mach_sub);
		            $f.find('input[name="coating_nm"]').val(d.coating_nm);
		            $f.find('input[name="mach_sub_weight"]').val(d.mach_sub_weight);
		            $f.find('input[name="mlpl_weight"]').val(d.mlpl_weight);
		            $f.find('input[name="kblack_weight"]').val(d.kblack_weight);
		            if (d.no !== undefined) {
		                $f.find('input[name="no"]').val(d.no);
		            }
		            $('#modalContainer').show().addClass('show');
		        }
		    });
		}

		// Ajax로 데이터만 교체
		function loadStandardDataCct() {
		    $.ajax({
		        url: "/geomet/condition/divisionWeight/list",
		        type: "POST",
		        dataType: "json",
		        data: {
		            group_id: $("#s_group_id").val() || "",
		            item_cd: $("#s_item_cd").val() || "",
		            item_nm: $("#s_item_nm").val() || "",
		            coating_nm: $("#s_coating_nm").val() || "",
		        },
		        success: function (data) {
		            if (data.status === "success") {
		            	StandardDataTable.replaceData(data.data);
		            } else {
		                alert("데이터 조회 실패: " + data.message);
		            }
		        },

		        error: function () {
		            alert("데이터 조회 실패");
		        }
		    });
		}
		function loadStandardDataSst() {
		    $.ajax({
		        url: "/geomet/condition/divisionWeight/list",
		        type: "POST",
		        dataType: "json",
		        data: {
		            group_id: $("#s_group_id").val() || "",
		            item_cd: $("#s_item_cd").val() || "",
		            item_nm: $("#s_item_nm").val() || "",
		            coating_nm: $("#s_coating_nm").val() || "",
		        },
		        success: function (data) {
		            if (data.status === "success") {
 		            	StandardDataTableSst.replaceData(data.data);
		            } else {
		                alert("데이터 조회 실패: " + data.message);
		            }
		        },

		        error: function () {
		            alert("데이터 조회 실패");
		        }
		    });
		}
		function loadStandardDataAttachment() {
		    $.ajax({
		        url: "/geomet/quality/getStandardList",
		        type: "POST",
		        dataType: "json",
		        data: {
		            group_id: $("#s_group_id").val() || "",
		            item_cd: $("#s_item_cd").val() || "",
		            item_nm: $("#s_item_nm").val() || "",
		            coating_nm: $("#s_coating_nm").val() || "",
		        },
		        success: function (data) {
		            if (data.status === "success") {
		            	StandardDataTableAttachment.replaceData(data.data);
		            } else {
		                alert("데이터 조회 실패: " + data.message);
		            }
		        },

		        error: function () {
		            alert("데이터 조회 실패");
		        }
		    });
		}
		function loadStandardDataTurbidity() {
		    $.ajax({
		        url: "/geomet/quality/getStandardList",
		        type: "POST",
		        dataType: "json",
		        data: {
		            group_id: $("#s_group_id").val() || "",
		            item_cd: $("#s_item_cd").val() || "",
		            item_nm: $("#s_item_nm").val() || "",
		            coating_nm: $("#s_coating_nm").val() || "",
		        },
		        success: function (data) {
		            if (data.status === "success") {
		            	StandardDataTableTurbidity.replaceData(data.data); 
		            } else {
		                alert("데이터 조회 실패: " + data.message);
		            }
		        },

		        error: function () {
		            alert("데이터 조회 실패");
		        }
		    });
		}

	//이벤트
	
	
	//함수
function openViewerModal(url, title, fileType) { // fileType 매개변수 추가
    const modal = document.getElementById('viewerModal'); // ID 변경
    const viewerTitle = document.getElementById('viewerModalTitle'); // ID 변경
    const closeBtn = document.getElementById('closeViewerModalBtn'); // ID 변경
    
    const pdfViewer = document.getElementById('pdfViewer');
    const imageViewer = document.getElementById('imageViewer');

    if (!url) {
        alert("파일 경로 정보가 없습니다.");
        return;
    }
    
    viewerTitle.innerText = title; 
    
    // 🚨 파일 타입에 따라 iframe 또는 img를 표시/숨김
    if (fileType === 'pdf') {
        pdfViewer.src = url;
        pdfViewer.style.display = 'block';
        imageViewer.style.display = 'none';
        imageViewer.src = ''; // 이미지 src 초기화
    } else if (fileType === 'image') { // 이미지 타입 추가
        imageViewer.src = url;
        imageViewer.style.display = 'block';
        pdfViewer.style.display = 'none';
        pdfViewer.src = ''; // PDF src 초기화
    } else {
        alert("지원하지 않는 파일 형식입니다. (파일명: " + title + ")");
        return;
    }
    
    modal.style.display = "block";

    if (!closeBtn.onclick) {
        closeBtn.onclick = function() {
            modal.style.display = "none";
            pdfViewer.src = ''; 
            imageViewer.src = ''; 
        }
    }
    
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            pdfViewer.src = ''; 
            imageViewer.src = ''; 
        }
    }
}

//그래프 버튼 클릭시 페이지 이동
$('.graphButton').click(function() {
	window.location.href = "/geomet/quality/graphPage";
});

//한 파일에 시트로 나누어 엑셀 생성
$('.excel-button').click(function() {
    const today = new Date().toISOString().slice(0, 10).replace(/-/g, "");
    const fileName = "테스트/시험정보_" + today + ".xlsx";
    
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
                    obj[col.title] = row[col.field];
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
    addTableToSheet(dataTable1, "세척 1,2호기 가성소다용액 농도");
    addTableToSheet(dataTable3, "지오메트 가열잔분 탱크액");
    addTableToSheet(attachmentTable, "지오메트 부착량");
    addTableToSheet(turbidityTable, "지오메트 후처리 부착량");
    addTableToSheet(sstTable, "SST 시험성적서");
    addTableToSheet(cctTable, "CCT 시험성적서");

    // 4. 최종 파일 내보내기
    XLSX.writeFile(workbook, fileName);
});
</script>

</body>
</html>
