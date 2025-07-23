<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수입검사</title>
<%@include file="../include/pluginpage.jsp"%>
<jsp:include page="../include/tabBar.jsp" />

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
.tab {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    margin-top: 5px;
    margin-bottom: 37px;
    height: 45px;
    border-radius: 6px 6px 0px 0px;
}

.title-container {
    flex: 0 0 auto;
}

.button-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

h2#pageTitle {
    margin: 0 0 0 46px;
    padding: 0;
    font-size: 31px;
    font-weight: bold;
    text-align: left;
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

/* .button-container {
   display: flex;
   gap: 10px;
   margin-left: auto;
   margin-right: 10px;
   margin-top: 40px;
} */

.box1 {
   display: flex;
   justify-content: right;
   align-items: center;
   width: 800px;
   margin-right: 20px;
   margin-top: 4px;
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

/* button-container.button {
   height: 16px;
} */

.mid {
   margin-right: 9px;
   font-size: 20px;
   font-weight: bold;
   height: 42px;
   margin-left: 9px;
}

.row_select {
   background-color: #ffeeba !important;
}
.download-button {
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
        .btn-container {
           margin-top: 20px;
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: 50px;
            padding: 0 10px;
            box-sizing: border-box;
        }
        .btn-container button {
            flex: 1;
            height: 100%;
            margin: 0 5px;
            font-size: 14px;
            color: #000;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        .btn-container button:first-child { margin-left: 0; }
        .btn-container button:last-child  { margin-right: 0; }
        .btn-container button:hover {
            background-color: #e0e0e0;
        }
    h2 {
    margin-left: 0;         /* 왼쪽 여백 제거 */
    font-size: 24px;        /* 글씨 크기 크게 (원하면 더 키울 수 있음) */
    font-weight: bold;      /* 굵게 (선택 사항) */
   } 
</style>
</head>

<body>

   <main class="main">
   
      <div class = "btn-container">
            <button id="btn1" class="btn1">GEOMET1</button>
            <button id="btn2" class="btn2">GEOMET2</button>
            <button id="btn3" class="btn3">지오메트 첨가제</button>
            <button id="btn4" class="btn4">K-BLACK</button>
            <button id="btn5" class="btn5">PLUS</button>
            <button id="btn6" class="btn6">ML(H),(G)</button>
            <button id="btn7" class="btn7">쇼트볼(SUS)</button>
      </div>
            
      <div class="button-container">
      
<div class="tab">
  <div class="title-container">
    <h2 id="pageTitle">GEOMET1</h2>
  </div>
  <div class="button-group">
<!--     <div class="box1">
      <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
      <label class="daylabel">검색일자 :</label>
      <input type="text" autocomplete="off" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
    </div> -->
     <button id="btn8" class="select-button">
      <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">제품 규격
    </button> 
<!--     <button id="insert-button" class="insert-button">
      <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
    </button> -->
    <button class="delete-button">
      <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
    </button>
    <button class="excel-button">
      <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
    </button>
    <button class="download-button" onclick="downloadFile()">
      <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">download
    </button>
  </div>
</div>
   </div>

   <div class="view">
      <div id="dataTable"></div>
   </div>
   </main>

   <div id="modal1"  class="modal">
      <div class="modal-content">
         <span class="close">&times;</span>
         <h2>GETMET1</h2>
         <form id="corrForm1" enctype="multipart/form-data" autocomplete="off">
         <input type="hidden" name="no" id="form-no">
         <label>가열잔분(불휘발분)</label>
         <label>제품규격</label>
              <input type="text" name="nv_1">
              <label>시험방법</label>
              <input type="text" name="nv_2">
              
              <label>관능</label>
         <label>제품규격</label>
              <input type="text" name="sensuality_1_1">
              <label>시험방법</label>
              <input type="text" name="sensuality_1_2">
              
                            <label>색상</label>
         <label>제품규격</label>
              <input type="text" name="color_1">
              <label>시험방법</label>
              <input type="text" name="color_2">
              
                            <label>관능</label>
         <label>제품규격</label>
              <input type="text" name="sensuality_2_1">
              <label>시험방법</label>
              <input type="text" name="sensuality_2_2">

            <button type="submit" class="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
         </form>
      </div>
      </div>

      <div id="modal2" class="modal">
            <div class="modal-content">
         <span class="close">&times;</span>
         <h2>수입검사 추가2</h2>
         <form id="corrForm2" enctype="multipart/form-data" autocomplete="off">
         <input type="hidden" name="no" id="form-no">
         
         <label>ph</label>
         <label>제품규격</label>
              <input type="text" name="ph_1">
              <label>시험방법</label>
              <input type="text" name="ph_2">
              
              <label>비중</label>
         <label>제품규격</label>
              <input type="text" name="specific_gravity_1">
              <label>시험방법</label>
              <input type="text" name="specific_gravity_2">
              
                            <label>관능</label>
         <label>제품규격</label>
              <input type="text" name="sensuality_1_1">
              <label>시험방법</label>
              <input type="text" name="sensuality_1_2">
              
                            <label>색상</label>
         <label>제품규격</label>
              <input type="text" name="color_1">
              <label>시험방법</label>
              <input type="text" name="color_2">
              
                            <label>관능</label>
         <label>제품규격</label>
              <input type="text" name="sensuality_2_1">
              <label>시험방법</label>
              <input type="text" name="sensuality_2_2">


            <button type="submit" class="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
         </form>
      </div>
      </div>

      <div id="modal3" class="modal">
            <div class="modal-content">
         <span class="close">&times;</span>
         <h2>지오메트 첨가제</h2>
         <form id="corrForm3" enctype="multipart/form-data" autocomplete="off">
         <input type="hidden" name="no" id="form-no">

         <label>APPERANCE</label>
         <label>제품규격</label>
              <input type="text" name="appearance_1">
              <label>시험방법</label>
              <input type="text" name="appearance_2">
              
              <label>비중</label>
         <label>제품규격</label>
              <input type="text" name="specific_gravity_1">
              <label>시험방법</label>
              <input type="text" name="specific_gravity_2">


            <button type="submit" class="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
         </form>
      </div>
   </div>
   
         <div id="modal4" class="modal">
            <div class="modal-content">
         <span class="close">&times;</span>
         <h2>추가</h2>
         <form id="corrForm4" enctype="multipart/form-data" autocomplete="off">
         <input type="hidden" name="no" id="form-no">

         <label>ph</label>
         <label>제품규격</label>
              <input type="text" name="ph_1">
              <label>시험방법</label>
              <input type="text" name="ph_2">
              
              <label>비중</label>
         <label>제품규격</label>
              <input type="text" name="specific_gravity_1">
              <label>시험방법</label>
              <input type="text" name="specific_gravity_2">
              
                            <label>점도</label>
         <label>제품규격</label>
              <input type="text" name="viscosity_1">
              <label>시험방법</label>
              <input type="text" name="viscosity_2">
              
                            <label>색상</label>
         <label>제품규격</label>
              <input type="text" name="color_1">
              <label>시험방법</label>
              <input type="text" name="color_2">
              
                            <label>관능</label>
         <label>제품규격</label>
              <input type="text" name="sensuality_1_1">
              <label>시험방법</label>
              <input type="text" name="sensuality_1_2">


            <button type="submit" class="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
         </form>
      </div>
   </div>
   
         <div id="modal5" class="modal">
            <div class="modal-content">
         <span class="close">&times;</span>
         <h2>쇼트볼(SUS)</h2>
         <form id="corrForm5" enctype="multipart/form-data" autocomplete="off">
         <input type="hidden" name="no" id="form-no">

         <label>심부경도</label>
         <label>제품규격</label>
              <input type="text" name="hardness_1">
              <label>시험방법</label>
              <input type="text" name="hardness_2">
              
              <label>비중</label>
         <label>제품규격</label>
              <input type="text" name="specific_gravity_1">
              <label>시험방법</label>
              <input type="text" name="specific_gravity_2">

            <button type="submit" class="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
         </form>
      </div>
   </div>
      <!-- 모달 뷰어 -->
   <div id="pdfModal" style="display:none; position:fixed; top:10%; left:10%; width:80%; height:80%; background:#fff; border:1px solid #ccc; z-index:10000; overflow:hidden; box-shadow:0 0 10px rgba(0,0,0,0.5);">
     <button id="closePdfModal" style="position:absolute; top:10px; right:10px; z-index:10001;">닫기</button>
     <iframe id="pdfFrame" style="width:100%; height:100%;" frameborder="0"></iframe>
   </div>
   



   <script>
  let now_page_code = "h05";

  var dataTable = null;
  var selectedRowData = null;
  
  let currentPage = "GEOMET1";
  
  //제목 변경
  function updatePageTitle(pageCode) {
      const titleMap = {
         "GEOMET1": "GEOMET1",
         "GEOMET2": "GEOMET2",
         "지오메트 첨가제": "지오메트 첨가제",
         "ML(H),(G)": "ML(H),(G)",
         "PLUS": "PLUS",
         "K-BLACK": "K-BLACK",
         "쇼트볼(SUS)": "쇼트볼(SUS)"
      };
      document.getElementById("pageTitle").innerText = titleMap[pageCode] || pageCode;
   }
  
  //새 창 열어서 배열 크기만큼 요청
  function downloadFile() {
     console.log("다운로드 요청");
       const filenames = [
           "유봉균_표준_수습일지_25.06.16.xls",
           "유봉균_표준_수습일지_25.06.17.xls"
       ];

       filenames.forEach((filename) => {
           const url = "/geomet/downloadFiles?filename=" + encodeURIComponent(filename);
           window.open(url, '_blank');
         });
   }
  
/*   <!-- 모달 뷰어 --> */
  document.getElementById('closePdfModal').addEventListener('click', function(){
        closePdfModal();
      });
      
  function openPdfModal(url) {
      const modal = document.getElementById('pdfModal');
      const iframe = document.getElementById('pdfFrame');
      iframe.src = url;
      modal.style.display = 'block';
    }

    function closePdfModal() {
      const modal = document.getElementById('pdfModal');
      const iframe = document.getElementById('pdfFrame');
      iframe.src = '';
      modal.style.display = 'none';
    }
  
  $("#files").on("change", function () {
      const files = this.files;

      if (files.length > 0) {
          const file = files[0]; 
          const ext = file.name.split('.').pop().toLowerCase();

          if (ext !== 'pdf') {
              alert("⚠️ PDF 파일만 업로드할 수 있습니다.");
              this.value = ''; 
              $("#save_url").val("");
              return;
          }

          console.log("파일 이름:", file.name);
          $("#save_url").val(file.name);

      } else {
          console.log("⚠️ 파일이 선택되지 않았습니다.");
          $("#save_url").val("");
      }
  });
  
  
  
  $(function () {
    // 초기 테이블 생성
    createTable(currentPage);
     
    //파일 url -> 파일 이름
     $('#file_url').on('change', function() {
          const fileInput = this;
          const fileNameInput = $('input[name="file_name"]');

          if (fileInput.files.length > 0) {
            const fileName = fileInput.files[0].name;
            fileNameInput.val(fileName);
          } else {
            fileNameInput.val('');
          }
        });
    
      // 파일 업로드 체크 (PDF만)
      $('#files').on('change', function() {
        var file = this.files[0];
        if (file && file.name.split('.').pop().toLowerCase() !== 'pdf') {
          alert('PDF 파일만 업로드 가능합니다.');
          $(this).val('');
        }
      });

    // 버튼 클릭 시 page 기준으로 테이블 다시 생성
    $("#btn1, #btn2, #btn3, #btn4, #btn5, #btn6, #btn7, #btn8").click(function () {
       currentPage = $(this).text().trim();
       console.log("currentPage: ", currentPage);
      createTable(currentPage);
      updatePageTitle(currentPage);
      
      // 버튼 누를 때 날짜 자동 설정
      const today = new Date();
      const formatted = today.toISOString().slice(0, 10); // yyyy-mm-dd 형식
      $("#startDate").val(formatted);
    });

    // 조건 선택 조회
    $('.select-button').click(function () {
      const sel = $('.dayselect').val();
      const in_day = $('#startDate').val();
      dataTable.setData("/geomet/quality/g1/list");
    });

    // 추가 버튼
    $('#insert-button').click(function () {
       console.log("currentPage", currentPage);
       console.log($("#modal1").length);
       console.log($("#modal1").css("display")); 
      selectedRowData = null;
      $('#corrForm1')[0].reset();
      $('#corrForm2')[0].reset();
      $('#corrForm3')[0].reset();
      $('#corrForm4')[0].reset();
      $('#corrForm5')[0].reset();
      if (currentPage === "GEOMET1") {
           $("#modal1").show().addClass("show");
         } else if (currentPage === "GEOMET2") {
           $("#modal2").show().addClass("show");
         }else if(currentPage === "지오메트 첨가제"){
            $("#modal3").show().addClass("show");
             }else if (currentPage === "ML(H),(G)" || currentPage === "PLUS" || currentPage === "K-BLACK") {
           $("#modal4").show().addClass("show");
         }else if(currentPage === "쇼트볼(SUS)"){
            $("#modal5").show().addClass("show");
             }
    });

    // 삭제 버튼
    $('.delete-button').click(function () {
      if (!selectedRowData) {
        alert('삭제할 행을 먼저 클릭해 주세요.');
        return;
      }
      if (!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;

      $.ajax({
        url: "/geomet/quality/inTest/delete",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ no: selectedRowData.no }),
        success: function (res) {
           if(res === true){
          alert('삭제되었습니다.');
         $('.modal').hide();
          const currentFilter = $('.dayselect').val() || 'ALL';
         dataTable.setData("/geomet/quality/g1/list", { page: currentPage });
          selectedRowData = null;
           }
           else{
              alert('삭제 실패했습니다.');
           }
        },
        error: function () {
          alert('삭제 중 오류가 발생했습니다.');
        }
      });
    });

    // 모달 닫기
    $('.close, #closeModal').click(function () {
      $('.modal').removeClass('show').hide();
    });

    // 저장 버튼
$(document).on('click', '.saveCorrStatus', function (event) {
  event.preventDefault();

  const $form = $(this).closest('form'); // 클릭된 버튼 기준으로 form 찾기
  const formData = new FormData($form[0]);
  formData.append("page", currentPage);
      
/*       if (selectedRowData && selectedRowData.no) {
        formData.append('no', selectedRowData.no);
      } */
      $.ajax({
         url: "/geomet/quality/inTest/insert",
         type: "POST",
         data: formData,
         processData: false,
         contentType: false,
         success: function (res) {
           if (res === true) {
             alert("저장되었습니다!");
             $('.modal').hide();

             const currentFilter = $('.dayselect').val() || 'ALL';
             dataTable.setData("/geomet/quality/g1/list", { page: currentPage, in_day: $('#startDate').val() });
             selectedRowData = null;
           } else {
             alert("저장 실패: " + res.message);
           }
         },
         error: function () {
           alert('서버 오류로 저장 중 실패했습니다.');
         }
       });
    });

  });

  let columns = [];
  
  //  테이블 생성 함수
  function createTable(pageValue) {
    if (dataTable) dataTable.destroy();



    if (pageValue === "GEOMET1") {
      columns = [
        { title: "시험항목", field: "page", width: 100, hozAlign: "center"},
        { title: "no", field: "no", width: 100, hozAlign: "center", visible: false },
        { title: "update_date", field: "", width: 100, hozAlign: "center", visible: false },
        {
            title: "가열잔분(불휘발분)",
            columns: [
              { title: "제품규격", field: "nv_1", width: 140, hozAlign: "center", editor: "input"  },
              { title: "시험방법", field: "nv_2", width: 140, hozAlign: "center", editor: "input"  }
            ]
          },
          {
              title: "관능",
              columns: [
                { title: "제품규격", field: "sensuality_1_1", width: 140, hozAlign: "center", editor: "input"  },
                { title: "시험방법", field: "sensuality_1_2", width: 140, hozAlign: "center", editor: "input"  }
              ]
            },
            {
                title: "색상",
                columns: [
                  { title: "제품규격", field: "color_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "color_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
              {
                  title: "관능",
                  columns: [
                    { title: "제품규격", field: "sensuality_2_1", width: 140, hozAlign: "center", editor: "input"  },
                    { title: "시험방법", field: "sensuality_2_2", width: 140, hozAlign: "center", editor: "input"  }
                  ]
                }
      ];
    } else if (pageValue === "GEOMET2") {
        columns = [
            { title: "시험항목", field: "page", width: 100, hozAlign: "center"},
            { title: "no", field: "no", width: 100, hozAlign: "center", visible: false },
            { title: "update_date", field: "", width: 100, hozAlign: "center", visible: false },
            {
                title: "ph",
                columns: [
                  { title: "제품규격", field: "ph_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "ph_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
            {
                title: "비중",
                columns: [
                  { title: "제품규격", field: "specific_gravity_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "specific_gravity_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
              {
                  title: "관능",
                  columns: [
                    { title: "제품규격", field: "sensuality_1_1", width: 140, hozAlign: "center", editor: "input"  },
                    { title: "시험방법", field: "sensuality_1_2", width: 140, hozAlign: "center", editor: "input"  }
                  ]
                },
                {
                    title: "색상",
                    columns: [
                      { title: "제품규격", field: "color_1", width: 140, hozAlign: "center", editor: "input"  },
                      { title: "시험방법", field: "color_2", width: 140, hozAlign: "center", editor: "input"  }
                    ]
                  },
                  {
                      title: "관능",
                      columns: [
                        { title: "제품규격", field: "sensuality_2_1", width: 140, hozAlign: "center", editor: "input"  },
                        { title: "시험방법", field: "sensuality_2_2", width: 140, hozAlign: "center", editor: "input"  }
                      ]
                    }
          ];
    } else if (pageValue === "지오메트 첨가제") {
        columns = [
            { title: "시험항목", field: "page", width: 100, hozAlign: "center" },
            { title: "no", field: "no", width: 100, hozAlign: "center", visible: false },
            { title: "update_date", field: "", width: 100, hozAlign: "center", visible: false },
            {
                title: "APPERANCE",
                columns: [
                  { title: "제품규격", field: "apperance_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "apperance_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
            {
                title: "비중",
                columns: [
                  { title: "제품규격", field: "specific_gravity_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "specific_gravity_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              }
          ];
    }
    else if (pageValue === "K-BLACK" || pageValue === "PLUS" || pageValue === "ML(H),(G)") {
        columns = [
            { title: "시험항목", field: "page", width: 100, hozAlign: "center" },
            { title: "no", field: "no", width: 100, hozAlign: "center", visible: false },
            { title: "update_date", field: "", width: 100, hozAlign: "center", visible: false },
            {
                title: "ph",
                columns: [
                  { title: "제품규격", field: "ph_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "ph_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
            {
                title: "비중",
                columns: [
                  { title: "제품규격", field: "specific_gravity_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "specific_gravity_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
              {
                  title: "점도",
                  columns: [
                    { title: "제품규격", field: "viscosity_1", width: 140, hozAlign: "center", editor: "input"  },
                    { title: "시험방법", field: "viscosity_2", width: 140, hozAlign: "center", editor: "input"  }
                  ]
                },
                {
                    title: "색상",
                    columns: [
                      { title: "제품규격", field: "color_1", width: 140, hozAlign: "center", editor: "input"  },
                      { title: "시험방법", field: "color_2", width: 140, hozAlign: "center", editor: "input"  }
                    ]
                  },
                  {
                      title: "가열잔분(불휘발분)",
                      columns: [
                        { title: "제품규격", field: "nv_1", width: 140, hozAlign: "center", editor: "input"  },
                        { title: "시험방법", field: "nv_2", width: 140, hozAlign: "center", editor: "input"  }
                      ]
                    }
          ];
    }
    else if (pageValue === "쇼트볼(SUS)") {
        columns = [
           { title: "시험항목", field: "page", width: 100, hozAlign: "center" },
            {
                title: "심부경도",
                columns: [
                  { title: "제품규격", field: "hardness_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "hardness_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
              {
                  title: "쇼트볼 넓이",
                  columns: [
                    { title: "제품규격", field: "short_1", width: 140, hozAlign: "center", editor: "input"  },
                    { title: "시험방법", field: "short_2", width: 140, hozAlign: "center", editor: "input"  }
                  ]
                }
          ];
    }else if (pageValue === "제품 규격") {
        columns = [
            { title: "시험항목", field: "page", width: 100, hozAlign: "center"},
            {
                title: "가열잔분(불휘발분)",
                columns: [
                  { title: "제품규격", field: "nv_1", width: 140, hozAlign: "center", editor: "input" },
                  { title: "시험방법", field: "nv_2", width: 140, hozAlign: "center", editor: "input" }
                ]
              },
              {
                  title: "관능",
                  columns: [
                    { title: "제품규격", field: "sensuality_1_1", width: 140, hozAlign: "center", editor: "input"  },
                    { title: "시험방법", field: "sensuality_1_2", width: 140, hozAlign: "center", editor: "input"  }
                  ]
                },
                {
                    title: "관능",
                    columns: [
                      { title: "제품규격", field: "sensuality_2_1", width: 140, hozAlign: "center", editor: "input"  },
                      { title: "시험방법", field: "sensuality_2_2", width: 140, hozAlign: "center", editor: "input"  }
                    ]
                  },
                  {
                      title: "색상",
                      columns: [
                        { title: "제품규격", field: "color_1", width: 140, hozAlign: "center", editor: "input"  },
                        { title: "시험방법", field: "color_2", width: 140, hozAlign: "center", editor: "input"  }
                      ]
                    },
                    {
                        title: "ph",
                        columns: [
                          { title: "제품규격", field: "ph_1", width: 140, hozAlign: "center", editor: "input"  },
                          { title: "시험방법", field: "ph_2", width: 140, hozAlign: "center", editor: "input"  }
                        ]
                      },
                      {
                          title: "비중",
                          columns: [
                            { title: "제품규격", field: "specific_gravity_1", width: 140, hozAlign: "center", editor: "input"  },
                            { title: "시험방법", field: "specific_gravity_2", width: 140, hozAlign: "center", editor: "input"  }
                          ]
                        },
                        {
                            title: "APPERANCE",
                            columns: [
                              { title: "제품규격", field: "apperance_1", width: 140, hozAlign: "center", editor: "input"  },
                              { title: "시험방법", field: "apperance_2", width: 140, hozAlign: "center", editor: "input"  }
                            ]
                          },
                          {
                              title: "점도",
                              columns: [
                                { title: "제품규격", field: "viscosity_1", width: 140, hozAlign: "center", editor: "input"  },
                                { title: "시험방법", field: "viscosity_2", width: 140, hozAlign: "center", editor: "input"  }
                              ]
                            },
            {
                title: "심부경도",
                columns: [
                  { title: "제품규격", field: "hardness_1", width: 140, hozAlign: "center", editor: "input"  },
                  { title: "시험방법", field: "hardness_2", width: 140, hozAlign: "center", editor: "input"  }
                ]
              },
              {
                  title: "쇼트볼 넓이",
                  columns: [
                    { title: "제품규격", field: "short_1", width: 140, hozAlign: "center", editor: "input"  },
                    { title: "시험방법", field: "short_2", width: 140, hozAlign: "center", editor: "input"  }
                  ]
                }
          ];
    }

    dataTable = new Tabulator("#dataTable", {
      height: '790px',
      layout: 'fitDataFill',
      headerSort: false,
      reactiveData: true,
      columnHeaderVertAlign: "middle",
      rowVertAlign: "middle",
      headerHozAlign: 'center',
      ajaxConfig: { method: 'GET' },
      ajaxURL: "/geomet/quality/g1/list",
      ajaxParams: { page: pageValue },
      placeholder: "조회된 데이터가 없습니다.",
      columns: columns,

      rowClick: function (e, row) {
        $('#dataTable .tabulator-row').removeClass('row_select');
        row.getElement().classList.add('row_select');
        selectedRowData = row.getData();
      },

      rowDblClick: function (e, row) {
        const d = row.getData();
        selectedRowData = d;
       console.log("no: ",d.no );
        $('#corrForm1')[0].reset();
        $('#corrForm2')[0].reset();
        $('#corrForm3')[0].reset();
        $('#corrForm4')[0].reset();
        $('#corrForm5')[0].reset();
        $('input[name="no"]').val(d.no);
        $('input[name="in_day"]').val(d.in_day);
        $('input[name="supplier"]').val(d.supplier);
        $('input[name="medicine"]').val(d.medicine);
        $('input[name="nv_1"]').val(d.nv_1);
        $('input[name="nv_2"]').val(d.nv_2);
        $('input[name="color_1"]').val(d.color_1);
        $('input[name="color_2"]').val(d.color_2);
        $('input[name="sensuality_1_1"]').val(d.sensuality_1_1);
        $('input[name="sensuality_2_1"]').val(d.sensuality_2_1);
        $('input[name="sensuality_1_2"]').val(d.sensuality_1_2);
        $('input[name="sensuality_2_2"]').val(d.sensuality_2_2);
        $('input[name="file_name"]').val(d.file_name);
        $('input[name="confirm"]').val(d.confirm);
        $('input[name="writer"]').val(d.writer);
        $('input[name="ph_1"]').val(d.ph_1);
        $('input[name="ph_2"]').val(d.ph_2);
        $('input[name="specific_gravity_1"]').val(d.specific_gravity_1);
        $('input[name="specific_gravity_2"]').val(d.specific_gravity_2);
        $('input[name="viscosity_1"]').val(d.viscosity_1);
        $('input[name="viscosity_2"]').val(d.viscosity_2);
        $('input[name="hardness_1"]').val(d.hardness_1);
        $('input[name="hardness_2"]').val(d.hardness_2);
        $('input[name="short_1"]').val(d.short_1);
        $('input[name="short_2"]').val(d.short_2);
        $('input[name="appearance_1"]').val(d.appearance_1);
        $('input[name="appearance_2"]').val(d.appearance_2);
        $('input[name="result"]').val(d.result);
        $('input[name="update_id"]').val(d.update_id);

        //$('#modalContainer').show().addClass('show');
            if (currentPage === "GEOMET1") {
           $("#modal1").show().addClass("show");
         } else if (currentPage === "GEOMET2") {
           $("#modal2").show().addClass("show");
         } else if (currentPage === "지오메트 첨가제") {
           $("#modal3").show().addClass("show");
         } else if (currentPage === "쇼트볼(SUS)") {
           $("#modal5").show().addClass("show");
         } else{
           $("#modal4").show().addClass("show");
         }
      },

      //셀 수정 후 즉시 업데이트
      cellEdited: function(cell){
         const row = cell.getRow().getData();
         const field = cell.getField();
         const newValue = cell.getValue();
         
         console.log("수정된 셀:",{
              no: row.no,
              field: field,
              value: newValue
         }),
         
          $.ajax({
              url: "/geomet/quality/inTest/update",
              type: "POST",
              contentType: "application/json",
              data: JSON.stringify({ no: row.no,
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
      }
    });
  }
  
  //페이지 로드 시 startDate에 오늘 날짜 세팅
  window.addEventListener("DOMContentLoaded", function () {
       const startDateInput = document.getElementById("startDate");
       if (startDateInput && !startDateInput.value) {
         const today = new Date();
         const formatted = today.toISOString().slice(0, 10); // yyyy-mm-dd
         startDateInput.value = formatted;
       }
     });
  
  // 엑셀 다운로드 버튼(해당 날짜의 모든 테이블 엑셀로 출력)
  $(".excel-button").on("click", function () {
       $("#excelOverlay, #excelLoading").show();

       const pages = ["G1", "G2", "ML(G)", "ML(H)", "PLUS", "K-BLACK"];
       const in_day = $("#startDate").val();

       pages.forEach((page, index) => {
           setTimeout(() => {
               $.ajax({
                   url: "/geomet/quality/inTest/excel",
                   method: "POST",
                   contentType: "application/json",
                   data: JSON.stringify({ page: page, in_day: in_day }), // page, in_day 기준으로 컨트롤러에서 데이터 조회
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
                   }
               });
           }, index * 1500); // 1.5초 간격으로 요청 (브라우저 안정성 확보)
       });
   });




</script>


</body>
</html>
