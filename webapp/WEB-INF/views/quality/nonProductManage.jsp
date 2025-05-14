<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>품질관리-부적합품 관리</title>
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
		
		.modal-content {
		    background: white;
		    width: 40%; /* 가로 길이를 50%로 설정 */
		    max-width: 400px; /* 최대 너비를 설정하여 너무 커지지 않도록 */
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
		 .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        
        .radio-group {
		  display: flex;
		  gap: 20px;
		  margin-bottom: 15px;
		  align-items: center;
		}
		
		.radio-group label {
		  display: flex;
		
		  gap: 5px;
		  font-size: 18px;
		  padding: 4px 8px;
		  border: 1px solid #ccc;
		  border-radius: 6px;
		  cursor: pointer;
		  transition: all 0.2s;
		}
		
		.radio-group input[type="radio"] {
		  accent-color: #007bff; /* 파란색 포인트 */
		  cursor: pointer;
		}
		
		.radio-group label:hover {
		  background-color: #f0f0f0;
		  border-color: #007bff;
		}

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
             <div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
           <label class="daylabel">검색일자 :</label>
			<input type="text" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
			
			<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>

			<input type="text" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">

            <label class="daylabel">설비명 :</label>
            <select class="dayselect equipment_name_select " id="equipment_name">

            </select>
			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>

                <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
				
				<button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button>
            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>


<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>교체이력 등록</h2>
        <form  id="corrForm"  autocomplete="off">
            <label>발생일</label>
            <input type="text"name="defect_date"  class="daySet" placeholder="날짜 선택" style="text-align: left;">
            <label>불량유형</label>
			<select name="defect_type">
			    <option value="액고임">액고임</option>
			    <option value="이종혼입">이종혼입</option>
			    <option value="녹 발생">녹 발생</option>
			    <option value="코팅 문제">코팅 문제</option>
			    <option value="이물질">이물질</option>
			    <option value="색상 이상">색상 이상</option>
			    <option value="크랙">크랙</option>
			    <option value="찍힘">찍힘</option>
			    <option value="기타">기타</option>
			</select>


            <label>발생설비</label>
			<select name="equipment" >
			    <option value="탈유탈지 1호기">탈유탈지 1호기</option>
			    <option value="탈유탈지 2호기">탈유탈지 2호기</option>
			    <option value="쇼트1호기">쇼트1호기</option>
			    <option value="쇼트2호기">쇼트2호기</option>
			    <option value="쇼트3호기">쇼트3호기</option>
			    <option value="쇼트4호기">쇼트4호기</option>
			    <option value="쇼트5호기">쇼트5호기</option>
			    <option value="쇼트6호기">쇼트6호기</option>
			    <option value="G-600">G-600</option>
			    <option value="G-800">G-800</option>
			    <option value="공용설비">공용설비</option>
			    <option value="K-BLACK">K-BLACK</option>
			    <option value="E코팅 1호기">E코팅 1호기</option>
			    <option value="E코팅 2호기">E코팅 2호기</option>
			    <option value="방청">방청</option>
			</select>


            <label>품번</label>
            <input type="text"  name="product_no" placeholder="품번 입력">

            <label>품명</label>
            <input type="text"  name="product_name" placeholder="품명 입력">

            <label>불량로트</label>
            <input type="text" name="defect_lot" placeholder="불량로트 입력">

            <label>작업자</label>
            <input type="text"  name="worker" placeholder="작업자 입력">

            <label>조치사항</label>
            <textarea rows="3"  name="action"placeholder="조치사항 입력"></textarea>

            <label>선별방법</label>
            <input type="text"   name="selection_method" placeholder="선별방법 입력">

            <label>조치완료일(일자기록)</label>
   			<input type="text"  name="action_date" class="daySet" placeholder="조치완료일 선택" style="text-align: left;">
   			
   			
            <label>불량수량(EA)</label>
            <input type="number"  name="defect_quantity" placeholder="불량수량 입력">

            <label>발생원인</label>
            <input type="text"  name="cause" placeholder="발생원인 입력">

            <label>개선대책</label>
            <input type="text"  name="improvement" placeholder="개선대책 입력">
            
			<label>대상유무</label>
			<div class="radio-group">
			  <label><input type="radio" name="yn_a" value="Y"> Y</label>
			  <label><input type="radio" name="yn_a" value="N"> N</label>
			</div>
			
			<label>실시유무</label>
			<div class="radio-group">
			  <label><input type="radio" name="yn_b" value="Y"> Y</label>
			  <label><input type="radio" name="yn_b" value="N"> N</label>
			</div>


             <label>진행일자</label>  
			<input type="text"  name="start_date" class="daySet" placeholder="진행일자 선택" style="text-align: left;">

            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

<script>

let now_page_code = "d05";

$(document).ready(function () {
    // 페이지 로딩 시 데이터 불러오기
 

    const today = new Date().toISOString().split('T')[0];
    $('#startDate').val(today);
    $('#endDate').val(today);


    getDataList();
    // 모달 열기
    $(".insert-button").click(function () {
        let modal = $("#modalContainer");
        modal.show();
        modal.addClass("show");
    });

    // 모달 닫기
    $(".close, #closeModal").click(function () {
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

        dataTable.setData("/geomet/quality/nonProductManage/list", {
            equipment_name: equipmentName,
            startDate: startDate,
            endDate: endDate,
        });
    });

    // 저장 버튼 클릭 시
    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();

        var corrForm = new FormData($("#corrForm")[0]);

        for (let pair of corrForm.entries()) {
            console.log(pair[0] + ': ' + pair[1]);
        }

        $.ajax({
            url: "/geomet/quality/nonProductManage/insert",
            type: "POST",
            data: corrForm,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.result === "success") {
                    alert("부적합품 관리가 성공적으로 저장되었습니다!");
                    $("#modalContainer").hide();
                    getDataList(); // 성공 시 목록 갱신
                } else {
                    alert("저장 실패: " + (response.message || "알 수 없는 오류"));
                }
            },
            error: function () {
                alert("서버 오류 발생!");
            }
        });
    });

    // 데이터 목록 로딩 함수 정의
    function getDataList() {
        dataTable = new Tabulator("#dataList", {
            height: "760px",
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
            ajaxURL: "/geomet/quality/nonProductManage/list",
            ajaxProgressiveLoad: "scroll",
            ajaxParams: {
                equipment_name: $("#equipment_name").val() || "",
                startDate: $("#startDate").val() || "",
                endDate: $("#endDate").val() || "",
            },
            placeholder: "조회된 데이터가 없습니다.",
            paginationSize: 20,
            ajaxResponse: function (url, params, response) {
                $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                return response;
            },
            columns: [
                { title: "NO", field: "no", sorter: "string", width: 70, hozAlign: "center" },
                { title: "발생일", field: "defect_date", width: 120, hozAlign: "center" },
                { title: "불량유형", field: "defect_type", width: 120, hozAlign: "center" },
                { title: "발생설비", field: "equipment", width: 120, hozAlign: "center" },
                { title: "품번", field: "product_no", width: 120, hozAlign: "center" },
                { title: "품명", field: "product_name", width: 120, hozAlign: "center" },
                { title: "불량로트", field: "defect_lot", width: 120, hozAlign: "center" },
                { title: "작업자", field: "worker", width: 120, hozAlign: "center" },
                { title: "조치사항", field: "action", width: 120, hozAlign: "center" },
                { title: "선별방법", field: "selection_method", width: 120, hozAlign: "center" },
                { title: "조치완료일", field: "action_date", width: 120, hozAlign: "center" },
                { title: "불량수량(EA)", field: "defect_quantity", width: 120, hozAlign: "center" },
                { title: "발생원인", field: "cause", width: 120, hozAlign: "center" },
                { title: "개선대책", field: "improvement", width: 120, hozAlign: "center" },
                { title: "대상유무", field: "yn_a", width: 90, hozAlign: "center" },
                { title: "실시유무", field: "yn_b", width: 90, hozAlign: "center" },
                { title: "진행일자", field: "start_date", width: 120, hozAlign: "center" },
            ],
            rowClick: function (e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");
                row.getElement().classList.add("row_select");
                selectedRow = row;
                console.log("선택된 row no:", selectedRow.getData().no);
            }
        });
    }




    $(".delete-button").click(function(event) {
        event.preventDefault();
    
    console.log("삭제 버튼 클릭됨");

    if (!selectedRow) {
        alert("삭제할 행을 선택하세요.");
        return;
    }

    var no = selectedRow.getData().no;
    
    console.log("no", no);

    if (!no) {
        alert("삭제할 항목이 없습니다.");
        return;
    }

    var requestData = JSON.stringify({ "no": no });
    console.log("전송된 데이터:", requestData);

    $.ajax({
        url: "/geomet/quality/nonProductManage/del",
        type: "POST",
        data: {
            equipment_name: $("#equipment_name").val() || "",
            startDate: $("#startDate").val() || "",
            endDate: $("#endDate").val() || ""
        },
        dataType: "json",  
        success: function(response) {
            console.log("엑셀 생성 성공:", response);
            alert("엑셀 파일이 성공적으로 생성되었습니다!");
     
            if (response.data) {
                window.open("/file/download?path=" + encodeURIComponent(response.data));
            }
        },
        error: function(xhr, status, error) {
            console.error("엑셀 생성 오류:", xhr.responseText);
            alert("엑셀 생성 중 오류가 발생했습니다: " + error);
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
</script>

</body>
</html>
