<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<!-- 제이쿼리홈페이지 js -->
<script type="text/javascript" src="/geomet/js/jquery-3.7.1.min.js"></script>

<!-- Tabulator 테이블 -->
<script type="text/javascript" src="/geomet/js/tabulator/tabulator.js"></script>
<link rel="stylesheet" href="/geomet/css/tabulator/tabulator_simple.css">

<!-- moment -->
<script type="text/javascript" src="/geomet/js/moment/moment.min.js"></script>

<!-- 화면캡쳐용 -->
<script type="text/javascript" src="/geomet/js/html2canvas.js"></script>


<!-- 하이차트 -->
<script type="text/javascript" src="/geomet/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="/geomet/js/highchart/exporting.js"></script>
<script type="text/javascript" src="/geomet/js/highchart/export-data.js"></script>
<script type="text/javascript" src="/geomet/js/highchart/data.js"></script>


<!-- Air Datepicker -->
<script type="text/javascript" src="/geomet/js/airdatepicker/datepicker.min.js"></script>
<script type="text/javascript" src="/geomet/js/airdatepicker/datepicker.ko.js"></script>
<link rel="stylesheet" href="/geomet/css/airdatepicker/datepicker.min.css"> 


<style>


</style>
<script>

$(function(){


	rpImagePopup();






	

	//airDatePicker 설정
	//날짜 : 일
	 $(".daySet").datepicker({
    	language: 'ko',
    	autoClose: true,
    }); 


	 $(".datetimeSet").datepicker({
		    language: 'ko',
		    timepicker: true,            // 시분 선택 가능
		    dateFormat: 'yyyy-mm-dd',
		    timeFormat: 'hh:ii',         // 시:분 형식
		    autoClose: true
		});
	    
	//날짜 : 월
   $(".monthSet").datepicker({
	    language: 'ko',           // 한국어 설정
	    view: 'months',           // 월만 표시
	    minView: 'months',        // 월만 선택 가능
	    dateFormat: 'yyyy-mm',    // 연도-월 형식 지정
	    autoClose: true,          // 월 선택 후 자동 닫힘
	});
   

    //날짜 : 년
	 $(".yearSet").datepicker({
	  language: 'ko',
      view: 'years',          // 연도만 표시
      minView: 'years',       // 연도만 표시하여 날짜 선택 비활성화
      dateFormat: 'yyyy',     // 연도 형식 지정
      autoClose: true,        // 연도 선택 후 자동 닫힘
      language: 'ko'          // 한국어 설정
  });

	 $(".monthDaySet").datepicker({
		    language: 'ko',
		    autoClose: true,
		    dateFormat: 'mm-dd',     // 📌 "월-일" 형식만 표시
		    view: 'days',            // 기본 day 뷰 사용
		    minView: 'days',         // day까지만 표시
		    onShow: function(inst, animationCompleted){
		        // 연도, 월 선택 영역 숨김 (디자인적으로)
		        $('.datepicker--nav-title i, .datepicker--nav-title span').hide();
		    }
		});

/*
   // AirDatepicker 초기화
   new AirDatepicker('.datepicker', {
       autoClose: true,
       dateFormat: 'yyyy-MM-dd',
       locale: {
           days: ['일', '월', '화', '수', '목', '금', '토'],
           daysShort: ['일', '월', '화', '수', '목', '금', '토'],
           daysMin: ['일', '월', '화', '수', '목', '금', '토'],
           months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           today: '오늘',
           clear: '초기화',
           firstDay: 0
       },
       // 일, 월, 년을 선택할 수 있게 하기 위한 설정
       view: 'days',  // 일, 월, 년 선택을 가능하게 함
       minView: 'days', // 날짜만 선택 가능
   });
*/
		
});

//오늘날짜 년-월-일
function todayDate(){
	var now = new Date();
	var y = now.getFullYear();
	var m = paddingZero(now.getMonth()+1);
	var d = paddingZero(now.getDate());
		
	return y+"-"+m+"-"+d; 
}

//어제날짜 년-월-일
function yesterDate(){
	var now = new Date();
	var y = now.getFullYear();
	var m = paddingZero(now.getMonth()+1);
	var d = paddingZero(now.getDate()-1);
		
	return y+"-"+m+"-"+d; 	
}

//왼쪽 0채우기
function paddingZero(value){
	var rtn = "";

	if(value < 10){
		rtn = "0"+value;
	}else{
		rtn = value;
	}

	return rtn;
}

function rpImagePopup() {
    var img = document.createElement("img");
//    console.log(img);
    
    // $(img).attr("src", "imgs/noimage_01.gif");
    $(img).css("width", "600");
    $(img).css("height", "500");
    
    var div = document.createElement("div");
    $(div).css("position", "absolute");
    $(div).css("display", "none");
    $(div).css("z-index", "24999");
    $(div).append(img);
    $(div).hide();
    $("body").append(div);

    $(document).on("mouseover", ".rp-img-popup > img", function(){
            $(img).attr("src", $(this).attr("src"));
            $(div).show();
            var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
            var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
            $(div).css("left", iWidth);
            $(div).css("top", 100);
        })
        .on("mouseout", ".rp-img-popup > img", function(){
            $(div).hide();
        });
    
    $(document).on("mouseover", ".rp-img-popup", function(){
        $(img).attr("src", $(this).attr("src"));
        $(div).show();
        var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
        var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
        $(div).css("left", iWidth);
        $(div).css("top", 100);
    })
    .on("mouseout", ".rp-img-popup", function(){
        $(div).hide();
    });
}


function pageObject(paramKey){
	//console.log("받은 키값 : "+paramKey);
	var obj = {
			"a01":["/geomet/machine/allMonitoring","통합 모니터링"],
			"a02":["/geomet/machine/detailMonitoring","설비별 모니터링"],
			"a03":["/geomet/machine/alarmMonitoring","경보 모니터링"],
			"a04":["/geomet/machine/alarmList","경보 발생빈도"],
			"a05":["/geomet/machine/tempMonitoring","온도경향 모니터링"],
			"a06":"",
			"a07":"",
			"b01":["/geomet/work/machinePerformStatus","설비별 생산실적"],
			"b02":["/geomet/work/machineEfficStatus","설비효율 관리"],
			"b03":["/geomet/work/monitoringStatus","생산모니터링 현황"],
			"b04":["/geomet/work/workDailyReport","작업일보"],
			"b05":["/geomet/work/inventoryStatus","재고관리(약품)"],
			"b06":"",
			"b07":"",
			"c01":["/geomet/condition/corrStatus","TC/조절계 이력"],
			"c02":["/geomet/condition/machinePartTemp","액탱크 관리대장"],
			"c03":["/geomet/condition/machineLiquidManage","교반 관리대장"],
			"c04":["/geomet/condition/dailyCheck","일상점검일지"],
			"c05":["/geomet/condition/divisionWeight","기준정보"],
			"c06":["/geomet/condition/divisionWashing","세척 투입제어"],
			"c07":"",
			"d01":["/geomet/quality/tusTest","온도균일성 테스트"],
			"d02":["/geomet/quality/resistTest","테스트/시험정보"],
			"d03":["/geomet/quality/inTest","수입검사"],
			"d04":["/geomet/quality/liquidAnalyze","액 분석 관리"],
			"d05":["/geomet/quality/nonProductManage","부적합품 관리"],
			"d06":["/geomet/quality/test_info","양산품 표면적 기준정보"],
			"d07":"",
			"e01":["/geomet/user/planManage","자격인증관리"],
			"e02":["/geomet/user/workerManage","작업자 근무현황"],
			"e03":["/geomet/user/carManage","지게차,청소차 점검일지"],
			"e04":["/geomet/user/checkManage","유해화학물질 점검일지"],
			"e05":["/geomet/user/userPermission","사용자 권한부여"],
			"e06":["/geomet/user/userInsert","사용자 등록"],
			"e07":"",
			"f01":["/geomet/work/inputControlStatus","생산설비 시간 정보"],
			"f02":["/geomet/work/machineRealStatus","투입제어 및 모니터링"],
			"f03":"",
			"f04":"",
			"f05":"",
			"f06":"",
			"f07":"",
			"g01":["/geomet/work/lotReportStatus","LOT 보고서"],
			"g02":["/geomet/work/workConditionStatus","생산조건 모니터링"],
			"g03":"",
			"g04":"",
			"g05":"",
			"g06":"",
			"g07":"",
			"h01":["/geomet/machine/checkPlan","정기점검 계획"],
			"h02":["/geomet/machine/nonTime","설비 비가동 현황"],
			"h03":["/geomet/machine/repairStatus","설비이력 관리"],
			"h04":["/geomet/machine/partStatus","부품교체 이력관리"],
			"h05":["/geomet/machine/spareStatus","스페어부품 관리"],
			"h06":["/geomet/machine/logStatus","공무 일지"],
			"h07":["/geomet/work/MTTR","MTTR"],
			
			"h08":["/geomet/machine/mch_info","설비 기준관리"],
			
			"i01":["/geomet/user/standardDocManage","작업 표준서"],
			"i02":["/geomet/user/productDocManage","사양별 대기통수"],
			"i03":["/geomet/user/checkDocManage","점검일정 체크"],
			"i04":"",
			"i05":"",
			"i06":"",
			"i07":"",
			"j01":["/geomet/agvwash/missionCount","AGV 미션수행횟수"],
			"j02":["/geomet/agvwash/errorCount","AGV 오류발생 횟수"],
			"j03":["/geomet/agvwash/batteryStatus","AGV 배터리 소모이력"],
			"j04":["/geomet/agvwash/workOrderStatus","AGV 작업지시 조회"],
			"j05":"",
			"j06":"",
			"j07":"",
			"k01":["/geomet/agvwash/washList","세척투입리스트"],
			"k02":["/geomet/agvwash/washInput","세척투입"],
			"k03":["/geomet/agvwash/washShotWorkPerform","세척,쇼트 일 생산량"],
			"k04":["/geomet/agvwash/washShotWaitList","세척,쇼트 예약상태"],
			"k05":["/geomet/agvwash/workOrderList","작업지시 조회"],
			"k06":["/geomet/agvwash/lineInOutList","라인별 입출고이력"],
			"k07":["/geomet/agvwash/machineWorkPerform","설비별 작업실적"],
			"k08":["/geomet/agvwash/lineUseManage","라인별 사용유무관리"],
			
	};
	
/*	
	console.log(obj);
	console.log(obj[paramKey][0]);*/
	
	return obj[paramKey];
}

$(window).on("load", function () {
    $.ajax({
        url: "/geomet/user/equipment_name_select",
        type: "POST",
        dataType: "json",
        success: function (response) {
            const $select = $(".equipment_name_select");
            $select.empty();
            $select.append('<option value="">전체</option>');

            response.data.forEach(function (item) {
                if (item.facility_name) {
                    const $option = $('<option>' + item.facility_name + '</option>')
                        .attr('value', item.facility_mach_code);

                    $select.append($option);
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("장비명 조회 실패:", error);
        }
    });
});

let userPermissions = {};

// 권한 정보 가져오기
function userInfoList(now_page_code) {
    $.ajax({
        url: '/geomet/user/info',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        success: function(response) {
            const loginUserPage = response.loginUserPage;
            userPermissions = loginUserPage || {};
            controlButtonPermissions(now_page_code);
            // 권한 세팅 후 핸들러 설치 (중복 호출 방지 내부 처리됨)
            installTabulatorReadOnlyHandlers();
        },
        error: function(xhr, status, error) {
            console.error("데이터 가져오기 실패:", error);
            // 그래도 핸들러는 설치해 둡니다(나중에 권한이 세팅되면 동작).
            installTabulatorReadOnlyHandlers();
        }
    });
}

function controlButtonPermissions(now_page_code) {
    const permission = userPermissions?.[now_page_code];
    // 전역 플래그 설정
    window.currentPermission = permission; // "R", "C", "D" 등
    window.canRead = permission === "R" || permission === "C" || permission === "D";
    window.canCreate = permission === "C" || permission === "D";
    window.canDelete = permission === "D";

    if (!window.canRead) {
        $(".select-button").css("pointer-events", "none").css("background-color", "#ced4da");
    }

    if (!window.canCreate) {
        $(".insert-button").css("pointer-events", "none").css("background-color", "#ced4da");
        $("#corrForm").prop("disabled", true);
    }

    if (!window.canDelete) {
        $(".delete-button").css("pointer-events", "none").css("background-color", "#ced4da");
    }

    $(".select-button").off("click.permissionCheck").on("click.permissionCheck", function (e) {
        if (!window.canRead) {
            alert("당신의 권한이 없습니다. (조회)");
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });

    $(".insert-button").off("click.permissionCheck").on("click.permissionCheck", function (e) {
        if (!window.canCreate) {
            alert("당신의 권한이 없습니다. (추가)");
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });

    $(".delete-button").off("click.permissionCheck").on("click.permissionCheck", function (e) {
        if (!window.canDelete) {
            alert("당신의 권한이 없습니다. (삭제)");
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });
}

/* ---------- 편집 차단 로직 (캡처 + Observer + 안전판) ---------- */

// 전역 토스트 알림 함수 (다른 곳에서도 사용)
window.showPermissionNotice = function(msg){
    let t = document.getElementById('permission-toast');
    if (!t) {
        t = document.createElement('div');
        t.id = 'permission-toast';
        t.style.position = 'fixed';
        t.style.right = '20px';
        t.style.bottom = '20px';
        t.style.padding = '10px 14px';
        t.style.background = 'rgba(0,0,0,0.75)';
        t.style.color = '#fff';
        t.style.borderRadius = '6px';
        t.style.zIndex = 99999;
        t.style.fontSize = '13px';
        document.body.appendChild(t);
    }
    t.textContent = msg;
    t.style.display = 'block';
    clearTimeout(t._hideTimer);
    t._hideTimer = setTimeout(function(){ t.style.display = 'none'; }, 1200);
};

// 설치 함수 (한 번만 설치됨)
function installTabulatorReadOnlyHandlers(){
    if (window.preventTabEditInstalled) return;
    window.preventTabEditInstalled = true;

    // 캡처 단계: 더블클릭 차단
    document.addEventListener('dblclick', function(e){
        const cell = e.target.closest && e.target.closest('.tabulator .tabulator-cell');
        if (cell && window.currentPermission === "R") {
            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation && e.stopImmediatePropagation();
            window.showPermissionNotice("당신의 권한이 없습니다. (수정)");
            return false;
        }
    }, true);

    // 캡처 단계: 클릭 차단(단일 클릭으로 편집 열리는 경우 대비)
    document.addEventListener('click', function(e){
        const cell = e.target.closest && e.target.closest('.tabulator .tabulator-cell');
        if (cell && window.currentPermission === "R") {

            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation && e.stopImmediatePropagation();

            return false;
        }
    }, true);

    document.addEventListener('mousedown', function(e){
        const cell = e.target.closest && e.target.closest('.tabulator .tabulator-cell');
        if (cell && window.currentPermission === "R") {
            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation && e.stopImmediatePropagation();
            window.showPermissionNotice("당신의 권한이 없습니다. (수정)");
            return false;
        }
    }, true);

    // 캡처 단계: 키 (Enter / F2) 차단
    document.addEventListener('keydown', function(e){
        const active = document.activeElement;
        const isCell = active && active.closest && active.closest('.tabulator .tabulator-cell');
        if (isCell && window.currentPermission === "R") {
            if (e.key === "Enter" || e.key === "F2") {
                e.preventDefault();
                e.stopPropagation();
                e.stopImmediatePropagation && e.stopImmediatePropagation();
                window.showPermissionNotice("당신의 권한이 없습니다. (수정)");
                return false;
            }
        }
    }, true);

    // MutationObserver: 생성되는 에디터 DOM을 즉시 제거
    const editorSelectors = [
        '.tabulator-editor',
        '.tabulator-editing',
        '.tabulator-edit',
        'input.tabulator-edit-input',
        'input.tabulator-editor',
        'textarea.tabulator-editor'
    ].join(',');

    const observer = new MutationObserver(function(mutations){
        if (window.currentPermission !== "R") return;

        mutations.forEach(function(m){
            m.addedNodes && m.addedNodes.forEach(function(node){
                if (!(node && node.nodeType === 1)) return;
                try {
                    if (node.matches && node.matches(editorSelectors)) {
                        node.remove();
                        window.showPermissionNotice("당신의 권한이 없습니다. (수정)");
                        return;
                    }
                    const found = node.querySelector && node.querySelector(editorSelectors);
                    if (found) {
                        found.remove();
                        window.showPermissionNotice("당신의 권한이 없습니다. (수정)");
                        return;
                    }
                } catch (err) {
        
                }
            });
        });
    });

    observer.observe(document.body, { childList: true, subtree: true });

    // 전역 레퍼런스로 보관 (원하면 observer.disconnect()로 해제 가능)
    window._tabulatorEditObserver = observer;

    // 안전판: 주기적으로 (느린 주기) 에디터/인풋이 남아있나 확인하여 제거/blur
    window._tabulatorEditCleaner = setInterval(function(){
        if (window.currentPermission !== "R") return;
        try {
            // 탐지 셀렉터: 에디터 래퍼 또는 입력 필드
            const list = document.querySelectorAll('.tabulator .tabulator-editor, .tabulator input, .tabulator textarea, .tabulator .tabulator-editing');
            if (!list || list.length === 0) return;
            list.forEach(function(el){
                try {
                    if (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA') {
                        el.blur();
                        el.disabled = true;
                    } else {
                        el.remove();
                    }
                } catch(e){}
            });
            if (list.length) window.showPermissionNotice("당신의 권한이 없습니다. (수정)");
        } catch(e){}
    }, 700); // 700ms 주기: 부담 적음
}

$(document).ready(function() {
    userInfoList(now_page_code);
    console.log("나우페이지코드", now_page_code);

    installTabulatorReadOnlyHandlers();
});




</script>
