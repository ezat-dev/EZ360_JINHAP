<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테스트 시험정보 차트</title>
     <%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/> 
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left: 1008px;
            margin-top: 200px;
        }
        .view {
            display: flex;
            justify-content: center;
            margin-top: 1%;
        }
        .tab {
            width: 95%;
            margin-bottom: 37px;
            margin-top: 5px;
            height: 45px;
            border-radius: 6px 6px 0px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
          .button-container {
    		display: flex;
		    gap: 10px;
		    margin-left: auto;
		    margin-right: 10px;
		    margin-top: 40px;
		}
		.box1 {
		    display: flex;
		    justify-content: right;
		    align-items: center;
		    width: 800px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
        	width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
        .daylabel {
            margin-right: 10px;
            margin-bottom: 13px;
            font-size: 18px;
            margin-left: 20px;
        }
        button-container.button{
        height: 16px;
        }
        
        
        
        /*모달css  */
		   .modal {
		    display: none;
		    position: fixed;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.5);
		    transition: opacity 0.3s ease-in-out;
		    overflow: auto;
		}
		.row_select {
		    background-color: #d0d0d0 !important;
		}
		
		.modal-content {
		    background: white;
		    width: 40%; /* 가로 길이를 50%로 설정 */
		    max-width: 400px; /* 최대 너비를 설정하여 너무 커지지 않도록 */
		    max-height: 800px; /* 화면 높이에 맞게 제한 */
		    overflow-y: auto;
		    margin: 2% auto; /* 수평 중앙 정렬 */
		    padding: 20px;
		    border-radius: 10px;
		    position: relative;
		    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		    transform: scale(0.8);
		    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
		    opacity: 0;
		}
		
		.modal.show {
		    display: block;
		    opacity: 1;
		}
		
		.modal.show .modal-content {
		    transform: scale(1);
		    opacity: 1;
		}
		
		.close {
		    background-color: white;
		    position: absolute;
		    right: 15px;
		    top: 10px;
		    font-size: 24px;
		    font-weight: bold;
		    cursor: pointer;
		}
		
		.modal-content form {
		    display: flex;
		    flex-direction: column;
		}
		
		.modal-content label {
		    font-weight: bold;
		    margin: 10px 0 5px;
		}
		
		.modal-content input, .modal-content textarea {
		    width: 100%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}

		select {
		    width: 104%;
		    height: 38px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}

		.modal-content button {
		    background-color: #d3d3d3;
		    color: black;
		    padding: 10px;
		    border: none;
		    border-radius: 5px;
		    margin-top: 10px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		.modal-content button:hover {
		    background-color: #a9a9a9;
		}
		 .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        
        .radio-group {
		  display: flex;
		  gap: 20px;
		  margin-bottom: 15px;
		  align-items: center;
		}
		
		.radio-group label {
		  display: flex;
		
		  gap: 5px;
		  font-size: 18px;
		  padding: 4px 8px;
		  border: 1px solid #ccc;
		  border-radius: 6px;
		  cursor: pointer;
		  transition: all 0.2s;
		}
		
		.radio-group input[type="radio"] {
		  accent-color: #007bff; /* 파란색 포인트 */
		  cursor: pointer;
		}
		
		.radio-group label:hover {
		  background-color: #f0f0f0;
		  border-color: #007bff;
		}
		#tankGraph1{
		width: 1300px;
		}
		#attachmentGraph{
		width: 1300px;
		}
		#turbidityGraph{
		width: 1300px;
		}
		.selectDate{
		margin-left: 9%;
		}
		.page-button {
    height: 40px;
    padding: 0 11px;
    border: 1px solid rgb(53, 53, 53);
    border-radius: 4px;
    background-color: #ffffff;
    cursor: pointer;
    display: flex;
    align-items: center;
}
    </style>
</head>
<body>
<h2 id="dateRangeDisplay" class="selectDate"></h2>
    <main class="main">
        <div class="tab">
        
            <div class="button-container">
            
             <div class="box1">
			<p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
			
			<input type="hidden" id="id" name="id">



    
			</div>
			    <button class="page-button" id="resistTestPageButton">
                    뒤로가기
                </button>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
				
<!-- 				<button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button> -->
            </div>
        </div>
        
        <div class="view">
            <div id="clean12Graph"></div>
        </div>
        <div class="view">
            <div id="tankGraph1"></div>
        </div>
        <div class="view">
            <div id="attachmentGraph"></div>
        </div>
         <div class="view">
            <div id="turbidityGraph"></div>
        </div>
    </main>

<script>
let categories;
let categories2;
let categories3;

let t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13, 
min_calc3_G600, min_calc3_G800, min_calc3_PLUS, min_calc3_ML, min_calc3_KB;

var tankGraph;
var attachmentGraph;
var turbidityGraph;

$(document).ready(function () {
    // 페이지 로딩 시 데이터 불러오기
 

    const currentYear = new Date().getFullYear();
	$('#t_year').val(currentYear);


	fetchData();
	fetchData2();
	fetchData3();

    $("#mch_name").on("change", function () {
        console.log("선택된 설비명:", $(this).val());
    });


    $(".select-button").click(function () {
    	fetchData();
    	fetchData2();
    	fetchData3();
    });
    displayDateRangeLine();
});

function safeNum(v){ return (v===null||v===undefined||v==="")?null:(isNaN(Number(v))?null:Number(v)); }
function dataLabelFormat(val){
    var d = new Date(val);
    return paddingZero(d.getMonth()+1) + "-" + paddingZero(d.getDate()) + "<br/>" +
           paddingZero(d.getHours()) + ":" + paddingZero(d.getMinutes());
}
var signListObj = {};

function fetchData() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/testGraph",
        data:{},
        success:function(result){
            if(!result || result.length===0){ console.log("데이터가 없습니다."); return; }
            const data1 = result.graph1;
            
            // 그룹화 + 중복 제거
            const grouped={}, uniqueOrder=[];
            result.graph1.forEach(r=>{
                const key = r.date;
                if(!grouped.hasOwnProperty(key)){
                    grouped[key] = r; // 최초 데이터만
                    uniqueOrder.push(key);
                }
            });
            categories = uniqueOrder.slice();

            // 시리즈 데이터 구성
            t1=uniqueOrder.map(rt=>safeNum(grouped[rt].t1));
            t2=uniqueOrder.map(rt=>safeNum(grouped[rt].t2));
            t3=uniqueOrder.map(rt=>safeNum(grouped[rt].t3));
            t4=uniqueOrder.map(rt=>safeNum(grouped[rt].t4));
            t5=uniqueOrder.map(rt=>safeNum(grouped[rt].t5));

            t6=uniqueOrder.map(rt=>safeNum(grouped[rt].t6));
            t7=uniqueOrder.map(rt=>safeNum(grouped[rt].t7));
            t8=uniqueOrder.map(rt=>safeNum(grouped[rt].t8));
            t9=uniqueOrder.map(rt=>safeNum(grouped[rt].t9));
            t10=uniqueOrder.map(rt=>safeNum(grouped[rt].t10));

            t11=uniqueOrder.map(rt=>safeNum(grouped[rt].t11));
            t12=uniqueOrder.map(rt=>safeNum(grouped[rt].t12));
            t13=uniqueOrder.map(rt=>safeNum(grouped[rt].t13));

            const newSeriesData=[ t1, t2,t3,t4,t5,t6, t7, t8, t9, t10,t11,t12,t13];

            if(!tankGraph) getTrend();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            tankGraph.xAxis[0].setCategories(categories,false);
            
            // 💡 13개의 온도 시리즈만 업데이트 (차트 시리즈 배열의 길이가 12라고 가정)
            for(let i=0; i<13; i++){
            	tankGraph.series[i].setData(newSeriesData[i] || [], false);
            }

            tankGraph.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

//가열잔분 탱크액 차트
function getTrend(){
	tankGraph = Highcharts.chart('tankGraph1',{
        chart:{ type:'line' },
        title:{ text:'지오메트 가열잔분 탱크액' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                }
            }
        },
        xAxis:{
            categories:categories,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 1
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:60, 
              tickAmount: 9,   
              tickPositions: [12, 18, 24, 30, 36, 42, 48, 54, 60],          
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,}
        ],
        tooltip:{
        	shared: true,
            crosshairs: true,
            formatter: function() {
                var s = '<b>' + (this.x || '') + '</b><br/>';
                // ✅ 핵심 수정: this.points 안전 체크 (undefined/빈 배열 방지)
                if (this.points && this.points.length > 0) {
                    this.points.forEach(function(pt) {  // 화살표 → function으로 변경 (this 안전)
                        s += pt.series.name + ': ' + (pt.y === null ? '-' : pt.y) + '<br/>';
                    });
                    // ✅ regtime 접근도 안전하게
                    var pointIndex = this.points[0].point ? this.points[0].point.x : 0;
                    var regtime = categories[pointIndex] || '';
                    var labelHtml = signListObj[regtime] || "";
                    if (labelHtml) s += '<hr/>' + labelHtml;
                } else {
                    s += '데이터 없음';  // 옵션: 빈 툴팁 시 메시지 (제거 가능)
                }
                return s;
            }
        },
        series:[
            { name:'G600_1', data:t1, yAxis:0 },
            { name:'G600_2', data:t2, yAxis:0 },
            { name:'G600_3', data:t3, yAxis:0 },
            { name:'G800_1', data:t4, yAxis:0 },
            { name:'G800_2', data:t5, yAxis:0 },
            { name:'G800_3', data:t6, yAxis:0 },
            { name:'G800_4', data:t7, yAxis:0 },
            { name:'PLUS_1', data:t8, yAxis:0 },
            { name:'PLUS_2', data:t9, yAxis:0 },
            { name:'ML_1', data:t10, yAxis:0 },
            { name:'ML_2', data:t11, yAxis:0 },
            { name:'KB_1', data:t10, yAxis:0 },
            { name:'KB_2', data:t10, yAxis:0 }
        ]
    });
}

//부착량 차트
function fetchData2() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/testGraph",
        data:{},
        success:function(result){
            if(!result.graph2 || result.graph2.length===0){ console.log("데이터가 없습니다."); return; }
            const data2 = result.graph2;
            
            // 그룹화 + 중복 제거
            const grouped={}, uniqueOrder=[];
            result.graph2.forEach(r=>{
                const key = r.date;
                if(!grouped.hasOwnProperty(key)){
                    grouped[key] = r; // 최초 데이터만
                    uniqueOrder.push(key);
                }
            });
            categories2 = uniqueOrder.slice();

            // 시리즈 데이터 구성
            min_calc3_G600=uniqueOrder.map(rt=>safeNum(grouped[rt].min_calc3_G600));
            min_calc3_G800=uniqueOrder.map(rt=>safeNum(grouped[rt].min_calc3_G800));

            const newSeriesData=[min_calc3_G600, min_calc3_G800];

            if(!attachmentGraph) getTrend2();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            attachmentGraph.xAxis[0].setCategories(categories2,false);
            
            for(let i=0; i<2; i++){
            	attachmentGraph.series[i].setData(newSeriesData[i] || [], false);
            }
            attachmentGraph.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

function getTrend2(){
	attachmentGraph = Highcharts.chart('attachmentGraph',{
        chart:{ type:'line' },
        title:{ text:'지오메트 부착량<br>(Spec.200mg/dm2↑)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                }
            }
        },
        xAxis:{
            categories:categories2,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 1
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:320, 
              tickAmount: 9,   
              tickPositions: [160, 180, 200, 220, 240, 260, 280, 300, 320],     
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,
              plotLines: [
                  {
                      value: 300,        // 최대 기준선 값
                      color: 'red',       // 선 색상
                      dashStyle: 'Dash',  // 선 모양 (Solid, Dash, Dot 등)
                      width: 2,           // 선 두께
                      zIndex: 5,          // 선을 그래프 위로 올림
                      label: {
                          //text: '최대 기준', // 선 옆에 표시될 텍스트
                          align: 'right',
                          style: { color: 'red', fontWeight: 'bold' }
                      }
                  },
                  {
                      value: 200,        // 최소 기준선 값
                      color: 'red',      // 최소선은 파란색으로 구분 가능
                      dashStyle: 'Dash',
                      width: 2,
                      zIndex: 5,
                      label: {
                          text: '',
                          align: 'right',
                          style: { color: 'blue', fontWeight: 'bold' }
                      }
                  }
              ]}
        ],
        tooltip:{
        	shared: true,
            crosshairs: true,
            formatter: function() {
                var s = '<b>' + (this.x || '') + '</b><br/>';
                // ✅ 핵심 수정: this.points 안전 체크 (undefined/빈 배열 방지)
                if (this.points && this.points.length > 0) {
                    this.points.forEach(function(pt) {  // 화살표 → function으로 변경 (this 안전)
                        s += pt.series.name + ': ' + (pt.y === null ? '-' : pt.y) + '<br/>';
                    });
                    // ✅ regtime 접근도 안전하게
                    var pointIndex = this.points[0].point ? this.points[0].point.x : 0;
                    var regtime = categories2[pointIndex] || '';
                    var labelHtml = signListObj[regtime] || "";
                    if (labelHtml) s += '<hr/>' + labelHtml;
                } else {
                    s += '데이터 없음';  // 옵션: 빈 툴팁 시 메시지 (제거 가능)
                }
                return s;
            }
        },
        series:[
            { name:'G600', data:min_calc3_G600, yAxis:0 },
            { name:'G800', data:min_calc3_G800, yAxis:0 }
        ]
    });
}

//후처리 부착량 차트
function fetchData3() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/testGraph",
        data:{},
        success:function(result){
            if(!result.graph3 || result.graph3.length===0){ console.log("데이터가 없습니다."); return; }
            const data3 = result.graph3;
            
            // 그룹화 + 중복 제거
            const grouped={}, uniqueOrder=[];
            result.graph3.forEach(r=>{
                const key = r.date;
                if(!grouped.hasOwnProperty(key)){
                    grouped[key] = r; // 최초 데이터만
                    uniqueOrder.push(key);
                }
            });
            categories3 = uniqueOrder.slice();

            // 시리즈 데이터 구성
            min_calc3_PLUS=uniqueOrder.map(rt=>safeNum(grouped[rt].min_calc3_PLUS));
            min_calc3_ML=uniqueOrder.map(rt=>safeNum(grouped[rt].min_calc3_ML));
            min_calc3_KB=uniqueOrder.map(rt=>safeNum(grouped[rt].min_calc3_KB));

            const newSeriesData=[min_calc3_PLUS, min_calc3_ML, min_calc3_KB];

            if(!turbidityGraph) getTrend3();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            turbidityGraph.xAxis[0].setCategories(categories3,false);
            
            for(let i=0; i<2; i++){
            	turbidityGraph.series[i].setData(newSeriesData[i] || [], false);
            }
            turbidityGraph.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

function getTrend3(){
	turbidityGraph = Highcharts.chart('turbidityGraph',{
        chart:{ type:'line' },
        title:{ text:'후처리 부착량<br>(ML: Spec.20mg/dm2↑, PLUS: Spec.20mg/dm2↑, K-BLACK: Spec.80mg/dm2↑)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                }
            }
        },
        xAxis:{
            categories:categories3,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 1
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:140, 
              tickAmount: 11,   
              tickPositions: [0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140], 
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,
              plotLines: [
                  {
                      value: 21,        // 최대 기준선 값
                      color: 'blue',       // 선 색상
                      dashStyle: 'Dash',  // 선 모양 (Solid, Dash, Dot 등)
                      width: 2,           // 선 두께
                      zIndex: 5,          // 선을 그래프 위로 올림
                      label: {
                          //text: '최대 기준', // 선 옆에 표시될 텍스트
                          align: 'right',
                          style: { color: 'red', fontWeight: 'bold' }
                      }
                  },
                  {
                      value: 20,        // 최소 기준선 값
                      color: 'black',      // 최소선은 파란색으로 구분 가능
                      dashStyle: 'Dash',
                      width: 2,
                      zIndex: 5,
                      label: {
                          text: '',
                          align: 'right',
                          style: { color: 'blue', fontWeight: 'bold' }
                      }
                  },
                  {
                      value: 80,        // 최소 기준선 값
                      color: 'green',      // 최소선은 파란색으로 구분 가능
                      dashStyle: 'Dash',
                      width: 2,
                      zIndex: 5,
                      label: {
                          text: '',
                          align: 'right',
                          style: { color: 'blue', fontWeight: 'bold' }
                      }
                  }
              ]
            }
        ],
        tooltip:{
        	shared: true,
            crosshairs: true,
            formatter: function() {
                var s = '<b>' + (this.x || '') + '</b><br/>';
                // ✅ 핵심 수정: this.points 안전 체크 (undefined/빈 배열 방지)
                if (this.points && this.points.length > 0) {
                    this.points.forEach(function(pt) {  // 화살표 → function으로 변경 (this 안전)
                        s += pt.series.name + ': ' + (pt.y === null ? '-' : pt.y) + '<br/>';
                    });
                    // ✅ regtime 접근도 안전하게
                    var pointIndex = this.points[0].point ? this.points[0].point.x : 0;
                    var regtime = categories3[pointIndex] || '';
                    var labelHtml = signListObj[regtime] || "";
                    if (labelHtml) s += '<hr/>' + labelHtml;
                } else {
                    s += '데이터 없음';  // 옵션: 빈 툴팁 시 메시지 (제거 가능)
                }
                return s;
            }
        },
        series:[
            { name:'PLUS', data:min_calc3_PLUS, yAxis:0,connectNulls: true },
            { name:'ML', data:min_calc3_ML, yAxis:0,connectNulls: true },
            { name:'K/B', data:min_calc3_KB, yAxis:0,connectNulls: true }
        ]
    });
}
function displayDateRangeLine() {
    // 1. 오늘 날짜와 3개월 전 날짜 설정
    const today = new Date();
    // 3개월 전 날짜 계산
    const threeMonthsAgo = new Date(today.getFullYear(), today.getMonth() - 3, today.getDate());

    // 2. 화면 출력 요소 가져오기
    const displayElement = document.getElementById('dateRangeDisplay');

    // 3. 날짜 포맷 함수 정의 (YYYY-MM-DD 형식)
    // 템플릿 리터럴 대신 문자열 연결(+) 사용
    const formatDate = (date) => {
        const yyyy = date.getFullYear();
        // padStart 대신 if/else를 사용하여 0을 채우는 방식으로 구현 가능
        
        let mm = date.getMonth() + 1;
        if (mm < 10) {
            mm = '0' + mm;
        }
        
        let dd = date.getDate();
        if (dd < 10) {
            dd = '0' + dd;
        }

        // 문자열 연결 연산자를 사용하여 YYYY-MM-DD 형식 완성
        return yyyy + '-' + mm + '-' + dd;
    };

    // 4. 시작일과 종료일 포맷
    const formattedStartDate = formatDate(threeMonthsAgo);
    const formattedEndDate = formatDate(today);

    // 5. 요청하신 대로 한 줄 문자열 완성 (문자열 연결 사용)
    const outputString = "조회 날짜: " + formattedStartDate + " ~ " + formattedEndDate;

    // 6. 결과를 HTML 요소에 출력
    displayElement.textContent = outputString;
}
//버튼 클릭시 페이지 이동
$('#resistTestPageButton').click(function() {
	window.location.href = "/geomet/quality/resistTest";
});
</script>

</body>
</html>
