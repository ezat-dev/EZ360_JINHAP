<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/jinhap/css/login/style.css">

	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>  
	<link rel="stylesheet" href="/jinhap/css/sideBar/styles.css">
	<link rel="stylesheet" href="/jinhap/css/login/style2.css">
<%@include file="../include/pluginpage.jsp" %>
  
<title>진합</title>
</head>

<style>
*{
	font-weight:700;
}

.row_select{
	background-color:#9ABCEA !important;
}


</style>

<body>
<!-- 
    <header class="header">
    	<div class="header-div">
        	<p id="header-title" style="font-size : 20px;"></p>
        </div> 
    </header>
 -->
    <div class="hhhh"></div>
    <div class="l-navbar" id="navbar" style="overflow-y: auto;">
        <nav class="nav">
            <div>
            <div class="nav__brand">
                 <a href="#" class="nav__logo"><img class="tkLogo" src="/jinhap/css/sideBar/jinhap4.gif"></a>
            </div>
			<div class="nav__list">
                    
			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">모니터링</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="aMenu">
<!-- 				
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/allMonitoring','모니터링','통합 모니터링')">통합모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/detailMonitoring','모니터링','설비별 모니터링')">설비별 모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/alarmMonitoring','모니터링','경보 발생빈도')">경보 발생빈도</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/tempMonitoring','모니터링','온도경향 모니터링')">온도경향 모니터링</a></li>
-->					
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">생산관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="bMenu">
<!-- 
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/machinePerformStatus','생산관리','설비별 생산실적')">설비별 생산실적</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/machineEfficStatus','생산관리','설비효율관리')">설비효율관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/monitoringStatus','생산관리','생산모니터링')">생산모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/inventoryStatus','생산관리','재고관리')">재고관리</a></li>
 -->
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">조건관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="cMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/corrStatus','조건관리','TC교체이력')">TC교체이력</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/machinePartTemp','조건관리','설비별 액 관리')">설비별 액 관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/machineLiquidManage','조건관리','신액 교반일지')">신액 교반일지</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/dailyCheck','조건관리','일상점검일지')">일상점검일지</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/divisionWeight','조건관리','분할기준중량관리')">분할기준중량관리</a></li>
-->
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="desktop-outline"></ion-icon>
				<span class="nav_name">품질관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="dMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/tusTest','품질관리','온도균일성 테스트')">온도균일성 테스트</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/resistTest','품질관리','내식성 테스트')">내식성 테스트</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/inTest','품질관리','수입검사')">수입검사</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/liquidAnalyze','품질관리','욕액분석')">욕액분석</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/nonProductManage','품질관리','부적합품 관리')">적합품 관리</a></li>
-->
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">인원 및 안전관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="eMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/planManage','인원 및 안전관리','자격인증관리')">자격인증관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/workerManage','인원 및 안전관리','작업자 근무현황')">작업자 근무현황</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/carManage','인원 및 안전관리','지게차,청소차 점검일지')">지게차,청소차 점검일지</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/checkManage','인원 및 안전관리','유해화학물질 점검일지')">유해화학물질 점검일지</a></li>
-->
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">투입 운전관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="fMenu">
<!-- 
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/inputControlStatus','투입 운전관리','투입제어 및 모니터링')">투입제어 및 모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/machineRealStatus','투입 운전관리','설비 실시간정보')">설비 실시간정보</a></li>
-->
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">취출 운전관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="gMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/lotReportStatus','취출 운전관리','LOT 보고서')">LOT 보고서</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/workConditionStatus','취출 운전관리','생산조건 모니터링')">생산조건 모니터링</a></li>
-->					
				</ul>
			</div>
	
			<div class="nav__link collapse">
				<ion-icon name="people-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">설비관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="hMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/checkPlan','설비관리','정기점검 계획')">정기점검 계획</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/nonTime','설비관리','비가동현황')">비가동현황</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/repairStatus','설비관리','설비이력카드')">설비이력카드</a></li>
-->
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="people-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">문서관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="iMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/standardDocManage','문서관리','관리계획서 등 관리')">관리계획서 등 관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/productDocManage','문서관리','사양별 대기통수')">사양별 대기통수</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/checkDocManage','문서관리','점검일정 체크')">점검일정 체크</a></li>
-->
				</ul>
			</div>
			
			<div class="nav__link collapse">
				<ion-icon name="people-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">AGV 관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="jMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/standardDocManage','문서관리','관리계획서 등 관리')">관리계획서 등 관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/productDocManage','문서관리','사양별 대기통수')">사양별 대기통수</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/checkDocManage','문서관리','점검일정 체크')">점검일정 체크</a></li>
-->
				</ul>
			</div>
			
			<div class="nav__link collapse">
				<ion-icon name="people-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">세척 관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu" id="kMenu">
<!--
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/standardDocManage','문서관리','관리계획서 등 관리')">관리계획서 등 관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/productDocManage','문서관리','사양별 대기통수')">사양별 대기통수</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/checkDocManage','문서관리','점검일정 체크')">점검일정 체크</a></li>
-->
				</ul>
			</div>
		</div>
	</div>
</nav>
        
    </div>
    
     <script>

     //로드
     $(function(){
//    	var pageData = sessionStorage.getItem("loginUserPage");
		loginUserMenuSetting();
     });
/*
<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/allMonitoring','모니터링','통합 모니터링')">통합모니터링</a></li>
<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/detailMonitoring','모니터링','설비별 모니터링')">설비별 모니터링</a></li>
<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/alarmMonitoring','모니터링','경보 발생빈도')">경보 발생빈도</a></li>
<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/tempMonitoring','모니터링','온도경향 모니터링')">온도경향 모니터링</a></li>
 */     
	function loginUserMenuSetting(){
		$.ajax({
			url:"/jinhap/user/login/menuSetting",
			type:"post",
			dataType:"json",
			success:function(result){
				console.log(result.data);
				var data = result.data;
				for(let key in data){
//					console.log(key);
					if(key != "perm_code" && key != "user_code"){
						if(data[key] != null && data[key] != "N"){
//							console.log(data[key]);
//							console.log(pageObject(key));
							var _link = pageObject(key)[0];
							var _name = pageObject(key)[1];
							
							var _menu = "<li>";
							_menu += "<a href="+_link+" class='collapse__sublink'>"+_name+"</a>"
							_menu += "</li>";
							if(key.indexOf("a") != -1){
								$("#aMenu").append(_menu);
							}else if(key.indexOf("b") != -1){
								$("#bMenu").append(_menu);
							}else if(key.indexOf("c") != -1){
								$("#cMenu").append(_menu);
							}else if(key.indexOf("d") != -1){
								$("#dMenu").append(_menu);
							}else if(key.indexOf("e") != -1){
								$("#eMenu").append(_menu);
							}else if(key.indexOf("f") != -1){
								$("#fMenu").append(_menu);
							}else if(key.indexOf("g") != -1){
								$("#gMenu").append(_menu);
							}else if(key.indexOf("h") != -1){
								$("#hMenu").append(_menu);
							}else if(key.indexOf("i") != -1){
								$("#iMenu").append(_menu);
							}else if(key.indexOf("j") != -1){
								$("#jMenu").append(_menu);
							}else if(key.indexOf("k") != -1){
								$("#kMenu").append(_menu);
							}
						}
					}					
				}				
			}
		});
    }
        // 메뉴 클릭 시 헤더 업데이트
        function updateHeader(menuGroup, menuName) {
//            document.getElementById('header-title').innerText = menuName;
            //모니터링 - 통합 모니터링
            $(".headerP").text(menuGroup+" - "+menuName);
        }

        function updateHeaderAndNavigate(event, url, menuGroup, menuName) {
            event.preventDefault(); // 기본 링크 동작 방지
            updateHeader(menuGroup, menuName); // 헤더 업데이트
            window.location.href = url; // 페이지 이동
        }

        // DOMContentLoaded 이벤트로 DOM이 준비된 후 스크립트 실행
        document.addEventListener('DOMContentLoaded', function() {
            const linkColor = document.querySelectorAll('.nav__link');

            // 메뉴 클릭 시 활성화
            function colorLink() {
                linkColor.forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            }
            linkColor.forEach(l => l.addEventListener('click', colorLink));

            const linkCollapse = document.getElementsByClassName('collapse__link');
            let i;
            for(i = 0; i < linkCollapse.length; i++) {
                linkCollapse[i].addEventListener('click', function() {
                    const collapseMenu = this.nextElementSibling;
                    collapseMenu.classList.toggle('showCollapse');
                    const rotate = collapseMenu.previousElementSibling;
                    rotate.classList.toggle('rotate');
                });
            }
        });
    </script>
    
</body>
</html>