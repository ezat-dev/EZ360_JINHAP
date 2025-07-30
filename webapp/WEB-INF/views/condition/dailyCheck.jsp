<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일상점검일지</title>
<%@include file="../include/pluginpage.jsp" %>    
<style>
.search{
	height:40px;
}
.container {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-left:1008px;
	margin-top:200px;
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
	    
		<div class="search">
            <button id="sendKakaoBtn" style="height:40px;">카카오톡 보내기</button>
    	</div>
    	
	    </div>

	</main>
<script>
$(function(){
	$(".headerP").text("조건관리 - 일상점검일지");

    // 버튼 클릭 이벤트
    $('#sendKakaoBtn').click(function() {
        $.ajax({
            url: '/geomet/condition/kakao',
            method: 'POST',
            data: { message: '안녕하세요! 카카오톡 테스트 메시지입니다.' },
            success: function(res) {
                alert('카카오톡 메시지 전송 완료: ' + res);
            },
            error: function(xhr, status, error) {
                alert('카카오톡 메시지 전송 실패: ' + error);
            }
        });
    });
});
</script>

</body>
</html>
