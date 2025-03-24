<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경보 모니터링</title>
<%@include file="../include/pluginpage.jsp" %>    
<style>
.selectMch {
    border: 2px solid #ccc;
    background-color: #fff;
    border-radius: 8px;
    padding: 10px;
    width: 310px;
    position: absolute;
    top: 55px;
    left: 75px;
    display: flex;
    align-items: center;
}

.selectMch label {
    font-size: 14pt;
    font-weight: 700;
    margin-right: 10px;
}

.selectMch select {
    font-size: 13pt;
    font-weight: 700;
    width: 120px;
    text-align: center;
    margin-right: 10px; /* 버튼과 간격을 줌 */
}

.select-button {
    background-color: #f0f0f0; /* 회색 배경 */
    color: #333; /* 텍스트 색상 */
    font-weight: bold;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 8px 15px;
    cursor: pointer;
    display: flex;
    align-items: center;
}

.select-button img {
    width: 16px;
    height: 16px;
    margin-right: 5px;
}

.select-button:hover {
    background-color: #dcdcdc; /* 마우스 오버 시 색상 */
}

.view {
    display: flex; 
    flex-wrap: wrap;
    justify-content: flex-start; 
    gap: 10px;
    max-width: 90%; 
    margin: 0 auto;
    padding: 20px;
    border: 2px solid #ccc; 
    background-color: #fff;
    margin-top: 120px;
}

.box {
    width: 180px;
    height: 70px;
    border: 1px solid #ccc;  
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 14pt;
    font-weight: bold;
    background-color: #f5f5f5;  
    border-radius: 8px; 
}
</style>
    
<body>

    <main class="main">
        <div class="selectMch">
            <label class="daylabel">설비명 :</label>
            <select class="dayselect">
                <option value="G800">G800</option>
                <option value="G600">G600</option>
                <option value="K-BLACK">K-BLACK</option>
                <option value="공용설비">공용설비</option>
                <option value="방청">방청</option>
                <option value="이코팅1호기">이코팅1호기</option>
                <option value="이코팅2호기">이코팅2호기</option>
                <option value="세척 공통 (열병합)">세척 공통 (열병합)</option>
                <option value="세척 1호기">세척 1호기</option>
                <option value="세척 2호기">세척 2호기</option>
            </select>
            <button class="select-button">
                <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
            </button>
        </div>
       
        <div class="view">
            <div class="box box1">예시1</div>
            <div class="box box2">예시2</div>
            <div class="box box3">예시3</div>
            <div class="box box4">예시4</div>
            <div class="box box5">예시5</div>
            <div class="box box6">예시6</div>
            <div class="box box7">예시7</div>
            <div class="box box8">예시8</div>
            <div class="box box9">예시9</div>
            <div class="box box10">예시10</div>
            <div class="box box11">예시11</div>
            <div class="box box12">예시12</div>
            <div class="box box13">예시13</div>
            <div class="box box14">예시14</div>
            <div class="box box15">예시15</div>
            <div class="box box16">예시16</div>
            <div class="box box17">예시17</div>
            <div class="box box18">예시18</div>
            <div class="box box19">예시19</div>
            <div class="box box20">예시20</div>
            <div class="box box21">예시21</div>
            <div class="box box22">예시22</div>
            <div class="box box23">예시23</div>
            <div class="box box24">예시24</div>
            <div class="box box25">예시25</div>
            <div class="box box26">예시26</div>
            <div class="box box27">예시27</div>
            <div class="box box28">예시28</div>
            <div class="box box29">예시29</div>
            <div class="box box30">예시30</div>
            <div class="box box31">예시31</div>
            <div class="box box32">예시32</div>
            <div class="box box33">예시33</div>
            <div class="box box34">예시34</div>
            <div class="box box35">예시35</div>
            <div class="box box36">예시36</div>
            <div class="box box37">예시37</div>
            <div class="box box38">예시38</div>
            <div class="box box39">예시39</div>
            <div class="box box40">예시40</div>
            <div class="box box41">예시41</div>
            <div class="box box42">예시42</div>
            <div class="box box43">예시43</div>
            <div class="box box44">예시44</div>
            <div class="box box45">예시45</div>
            <div class="box box46">예시46</div>
            <div class="box box47">예시47</div>
            <div class="box box48">예시48</div>
            <div class="box box49">예시49</div>
            <div class="box box50">예시50</div>
            <div class="box box51">예시51</div>
            <div class="box box52">예시52</div>
            <div class="box box53">예시53</div>
            <div class="box box54">예시54</div>
            <div class="box box55">예시55</div>
            <div class="box box56">예시56</div>
        </div>
    </main>
    
<script>
    $(function(){
        $(".headerP").text("모니터링 - 경보모니터링");
        insertButtonNone();
        excelButtonNone();
        printButtonNone();        
    });
</script>

</body>
</html>
