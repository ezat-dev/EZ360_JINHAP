<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>작업일보</title>
    <%@include file="../include/pluginpage.jsp" %>
    <style>
        .btn-container {
        	margin-top: 20px;
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: 50px;
            padding: 0 10px;
            box-sizing: border-box;
        }
        .btn-container button {
            flex: 1;
            height: 100%;
            margin: 0 5px;
            font-size: 14px;
            color: #000;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        .btn-container button:first-child { margin-left: 0; }
        .btn-container button:last-child  { margin-right: 0; }
        .btn-container button:hover {
            background-color: #e0e0e0;
        }
        iframe {
            width: 100%;
            height: 750px; /* 원하는 높이 설정 */
            border: none;
        }
    </style>
</head>
<body>
    <main class="main">
        <div class="btn-container">
         	<button id="btn1">G600</button>
            <button id="btn2">G800</button>
           
            <button id="btn3">공용설비</button>
            <button id="btn4">K-BLACK</button>
            <button id="btn5">탈유지 1호기</button>
            <button id="btn6">탈유지 2호기</button>
            <button id="btn7">쇼트1호기</button>
            <button id="btn8">쇼트2호기</button>
            <button id="btn9">쇼트3호기</button>
            <button id="btn10">쇼트4호기</button>
            <button id="btn11">쇼트5호기</button>
            <button id="btn12">쇼트6호기</button>
        </div>
        <jsp:include page="../include/tabBar.jsp"/>
        
   
        <iframe id="iframe-view"></iframe>
    </main>

<script>
$(function(){
    $(".headerP").text("취출 운전관리 - 생산조건 모니터링");

    const buttonMappings = {
        "#btn1": "/geomet/work/report_g600",
        "#btn2": "/geomet/work/report_g800",
        "#btn3": "/geomet/work/report_common",
        "#btn4": "/geomet/work/report_kblack",
        "#btn5": "/geomet/work/report_oil1",
        "#btn6": "/geomet/work/report_oil2",
        "#btn7": "/geomet/work/report_shot1",
        "#btn8": "/geomet/work/report_shot2",
        "#btn9": "/geomet/work/report_shot3",
        "#btn10": "/geomet/work/report_shot4",
        "#btn11": "/geomet/work/report_shot5",
        "#btn12": "/geomet/work/report_shot6"
    };

    $.each(buttonMappings, function(buttonId, url) {
        $(buttonId).on("click", function(){
            $(".btn-container button").css("background-color", "#f0f0f0");
            $(this).css("background-color", "#c0c0c0");
            $("#iframe-view").attr("src", url);
        });
    });
    setTimeout(function(){
        $("#btn1").click();
    }, 100);

});

</script>

</body>
</html>
