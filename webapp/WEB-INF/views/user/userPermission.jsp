<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 권한부여</title>
<%@include file="../include/pluginpage.jsp" %>
    <link rel="stylesheet" href="/geomet/css/authority2/authority2.css">
    
    <style>
	
.view {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-left:1008px;
	margin-top:200px;
}
.tabulator {
	width: 90%;
	max-width: 100%;
	max-height: 500px;
	overflow-x: hidden !important;  
}
       
.tabulator .tabulator-cell {
	white-space: normal !important;
	word-break: break-word; 
	text-align: center;
}
        
.row_select{
	background-color:#9ABCEA !important;
}
    
    
    </style>
    <body>
    
    <div class="tab">
    

</div>

    <body>

    <form method="post" id="permissionForm" name="permissionForm">
    	<input type="text" style="display:none;" id="user_code" name="user_code" />

	    
	    <div class="a-01-text-box">통합 모니터링</div>
	    <div class="a-02-text-box">설비별 모니터링</div>
	    <div class="a-03-tex-box">경보 모니터링</div>
	    <div class="a-04-text-box">경보 발생빈도</div>
	    <div class="a-05-text-box">온도경향 모니터링</div>
<!-- 	    
	    <div class="a-06-text-box">출고대기현황</div>
	    <div class="a-07-text-box">담당자별공정작업현황</div>
	    <div class="a-08-text-box">재고현황(개괄)</div>
	    <div class="a-09-text-box">재고현황(상세정보)</div>
	    <div class="a-10-text-box">입출고삭제현황</div>
 -->
	    
	    
	    
	      <select id="a01" name="a01" class="a-01">
	          <option value="N">없음</option>
	          <option value="R">조회</option>
	      </select>
	    
	    
	      <select id="a02" name="a02" class="a-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	    
	      <select id="a03" name="a03" class="a-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	    
	      <select id="a04" name="a04" class="a-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	    
	      <select id="a05" name="a05" class="a-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
<!-- 	    
	      <select id="a06" name="a06" class="a-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="a07" name="a07" class="a-07">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	      <select id="a09" name="a09" class="a-08">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	    
	      <select id="a08" name="a08" class="a-09">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	      <select id="a10" name="a10" class="a-10">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
 -->
 
	    <div class="b-01-text-box">설비별 생산실적</div>
	    <div class="b-02-text-box">설비효율 관리</div>
	    <div class="b-03-text-box">생산모니터링 현황</div>
	    <div class="b-04-text-box">작업일보</div>
	    <div class="b-05-text-box">재고관리(약품)</div>
	    
	      <select id="b01" name="b01" class="b-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	    
	      <select id="b02" name="b02" class="b-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="b03" name="b03" class="b-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	    
	      <select id="b04" name="b04" class="b-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="b05" name="b05" class="b-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	   
	   	<div class="c-01-text-box">TC/조절계 이력</div>
	    <div class="c-02-text-box">설비별 조건관리</div>
	    <div class="c-03-text-box">설비별 관리일지</div>
	    <div class="c-04-text-box">일상점검일지</div>
	    <div class="c-05-text-box">기준 정보</div>
	   
	   
<!-- 	    <div class="c-01-text-box">TC교체이력</div>
	    <div class="c-02-text-box">설비별 액 관리</div>
	    <div class="c-03-text-box">신액 교반일지</div>
	    <div class="c-04-text-box">일상점검일지</div>
	    <div class="c-05-text-box">분할기준중량관리</div> -->
<!-- 	    
	    <div class="c-06-text-box">후세정작업실적</div>
	    <div class="c-07-text-box">쇼트/포장 작업실적</div>
	    <div class="c-08-text-box">제품별작업실적</div>
	    <div class="c-09-text-box">설비별작업실적</div>
	    <div class="c-10-text-box">제품별불량현황</div>
	    <div class="c-11-text-box">설비별불량현황</div>
	    <div class="c-12-text-box">출고대기현황</div>
 -->	    
	    
	      <select id="c01" name="c01" class="c-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="c02" name="c02" class="c-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="c03" name="c03" class="c-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="c04" name="c04" class="c-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="c05" name="c05" class="c-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
<!-- 
	      <select id="c05" name="c05" class="c-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="c06" name="c06" class="c-07">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="c07" name="c07" class="c-08">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="c08" name="c08" class="c-09">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="c09" name="c09" class="c-10">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	  
	      <select id="c10" name="c10" class="c-11">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="c11" name="c11" class="c-12">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
 -->
	    <div class="d-01-text-box">온도균일성</div>
	    <div class="d-02-text-box">테스트/시험정보</div>
	    <div class="d-03-text-box">수입검사</div>
	    <div class="d-04-text-box">액 분석 관리</div>
	    <div class="d-04-text-box">부적합품 관리</div>
<!-- 	    
	    <div class="d-05-text-box">설비점검기준등록</div>
	    <div class="d-06-text-box">설비별점검현황(일별)</div>
	    <div class="d-07-text-box">설비별점검현황(월별)</div>
	    <div class="d-08-text-box">측정기기고장이력</div>
	    <div class="d-09-text-box">측정기기점검관리</div>
 -->	    
	    
	      <select id="d01" name="d01" class="d-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="d02" name="d02" class="d-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="d03" name="d03" class="d-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	    
	      <select id="d04" name="d04" class="d-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>

	    <div class="e-01-text-box">자격인증관리</div>
	    <div class="e-02-text-box">작업자 근무현황</div>
	    <div class="e-03-text-box">지게차,청소차 점검일지</div>
	    <div class="e-04-text-box">유해화학물질 점검일지</div>
	    <div class="e-05-text-box">사용자 권한부여</div>
	    <div class="e-06-text-box">사용자 등록</div>
	
	      <select id="e01" name="e01" class="e-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	   
	      <select id="e02" name="e02" class="e-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	   
	     <select id="e03" name="e03" class="e-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	   
	     <select id="e04" name="e04" class="e-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	   
	     <select id="e05" name="e05" class="e-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	        <option value="D">삭제</option>
	    </select>
	
	    <div class="f-01-text-box"></div>
	    <div class="f-02-text-box"></div>
	    <div class="f-04-text-box"></div>
	    
	    
	    <div class="f-01-text-box">투입제어 및 모니터링</div>
	    <div class="f-02-text-box">설비 실시간 정보</div>


	      <select id="e06" name="e06" class="e-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="f01" name="f01" class="f-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="f02" name="f02" class="f-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
 
	    <div class="g-01-text-box">LOT 보고서</div>
	    <div class="g-02-text-box">생산조건 모니터링</div>
	    
	    <div class="h-01-text-box">정기점검 계획</div>
	    <div class="h-02-text-box">설비 비가동 현황</div>
	    <div class="h-03-text-box">설비 이력 관리</div>
	    

	    <div class="i-01-text-box">온도 균일성</div>
	    <div class="i-02-text-box">사양별 대기통수</div>
	    <div class="i-03-text-box">점검일정 체크</div>
	    
	      <select id="g01" name="g01" class="g-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	 
	      <select id="g02" name="g02" class="g-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	


	
	      <select id="h01" name="h01" class="h-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="h02" name="h02" class="h-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="h03" name="h03" class="h-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	



	
	      <select id="i01" name="i01" class="i-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="i02" name="i02" class="i-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="i03" name="i03" class="i-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	
	</form>
	    
	    <div class="aa-text">모니터링</div>
	    <div class="bb-text">생산관리</div>
	    <div class="cc-text">조건관리</div>
	    <div class="dd-text">품질관리</div>
	    <div class="ee-text">인원 및 안전관리</div>
	    <div class="ff-text">투입 운전관리</div>
	    <div class="gg-text">취출 운전관리</div>
	    <div class="hh-text">설비관리</div>
	    <div class="ii-text">문서관리</div>

	    <img class="sub-title-01-1" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-2" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-3" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-4" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-5" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-6" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-7" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-8" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-9" src="/geomet/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-10" src="/geomet/css/login/sub-title-01-10.png" />
	  	<div class="selectUserText">작업자 선택</div>
	  	<div class="selectUserText2">작업자 : </div>
	  	<div class="userName"></div>
	  	
	  	<div class="autText">권한부여 : </div>
	  	<button class="allNo" type="button">전체없음</button>
	  	<button class="allUpdate" type="button">최고권한</button>
	    
	    <button class="saveAut" type="button" onclick="saveAut();">저장</button>
	    <button class="clearAut" type="button">초기화</button>
	    
	    
	     <div class="view">
	        <div id="dataList" class="tabulator"></div>
	    </div>

<script>
	//전역변수
    var userTable;	
	var user_code = 0;	//선택한 사용자의 고유코드

	//로드
	$(function(){
		$(".headerP").text("인원 및 안전관리 - 사용자 권한부여");
		//전체 사용자목록 조회
		getAllUserList();
	});

	//이벤트
	$('.allNo').click(function() {
	    $('select').val('no');
	});    
	$('.allUpdate').click(function() {
	    $.each(selectBoxes, function(className, value) {
	        $('.' + className).val(value);
	    });
	});
	
  /*   $(document).ready(function() {
        const selectBoxes = {
            "a-01": "update",
            "a-02": "update",
            "a-03": "update",
            "a-04": "update",
            "a-05": "update",
            "a-06": "update", 
            "a-07": "select",
            "a-08": "select",
            "a-09": "select",
            "a-10": "select",
            "b-01": "update",
            "b-02": "update",
            "b-03": "update",
            "b-04": "update",
            "b-05": "update",
            "c-01": "update",
            "c-02": "update",
            "c-03": "update",
            "c-04": "update",
            "c-05": "update",
            "c-06": "update",
            "c-07": "update",
            "c-08": "update",
            "c-09": "update",
            "c-10": "update",
            "c-11": "update",
            "c-12": "update",
            "d-01": "update",
            "d-02": "update",
            "d-03": "update",
            "d-04": "update",
            "d-05": "update",
            "d-06": "select",
            "d-07": "select",
            "d-08": "select",
            "d-09": "update",
            "e-01": "select",
            "e-02": "select",
            "e-03": "select",
            "f-01": "update",
            "f-02": "update",
            "f-03": "update",
            "f-04": "update",
            "f-05": "select",
            "f-06": "select",
            "f-07": "update",
            "f-08": "select",
            "f-09": "select",
            "g-01": "update",
            "g-02": "update",
            "g-03": "update",
            "g-04": "update",
            "g-05": "update",
            "g-06": "update",
            "g-07": "select",
            "g-08": "select",
            "g-09": "select",
            "g-10": "select",
            "g-11": "select",
            "g-12": "select",
            "g-13": "select",
            "g-14": "select",
            "g-15": "select",
            "g-16": "select",
            "g-17": "update",
            "g-18": "select",
            "h-01": "update",
            "h-02": "update",
            "h-03": "update",
            "h-04": "update",
            "h-05": "update",
            "h-06": "update",
            "h-07": "update",
            "h-08": "update",
            "h-09": "update",
            "h-10": "update",
            "h-11": "update",
            "h-12": "update",
            "h-13": "update",
               
           
        };
    } */

	
	//함수
	function getAllUserList(){
		
		userTable = new Tabulator("#dataList", {
		    height:"560px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    selectableRows:true,
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/geomet/user/userPermission/userSelect",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#dataList .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"아이디", field:"user_id", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"성명", field:"user_name", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"부서", field:"user_busu", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"직책", field:"user_jick", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"유저코드", field:"user_code", sorter:"int", width:100,
		        	hozAlign:"center", visible:false},
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){
				
				$("#dataList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#dataList div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();

				user_code = rowData.user_code;
				$("#user_code").val(rowData.user_code);
				$(".userName").text(rowData.user_name);
				console.log("user_code 값 입력된 후:", $("#user_code").val());
			    console.log("user_name 값 입력된 후:", $(".userName").text());
				getPermissionUserSelectPermission();
			},
		});		
	}
	
	function getPermissionUserSelectPermission(){
		
		var userCode = $("#user_code").val();
		
		$.ajax({
			url:"/geomet/user/userPermission/userSelectPermission",
			type:"post",
			dataType:"json",
			data:{"user_code":userCode},
			success:function(result){
				
				
				var data = result.data;
				for(let key in data){
					$("#"+key).val(data[key]);		
				}
			}
		})
	}


	
	$(document).on('click', '.Aupdate', function() {
	    var user_code = $("#user_code").val();
	    var permissions = {};
	    
	    for (var i = 1; i <= 7; i++) {
	        // 체크박스가 선택된 경우 'R', 그렇지 않으면 'N'
	        permissions['a0' + i] = $("input[name='a0" + i + "']:checked").val() ? 'R' : 'N';
	    }

	    var permissionData = new FormData();
	    permissionData.append("user_code", user_code);

	    for (var key in permissions) {
	        permissionData.append(key, permissions[key]);
	    }

	    permissionData.forEach(function(value, key) {
	        console.log(key + ": " + value); // 콘솔에 전송되는 값 출력
	    });

	    $.ajax({
	        url: "/geomet/user/userPermission/update",
	        type: "POST",
	        contentType: false,
	        processData: false,
	        dataType: "json",
	        data: permissionData,
	        success: function(result) {
	            alert("권한이 수정되었습니다.");
	            getPermissionUserSelect();
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX 오류:", status, error);
	            alert("오류가 발생했습니다.");
	        }
	    });
	});


	    
	function saveAut(){
	    var permissionData = new FormData($("#permissionForm")[0]);

	    // FormData의 내용을 콘솔에 출력
	    for (var pair of permissionData.entries()) {
	        console.log(pair[0] + ': ' + pair[1]);
	    }

	    $.ajax({
	        url: "/geomet/user/userPermission/update",
	        type: "post",
	        contentType: false,
	        processData: false,
	        dataType: "json",
	        data: permissionData,
	        success: function(result){
	            alert("권한이 수정되었습니다.");
	            getPermissionUserSelect();
	        }
	    });		
	}


    </script>

	</body>
</html>
