<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비별 모니터링</title>
<link rel="stylesheet" href="/geomet/css/searchBar/searchBar.css">
<%@include file="../include/pluginpage.jsp" %> 
<style>
.search{
	border-radius: 5px;
	display: flex;
	align-items: center;
	margin:1rem 0 0 2rem;	
	/*상 우 하 좌*/
	width:90%;
	height:40px;
}

.search label{
	font-size:12pt;
	font-weight:700;
	margin-right:1%;
	display: inline-block;
	width:100px;
}



.search select{
	font-size:13pt;
	font-weight:700;
	width:120px;
	text-align:center;
	position:absolute;
	left:100px;
	top:27px;
}


.view{
	display: flex; 
	justify-content: center;
}
</style>
    
    
<body>

	<main class="main">
    	<!-- 조회조건 표시 -->
    	<div class="search">
    		<label for="selectHogi">설비명:</label>
			<select id="selectHogi" style="margin-right:1%;">
				<option value="">600T</option>
				<option value="">800T</option>
				<option value="">이코팅 1호기</option>
				<option value="">세척 1호기</option>
			</select>    		
    	</div>
    	
    	
		<jsp:include page="../include/tabBar.jsp"/>
	   
	    
	    <!-- 화면표시 -->
	    <div class="view">
	    	<img src="/geomet/css/img/detailMonitoring.png" alt="" />
	    </div>
	    

	</main>
<script>
	//전역변수

	//로드
	$(function(){
		//헤더에 페이지명 적용
		$(".headerP").text("모니터링 - 설비별 모니터링");		
		insertButtonNone();
		excelButtonNone();
		printButtonNone();
	});

	//이벤트
	
	
	//함수

</script>

</body>
</html>
