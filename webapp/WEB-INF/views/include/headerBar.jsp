<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/jinhap/css/headerBar/headerBar.css">
  <title>진합</title>
</head>

<style>	

</style>

<body>
    <div class="header">
	    <p class="headerP" style="font-size:20px; margin-left:40px; color : white; font-weight:800;"></p>
	    <!-- 로그인정보 표현, 로그아웃 버튼 -->
	    <p class="loginName" style="font-size:20px; margin-left:960px; color : white; font-weight:800;"></p>
        <button class="logout-button">
            <img src="/jinhap/css/headerBar/exit-outline.svg" alt="select" class="button-image">로그아웃	           
        </button>
    </div>
    
<script>
$(function(){
	var loginInfo = "${loginUser.user_name}";
	console.log(loginInfo);
	$(".loginName").text(loginInfo+"님 로그인");
});


$(".logout-button").on("click",function(){
	$.ajax({
		url:"/jinhap/user/logout",
		type:"get",
		dataTypa:"json",
		success:function(result){
			location.href = "/jinhap";
		}
	});
});
</script>
    
</body>
</html>