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
//	console.log("받은 키값 : "+paramKey);
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
			"c02":["/geomet/condition/machinePartTemp","설비별 조건관리"],
			"c03":["/geomet/condition/machineLiquidManage","설비별 관리일지"],
			"c04":["/geomet/condition/dailyCheck","일상점검일지"],
			"c05":["/geomet/condition/divisionWeight","기준 정보"],
			"c06":"",
			"c07":"",
			"d01":["/geomet/quality/tusTest","온도균일성 테스트"],
			"d02":["/geomet/quality/resistTest","테스트/시험정보"],
			"d03":["/geomet/quality/inTest","수입검사"],
			"d04":["/geomet/quality/liquidAnalyze","액 분석 관리"],
			"d05":["/geomet/quality/nonProductManage","부적합품 관리"],
			"d06":"",
			"d07":"",
			"e01":["/geomet/user/planManage","자격인증관리"],
			"e02":["/geomet/user/workerManage","작업자 근무현황"],
			"e03":["/geomet/user/carManage","지게차,청소차 점검일지"],
			"e04":["/geomet/user/checkManage","유해화학물질 점검일지"],
			"e05":["/geomet/user/userPermission","사용자 권한부여"],
			"e06":["/geomet/user/userInsert","사용자 등록"],
			"e07":"",
			"f01":["/geomet/work/inputControlStatus","LOT 보고서"],
			"f02":["/geomet/work/machineRealStatus","생산조건 모니터링"],
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
			"h03":["/geomet/machine/repairStatus","설비 이력 관리"],
			"h04":"",
			"h05":"",
			"h06":"",
			"h07":"",
			"i01":["/geomet/user/standardDocManage","온도 균일성"],
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
                        .attr('value', item.facility_name);
                    $select.append($option);
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("장비명 조회 실패:", error);
        }
    });
});


</script>
