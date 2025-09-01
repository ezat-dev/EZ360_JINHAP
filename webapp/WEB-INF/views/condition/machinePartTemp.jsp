<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비별 액 관리</title>
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
           height: 47vh; 
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
    width: 96px;
    height: 40px;
    padding: 0 19px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-bottom: 14px;
    margin-left: 15px;
    font-size: 14px;
}

  .pCodeBtn.active {
    background-color: #ccc;  /* 진한 회색 */
    font-weight: bold;
  }
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">        

            <div class="button-container">
            
               <div class="box1">
               
              <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
              <label class="monthlabel">조건관리 :</label>
            <input type="text"autocomplete="off" class="monthSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">

               <label class="daylabel">설비명 :</label>
           <select id="mch_code" class="mch_code">
             
                <option value="G03-GG01">G800조건관리</option>
                <option value="G03-GG03">G600조건관리</option>
                <option value="G04-GG07">공용관리</option>
                <option value="G04-GG05">K-BLACK조건관리</option>

            </select>
            
                             <div class="tab" id="pCodeButtonContainer">
               <button class="pCodeBtn active" data-pcode="p_1">
               <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">액탱크1</button>
               <button class="pCodeBtn" data-pcode="p_2">
               <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">액탱크2</button>
               <button class="pCodeBtn" data-pcode="p_3">
               <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">액탱크3</button>
               <button class="pCodeBtn" data-pcode="p_4">
               <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">액탱크4</button>
             
             
             
	          <!--    <button type="button" class="select-button"  style="display: none;">
	                <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
	            </button> -->

                
             
             
              </div>
                 <button class="excel-button">
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
           <h2>조건관리 일지</h2>
           <form id="corrForm"autocomplete="off">
   
            <label>일자</label>
            <input type="text" name="date" placeholder="일자 선택" style="text-align: left;" autocomplete="off"readonly>
            
            
                <label>점검 항목</label>
                <input type="text" name="filed" placeholder="filed" style="text-align: left; display: none;" autocomplete="off" readonly>

                <input type="text"name="title" placeholder="title" style="text-align: left;" autocomplete="off"readonly>
          
            <label>내용</label>
             <input type="text" name="value" >
             <input type="text" name="id"readonly style="display: none;">
   
               <button type="submit" id="saveCorrStatus">저장</button>
               <button type="button" id="closeModal">닫기</button>
           </form>
       </div>
   </div>
   

<script>
let now_page_code = "c02";

  $(function () {
    var now    = new Date();
    var year   = now.getFullYear();
    var month  = String(now.getMonth() + 1).padStart(2, '0');
    var yearMonth = year + '-' + month;

    $('#startDate').val(yearMonth).attr('placeholder', yearMonth);

    $('.insert-button').click(function(){ toggleModal(true); });
    $('.close, #closeModal').click(function(){ toggleModal(false); });

    $('#saveCorrStatus').click(handleFormSubmit);

    $('.select-button').click(handleSelectButtonClick);

    getDataList(yearMonth);
  });
  
  var p_code;   //최근에 누른 버튼 번호 저장
  
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
});

  var defaultColumns = [

/*      tank_temp: 38°C 초과 시 빨간색

     visocosity: 30초 미만 또는 50초 초과 시 빨간색 (기준: 40±10초)

     specific_gravity: 1.38 미만 또는 1.48 초과 시 빨간색 (기준: 1.43±0.05)

     chiller_temp: 8 미만 또는 12 초과 시 빨간색 (기준: 10±2℃)
 */
     
     { title: '일자', field: 'date', width: 200, hozAlign: 'center' },
     { title: '주간/야간', field: 'b_a', width: 200, hozAlign: 'center' },

     { title: '액탱크 온도(38°C이하)', field: 'tank_temp', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value > 38) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: '점도(40±10초)', field: 'visocosity', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 30 || value > 50) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: '비중(1.43±0.05)', field: 'specific_gravity', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 1.38 || value > 1.48) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: '칠러 온도(10±2℃)', field: 'chiller_temp', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 8 || value > 12) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: 'id', field: 'id', hozAlign: 'center', visible: false },
     { title: 'mch_code', field: 'mch_code', hozAlign: 'center', visible: false },
     { title: 'mch_name', field: 'mch_name', hozAlign: 'center', visible: false }
   ];


  var plColumns = [
     { title: '일자', field: 'date', width: 200, hozAlign: 'center' },
     { title: '주간/야간', field: 'b_a', width: 200, hozAlign: 'center' },

     { title: '액탱크 온도(20±10℃)', field: 'tank_temp', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 10 || value > 30) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         }
         return value;
       }
     },

     { title: '점도(25±5초)', field: 'visocosity', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 20 || value > 30) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         }
         return value;
       }
     },

     { title: '비중(1.075~0.075)', field: 'specific_gravity', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 1.000 || value > 1.150) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         }
         return value;
       }
     },

     { title: '칠러 온도(15±1.5℃)', field: 'chiller_temp', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 13.5 || value > 16.5) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         }
         return value;
       }
     },

     { title: 'id', field: 'id', hozAlign: 'center', visible: false },
     { title: 'mch_code', field: 'mch_code', hozAlign: 'center', visible: false },
     { title: 'mch_name', field: 'mch_name', hozAlign: 'center', visible: false }
   ];


  var mlColumns = [

   /*   tank_temp: 10℃ 미만 또는 30℃ 초과일 때 빨간색 (기준: 20±10℃)
   
     visocosity: 30초 미만 또는 40초 초과일 때 빨간색 (기준: 35±5초)
   
     specific_gravity: 1.0 미만 또는 1.15 초과일 때 빨간색 (기준: 1.075±0.075)
   
     chiller_temp: 13.5℃ 미만 또는 16.5℃ 초과일 때 빨간색 (기준: 15±1.5℃) */

     
     { title: '일자', field: 'date', width: 200, hozAlign: 'center' },
     { title: '근무조', field: 'b_a', width: 200, hozAlign: 'center' },

     { title: '액탱크 온도(38°C이하)', field: 'tank_temp', width: 200, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value > 38) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: 'PLUS 점도(25±10초)', field: 'visocosity', width: 200, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 15 || value > 35) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },
     { title: 'ML 점도(35±10초)', field: 'visocosity1', width: 200, hozAlign: 'center',
         formatter: function(cell) {
           var value = parseFloat(cell.getValue());
           if (value < 25 || value > 45) {
             return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
           } else {
             return value;
           }
         }
       },

     { title: 'ML 비중(1.075±0.075)', field: 'specific_gravity', width: 200, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 1.0 || value > 1.15) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },
     { title: 'PLUS 비중(1.08±0.04)', field: 'specific_gravity1', width: 200, hozAlign: 'center',
         formatter: function(cell) {
           var value = parseFloat(cell.getValue());
           if (value < 1.04 || value > 1.12) {
             return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
           } else {
             return value;
           }
         }
       },

     { title: '칠러 온도(15±1.5℃)', field: 'chiller_temp', width: 200, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 13.5 || value > 16.5) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: 'id', field: 'id', hozAlign: 'center', visible: false },
     { title: 'mch_code', field: 'mch_code', hozAlign: 'center', visible: false },
     { title: 'mch_name', field: 'mch_name', hozAlign: 'center', visible: false }
   ];


  var g04Columns = [

/*      tank_temp: 10℃ 미만 또는 30℃ 초과 시 빨간색 (20±10℃)

     visocosity: 43초 미만 또는 53초 초과 시 빨간색 (48±5초)
   
     specific_gravity: 1.050 미만 또는 1.150 초과 시 빨간색 (1.050~1.150)
   
     chiller_temp: 20℃ 초과 시 빨간색 (최대 20℃) */
     
     { title: '일자', field: 'date', width: 200, hozAlign: 'center' },
     { title: '작업 시간', field: 'b_a', width: 200, hozAlign: 'center' },
     
     { title: '액탱크 온도(38°C이하))', field: 'tank_temp', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value > 38) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: '점도(44±11초)', field: 'visocosity', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 33 || value > 55) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: '비중(1.050~1.150)', field: 'specific_gravity', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value < 1.050 || value > 1.150) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: '칠러 온도(Max 20℃)', field: 'chiller_temp', width: 310, hozAlign: 'center',
       formatter: function(cell) {
         var value = parseFloat(cell.getValue());
         if (value > 20) {
           return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
         } else {
           return value;
         }
       }
     },

     { title: 'id', field: 'id', hozAlign: 'center', visible: false },
     { title: 'mch_code', field: 'mch_code', hozAlign: 'center', visible: false },
     { title: 'mch_name', field: 'mch_name', hozAlign: 'center', visible: false }
   ];


  var dataTable;

  function getDataList(initialMonth) {
    var startDate = initialMonth || $('#startDate').val() || '';
    if (startDate.length >= 7) { startDate = startDate.substring(0, 7); }
    var mch_code = $('.mch_code').val() || '';

    var cols = defaultColumns;
    if (mch_code === 'PL')           cols = plColumns;
    else if (mch_code === 'ML')      cols = mlColumns;
    else if (mch_code === 'G04-GG05') cols = g04Columns;

    if (!dataTable) {
      dataTable = new Tabulator('#dataTable', {
        height: '790px',
        layout: 'fitDataFill',
        layoutColumnsOnNewData: true,
        headerSort: false,
        selectableRangeMode: 'click',
        reactiveData: true,
        headerHozAlign: 'center',
        ajaxConfig: { method: 'POST' },
        ajaxURL: '/geomet/condition/machinePartTemp/list',
        ajaxParams: { startDate: startDate, mch_code: mch_code, p_code: 'p_1'},//페이지 로딩될 때 액탱크1 조회됨
        placeholder: '조회된 데이터가 없습니다.',
        paginationSize: false,
        ajaxResponse: function(url, params, response){ return response; },
        dataLoaded: function(){ $('#dataTable .tabulator-col.tabulator-sortable').css('height','29px'); },
        columns: cols,
        cellClick: function(e, cell){ },
        cellDblClick: function(e, cell){
            var field   = cell.getField();
            var rowData = cell.getRow().getData();

            if (field !== 'date') {
              var title  = cell.getColumn().getDefinition().title;
              var value  = cell.getValue();
              var rowId  = rowData.id;
              var date   = rowData.date;

              console.log(
                '필드: '  + field  + ', ' +
                title     + ': '    + value + ', ' +
                'id: '    + rowId  + ', ' +
                '일자: '  + date
              );

  
              $('#modalContainer').show().addClass('show');
              $('#corrForm input[name="date"]').val(date);
              $('#corrForm input[name="filed"]').val(field);
              $('#corrForm input[name="title"]').val(title);
              $('#corrForm input[name="value"]').val(value);
              $('#corrForm input[name="id"]').val(rowId);
            }
          }
      });
    } else {
      dataTable.setColumns(cols);
      dataTable.setData('/geomet/condition/machinePartTemp/list', { startDate: startDate, mch_code: mch_code }, { method: 'POST' });
    }
  }

//Ajax로 데이터만 교체
  function loadData() {
   console.log("데이터만 교체할 때 p_code:", p_code);
      $.ajax({
          url: "/geomet/condition/machinePartTemp/list",
          type: "POST",
          dataType: "json",
          data: {
              startdate: $("#startdate").val() || "",
              mch_code: $("#mch_code").val() || "",
              p_code: p_code
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
    var startDate = $('#startDate').val() || '';
    if (startDate.length >= 7) { startDate = startDate.substring(0, 7); }
    var mch_code = $('.mch_code').val() || '';

    // 컬럼 선택
    var cols = defaultColumns;
    if (mch_code === 'PL')           cols = plColumns;
    else if (mch_code === 'ML')      cols = mlColumns;
    else if (mch_code === 'G04-GG05') cols = g04Columns;

    dataTable.setColumns(cols);
    dataTable.setData('/geomet/condition/machinePartTemp/list', { startDate: startDate, mch_code: mch_code }, { method: 'POST' });
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
       
       p_code = 'p_1'; //기본 p_code 액탱크1로 설정

       // 👉 버튼 스타일 토글
       $('.pCodeBtn').removeClass('active');
       $(".pCodeBtn[data-pcode='p_1']").show().addClass('active'); //기본으로 액탱크1 진한 회색

       var startDate = $('#startDate').val();
       var mch_code = $('.mch_code').val();

       console.log(' p_code:', p_code);
       console.log(' startDate:', startDate);
       console.log(' mch_code:', mch_code);

       if (!startDate) {
           alert('날짜를 선택하세요');
           return;
       }

       var cols = defaultColumns;
       if (mch_code === 'PL')           cols = plColumns;
       else if (mch_code === 'G04-GG07')      cols = mlColumns; //공용관리
       else if (mch_code === 'G04-GG05') cols = g04Columns; //K-BLACK
       console.log("cols", cols);

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
               dataTable.setColumns(cols);
               dataTable.setData(data);
           },
           error: function () {
               alert('데이터 조회 중 오류 발생');
           }
       });
     });
   });

</script>


</body>
</html>