<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경보 발생빈도</title>
<%@include file="../include/pluginpage.jsp" %>    
<style>
.search{
	height:40px;
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
    		
    	</div>
    	
    	
		<jsp:include page="../include/tabBar.jsp"/>
	   
	    
	    <!-- 화면표시 -->
	    <div class="view">
	    	
	    </div>
	    

	</main>
	
<script>
	//전역변수

	//로드
	$(function(){
		//헤더에 페이지명 적용
		$(".headerP").text("모니터링 - 경보발생빈도");
		insertButtonNone();
		excelButtonNone();
		printButtonNone();		
	});

	//이벤트
	
	
	//함수

</script>

</body>
</html>
