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


  .view {
    display: flex; 
    justify-content: center;
    align-items: center;      /* 세로 중앙 정렬 추가 */
    height: calc(100vh - 100px); /* 차트 높이와 비슷하게 전체 화면 중앙에 */
  }
  .placeholder {
    font-size: 25px;
    font-weight: 700;
    color: #cccccc;           /* 연한 회색 */
    text-align: center;
  }
</style>
    
    
<body>

	<main class="main">
    	<!-- 조회조건 표시 -->

    	
    	
		<jsp:include page="../include/tabBar.jsp"/>
	   
	    

	    <div class="view">
      <p class="placeholder">요청내용 확인 부탁드립니다</p>
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
