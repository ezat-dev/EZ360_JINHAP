<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/geomet/css/login/style.css">
  <%@include file="include/pluginpage.jsp" %>
  
  <style>
   a,
   button,
   input,
   select,
   h1,
   h2,
   h3,
   h4,
   h5,
   * {
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       border: none;
       text-decoration: none;
       background: none;
   
       -webkit-font-smoothing: antialiased;
   } 
   
   menu, ol, ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
   }
   html, body {
    height: 100%;        
    margin: 0;            
    padding: 0;           
    overflow: hidden;     
}
.background-1 {
    position: absolute;
    top: 0;
    left: -83px;
    width: 107%;
    height: 107%;
    object-fit: cover;
}
   
   </style>
  <title>Document</title>
</head>
<body>
  <div class="group-1">
    <div class="main"></div>
    <img class="background-1" src="/geomet/css/login/backA.png" />
    <div class="login-box"></div>
    
    
    
    
    <div class="id-input"></div>
    <div class="pw-input"></div>
    <div class="text-1"></div>
    <div class="text-2">대전 대덕구 문평서로 42 (주)진합</div>
    <form id="userForm" autocomplete="off">
    	<input type="text" id="n_id" name="user_id" placeholder="아이디를 입력하세요."  />
    	<input type="password" id="n_pw" name="user_pw" placeholder="비밀번호를 입력하세요." />
    </form>
    
    <button class="login_btn" onclick="login();">로그인</button>
    <div class="text-5">아이디</div>
    <div class="text-6">패스워드</div>
<!--     <img class="logo" src="/geomet/css/login/logo0.svg" /> -->
    <div class="text-4">주식회사 진합 로그인</div>
    <div class="text-3">
      Copyright 2025. EZAutomation Co. All rights reserved.
    </div>
  </div>
  
  <script>

//이벤트
$("*").on("keydown",function(e){
	//엔터키가 눌렸을 때
	if(e.keyCode == 13){
		login();
	}
});
  
/* //함수
function login(){
	var userData = new FormData($("#userForm")[0]);
	$.ajax({
		url:"/geomet/user/login/check",
		type:"post",
		contentType: false,
		processData: false,
		dataType: "json",
		data:userData,
		success:function(result){
//			console.log(result);
			location.href = "/geomet/jinhapGeomet";
			
//			var pageData = result.loginUserPage;
		}
	});
}
 */




function login() {
    var userData = new FormData($("#userForm")[0]);
    $.ajax({
        url: "/geomet/user/login/check",
        type: "post",
        contentType: false,
        processData: false,
        dataType: "json",
        data: userData,
        success: function(result) {
            console.log(result); 

            if (result.data && result.data.user_id) {

                location.href = "/geomet/jinhapGeomet";  

            } else {
            	 console.log(userData); 
                alert("로그인 실패! 사용자 정보가 잘못되었습니다.");
            }
        },
        error: function(xhr, status, error) {
            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            console.log(error); 
        }
    });
}

//모달

//

  </script>
</body>
</html>