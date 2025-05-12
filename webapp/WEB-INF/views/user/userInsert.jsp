<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 등록</title>
    <link rel="stylesheet" href="/geomet/css/userInsert/userInsert.css">
<%@include file="../include/pluginpage.jsp" %>
    
    <style>
.tabulator {
	width: 100%;
	max-width: 100%;
	max-height: 1200px;
	overflow-x: hidden !important;  
}
        
.tabulator .tabulator-cell {
	white-space: normal !important;
	word-break: break-word; 
	text-align: center;
}
.search{
	border-radius: 5px;
	display: flex;
	align-items: center;
	margin:1rem 0 0 2rem;	
	/*상 우 하 좌*/
	height:40px;
}

.search label{
	font-size:12pt;
	font-weight:700;
	margin-right:1%;
}


.search input{
	font-size:13pt;
	font-weight:700;
	width:120px;
	text-align:center;
}

.view{
	display: flex; 
	justify-content: center;
	margin-top:1%;
}  
</style>
    
    
    <body>
        
    <main class="main">
    
    	<div class="search">

    	</div>
    
	<jsp:include page="../include/tabBar.jsp"/>
	
	
	<div class="view">
	  <div id="dataList" class="tabulator"></div>
	</div>
	
	<div class="userModal">
	<form method="post" id="userForm" name="userForm" autocomplete="off">
	<div class="user-insert-box"></div>
    <div class="user-inser-header">사용자등록</div>
    <div class="user-no-box">아이디</div>
    <div class="user-buso-box">이름</div>
    <div class="user-name-box">비밀번호</div>
    <div class="user-jick-box">등급</div>
   
    <div class="user-jdate-box">부서</div>
    <div class="user-odate-box">직책</div>
<!--     
    <div class="user-id-box">아이디</div>
    <div class="user-pwd-box">패스워드</div>
    <div class="user-phone-box">휴대전화</div>
    <div class="user-add-box">주소</div>
    <div class="user-bigo-box">비고</div>
    <div class="user-sms-box">SMS 발송</div>
 -->
 	
    <input type="text" id="user_id" name="user_id" class="user-no">
    <input type="password" id="user_pw" name="user_pw" class="user-name">
    <input type="text" id="user_name" name="user_name" class="user-buso">

    <select id="user_level" name="user_level" class="user-jick">
    	<option value="2">사용자</option>
    	<option value="1">일반관리자</option>
    </select>
    <input type="text" id="user_busu" name="user_busu" class="user-jdate">
    <input type="text" id="user_jick" name="user_jick" class="user-odate">
<!--     
    <input type="text" class="user-id">
    <input type="text" class="user-pwd">
    <input type="text" class="user-phone">
    <input type="text" class="user-add">
    <input type="text" class="user-bigo">
 -->
    <button type="button" class="saveModal" onclick="userSave();">저장</button>
    <button type="button" class="closeModal">닫기</button>
</form>
</div>
</main>

<script>
let now_page_code = "e06";
	//전역변수
    var userTable;	
	

	//로드
	$(function(){
		$(".headerP").text("인원 및 안전관리 - 사용자 등록");
		//전체 사용자목록 조회
		getAllUserList();
	});
	
	
	//함수
	function getAllUserList(){
		
		userTable = new Tabulator("#dataList", {
		    height:"760px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/geomet/user/userInsert/select",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#dataList .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:100,
		        	hozAlign:"center"},
		        {title:"아이디", field:"user_id", sorter:"string", width:120,
		        	hozAlign:"center"},
		        {title:"성명", field:"user_name", sorter:"string", width:140,
		        	hozAlign:"center"},
		        {title:"등급", field:"user_level", sorter:"string", width:140,
		        	hozAlign:"center"},
		        {title:"부서", field:"user_busu", sorter:"string", width:140,
		        	hozAlign:"center"},
		        {title:"직책", field:"user_jick", sorter:"string", width:140,
		        	hozAlign:"center"}
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#dataList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#dataList div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				$(".userName").text(rowData.user_name);
				
				
			},
			rowDblClick:function(e, row){


				var rowData = row.getData();
				$(".userName").text(rowData.user_name);
			},			
		});		
	}

	// 드래그 기능 추가
	const modal = document.querySelector('.userModal');
	const header = document.querySelector('.user-inser-header'); // 헤더를 드래그할 요소로 사용

	header.addEventListener('mousedown', function(e) {
	    let offsetX = e.clientX - modal.getBoundingClientRect().left; // 마우스와 모달의 x 위치 차이
	    let offsetY = e.clientY - modal.getBoundingClientRect().top; // 마우스와 모달의 y 위치 차이

	    function moveModal(e) {
	        modal.style.left = (e.clientX - offsetX) + 'px';
	        modal.style.top = (e.clientY - offsetY) + 'px';
	    }

	    function stopMove() {
	        window.removeEventListener('mousemove', moveModal); // 이동 중지
	        window.removeEventListener('mouseup', stopMove); // 마우스 업 이벤트 제거
	    }

	    window.addEventListener('mousemove', moveModal); // 마우스 이동 이벤트
	    window.addEventListener('mouseup', stopMove); // 마우스 업 이벤트
	});
		

	// 모달 열기
/*	
	const insertButton = document.querySelector('.insert-button');
	const userModal = document.querySelector('.userModal');
	const closeButton = document.querySelector('.closeModal');

	insertButton.addEventListener('click', function() {
	    userModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
	    userModal.style.display = 'none'; // 모달 숨김
	});
*/
	function modalOpen(){
		$(".userModal").show();
	}
	
	function modalClose(){
		$(".userModal").hide();
	}

	//이벤트
	$(".insert-button").on("click",function(){
		modalOpen();
	});

	$(".closeModal").on("click", function(){
		$("#userForm")[0].reset();
		modalClose();
	});
	
	
	// 사용자 등록 모달 ajax
	
	function userSave(){
		var userData = new FormData($("#userForm")[0]);
		
		console.log(userData);
		
		$.ajax({
			url:"/geomet/user/userInsert/insert",
			type:"post",
			contentType: false,
			processData: false,
			dataType: "json",
			data:userData,
			success:function(result){
				getAllUserList();
				modalClose();
			}
		});
	}

    </script>

	</body>
</html>
