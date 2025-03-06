<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="태경열처리 관리 시스템">
  <meta name="author" content="태경열처리">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/tkheat/css/login/style.css">

	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link rel="stylesheet" href="/tkheat/css/sideBar/styles.css">
<!--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script> -->
    <link rel="stylesheet" href="/tkheat/css/login/style2.css">
    <link rel="stylesheet" href="/tkheat/css/tabulator/tabulator_simple.css">
    <script src="/tkheat/js/tabulator/tabulator.js"></script>
  
  <title>태경열처리</title>
</head>


<body>
    <header class="header">
        <p id="header-title" style="font-size : 20px;"></p> 
    </header>
    <div class="hhhh"></div>
    <div class="l-navbar" id="navbar" style="overflow-y: auto;">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                     <a href="#" class="nav__logo"><img class="tkLogo" src="/tkheat/css/sideBar/tkLogo.png"></a>
                </div>
                <div class="nav__list">
                    
                     <div class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">제품관리</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                             <li><a href="#" class="collapse__sublink" onclick="updateHeader('입고관리')">입고관리</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('출고관리')">출고관리</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('재고현황(상세정보)')">재고현황(상세정보)</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('제품별재고현황')">제품별재고현황</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('출고대기현황')">출고대기현황</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('공정작업현황')">공정작업현황</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('입출고삭제현황')">입출고삭제현황</a></li>
                        </ul>
                    </div>

                    <div class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">생산관리</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('작업지시')">작업지시</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('작업스케줄')">작업스케줄</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('작업현황')">작업현황</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('부적합보고서')">부적합보고서</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('생산대기현황')">생산대기현황</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('LOT추적 관리(입고)')">LOT추적 관리(입고)</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('LOT추적 관리(열처리LOT)')">LOT추적 관리(열처리LOT)</a></li>
                        </ul>
                    </div>

                    <div class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">생산공정관리</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('준비 작업실적')">준비 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('전세정 작업실적')">전세정 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('침탄 작업실적')">침탄 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('고주파 작업실적')">고주파 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('템퍼링 작업실적')">템퍼링 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('후세정 작업실적')">후세정 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('쇼트/샌딩 작업실적')">쇼트/샌딩 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비별 작업실적')">설비별 작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('제품별 불량현황')">제품별 불량현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('소입경도현황')">소입경도현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('템퍼링경도현황')">템퍼링경도현황</a></li>
                        </ul>
                    </div>

                    <div class="nav__link collapse">
                        <ion-icon name="desktop-outline"></ion-icon>
                        <span class="nav_name">감시시스템</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('품질관리모니터링')">품질관리모니터링</a></li>
                        </ul>
                    </div>

                    <div class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">설비보존관리</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('SparePart관리')">SparePart관리</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비비가동등록')">설비비가동등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비가동율분석')">설비가동율분석</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비수리이력관리')">설비수리이력관리</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비점검기준등록')">설비점검기준등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비별점검현황(일별)')">설비별점검현황(일별)</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비별점검현황(월별)')">설비별점검현황(월별)</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('측정기기고장이력')">측정기기고장이력</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('측정기기점검관리')">측정기기점검관리</a></li>
                        </ul>
                    </div>

                    <div class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">품질관리</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('수입검사')">수입검사</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('부적합등록')">부적합등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('소입경도현황')">소입경도현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('템퍼링경도현황')">템퍼링경도현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('자주검사불량현황')">자주검사불량현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('자주검사불량조치관리')">자주검사불량조치관리</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('Xbar-R관리도')">Xbar-R관리도</a></li>
                        </ul>
                    </div>

                    <div class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">경영정보</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('제품별입고현황')">제품별입고현황</a></li>
                            <li><a href="#" class="collapse__sublink" onclick="updateHeader('제품별출고현황')">제품별출고현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('거래처별입고현황')">거래처별입고현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('거래처별출고현황')">거래처별출고현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('년간매출현황')">년간매출현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('월별불량현황')">월별불량현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('월별거래처별불량현황')">월별거래처별불량현황</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('제품별작업실적')">제품별작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비별작업실적')">설비별작업실적</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('공지사항')">공지사항</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('월매출현황(마감)')">월매출현황(마감)</a></li>
                        </ul>
                    </div>
	
					<div class="nav__link collapse">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">기준정보</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event, '/tkheat/management/cutumInsert','거래처등록')">거래처등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('제품등록')">제품등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('설비등록')">설비등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('침탄로작업표준')">침탄로작업표준</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('고주파로작업표준')">고주파로작업표준</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('코일등록')">코일등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('PLUG등록')">PLUG등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('PLUG점검기준등록')">PLUG점검기준등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event, '/tkheat/management/userinsert', '작업자등록')">작업자등록</a></li>
       						<li><a href="#" class="collapse__sublink" onclick="updateHeaderAndNavigate(event, '/tkheat/management/authority', '사원별권한등록')">사원별권한등록</a></li>
					        <li><a href="#" class="collapse__sublink" onclick="updateHeader('측정기기관리')">측정기기관리</a></li>
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