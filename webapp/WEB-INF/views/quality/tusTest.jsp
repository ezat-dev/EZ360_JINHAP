<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온도균일성 테스트</title>
    <%@include file="../include/pluginpage.jsp" %>    
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #7ABF4E;
            color: white;
        }
        .category {
            background-color: #D9EAD3;
        }
        .inputt {
            font-size: 18px;
            width: 77px; 
            margin-bottom: 10px;
        }
        .box1 {
            margin-top: 100px;
        }
        .status {
            padding: 5px;
            background-color: #FFD700;
            font-size: 18px;
            color: white;
            border-radius: 3px;
            margin-left: 5px;
        }
    </style>
</head>
<body>

<div class="box1">
<h3>테스트 기준 : 1회/년</h3>
    <table>
        <tr>
            <th rowspan="2">설비</th>
            <th rowspan="2">기준서 (첨부)</th>
            <th rowspan="2">합부기준</th>
            <th rowspan="2">구분</th>
            <th colspan="12">월별</th>
        </tr>
        <tr>
            <th>1월</th><th>2월</th><th>3월</th><th>4월</th><th>5월</th><th>6월</th>
            <th>7월</th><th>8월</th><th>9월</th><th>10월</th><th>11월</th><th>12월</th>
        </tr>

        <!-- 반복문을 통한 G-600 데이터 생성 -->
        <tr>
            <td rowspan="2">G-600</td>
            <td rowspan="2"></td>
            <td rowspan="2">320도~355도<br>10분 이상</td>
            <td class="category">계획</td>
            <c:forEach var="i" begin="1" end="12">
                <td>
                    <input class="inputt" type="text" name="g600-plan-<c:out value="${i}"/>" placeholder="날짜 입력">
                </td>
            </c:forEach>
        </tr>
        <tr>
            <td class="category">실적</td>
            <c:forEach var="i" begin="1" end="12">
                <td>
                    <input class="inputt" type="text" name="g600-<c:out value="${i}"/>" placeholder="분 입력">
                    <span class="status">합/부</span>
                </td>
            </c:forEach>
        </tr>

        <!-- 반복문을 통한 G-800 데이터 생성 -->
        <tr>
            <td rowspan="2">G-800</td>
            <td rowspan="2"></td>
            <td rowspan="2">320도~355도<br>10분 이상</td>
            <td class="category">계획</td>
            <c:forEach var="i" begin="1" end="12">
                <td>
                    <input class="inputt" type="text" name="g800-plan-<c:out value="${i}"/>" placeholder="날짜 입력">
                </td>
            </c:forEach>
        </tr>
        <tr>
            <td class="category">실적</td>
            <c:forEach var="i" begin="1" end="12">
                <td>
                    <input class="inputt" type="text" name="g800-<c:out value="${i}"/>" placeholder="분 입력">
                    <span class="status">합/부</span>
                </td>
            </c:forEach>
        </tr>

        <!-- 반복문을 통한 공용설비 데이터 생성 -->
        <tr>
            <td rowspan="2">공용설비</td>
            <td rowspan="2"></td>
            <td rowspan="2">100도 +10도<br>10분 이상</td>
            <td class="category">계획</td>
            <c:forEach var="i" begin="1" end="12">
                <td>
                    <input class="inputt" type="text" name="gongyong-plan-<c:out value="${i}"/>" placeholder="날짜 입력">
                </td>
            </c:forEach>
        </tr>
        <tr>
            <td class="category">실적</td>
            <c:forEach var="i" begin="1" end="12">
                <td>
                    <input class="inputt" type="text" name="gongyong-<c:out value="${i}"/>" placeholder="분 입력">
                    <span class="status">합/부</span>
                </td>
            </c:forEach>
        </tr>
    </table>
</div>

<script>
let now_page_code = "d01";
</script>
</body>
</html>
