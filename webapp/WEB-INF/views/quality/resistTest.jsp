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
   			 max-width: 951px;
		    max-height: 700px; /* 화면 높이에 맞게 제한 */
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
		    width: 100%;
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
		    justify-content: right;
		    align-items: center;
		    width: 800px;
		    margin-right: 20px;
		    margin-top:4px;
		    gap: 14px;
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
        	width: 20%;
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
</style>
<body>

	<main class="main">
	        <div class="tab">
	        
	        <div class="bt_box">
	         <button class="insert-button_1 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">1. 세척1.2호기  가성소다용액 농도
                </button>
                	         <button class="insert-button_2 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">2. 이코팅 욕액 분석
                </button>
                	         <button class="insert-button_3 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">3. 지오메트 가열잔분 탱크액
                </button>
                	         <button class="insert-button_4 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">4. 지오메트 부착량
                </button>
                	         <button class="insert-button_5 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">5. 후처리 부착량
                </button>
                	         <button class="insert-button_6 boxCss">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">6. 내수밀착성
                </button>
              </div>
                
            <div class="button-container">
                <div class="box1">
                    <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
                    
                    <label class="daylabel">검색일자 :</label>
                    <input type="text" 
                           autocomplete="off" 
                           class="daySet" 
                           id="startDate" 
                           style="font-size: 16px; margin-bottom:10px;" 
                           placeholder="날짜 선택">
     

                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>

                <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				
			<button class="btn">세척액 약품투입기준자료</button>

           </div>
                		<!-- 조회조건 표시 -->
	
            </div>
        </div>
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
        <h2>가열잔분 탱크액 관리기준 정보</h2>
        <form  id="corrForm1"  autocomplete="off">
            <label>테스트 시험일자</label>
           <input type="text" name="date" class="daySet" placeholder="날짜 선택" style="text-align: left; width: 120px; margin-left: 45px;">
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
		<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>가열잔분 탱크액 관리기준 정보</h2>
        <form  id="corrForm"  autocomplete="off">
            <label>테스트 시험일자</label>
           <input type="text" name="date" class="daySet" placeholder="날짜 선택" style="text-align: left; width: 120px; margin-left: 5%;">
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
          <tr>
            <td>G600 <input type="hidden" name="mch_name" value="G600"></td>
            <td><input type="number"  name="hafter_1" required></td>
            <td><input type="number"  name="empty_2" required></td>
            <td><input type="number"  name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>G800 <input type="hidden" name="mch_name" value="G800"></td>
            <td><input type="number"  name="hafter_1" required></td>
            <td><input type="number"  name="empty_2" required></td>
            <td><input type="number"  name="hbefore_3" required></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>PLUS <input type="hidden" name="mch_name" value="PLUS"></td>
            <td><input type="number"  name="hafter_1"></td>
            <td><input type="number"  name="empty_2"></td>
            <td><input type="number"  name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>ML <input type="hidden" name="mch_name" value="ML"></td>
            <td><input type="number"  name="hafter_1"></td>
            <td><input type="number"  name="empty_2"></td>
            <td><input type="number"  name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
          <tr>
            <td>K/B <input type="hidden" name="mch_name" value="K/B"></td>
            <td><input type="number"  name="hafter_1"></td>
            <td><input type="number"  name="empty_2"></td>
            <td><input type="number"  name="hbefore_3"></td>
            <td><input type="text" name="action"></td>
            <td><input type="text" name="min_spec" value="36.5"></td>
            <td><input type="text" name="max_spec" value="41.5"></td>
          </tr>
        </tbody>
      </table>

      <input type="hidden" name="batchId" value="">
			
			<label>기준서(PDF)</label>
			<input type="file" id="fileInput3" accept="application/pdf"  name="uploadFile" style="text-align: left; width: 180px; margin-left: 5%;">

			<label style="display: none;">파일 이름</label>
			<input type="text" name="t_url" id="fileName" placeholder="기준서(PDF)" style="text-align: left; width: 120px; margin-left: 5%; display: none;">

            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>
        <div class="view">
            <div id="dataList1"></div>
        </div>
        <div class="view">
            <div id="dataList3"></div>
        </div>
	</main>
	<script>
	//전역변수
let now_page_code = "d02";
let dataTable1; // Tabulator 전역 변수
let dataTable3;
let clicked;	//클릭 했는지 확인용


	//로드
	$(function(){
		$(".headerP").text("품질관리 - 내식성 테스트");
	    // 오늘 날짜 구하기
	    const today = new Date().toISOString().split('T')[0];

	    // input에 오늘 날짜 기본 세팅
	    $('#startDate').val(today);

	    // Tabulator 테이블 초기 생성
	    //initDataTable();

	    // 페이지 로드 시 데이터 조회
	    getDataList(today);

	    // 조회 버튼 클릭 시
	    $('.select-button').click(function() {
	        const selectedDate = $('#startDate').val();
	        getDataList(selectedDate);
	    });
		
	});
	  $(".btn").on("click", function () {
		    window.location.href = "/geomet/quality/medicineStandard";
		  });
	  $(document).ready(function () {
		    // 페이지 로딩 시 데이터 불러오기
		 

		    const today = new Date().toISOString().split('T')[0];
		    $('#startDate').val(today);
		    $('#endDate').val(today);


		    //getDataList();
		    
		    // 1번모달 열기
		    $(".insert-button_1").click(function () {
		    	$('#corrForm1')[0].reset();
		        let modal = $("#modalContainer1");
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
		            //endDate: endDate,
		        });
		        dataTable3.setData("/geomet/quality/testTank/list", {
			           // equipment_name: equipmentName,
			            date: startDate,
			            //endDate: endDate,
			        });
		    });

		    // 저장 버튼 클릭 시
		    $("#saveCorrStatus").click(function (event) {
		        event.preventDefault();

		        // 각 설비별 테이블 행(tr)을 선택
		        const rows = $(".tank-table tbody tr");
		        let successfulRequests = 0;
		        const totalRequests = rows.length;

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
		            if (hafter_1 || empty_2 || hbefore_3 || action || spec) {
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
		                        // 모든 요청이 완료된 후 최종 알림
		                        if (index === totalRequests - 1) {
		                            alert("저장 완료되었습니다.");
		                            $("#modalContainer").hide();
		                            getDataList();
		                        }
		                    } 
		                });
		            }
		        });
		    });

		    // 첫 번째 모달창 저장 버튼 클릭 시
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
		        

		        if (!selectedRow) {
		            alert("삭제할 행을 선택하세요.");
		            return;
		        }

		        var requestData = JSON.stringify({ "test_num": test_num });
		        console.log("전송된 데이터:", requestData);

		        $.ajax({
		            url: "/geomet/quality/testTank/delete",
		            type: "POST",
		            contentType: "application/json", 
		            data: requestData,
		            dataType: "json",
		            success: function(response) {
		                console.log("행 삭제 성공:", response);
		                alert("행 삭제 완료");
		                getDataList($("#startDate").val());
		                //dataTable1.setData("/geomet/quality/testTank/list", { date: $("#startDate").val() });

		            },
		            error: function(xhr, status, error) {
		                console.error("삭제 오류:", xhr.responseText);
		                alert("삭제 중 오류가 발생했습니다: " + error);
		            }
		        });
		    });


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
		  });
		    
		});
	// 데이터 목록 로딩 함수 정의
	  function getDataList() {
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
	              //endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              $("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.data1;
	          },
	          columns: [
	              { title: "id", field: "id", visible: false },
	              { title: "test_num", field: "test_num", visible: false },
	             
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false },

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
	              { title: "② NaOH농도값<br>(① * 0.8)", field: "naoh_density", width: 130, hozAlign: "center",
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
	              { title: "조치사항", 
	                  columns: [
	                      { title: "NaOH<br>분석결과(g/L)", field: "naoh_result", hozAlign: "center", headerSort: false, width: 120 },
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
	          		            { title: "NaOH<br>(포)", field: "naoh", width: 80, hozAlign: "center", headerSort: false },
	          		            { title: "SC300A<br>(liter)", field: "sc300a", width: 90, hozAlign: "center", headerSort: false },
	          		            { title: "SC300B<br>(liter)", field: "sc300b", width: 90, hozAlign: "center", headerSort: false },
	          		            { title: "농축액<br>(liter)", field: "condense", width: 80, hozAlign: "center", headerSort: false }
	          					]
	                           },
	                           { title: "투입 후<br>NaOH 농도", field: "after_naoh", width: 100, hozAlign: "center", headerSort: false},
	                           { title: "파일", field: "file_name", width: 130, hozAlign: "center" }
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

	      dataTable3 = new Tabulator("#dataList3", {
	          height: "200px",
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
	              //endDate: $("#endDate").val() || "",
	          },
	          placeholder: "조회된 데이터가 없습니다.",
	     
	          ajaxResponse: function (url, params, response) {
	              $("#dataList3 .tabulator-col.tabulator-sortable").css("height", "29px");
	              return response.data3;
	          },
	          columns: [
	              { title: "id", field: "id", visible: false },
	              { title: "test_num", field: "test_num", visible: false },
	             
	              { title: "No", formatter: "rownum", hozAlign: "center", width: 30, headerSort: false },

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
	              { title: "④ ((1-2)/3) * 100", field: "etc1", width: 160, hozAlign: "center" },
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
	              { title: "파일", field: "file_name", width: 130, hozAlign: "center" }
	          ],
	          rowClick: function (e, row) {
	              // 모든 행의 선택 해제 및 스타일 제거
	              //$("#dataList .tabulator-row").removeClass("row_select");
	              clicked = !clicked;
	              // 클릭된 행의 test_num 값 가져오기
	              const clicked_test_num = row.getData().test_num;

					if(clicked === true){
	              // test_num이 같은 모든 행을 선택하고 클래스 추가
	              dataTable3.getRows().forEach(function(r) {
	                  if (r.getData().test_num === clicked_test_num) {
	                      r.select(); // Tabulator의 select() 메서드를 사용하여 선택 상태로 만듦
	                      r.getElement().classList.add("row_select");
	                  }
	              });
					}else{
						$("#dataList3 .tabulator-row").removeClass("row_select");
						}

	              // selectedRow 변수 업데이트
	              selectedRow = row;
	              console.log("선택된 test_num:", clicked_test_num);
	          }
	      });
	  }

	//이벤트
	
	
	//함수

</script>

</body>
</html>
