<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스페어 이력관리</title>
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
            width: 95%;
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
	.where_bt {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	    transition: background-color 0.2s, border-color 0.2s; /* 부드러운 효과 */
	}
	
	.where_bt:hover {
	    background-color: rgb(240, 240, 240); /* 호버 시 배경색 */
	    border-color: rgb(30, 30, 30);       /* 호버 시 테두리 색 */
	}
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	          <!--  <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">검색일자 :</label>
				<input type="text" autocomplete="off" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid"  style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택"> -->
	
	            <label class="daylabel">설비명 :</label>
	<select class="dayselect">
	    <option value="ALL">전체</option>
	    <option value="600톤">600톤</option>
	    <option value="800톤">800톤</option>
	    <option value="G800">G800</option>
	    <option value="K-BLACK">K-BLACK</option>
	    <option value="공용설비">공용설비</option>
	    <option value="기타">기타</option>
	    <option value="설비추가">설비추가</option>
	    <option value="쇼트 1호기">쇼트 1호기</option>
	    <option value="쇼트 2호기">쇼트 2호기</option>
	    <option value="쇼트 3호기">쇼트 3호기</option>
	    <option value="쇼트 4호기">쇼트 4호기</option>
	    <option value="쇼트 5호기">쇼트 5호기</option>
	    <option value="쇼트 6호기">쇼트 6호기</option>
	    <option value="쇼트 자동화 레일">쇼트 자동화 레일</option>
	    <option value="지오메트 자동화 레일">지오메트 자동화 레일</option>
	</select>


		         <label class="daylabel">검색 :</label>
		<input type="text" autocomplete="off" class="monthSet" id="startDate"
		       style="font-size: 16px; height: 28px; width: 150px; 
				margin-bottom: 10px;
		              border: 1px solid #ccc; border-radius: 4px; "
		       placeholder="시작 날짜 선택">

			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
            	<button class="where_bt ">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">스페어 부품 관리
                </button>
                           
                           
  
            </div>
        </div>

        <div class="view">
            <div id="dataTable"></div>
        </div>
    </main>
	


<script>

let now_page_code = "h05";


  var dataTable;
  var selectedRowData = null;



  
  $(function() {

	    // 오늘 날짜 기준 월을 yyyy-MM 형태로 반환
	    function getMonthStr() {
	        const today = new Date();
	        const yyyy = today.getFullYear();
	        const mm = String(today.getMonth() + 1).padStart(2, '0');
	        return `${yyyy}-${mm}`;
	    }

	    const todayStr = new Date().toISOString().slice(0, 7);

	    // startDate input에 오늘 날짜 기본값 세팅
	    $('#startDate').val(todayStr);

	    var dataTable = new Tabulator('#dataTable', {
	        height: '790px',
	        layout: 'fitDataFill',
	        headerSort: false,
	        columnHeaderVertAlign: "middle",
	        rowVertAlign: "middle",
	        reactiveData: true,
	        headerHozAlign: 'center',
	        ajaxConfig: { method: 'POST' },
	        ajaxURL: "/geomet/machine/spareStatus/list",
	        ajaxParams: { 
	            mch_name: $('.dayselect').val() || 'ALL',
	            month: $('#startDate').val().slice(0,7) || getMonthStr() // yyyy-MM
	        },
	        placeholder: "조회된 데이터가 없습니다.",
	        columns: [
	            { title: "NO", field: "id", hozAlign: "center", width: 70 },
	            { title: "대상 설비(3)", field: "equipment_name", hozAlign: "center", width: 180 },
	            { title: "부품명(8)", field: "category_sub", hozAlign: "center", width: 180 },
	            { title: "사용처(7)", field: "category_mid", hozAlign: "left", width: 200 },
	            { title: "규격(15)", field: "part_name", hozAlign: "left", width: 200 },
	            { title: "제작 업체(22)", field: "manufacturer", hozAlign: "right", width: 130 },
	            { title: "교체(입력)</br>상시 / 정기", field: "", hozAlign: "right", width: 130 },
	            { title: "구매주기</br>월/반기/년(27)", field: "", hozAlign: "right", width: 130 },
	            { title: "현재고(27)", field: "current_stock", hozAlign: "right", width: 130 },
	            { title: "안전재고(26)", field: "safety_stock", hozAlign: "right", width: 130 },
	            { title: "구매 필요수량(26-27)</br>외주 / 자체", field: "purchase_qty", hozAlign: "right", width: 130 }
	           
	        ],
	        rowClick: function(e, row) {
	            $('#dataTable .tabulator-row').removeClass('row_select');
	            row.getElement().classList.add('row_select');
	            selectedRowData = row.getData();
	        },
	        rowDblClick: function(e, row) {
	            var d = row.getData();
	            selectedRowData = d;
	            $('#corrForm')[0].reset();
	            $('input[name="no"]').val(d.no);
	            $('select[name="mch_name"]').val(d.mch_name);
	            $('#modalContainer').show().addClass('show');
	        }
	    });

	    // 조회 버튼
	    $('.select-button').click(function() {
	        const selMch = $('.dayselect').val() || 'ALL';
	        const selMonth = $('#startDate').val().slice(0,7) || getMonthStr(); // yyyy-MM
	        dataTable.setData("/geomet/machine/spareStatus/list", { 
	            mch_name: selMch,
	            month: selMonth
	        });
	    });

	    // 소모품 관리 버튼 클릭
	    $('.where_bt').click(function() {
	        const selMch = $('.dayselect').val() || 'ALL';
	        const selMonth = $('#startDate').val().slice(0,7) || getMonthStr();

	        dataTable.setData("/geomet/machine/spareStatus/list", { 
	            mch_name: selMch,
	            month: selMonth,
	            where_bt: '조건'  // MyBatis에서 <if test="where_bt == '조건'"> 적용
	        });
	    });
	    

	    // 신규 추가
	    $('.insert-button').click(function() {
	        selectedRowData = null;
	        $('#corrForm')[0].reset();
	        $('#modalContainer').show().addClass('show');
	    });

	    // 모달 닫기
	    $('.close, #closeModal').click(function() {
	        $('#modalContainer').removeClass('show').hide();
	    });

	    // 저장
	    $('#saveCorrStatus').click(function(event) {
	        event.preventDefault();
	        var formData = new FormData($('#corrForm')[0]);
	        if (selectedRowData && selectedRowData.no) {
	            formData.append('no', selectedRowData.no);
	        }
	        $.ajax({
	            url: "/geomet/machine/spareStatus/insert",
	            type: "POST",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function() {
	                alert("저장되었습니다!");
	                $('#modalContainer').hide();
	                const currentFilter = $('.dayselect').val() || 'ALL';
	                const currentMonth = $('#startDate').val().slice(0,7) || getMonthStr();
	                dataTable.setData("/geomet/machine/spareStatus/list", { 
	                    mch_name: currentFilter,
	                    month: currentMonth
	                });
	                selectedRowData = null;
	            },
	            error: function() {
	                alert('저장 중 오류가 발생했습니다.');
	            }
	        });
	    });

	});


</script>


</body>
</html>
