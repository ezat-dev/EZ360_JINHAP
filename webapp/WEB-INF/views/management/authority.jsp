<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>권한 설정</title>
    <%@ include file="../include/sideBar.jsp" %>
    
    
    <style>
    .main {
    margin-left: 225px;
    margin-right:8px; 
    margin-top : 70px;
    width : 87.85%;
    height: calc(100vh - 80px); 
    background-color: #ffffff; 
    padding: 1rem; 
     /* border : 1px solid rgb(53, 53, 53);  */
    border-radius: 0px 0px 6px 6px;
	}
	.tab {
    margin-left: 117px;
    margin-right:8px;
    margin-top: 5px; 
    height: 33px;
    /* padding: 1rem; */
    background-color: #ffffff; 
     /* border : 1px solid rgb(53, 53, 53);   */
    border-radius: 6px 6px 0px 0px;
	}
	
	
	
	.container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left:1008px;
            margin-top:200px;
        }

        #tab1, #tab2, #tab3, #tab4 {
            visibility: hidden;
        }

        #tab1 {
            visibility: visible;
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
    
    <div class="tab"></div>
    <form method="post" id="permissionForm" name="permissionForm">
    	<input type="text" style="display:none;" id="user_code" name="user_code" />
	 	<main class="main">
	    
	    <div class="a-01-text-box">품목관리</div>
	    <div class="a-02-text-box">입고관리</div>
	    <div class="a-03-tex-box">출고관리</div>
	    <div class="a-04-text-box">기타출고</div>
	    <div class="a-05-text-box">제품별재고현황</div>
	    <div class="a-06-text-box">출고대기현황</div>
	    <div class="a-07-text-box">담당자별공정작업현황</div>
	    <div class="a-08-text-box">재고현황(개괄)</div>
	    <div class="a-09-text-box">재고현황(상세정보)</div>
	    <div class="a-10-text-box">입출고삭제현황</div>
	    
	    
	    
	    
	      <select id="a01" name="a01" class="a-01">
	          <option value="N">없음</option>
	          <option value="R">조회</option>
	          <option value="I">저장</option>
	          <option value="U">수정</option>
	      </select>
	    
	    
	      <select id="a02" name="a02" class="a-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	    
	      <select id="a03" name="a03" class="a-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	    
	      <select id="a04" name="a04" class="a-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	    
	      <select id="a05" name="a05" class="a-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	    
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
	
	    <div class="b-01-text-box">작업지시</div>
	    <div class="b-02-text-box">작업현황</div>
	    <div class="b-03-text-box">부적합보고서</div>
	    <div class="b-04-text-box">생산대기현황</div>
	    <div class="b-05-text-box">LOT추적관리</div>
	    
	      <select id="b01" name="b01" class="b-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	    
	      <select id="b02" name="b02" class="b-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="b03" name="b03" class="b-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="b04" name="b04" class="b-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="b05" name="b05" class="b-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	    <div class="c-01-text-box">준비작업실적</div>
	    <div class="c-02-text-box">전세정작업실적</div>
	    <div class="c-03-text-box">방탄작업실적</div>
	    <div class="c-04-text-box">각로별작업실적</div>
	    <div class="c-05-text-box">템퍼링작업실적</div>
	    <div class="c-06-text-box">후세정작업실적</div>
	    <div class="c-07-text-box">쇼트/포장 작업실적</div>
	    <div class="c-08-text-box">제품별작업실적</div>
	    <div class="c-09-text-box">설비별작업실적</div>
	    <div class="c-10-text-box">제품별불량현황</div>
	    <div class="c-11-text-box">설비별불량현황</div>
	    <div class="c-12-text-box">출고대기현황</div>
	    
	      <select id="c12" name="c12" class="c-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="c01" name="c01" class="c-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="c02" name="c02" class="c-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="c03" name="c03" class="c-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="c04" name="c04" class="c-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
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
	 
	    <div class="d-01-text-box">SparePart관리</div>
	    <div class="d-02-text-box">설비비가동등록</div>
	    <div class="d-03-text-box">설비가동율분석</div>
	    <div class="d-04-text-box">설비수리이력관리1</div>
	    <div class="d-05-text-box">설비점검기준등록</div>
	    <div class="d-06-text-box">설비별점검현황(일별)</div>
	    <div class="d-07-text-box">설비별점검현황(월별)</div>
	    <div class="d-08-text-box">측정기기고장이력</div>
	    <div class="d-09-text-box">측정기기점검관리</div>
	    
	      <select id="e01" name="e01" class="d-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="e02" name="e02" class="d-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="e03" name="e03" class="d-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="e04" name="e04" class="d-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="e05" name="e05" class="d-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    
	      <select id="e06" name="e06" class="d-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="e07" name="e07" class="d-07">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="e08" name="e08" class="d-08">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="e09" name="e09" class="d-09">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	    <div class="e-01-text-box">전체모니터링</div>
	    <div class="e-02-text-box">전체모니터링(설비)</div>
	    <div class="e-03-text-box">품질관리모니터링</div>
	
	      <select id="d01" name="d01" class="e-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="d02" name="d02" class="e-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	   
	      <select id="d03" name="d03" class="e-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	    <div class="f-01-text-box">수입검사</div>
	    <div class="f-02-text-box">최종검사</div>
	    <div class="f-03-text-box">부적합등록</div>
	    <div class="f-04-text-box">Xbar-R관리도</div>
	    <div class="f-05-text-box">LOT추적</div>
	    <div class="f-06-text-box">월별불량현황</div>
	    <div class="f-07-text-box">세척청정도검사</div>
	    <div class="f-08-text-box">소입경도현황</div>
	    <div class="f-09-text-box">템퍼링경도현황</div>
	   
	      <select id="f01" name="f01" class="f-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	 
	      <select id="f02" name="f02" class="f-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="f03" name="f03" class="f-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	   
	      <select id="f04" name="f04" class="f-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="f05" name="f05" class="f-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="f06" name="f06" class="f-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="f07" name="f07" class="f-07">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="f08" name="f08" class="f-08">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="f09" name="f09" class="f-09">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	    <div class="g-01-text-box">제품별입고현황</div>
	    <div class="g-02-text-box">제품별출고현황</div>
	    <div class="g-03-text-box">제품별작업실적</div>
	    <div class="g-04-text-box">거래처별입고현황</div>
	    <div class="g-05-text-box">거래처별출고현황</div>
	    <div class="g-06-text-box">설비별작업실적</div>
	    <div class="g-07-text-box">월매출현황(마감)</div>
	    <div class="g-08-text-box">입고현황(종합)</div>
	    <div class="g-09-text-box">생산현황(종합)</div>
	    <div class="g-10-text-box">출고현황(종합)</div>
	    <div class="g-11-text-box">일일매출현황(영업)</div>
	    <div class="g-12-text-box">월별매출및중량보고서</div>
	    <div class="g-13-text-box">년간매출현황</div>
	    <div class="g-14-text-box">월별공정별재고현황</div>
	    <div class="g-15-text-box">월매출현황(마감)_개괄</div>
	    <div class="g-16-text-box">출고현황(종합)_내방</div>
	    <div class="g-17-text-box">공지사항</div>
	    <div class="g-18-text-box">월별거래처별불량현황</div>
	    
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
	
	      <select id="g03" name="g03" class="g-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="g04" name="g04" class="g-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="g05" name="g05" class="g-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="g06" name="g06" class="g-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="g07" name="g07" class="g-07">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g09" name="g09" class="g-08">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g10" name="g10" class="g-09">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g11" name="g11" class="g-10">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g12" name="g12" class="g-11">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g13" name="g13" class="g-12">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g14" name="g14" class="g-13">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g15" name="g15" class="g-14">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g16" name="g16" class="g-15">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g17" name="g17" class="g-16">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	      <select id="g18" name="g18" class="g-17">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	  
	      <select id="g19" name="g19" class="g-18">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	    </select>
	
	    <div class="h-01-text-box">제품등록</div>
	    <div class="h-02-text-box">거래처등록</div>
	    <div class="h-03-text-box">로그인기록</div>
	    <div class="h-04-text-box">설비등록</div>
	    <div class="h-05-text-box">설비별작업표준등록</div>
	    <div class="h-06-text-box">작업자등록</div>
	    <div class="h-07-text-box">불량코드등록</div>
	    <div class="h-08-text-box">설비비가동코드등록</div>
	    <div class="h-09-text-box">사원별권한등록</div>
	    <div class="h-10-text-box">코일등록</div>
	    <div class="h-11-text-box">PLUG등록</div>
	    <div class="h-12-text-box">PLUG점검기준등록</div>
	    <div class="h-13-text-box">측정기기관리</div>
	    
	      <select id="h01" name="h01" class="h-01">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	 
	      <select id="h02" name="h02" class="h-02">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h09" name="h09" class="h-03">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	 
	      <select id="h03" name="h03" class="h-04">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h04" name="h04" class="h-05">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h05" name="h05" class="h-06">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h06" name="h06" class="h-07">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h07" name="h07" class="h-08">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h08" name="h08" class="h-09">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h10" name="h10" class="h-10">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h11" name="h11" class="h-11">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h12" name="h12" class="h-12">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	
	      <select id="h13" name="h13" class="h-13">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	</form>
	    <!-- <div class="user-text-box">작업자</div>
	    <div class="user-01">
	      <select class="h-13">
	        <option value="N">없음</option>
	        <option value="R">조회</option>
	        <option value="I">저장</option>
	        <option value="U">수정</option>
	    </select>
	    </div>
	    <div class="save">저장</div>
	    <div class="close">종료</div> -->
	    <div class="aa-text">제품입출고관리</div>
	    <div class="bb-text">생산관리</div>
	    <div class="cc-text">생산공정관리</div>
	    <div class="dd-text">설비보존관리</div>
	    <div class="ee-text">감사시스템</div>
	    <div class="ff-text">품질관리</div>
	    <div class="gg-text">경영정보</div>
	    <div class="hh-text">기준정보</div>
	    <!-- <div class="useruser-text">작업자선택</div> -->
	    <img class="sub-title-01-1" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-2" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-3" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-4" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-5" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-6" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-7" src="/tkheat/css/login/sub-title-01-10.png" />
	    <img class="sub-title-01-8" src="/tkheat/css/login/sub-title-01-10.png" />
	    
	    <img class="sub-title-01-9" src="/tkheat/css/login/sub-title-01-10.png" />
	  	<div class="selectUserText">작업자 선택</div>
	  	<div class="selectUserText2">작업자 : </div>
	  	<div class="userName">홍길동</div>
	  	
	  	<div class="autText">권한부여 : </div>
	  	<button class="allNo" type="button">전체없음</button>
	  	<button class="allUpdate" type="button">최고권한</button>
	    
	    <button class="saveAut" type="button" onclick="saveAut();">저장</button>
	    <button class="clearAut" type="button">초기화</button>
	    
	    
	     <div class="container">
	        <div id="tab1" class="tabulator"></div>
	        <!-- <div id="tab2" class="tabulator"></div>
	        <div id="tab3" class="tabulator"></div>
	        <div id="tab4" class="tabulator"></div> -->
	    </div>
	</main>
	
    
    <script>
    
/*
$(document).ready(function() {
    $("#tab2, #tab3, #tab4").css("visibility", "hidden");

    var table1 = new Tabulator("#tab1", {
        height: "640px",
        layout: "fitColumns",
        responsiveLayout: "hide",
        pagination: false,
        columns: [
            { title: "사번", field: "user_eNum", hozAlign: "center", width: 73 },
            { title: "아이디", field: "user_id", hozAlign: "center", width: 130 },
            { title: "부서", field: "user_team", hozAlign: "center", width: 73 },
            { title: "직책", field: "user_job", hozAlign: "center", width: 73 },
            { title: "이름", field: "user_name", hozAlign: "center", width: 95 },
            { title: "권한", field: "user_level", hozAlign: "center", width: 70 },
        ]
    });

    table1.on("rowClick", function(e, row) {
        selectedRowData = row.getData();
        console.log("Row data:", selectedRowData);
        
        $("#tab2").css("visibility", "visible");
        $("#tab1 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");

        fetchData2();
    });

    function fetchData1() {
        $.ajax({
            url: '/tkheat/management/authority/user',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            success: function(response) {
                console.log("받아온 데이터:", response);
                table1.clearData();
                table1.setData(response);
            },
            error: function(xhr, status, error) {
                console.error("데이터 가져오기 실패:", error);
            }
        });
    }

    fetchData1();

    var table2 = new Tabulator("#tab2", {
        height: "640px",
        layout: "fitColumns",
        responsiveLayout: "hide",
        pagination: false,
        columns: [
            { title: "B_C", field: "page_big", hozAlign: "center", width: 66 },
            { title: "P_C", field: "page_code", hozAlign: "center", width: 120 },
            { title: "B_N", field: "page_big_name", hozAlign: "center", width: 241 }
        ]
    });

    table2.on("rowClick", function(e, row) {
        var pageBig = row.getData().page_big;
        console.log("클릭된 page_big:", pageBig);

        fetchData3(pageBig);

        $("#tab2 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");
    });

    function fetchData2() {
        $.ajax({
            url: '/tkheat/management/authority/big_Page',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            success: function(response) {
                console.log("테이블 2 데이터:", response);
                table2.clearData();
                table2.setData(response);
            },
            error: function(xhr, status, error) {
                console.error("테이블 2 데이터 가져오기 실패:", error);
            }
        });
    }

    var table3 = new Tabulator("#tab3", {
        height: "640px",
        layout: "fitColumns",
        responsiveLayout: "hide",
        pagination: false,
        columns: [
            { title: "P_C", field: "page_code", hozAlign: "center", width: 120 },
            { title: "B_C", field: "page_sml", hozAlign: "center", width: 66 },
            { title: "B_N", field: "page_sml_name", hozAlign: "center", width: 240 }
        ]
    });

    function fetchData3(pageBig) {
        $.ajax({
            url: '/tkheat/management/authority/small_page',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ page_big: pageBig }),
            success: function(response) {
                console.log("테이블 3 데이터:", response);
                table3.clearData();
                table3.setData(response);
                $("#tab3").css("visibility", "visible");
            },
            error: function(xhr, status, error) {
                console.error("테이블 3 데이터 가져오기 실패:", error);
            }
        });
    }

    table3.on("rowClick", function(e, row) {
        var pageBig = row.getData().page_big;
        console.log("클릭된 page_big:", pageBig);

        $("#tab4").css("visibility", "visible");

        $("#tab3 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");
    });

    var table4 = new Tabulator("#tab4", {
        height: 200,
        data: [
            {NO: 1, LV: "Lv_1", 범위: "보기"},
            {NO: 2, LV: "Lv_2", 범위: "수정"},
            {NO: 3, LV: "Lv_3", 범위: "삭제"},
            {NO: 4, LV: "Lv_100", 범위: "작업자"},
            {NO: 5, LV: "Lv_999", 범위: "Master"}
        ],
        columns: [
            {title: "NO", field: "NO", hozAlign: "center", width: 80 },
            {title: "LV", field: "LV", hozAlign: "center", width: 171 },
            {title: "범위", field: "범위", hozAlign: "center", width: 175 }
        ]
    });

    table4.on("rowClick", function(e, row) {
        $("#tab4 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");
    });

});
*/
</script>


<script>
/*
        $(document).ready(function() {
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

        });
*/

	//전역변수
    var userTable;	
	var user_code = 0;	//선택한 사용자의 고유코드

	//로드
	$(function(){
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
	
	
	
	//함수
	function getAllUserList(){
		
		userTable = new Tabulator("#tab1", {
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
		    ajaxURL:"/tkheat/management/authority/userList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"아이디", field:"user_no", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"부서", field:"user_buso", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"직책", field:"user_jick", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"성명", field:"user_name", sorter:"string", width:100,
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

				$("#tab1 .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#tab1 div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
//				console.log(rowData.user_code);
				user_code = rowData.user_code;
				$("#user_code").val(rowData.user_code);
				$(".userName").text(rowData.user_name);
				
				getPermissionUserSelect();
			},
		});		
	}
	
	function getPermissionUserSelect(){
		
		var userCode = $("#user_code").val();
		
		$.ajax({
			url:"/tkheat/management/authority/userSelect",
			type:"post",
			dataType:"json",
			data:{"user_code":userCode},
			success:function(result){
				
				
				var data = result.data;
				for(let key in data){
					console.log(key);
					console.log(data[key]);
					$("#"+key).val(data[key]);		
				}
			}
		})
	}
	
	function saveAut(){
		var permissionData = new FormData($("#permissionForm")[0]);
/*		
		console.log(permissionData);
		
		return false;
*/		
		
		$.ajax({
			url:"/tkheat/management/authority/userSelectSave",
			type:"post",
			contentType: false,
			processData: false,
			dataType: "json",
			data:permissionData,
			success:function(result){
				alert("권한이 수정되었습니다.");
				getPermissionUserSelect();
			}
		});		
	}

    </script>

	</body>
</html>
