<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지게차,청소차 점검일지</title>
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

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
             <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">교체일자 :</label>
				<input type="text" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
	
	            <label class="daylabel">설비명 :</label>
	            <select class="dayselect">
                <option value="Q01-HN01">Q01-HN01</option>
                <option value="G800">G800</option>
                <option value="G600">G600</option>
                <option value="K-BLACK">K-BLACK</option>
                <option value="공용설비">공용설비</option>
                <option value="방청">방청</option>
                <option value="이코팅1호기">이코팅1호기</option>
                <option value="이코팅2호기">이코팅2호기</option>
                <option value="세척 공통 (열병합)">세척 공통 (열병합)</option>
                <option value="세척 1호기">세척 1호기</option>
                <option value="세척 2호기">세척 2호기</option>
            </select>
			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
                <button class="printer-button">
                    <img src="/geomet/css/tabBar/printer-icon.png" alt="printer" class="button-image">출력
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
        <form>
            <label>발생일</label>
            <input type="text" class="daySet" placeholder="날짜 선택" style="text-align: left;">


            <label>불량유형</label>
			<select>
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
			<select>
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
            <input type="text" placeholder="품번 입력">

            <label>품명</label>
            <input type="text" placeholder="품명 입력">

            <label>불량로트</label>
            <input type="text" placeholder="불량로트 입력">

            <label>작업자</label>
            <input type="text" placeholder="작업자 입력">

            <label>조치사항</label>
            <textarea rows="3" placeholder="조치사항 입력"></textarea>

            <label>선별방법</label>
            <input type="text" placeholder="선별방법 입력">

            <label>조치완료일(일자기록)</label>
   			<input type="text" class="daySet" placeholder="조치완료일 선택" style="text-align: left;">
   			
   			
            <label>불량수량(EA)</label>
            <input type="number" placeholder="불량수량 입력">

            <label>발생원인</label>
            <input type="text" placeholder="발생원인 입력">

            <label>개선대책</label>
            <input type="text" placeholder="개선대책 입력">


            <button type="submit">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

    <script>
        $(function() {
            getDataList();
        });

        function getDataList() {
            dataTable = new Tabulator("#dataList", {
                height: "560px",
                layout: "fitColumns",
                selectable: true,
                tooltips: true,
                selectableRangeMode: "click",
                reactiveData: true,
                headerHozAlign: "center",
                ajaxConfig: "POST",
                ajaxLoader: false,
                ajaxURL: "/geomet/quality/tustest/selectList",
                ajaxProgressiveLoad: "scroll",
                ajaxParams: {},
                placeholder: "조회된 데이터가 없습니다.",
                paginationSize: 20,
                ajaxResponse: function(url, params, response) {
                    $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                    return response;
                },
                columns: [
                    {title: "NO", field: "1", sorter: "string", width: 30, hozAlign: "center", headerSort: false},
                    {title: "발생일", field: "2", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "불량유형", field: "3", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "발생설비", field: "4", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "품번", field: "5", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "품명", field: "6", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "불량로트", field: "7", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "작업자", field: "8", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "조치사항", field: "9", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "선별방법", field: "10", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "조치완료일", field: "11", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "불량수량(EA)", field: "12", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "발생원인", field: "13", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                    {title: "개선대책", field: "14", sorter: "string", width: 120, hozAlign: "center", headerSort: false},
                ],

                rowFormatter: function(row) {
                    var data = row.getData();
                    row.getElement().style.fontWeight = "700";
                    row.getElement().style.backgroundColor = "#FFFFFF";
                },
                rowClick: function(e, row) {
                    $("#dataList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item) {
                        if ($(this).hasClass("row_select")) {
                            $(this).removeClass('row_select');
                            row.getElement().className += " row_select";
                        } else {
                            $("#dataList div.row_select").removeClass("row_select");
                            row.getElement().className += " row_select";
                        }
                    });
                },
            });
        }

        document.querySelector(".insert-button").addEventListener("click", function() {
            let modal = document.getElementById("modalContainer");
            modal.classList.add("show");
        });

        document.querySelector(".close").addEventListener("click", function() {
            let modal = document.getElementById("modalContainer");
            modal.classList.remove("show");
        });

        document.getElementById("closeModal").addEventListener("click", function() {
            document.getElementById("modalContainer").classList.remove("show");
        });

    </script>

</body>
</html>
