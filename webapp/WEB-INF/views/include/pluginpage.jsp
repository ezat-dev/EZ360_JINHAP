<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 제이쿼리홈페이지 js -->
<script type="text/javascript" src="/jinhap/js/jquery-3.7.1.min.js"></script>

<!-- Tabulator 테이블 -->
<script type="text/javascript" src="/jinhap/js/tabulator/tabulator.js"></script>
<link rel="stylesheet" href="/jinhap/css/tabulator/tabulator_simple.css">

<!-- moment -->
<script type="text/javascript" src="/jinhap/js/moment/moment.min.js"></script>

<!-- 화면캡쳐용 -->
<script type="text/javascript" src="/jinhap/js/html2canvas.js"></script>


<!-- 하이차트 -->
<script type="text/javascript" src="/jinhap/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="/jinhap/js/highchart/exporting.js"></script>
<script type="text/javascript" src="/jinhap/js/highchart/export-data.js"></script>
<script type="text/javascript" src="/jinhap/js/highchart/data.js"></script>


<!-- Air Datepicker -->
<script type="text/javascript" src="/jinhap/js/airdatepicker/datepicker.min.js"></script>
<script type="text/javascript" src="/jinhap/js/airdatepicker/datepicker.ko.js"></script>
<link rel="stylesheet" href="/jinhap/css/airdatepicker/datepicker.min.css"> 


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
			"a01":["/jinhap/machine/allMonitoring","통합 모니터링"],
			"a02":["/jinhap/machine/detailMonitoring","설비별 모니터링"],
			"a03":["/jinhap/machine/alarmMonitoring","경보 모니터링"],
			"a04":["/jinhap/machine/alarmList","경보 발생빈도"],
			"a05":["/jinhap/machine/tempMonitoring","온도경향 모니터링"],
			"a06":"",
			"a07":"",
			"b01":["/jinhap/work/machinePerformStatus","설비별 생산실적"],
			"b02":["/jinhap/work/machineEfficStatus","설비효율관리"],
			"b03":["/jinhap/work/monitoringStatus","생산모니터링"],
			"b04":["/jinhap/work/inventoryStatus","재고관리"],
			"b05":"",
			"b06":"",
			"b07":"",
			"c01":["/jinhap/condition/corrStatus","TC교체이력"],
			"c02":["/jinhap/condition/machinePartTemp","설비별 액 관리"],
			"c03":["/jinhap/condition/machineLiquidManage","신액 교반일지"],
			"c04":["/jinhap/condition/dailyCheck","일상점검일지"],
			"c05":["/jinhap/condition/divisionWeight","분할기준중량관리"],
			"c06":"",
			"c07":"",
			"d01":["/jinhap/quality/tusTest","온도균일성 테스트"],
			"d02":["/jinhap/quality/resistTest","내식성 테스트"],
			"d03":["/jinhap/quality/inTest","수입검사"],
			"d04":["/jinhap/quality/liquidAnalyze","욕액분석"],
			"d05":["/jinhap/quality/nonProductManage","부적합품 관리"],
			"d06":"",
			"d07":"",
			"e01":["/jinhap/user/planManage","자격인증관리"],
			"e02":["/jinhap/user/workerManage","작업자 근무현황"],
			"e03":["/jinhap/user/carManage","지게차,청소차 점검일지"],
			"e04":["/jinhap/user/checkManage","유해화학물질 점검일지"],
			"e05":["/jinhap/user/userPermission","사용자 권한부여"],
			"e06":["/jinhap/user/userInsert","사용자 등록"],
			"e07":"",
			"f01":["/jinhap/work/inputControlStatus","투입제어 및 모니터링"],
			"f02":["/jinhap/work/machineRealStatus","설비 실시간정보"],
			"f03":"",
			"f04":"",
			"f05":"",
			"f06":"",
			"f07":"",
			"g01":["/jinhap/work/lotReportStatus","LOT 보고서"],
			"g02":["/jinhap/work/workConditionStatus","생산조건 모니터링"],
			"g03":"",
			"g04":"",
			"g05":"",
			"g06":"",
			"g07":"",
			"h01":["/jinhap/machine/checkPlan","정기점검 계획"],
			"h02":["/jinhap/machine/nonTime","비가동현황"],
			"h03":["/jinhap/machine/repairStatus","설비이력카드"],
			"h04":"",
			"h05":"",
			"h06":"",
			"h07":"",
			"i01":["/jinhap/user/standardDocManage","관리계획서 등 관리"],
			"i02":["/jinhap/user/productDocManage","사양별 대기통수"],
			"i03":["/jinhap/user/checkDocManage","점검일정 체크"],
			"i04":"",
			"i05":"",
			"i06":"",
			"i07":"",
			"j01":["/jinhap/agvwash/missionCount","AGV 미션수행횟수"],
			"j02":["/jinhap/agvwash/errorCount","AGV 오류발생 횟수"],
			"j03":["/jinhap/agvwash/batteryStatus","AGV 배터리 소모이력"],
			"j04":["/jinhap/agvwash/workOrderStatus","AGV 작업지시 조회"],
			"j05":"",
			"j06":"",
			"j07":"",
			"k01":["/jinhap/agvwash/washList","세척투입리스트"],
			"k02":["/jinhap/agvwash/washInput","세척투입"],
			"k03":["/jinhap/agvwash/washShotWorkPerform","세척,쇼트 일 생산량"],
			"k04":["/jinhap/agvwash/washShotWaitList","세척,쇼트 예약상태"],
			"k05":["/jinhap/agvwash/workOrderList","작업지시 조회"],
			"k06":["/jinhap/agvwash/lineInOutList","라인별 입출고이력"],
			"k07":["/jinhap/agvwash/machineWorkPerform","설비별 작업실적"],
			"k08":["/jinhap/agvwash/lineUseManage","라인별 사용유무관리"],
			
	};
	
/*	
	console.log(obj);
	console.log(obj[paramKey][0]);*/
	
	return obj[paramKey];
}
</script>
