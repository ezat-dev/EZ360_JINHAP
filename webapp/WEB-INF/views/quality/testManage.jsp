<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테스트 관리대장</title>
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
            width: 30%;
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
           height: 39vh; 
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
          width: 1500px;
          margin-right: 20px;
          margin-top:4px;
          margin-left: 140px;
      }
        .mch_code {
            width: 15%;
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
           .monthselect {
        width: 20%;
        text-align: center;
        font-size: 15px;
    }
    .monthSet {
        width: 14%;
        text-align: center;
        height: 16px;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
        margin-right: -346px;
    }
    .monthlabel {
        margin-right: 10px;
        margin-bottom: 13px;
        font-size: 18px;
        margin-left: 20px;
    }
	#pCodeButtonContainer {
	    margin-left: 20px;
	    margin-top: 26px;
	    display: flex;
	    gap: 8px;
	}

.pCodeBtn {
  padding: 8px 16px;
  border: 1px solid #ccc;
  background-color: #f8f8f8;
  color: #333;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.2s ease;
}

.pCodeBtn:hover {
  background-color: #e6e6e6;
  border-color: #999;
}

.pCodeBtn:active {
  background-color: #ddd;
  border-color: #888;
}

.excel-button {
    width: 86px;
    height: 40px;
    padding: 0 19px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    margin-left: 15px;
    font-size: 14px;
}

  .pCodeBtn.active {
    background-color: #ccc;  /* 진한 회색 */
    font-weight: bold;
  }
  .select-button {
    margin-left: 360px;
    height: 40px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex
;
    align-items: center;
}
/* 기본 모달 스타일 (기존 코드와 유사) */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.7);
    justify-content: center;
    align-items: center;
}
/* 모달이 보일 때 적용되는 클래스 */
.modal.show {
    display: flex;
}

/* 새로운 모달의 내용 컨테이너 스타일 */
.modal-content-viewer {
    background-color: #fff;
    padding: 20px;
    border: 1px solid #888;
    width: 90%;
    max-width: 1000px;
    height: 90%;
    position: relative;
    margin-left: 20%;
    margin-top: 3%;
}

button.select-button {
    margin-top: -7px;
}
.frameDiv {
    display: flex;
    width: 92.7%;
    height: 89%;
    background: white;
    margin-left: 131px;
    border-radius: 14px;
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.15);
    overflow: hidden;
}
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">        

            <div class="button-container">
            
               <div class="box1">
               
              <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
              <label class="monthlabel">월 선택 :</label>
            <input type="text"autocomplete="off" class="monthSet" id="startDate" style="font-size: 16px; 
            margin-bottom:10px;" placeholder="시작 날짜 선택">
             	             <button type="button" class="select-button">
	                <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	            </button> 

<!--                <label class="daylabel">설비명 :</label>
           <select id="mch_code" class="mch_code">
             
                <option value="G03-GG01">G800조건관리</option>
                <option value="G03-GG03">G600조건관리</option>
                <option value="PL">공용관리</option>
                <option value="G04-GG05">K-BLACK조건관리</option>

            </select> -->

                <button class="excel-button" style="width:92px;">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button> 
              
         </div>

             
            </div>
        </div>

        <div class="view">
            <div id="dataTable"></div>
        </div>
    </main>
   
      <div id="modalContainer" class="modal">
       <div class="modal-content">
           <span class="close">&times;</span>
           <h2>파일 저장</h2>
           <form id="corrForm"autocomplete="off">
           <input type="hidden" id="number" name="number" />
           <input type="hidden" id="targetField" name="targetField" />

			<label>저장할 파일</label>
			<input type="file" name="file" id="file" accept=".xls,.xlsx">

			<label>저장된 파일</label>
			<input type="text" name="fileName" id="fileName" placeholder="저장된 파일 없음">

   
               <button type="submit" id="saveCorrStatus">저장</button>
               <button type="button" id="closeModal">닫기</button>
           </form>
       </div>
   </div>
   
   <!-- pdf 미리보기 모달창-->
<!-- <div id="pdfViewerModal" class="modal">
    <div class="modal-content-viewer">
        <span class="close" id="pdfViewerCloseBtn">&times;</span>
        <div id="pdfViewer">
            <iframe id="pdfIframe" src="" frameborder="0"></iframe>
        </div>
    </div>
</div> -->
   

<script>
let now_page_code = "d07";

  $(function () {
    var now    = new Date();
    var year   = now.getFullYear();
    var month  = String(now.getMonth() + 1).padStart(2, '0');
    var yearMonth = year + '-' + month;

    $('#startDate').val(yearMonth).attr('placeholder', yearMonth);

    $('.insert-button').click(function(){ toggleModal(true); });
    $('.close, #closeModal').click(function(){ toggleModal(false); });

    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();

        const formElement = document.getElementById("corrForm");
        const formData = new FormData(formElement);

        // id 값이 비어 있으면 제거
        if (!formData.get("id") || formData.get("id").trim() === "") {
            formData.delete("id");
        }

        // 디버깅 로그
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }

        $.ajax({
            url: "/geomet/quality/testManage/updateFile",
            type: "POST",
            data: formData, 
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                if (response === true) {
                    alert("파일이 성공적으로 저장되었습니다!");
                    $("#modalContainer").hide();
                    loadData(); 
                } else {
                    alert("저장 실패: " + (response.message || "알 수 없는 오류"));
                }
            },
            error: function () {
                alert("서버 오류 발생!");
            }
        });
    });

    $('.select-button').click(loadData);

    getDataList(yearMonth);

  });
  
  var p_code;   //최근에 누른 버튼 번호 저장
/*   
  //버튼 눌러서 데이터 가져오기
$('.pCodeBtn').click(function () {
    // 👉 버튼 스타일 토글
    $('.pCodeBtn').removeClass('active');
    $(this).addClass('active');

    p_code = $(this).data('pcode');
    var startDate = $('#startDate').val();
    var mch_code = $('.mch_code').val();

    console.log(' p_code:', p_code);
    console.log(' startDate:', startDate);
    console.log(' mch_code:', mch_code);

    if (!startDate) {
        alert('날짜를 선택하세요');
        return;
    }

    $.ajax({
        url: '/geomet/condition/machinePartTemp/list',
        method: 'POST',
        data: {
            startDate: startDate,
            mch_code: mch_code,
            p_code: p_code
        },
        success: function (data) {
            console.log('서버 응답 데이터:', data);
            dataTable.setData(data);
        },
        error: function () {
            alert('데이터 조회 중 오류 발생');
        }
    });
}); */

  var defaultColumns = [

/*      tank_temp: 38°C 초과 시 빨간색

     visocosity: 30초 미만 또는 50초 초과 시 빨간색 (기준: 40±10초)

     specific_gravity: 1.38 미만 또는 1.48 초과 시 빨간색 (기준: 1.43±0.05)

     chiller_temp: 8 미만 또는 12 초과 시 빨간색 (기준: 10±2℃)
 */
 { title: "실험명",
		columns:[
			{title: "주기", 
					columns: [
						{ title: "항목", field: "date", width: 110, hozAlign: "center", headerSort: false, frozen: true }
						]
			, frozen: true }
			]
 , frozen: true },
 { title: "number", field: "number", visible: false },

     { title: "S.S.T",
 		columns:[
 			{title: "2회/주", 
 					columns: [
 						{ title: "투입/종료</br>시험일", field: "sst1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
 						{ title: "결과", field: "sst2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
 	 						editorParams: {
								values: {"합격": "합격", "불합격": "불합격" }
 	 						},
	 						},
 			            {
 						    title: "파일",
 						    field: "sst3",
 						    hozAlign: "center",
 						    width: 230,
 			                formatter: function(cell, formatterParams, onRendered) {
 			                    const fileName = cell.getValue();
 			                    if (!fileName) return "";
 			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
 			                }

 			            }
 						]
 				}
 			]
      },
      { title: "C.C.T",
   		columns:[
   			{title: "2회/주", 
   					columns: [
   						{ title: "투입/종료</br>시험일", field: "cct1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
   						{ title: "결과", field: "cct2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
 	 						editorParams: {
								values: {"합격": "합격", "불합격": "불합격" }
 	 						},
   	   						 },
 			            {
 						    title: "파일",
 						    field: "cct3",
 						    hozAlign: "center",
 						    width: 230,
 			                formatter: function(cell, formatterParams, onRendered) {
 			                    const fileName = cell.getValue();
 			                    if (!fileName) return "";
 			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
 			                }

 			            }
   						]
   				}
   			]
        },
        { title: "내수밀착성",
       		columns:[
       			{title: "1회/월", 
       					columns: [
       						{ title: "투입/종료</br>시험일", field: "contact1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
       						{ title: "결과", field: "contact2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
     	 						editorParams: {
    								values: {"합격": "합격", "불합격": "불합격" }
     	 						},},
     			            {
     						    title: "파일",
     						    field: "contact3",
     						    hozAlign: "center",
     						    width: 230,
     			                formatter: function(cell, formatterParams, onRendered) {
     			                    const fileName = cell.getValue();
     			                    if (!fileName) return "";
     			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
     			                }

     			            }
       						]
       				}
       			]
            },
            { title: "GEOMET 부착량",
           		columns:[
           			{title: "1회/일", 
           					columns: [
           						{ title: "투입/종료</br>시험일", field: "gattach1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
           						{ title: "결과", field: "gattach2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
         	 						editorParams: {
        								values: {"합격": "합격", "불합격": "불합격" }
         	 						},},
         			            {
         						    title: "파일",
         						    field: "gattach3",
         						    hozAlign: "center",
         						    width: 230,
         			                formatter: function(cell, formatterParams, onRendered) {
         			                    const fileName = cell.getValue();
         			                    if (!fileName) return "";
         			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
         			                }

         			            }
           						]
           				}
           			]
                },
                { title: "후처리 부착량",
               		columns:[
               			{title: "2회/주", 
               					columns: [
               						{ title: "투입/종료</br>시험일", field: "after_attach1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
               						{ title: "결과", field: "after_attach2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
             	 						editorParams: {
            								values: {"합격": "합격", "불합격": "불합격" }
             	 						},},
             			            {
             						    title: "파일",
             						    field: "after_attach3",
             						    hozAlign: "center",
             						    width: 230,
             			                formatter: function(cell, formatterParams, onRendered) {
             			                    const fileName = cell.getValue();
             			                    if (!fileName) return "";
             			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
             			                }

             			            }
               						]
               				}
               			]
                    },
                    { title: "가열잔분",
                   		columns:[
                   			{title: "1회/주", 
                   					columns: [
                   						{ title: "투입/종료</br>시험일", field: "heat1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
                   						{ title: "결과", field: "heat2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
                 	 						editorParams: {
                								values: {"합격": "합격", "불합격": "불합격" }
                 	 						},},
                 			            {
                 						    title: "파일",
                 						    field: "heat3",
                 						    hozAlign: "center",
                 						    width: 230,
                 			                formatter: function(cell, formatterParams, onRendered) {
                 			                    const fileName = cell.getValue();
                 			                    if (!fileName) return "";
                 			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
                 			                }

                 			            }
                   						]
                   				}
                   			]
                        },
                        { title: "세척 적정 액 분석",
                       		columns:[
                       			{title: "1회/주", 
                       					columns: [
                       						{ title: "투입/종료</br>시험일", field: "clean1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
                       						{ title: "결과", field: "clean2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
                     	 						editorParams: {
                    								values: {"합격": "합격", "불합격": "불합격" }
                     	 						},},
                     			            {
                     						    title: "파일",
                     						    field: "clean3",
                     						    hozAlign: "center",
                     						    width: 230,
                     			                formatter: function(cell, formatterParams, onRendered) {
                     			                    const fileName = cell.getValue();
                     			                    if (!fileName) return "";
                     			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
                     			                }

                     			            }
                       						]
                       				}
                       			]
                            },
                            { title: "쇼트볼 수입검사",
                           		columns:[
                           			{title: "1회/월", 
                           					columns: [
                           						{ title: "투입/종료</br>시험일", field: "shot1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
                           						{ title: "결과", field: "shot2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
                         	 						editorParams: {
                        								values: {"합격": "합격", "불합격": "불합격" }
                         	 						},},
                         			            {
                         						    title: "파일",
                         						    field: "shot3",
                         						    hozAlign: "center",
                         						    width: 230,
                         			                formatter: function(cell, formatterParams, onRendered) {
                         			                    const fileName = cell.getValue();
                         			                    if (!fileName) return "";
                         			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
                         			                }

                         			            }
                           						]
                           				}
                           			]
                                },
                                { title: "기타",
                               		columns:[
                               			{title: "2회/주", 
                               					columns: [
                               						{ title: "투입/종료</br>시험일", field: "etc1", width: 180, hozAlign: "center", editor: "input", headerSort: false },
                               						{ title: "결과", field: "etc2", width: 110, hozAlign: "center", editor: "select", headerSort: false,
                             	 						editorParams: {
                            								values: {"합격": "합격", "불합격": "불합격" }
                             	 						},},
                             			            {
                             						    title: "파일",
                             						    field: "etc3",
                             						    hozAlign: "center",
                             						    width: 230,
                             			                formatter: function(cell, formatterParams, onRendered) {
                             			                    const fileName = cell.getValue();
                             			                    if (!fileName) return "";
                             			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
                             			                }

                             			            }
                               						]
                               				}
                               			]
                                    },
                                    { title: "기타",
                                   		columns:[
                                   			{title: "2회/주", 
                                   					columns: [
                                   						{ title: "투입/종료</br>시험일", field: "etc4", width: 180, hozAlign: "center", editor: "input", headerSort: false },
                                   						{ title: "결과", field: "etc5", width: 110, hozAlign: "center", editor: "select", headerSort: false,
                                 	 						editorParams: {
                                								values: {"합격": "합격", "불합격": "불합격" }
                                 	 						},},
                                 			            {
                                 						    title: "파일",
                                 						    field: "etc6",
                                 						    hozAlign: "center",
                                 						    width: 230,
                                 			                formatter: function(cell, formatterParams, onRendered) {
                                 			                    const fileName = cell.getValue();
                                 			                    if (!fileName) return "";
                                 			                    return '<a href="/geomet/download_testManage?filename=' + encodeURIComponent(fileName) + '" target="_blank">' + fileName + '</a>';
                                 			                }

                                 			            }
                                   						]
                                   				}
                                   			]
                                        }
   ];


  var dataTable;

  
  $('#startDate').on('change', function () {
	  console.log("날짜 바뀜");
	  getDataList();   // 값 바뀔 때마다 데이터 다시 조회
	});


//Ajax로 데이터만 교체
  function loadData() {
      $.ajax({
          url: "/geomet/quality/getTestManageList",
          type: "POST",
          dataType: "json",
          data: {
              date: $("#startDate").val() || ""
          },
          success: function (data) {
                  dataTable.replaceData(data); // ✅ 배열만 넘김
          },
          error: function () {
              alert("데이터 조회 실패");
          }
      });
  }
  
  
  function handleSelectButtonClick() {
    var date = $('#startDate').val() || '';
    if (startDate.length >= 7) { startDate = startDate.substring(0, 7); }
    var mch_code = $('.mch_code').val() || '';

    // 컬럼 선택
    var cols = defaultColumns;
    if (mch_code === 'PL')           cols = plColumns;
    else if (mch_code === 'ML')      cols = mlColumns;
    else if (mch_code === 'G04-GG05') cols = g04Columns;

    dataTable.setColumns(cols);
    dataTable.setData('/geomet/quality/getTestManageList', { date: startDate}, { method: 'POST' });
  }

  function toggleModal(show) {
    $('#modalContainer').toggleClass('show', show).toggle(show);
  }

  function handleFormSubmit(event) {
	    event.preventDefault();

	    var corrForm = new FormData($('#corrForm')[0]);
	    corrForm.forEach(function(v, k){ 
	        console.log(k + ' = ' + v); 
	    });

	    var startDate = $('#startDate').val();
	    var mch_code = $('#mch_code').val();

	    // 🔸 현재 스크롤 위치 저장
	    const scrollTop = document.querySelector('#dataTable .tabulator-tableholder')?.scrollTop || 0;

	    // 🔸 선택된 행 ID 저장 (선택된 행이 있을 경우)
	    const selectedRow = dataTable.getSelectedRows()[0];
	    const selectedId = selectedRow ? selectedRow.getData().id : null;

	    $.ajax({
	        url: '/geomet/condition/machinePartTemp/update', 
	        type: 'POST',
	        data: corrForm,
	        dataType: 'json',
	        processData: false,
	        contentType: false,
	        success: function(response) {
	            alert(response.data);
	            toggleModal(false);

	            // 🔸 데이터만 다시 불러오고, 완료 후 스크롤과 선택 복원
	            dataTable.replaceData('/geomet/condition/machinePartTemp/list', {
	                startDate: $("#startDate").val() || "",
	                mch_code: $("#mch_code").val() || "",
	                p_code: p_code
	            }).then(() => {
	                // 🔹 스크롤 복원
	                document.querySelector('#dataTable .tabulator-tableholder')?.scrollTo({ top: scrollTop });

	                // 🔹 선택 복원
	                if (selectedId !== null) {
	                    const row = dataTable.getRowFromData({ id: selectedId });
	                    if (row) row.select();
	                }
	            });

	        },
	        error: function() {
	            alert('오류가 발생했습니다. 다시 시도해주세요.');
	        }
	    });
	}

  
  //설비명에 다라 버튼 개수 조정
  $(document).ready(function () {
     function updatePCodeButtons(mchCode) {
       // 일단 전체 버튼 숨김
       $(".pCodeBtn").hide();

       if (mchCode === "G03-GG01") {
          console.log("g800")
         //G800
         $(".pCodeBtn[data-pcode='p_1']").show();
         $(".pCodeBtn[data-pcode='p_2']").show();
         $(".pCodeBtn[data-pcode='p_3']").show();
         $(".pCodeBtn[data-pcode='p_4']").show();
       } else if (mchCode === "G03-GG03") {
         //G600
         $(".pCodeBtn[data-pcode='p_1']").show();
         $(".pCodeBtn[data-pcode='p_2']").show();
         $(".pCodeBtn[data-pcode='p_3']").show();
       } else {
         //나머지
         $(".pCodeBtn[data-pcode='p_1']").show();
         $(".pCodeBtn[data-pcode='p_2']").show();
       }
     }

     // 페이지 로드 시 초기 상태 설정
     const defaultCode = $("#mch_code").val();
     updatePCodeButtons(defaultCode);

     // 설비명 드롭다운 변경 시 버튼 갱신
     $("#mch_code").on("change", function () {
       const selectedCode = $(this).val();
       updatePCodeButtons(selectedCode);
     });
   });

  function getDataList(initialMonth) {
	  var startDate = $('#startDate').val();
    if (startDate.length >= 7) { startDate = startDate.substring(0, 7); }
    var mch_code = $('.mch_code').val() || '';

    var cols = defaultColumns;
    if (mch_code === 'PL')           cols = plColumns;
    else if (mch_code === 'ML')      cols = mlColumns;
    else if (mch_code === 'G04-GG05') cols = g04Columns;

    if (!dataTable) {
      dataTable = new Tabulator('#dataTable', {
        height: '710px',
        layout: 'fitDataFill',
        layoutColumnsOnNewData: true,
        headerSort: false,
        selectableRangeMode: 'click',
        reactiveData: true,
        headerHozAlign: 'center',
        ajaxConfig: { method: 'POST' },
        ajaxURL: '/geomet/quality/getTestManageList',
        ajaxParams: {"date": startDate},
        placeholder: '조회된 데이터가 없습니다.',
        paginationSize: false,
        ajaxResponse: function(url, params, response){ return response; },
        dataLoaded: function(){ $('#dataTable .tabulator-col.tabulator-sortable').css('height','29px'); },
        columns: cols,
        //셀 수정 후 즉시 업데이트
        cellEdited: function(cell){
           const row = cell.getRow().getData();
           const field = cell.getField();
           const newValue = cell.getValue();
           const oldValue = cell.getOldValue();

           //값을 입력 안하거나 이전과 값이 같으면
           if (!newValue || Object.is(newValue, oldValue)) {
               return;
           }
           
           console.log("수정된 셀:",{
                number: row.number,
                field: field,
                value: newValue
           }),
           
            $.ajax({
                url: "/geomet/quality/testManage/update",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ number: row.number,
                [field]: newValue }),
                success: function (res) {
                    if (res === true) {
                        console.log("업데이트 성공");
                    } else {
                        alert("업데이트 실패: " + res.message);
                        cell.restoreOldValue();
                    }
                },
                error: function () {
                    alert("서버 오류");
                    cell.restoreOldValue();
                }
            });
        } ,
        cellClick: function(e, cell){ },
        cellDblClick: function(e, cell){
            var field   = cell.getField();	//sst3
            var rowData = cell.getRow().getData();

            if (field == 'sst3' || field == 'cct3' || field == 'contact3'|| field == 'gattach3' 
                || field == 'after_attach3' || field == 'heat3' || field == 'clean3' || field == 'shot3'
                    || field == 'etc3' || field == 'etc6') {
              var title  = cell.getColumn().getDefinition().title;
              var value  = cell.getValue();	//파일명
              var number  = rowData.number; //number
              var date   = rowData.date;

              console.log(
                '필드: '  + field  + ', ' +
                title     + ': '    + value + ', ' +
                'number: '    + number  + ', ' +
                '일자: '  + date
              );
				
              $("#corrForm")[0].reset();   // 모달 초기화
              $('#modalContainer').show().addClass('show');
              $("#corrForm input[name='fileName']").val(value)
              $("#corrForm input[name='number']").val(number);
              $("#corrForm input[name='targetField']").val(field);
            }
          } 
        
      });
    } else {
      dataTable.setColumns(cols);
      dataTable.setData('/geomet/condition/machinePartTemp/list', { startDate: startDate, mch_code: mch_code }, { method: 'POST' });
    }
  };

  //모달 닫기
  $(document).ready(function() {
    // 닫기 버튼(X) 클릭 시 모달 닫기
    $("#pdfViewerCloseBtn").on("click", function() {
        $("#pdfViewerModal").hide().removeClass('show');
        $("#pdfIframe").attr('src', ''); // iframe 초기화
    });

    // 모달 바깥 영역 클릭 시 모달 닫기
    $(window).on("click", function(event) {
        if ($(event.target).is("#pdfViewerModal")) {
            $("#pdfViewerModal").hide().removeClass('show');
            $("#pdfIframe").attr('src', ''); // iframe 초기화
        }
    });
});

  //엑셀
      $(".excel-button").on("click", function () {
  	    $("#excelOverlay, #excelLoading").show();

  	    // 1) 파라미터 준비
  	    //let s_time = $("#s_time").val().replaceAll("-", "");
/*   	    let e_time = s_time;
  	    let m_code = $("#m_code").text().trim();
  	    let ex_mch_name  = "세척1호기 작업일보"; */
  	    let date = $("#startDate").val();

  	    console.log("▶ 엑셀 생성 요청 파라미터:", { date });

  	    // 2) AJAX 호출
  	    $.ajax({
  	        url: "/geomet/quality/testManage/excel",
  	        method: "POST",
  	        contentType: "application/json",
  	        data: JSON.stringify({ date }),
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