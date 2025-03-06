<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/tkheat/css/login/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
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
   </style>
  <title>Document</title>
</head>
<body>
  <div class="group-1">
    <div class="main"></div>
    <img class="background-1" src="/tkheat/css/login/background-10.png" />
    <div class="login-box"></div>
    
    <div class="id-input"></div>
    <div class="pw-input"></div>
    <div class="text-1">이 사이트는 태경열처리 임직원 전용입니다.</div>
    <div class="text-2">주소 경남 함안군 군북면 함안산단 3 길 34</div>
    <input type="text" id="n_id" name="n_id" placeholder="아이디를 입력하세요." />
    <input type="password" id="n_pw" name="n_pw" placeholder="비밀번호를 입력하세요." />
    <button class="login_btn" onclick="login();">로그인</button>
    <div class="text-5">아이디</div>
    <div class="text-6">패스워드</div>
    <img class="logo" src="/tkheat/css/login/logo0.svg" />
    <div class="text-4">태경열처리 로그인</div>
    <div class="text-3">
      Copyright 2025. EZAutomation Co. All rights reserved.
      
    </div>
  </div>
  
  
  <script>

  function login(){
	    var id = $("#n_id").val();
	    var pw = $("#n_pw").val(); 

	    $.ajax({
	        url: "/tkheat/user/login",
	        type: "post",
	        data: {user_id: id, user_pw: pw}, 
	        success: function(result) {
	            if(result == "fail") {
	                modal_alert(); 
	            } else {
	                location.href = "/tkheat/management/userinsert"
	            }
	        }
	    });
	    
	}


//모달
function modal_alert() {
    alert("아이디와 비밀번호를 확인해 주십시오!");
}

  </script>
</body>
</html>