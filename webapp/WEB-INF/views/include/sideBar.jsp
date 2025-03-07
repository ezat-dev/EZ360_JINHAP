<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/jinhap/css/login/style.css">

	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link rel="stylesheet" href="/jinhap/css/sideBar/styles.css">
<!--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script> -->
    <link rel="stylesheet" href="/jinhap/css/login/style2.css">
    <link rel="stylesheet" href="/jinhap/css/tabulator/tabulator_simple.css">
    <script src="/jinhap/js/tabulator/tabulator.js"></script>
  
  <title>태경열처리</title>
</head>

<style>
	*{
		font-weight:700;
	}
	
    .main {
	    margin-left: 231px;
	    margin-right:8px; 
	    margin-top : 70px;
	    width : 88.8%;
	    height: calc(100vh - 80px); 
	    background-color: #ffffff; 
	    padding: 1rem; 
	     /* border : 1px solid rgb(53, 53, 53);  */
	    border-radius: 0px 0px 6px 6px;
	}
	
	.tab {
	    margin-left: 123px;
	    margin-right:8px;
	    margin-top: 5px; 
	    height: 33px;
	    /* padding: 1rem; */
	    background-color: #ffffff; 
	     /* border : 1px solid rgb(53, 53, 53);   */
	    border-radius: 6px 6px 0px 0px;
	}
	
	
.row_select{
	background-color:#9ABCEA !important;
}
</style>

<body>
    <header class="header">
        <p id="header-title" style="font-size : 20px;"></p> 
    </header>
    <div class="hhhh"></div>
    <div class="l-navbar" id="navbar" style="overflow-y: auto;">
        <nav class="nav">
            <div>
            <div class="nav__brand">
                 <a href="#" class="nav__logo"><img class="tkLogo" src="/jinhap/css/sideBar/tkLogo.png"></a>
            </div>
			<div class="nav__list">
                    
			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">모니터링</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/allMonitoring','통합 모니터링')">통합모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/detailMonitoring','설비별 모니터링')">설비별 모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/alarmMonitoring','경보 발생빈도')">경보 발생빈도</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/tempMonitoring','온도경향 모니터링')">온도경향 모니터링</a></li>
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">생산관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/machinePerformStatus','설비별 생산실적')">설비별 생산실적</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/machineEfficStatus','설비효율관리')">설비효율관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/monitoringStatus','생산모니터링')">생산모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/inventoryStatus','재고관리')">재고관리</a></li>					
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">조건관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/corrStatus','TC교체이력')">TC교체이력</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/machinePartTemp','설비별 액 관리')">설비별 액 관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/machineLiquidManage','신액 교반일지')">신액 교반일지</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/dailyCheck','일상점검일지')">일상점검일지</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/condition/divisionWeight','분할기준중량관리')">분할기준중량관리</a></li>
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="desktop-outline"></ion-icon>
				<span class="nav_name">품질관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/tusTest','온도균일성 테스트')">온도균일성 테스트</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/resistTest','내식성 테스트')">내식성 테스트</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/inTest','수입검사')">수입검사</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/liquidAnalyze','욕액분석')">욕액분석</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/quality/nonProductManage','부적합품 관리')">적합품 관리</a></li>
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">인원 및 안전관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/planManage','자격인증관리')">자격인증관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/workerManage','작업자 근무현황')">작업자 근무현황</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/carManage','지게차,청소차 점검일지')">지게차,청소차 점검일지</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/checkManage','유해화학물질 점검일지')">유해화학물질 점검일지</a></li>	
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">투입 운전관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/inputControlStatus','투입제어 및 모니터링')">투입제어 및 모니터링</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/machineRealStatus','설비 실시간정보')">설비 실시간정보</a></li>
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">취출 운전관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/lotReportStatus','LOT 보고서')">LOT 보고서</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/work/workConditionStatus','생산조건 모니터링')">생산조건 모니터링</a></li>
				</ul>
			</div>
	
			<div class="nav__link collapse">
				<ion-icon name="people-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">설비관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/checkPlan','정기점검 계획')">정기점검 계획</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/nonTime','비가동현황')">비가동현황</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/machine/repairStatus','설비이력카드')">설비이력카드</a></li>
				</ul>
			</div>

			<div class="nav__link collapse">
				<ion-icon name="people-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">문서관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
				<ul class="collapse__menu">
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/standardDocManage','관리계획서 등 관리')">관리계획서 등 관리</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/productDocManage','사양별 대기통수')">사양별 대기통수</a></li>
					<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event,'/jinhap/user/checkDocManage','점검일정 체크')">점검일정 체크</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
        
    </div>
    
     <script>

        // 메뉴 클릭 시 헤더 업데이트
        function updateHeader(menuName) {
            document.getElementById('header-title').innerText = menuName;
        }

        function updateHeaderAndNavigate(event, url, menuName) {
            event.preventDefault(); // 기본 링크 동작 방지
            updateHeader(menuName); // 헤더 업데이트
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