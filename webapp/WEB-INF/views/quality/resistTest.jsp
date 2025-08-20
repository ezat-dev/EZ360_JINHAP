<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>테스트/시험정보</title>
<%@include file="../include/pluginpage.jsp"%>
<style>
.search {
	height: 40px;
}

.container {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-left: 1008px;
	margin-top: 200px;
}

.search {
	height: 40px;
	display: flex;
	justify-content: flex-end; /* 오른쪽 끝으로 이동 */
	align-items: center; /* 세로 가운데 정렬 */
}

.btn {
	font-size: 18px;
	margin-right: 200px;
}
</style>
<body>

	<main class="main">
		<!-- 조회조건 표시 -->
		<div class="search">
			<button class="btn">세척액 약품투입기준자료</button>
		</div>


		<jsp:include page="../include/tabBar.jsp" />


		<!-- 화면표시 -->
		<div class="view"></div>

	</main>
	<script>
	//전역변수
let now_page_code = "d02";
	//로드
	$(function(){
		$(".headerP").text("품질관리 - 내식성 테스트");
		
	});
	  $(".btn").on("click", function () {
		    window.location.href = "/geomet/quality/medicineStandard";
		  });

	//이벤트
	
	
	//함수

</script>

</body>
</html>
