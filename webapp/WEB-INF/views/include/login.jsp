<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/geomet/css/login/basic_v7.css">
    <link rel="stylesheet" href="/geomet/css/login/login.css">

<style>
    .login_box {
        display: flex;
        align-items: center;
    }
    
    .notice{

    }
    
    .login{
 margin-left: auto !important;
    }
    
    .tit{
    font-size: 30px !important;
    }
    
    

</style>

</head>
	
	<body id="login_body" class="layout_ex " onload="">
    
<div id="wrap_login" class="login_gw7">
	<div class="login_container">
		<div class="header">
			<div class="inner">
			<h1 class="logo"><img id="login_img_logo" src="/geomet/css/login/fileView.png" alt=""></h1>
			<div class="lang">
			</div>
			</div>
		</div>
		<hr class="hide">
		<div class="content" id="login_layout_content">
			<div id="login_imgbox" class="visual_box">
				<img id="login_img_loginBanner" src="/geomet/css/login/vt.png" alt="">
			</div>
			<div class="login_box">
				<div class="notice">
					<div class="tit_bar">
						<h2 class="tit">현재 프로그램 수정 중입니다</h2>
					</div>
					<ul id="login_noticeCont_ul" class="bu_lst">
					</ul>
				</div>
				<div class="login">
				    <form id="userForm" class="omb_loginForm" role="form" 
    				action="login_ok.jsp" method="post" onsubmit="return false">
						<div class="login_frm">
							
							<div id="login_loginBox">
								<ul id="loginIdType1" class="ip_box">
									<li class="info id">
										<label class="input_txt">
											<input id="userId" name="user_id" class="input_id" type="text" autocomplete="off" >
											<i class="ico ico_login-id"></i>
										</label>
									</li>
									<li class="info pw">
										<label class="input_txt">
											<input id="password" name="user_pw" type="password" autocomplete="new-password" class="input_pw">
											<i class="ico ico_login-pw"></i>
										</label>
									</li>
								</ul>
							</div>
							<div class="btn_login">
								<button id="btnLogin" data-text="Login" onclick="login()">
									<span>L</span><span>o</span><span>g</span><span>i</span><span>n</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
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