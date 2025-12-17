<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온도균일성 테스트</title>
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
		#kccMeqChart{
		width: 1300px;
		}
		#kccAshChart{
		width: 1300px;
		}
		#kccNvChart{
		width: 1300px;
		}
		#kccPhChart{
		width: 1300px;
		}
		#kccConductivityChart{
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
				<button class="page-button" id="liquidAnalyzePageButton">
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
            <div id="kccAshChart"></div>
        </div>
         <div class="view">
            <div id="kccNvChart"></div>
        </div>
        <div class="view">
            <div id="kccMeqChart"></div>
        </div>
        <div class="view">
            <div id="kccPhChart"></div>
        </div>
        <div class="view">
            <div id="kccConductivityChart"></div>
        </div>
    </main>

<script>
let categories;
let categories2;
let categories3;
let categories4;
let categories5;

let meq_result, ash_result, nv_result, ph_result, conductivity_result,
meq_result2, ash_result2, nv_result2, ph_result2, conductivity_result2;

var kccMeqChart;
var kccAshChart;
var kccNvChart;
var kccPhChart;
var kccConductivityChart;

$(document).ready(function () {
    // 페이지 로딩 시 데이터 불러오기
 

    const currentYear = new Date().getFullYear();
	$('#t_year').val(currentYear);


	fetchData();
	fetchData2();
	fetchData3();
	fetchData4();
	fetchData5();

    $(".select-button").click(function () {
    	fetchData();
    	fetchData2();
    	fetchData3();
    	fetchData4();
    	fetchData5();
    });
    displayDateRangeLine();
});

function safeNum(v){ return (v===null||v===undefined||v==="")?null:(isNaN(Number(v))?null:Number(v)); }
function dataLabelFormat(val){
    var d = new Date(val);
    return paddingZero(d.getMonth()+1) + "-" + paddingZero(d.getDate()) + "<br/>"/* +
           paddingZero(d.getHours()) + ":" + paddingZero(d.getMinutes());*/
}
var signListObj = {};

function fetchData() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/getLiquidChart",
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
            meq_result=uniqueOrder.map(rt=>safeNum(grouped[rt].meq_result));
            meq_result2=uniqueOrder.map(rt=>safeNum(grouped[rt].meq_result2));

            const newSeriesData=[ meq_result, meq_result2];

            if(!kccMeqChart) getTrend();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            kccMeqChart.xAxis[0].setCategories(categories,false);
            
            // 시리즈 2개
            for(let i=0; i<2; i++){
            	kccMeqChart.series[i].setData(newSeriesData[i] || [], false);
            }

            kccMeqChart.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

//MEQ 차트
function getTrend(){
	kccMeqChart = Highcharts.chart('kccMeqChart',{
        chart:{ type:'line' },
        title:{ text:'MEQ(중화제함량)<br>(Spec.36~45)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                },
                connectNulls: true
            }
        },
        xAxis:{
            categories:categories,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 2
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:50.0, 
              tickAmount: 11,   
              tickPositions: [30.00, 32.00, 34.00, 36.00, 38.00, 40.00, 42.00, 44.00, 46.00, 48.00, 50.0],          
              endOnTick: false,
              showLastLabel: true,
              plotLines: [
                  {
                      value: 45,        // 최대 기준선 값
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
                      value: 35,        // 최소 기준선 값
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
              ]
              },
              
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
            { name:'MEQ 1호기', data:meq_result, yAxis:0 },
            { name:'MEQ 2호기', data:meq_result2, yAxis:0 }
        ]
    });
}

//ash 차트
function fetchData2() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/getLiquidChart",
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
            categories2 = uniqueOrder.slice();

            // 시리즈 데이터 구성
            ash_result=uniqueOrder.map(rt=>safeNum(grouped[rt].ash_result));
            ash_result2=uniqueOrder.map(rt=>safeNum(grouped[rt].ash_result2));

            const newSeriesData=[ ash_result, ash_result2];

            if(!kccAshChart) getTrend2();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            kccAshChart.xAxis[0].setCategories(categories2,false);
            
            // 시리즈 2개
            for(let i=0; i<2; i++){
            	kccAshChart.series[i].setData(newSeriesData[i] || [], false);
            }

            kccAshChart.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

function getTrend2(){
	kccAshChart = Highcharts.chart('kccAshChart',{
        chart:{ type:'line' },
        title:{ text:'ASH(회분)<br>(Spec.10~15)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                },
                connectNulls: true
            }
        },
        xAxis:{
            categories:categories2,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 2
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:16.0, 
              tickAmount: 5,   
              tickPositions: [8.00, 10.00, 12.00, 14.00, 16.00],          
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,
              plotLines: [
                  {
                      value: 15,        // 최대 기준선 값
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
                      value: 10,        // 최소 기준선 값
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
            { name:'Ash 1호기', data:ash_result, yAxis:0 },
            { name:'Ash 2호기', data:ash_result2, yAxis:0 }
        ]
    });
}

//nv 차트
function fetchData3() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/getLiquidChart",
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
            categories3 = uniqueOrder.slice();

            // 시리즈 데이터 구성
            nv_result=uniqueOrder.map(rt=>safeNum(grouped[rt].nv_result));
            nv_result2=uniqueOrder.map(rt=>safeNum(grouped[rt].nv_result2));

            const newSeriesData=[ nv_result, nv_result2];

            if(!kccNvChart) getTrend3();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            kccNvChart.xAxis[0].setCategories(categories3,false);
            
            // 시리즈 2개
            for(let i=0; i<2; i++){
            	kccNvChart.series[i].setData(newSeriesData[i] || [], false);
            }

            kccNvChart.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

//nv 차트
function getTrend3(){
	kccNvChart = Highcharts.chart('kccNvChart',{
        chart:{ type:'line' },
        title:{ text:'N.V(고형분함량)<br>(Spec.15~20)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                },
                connectNulls: true
            }
        },
        xAxis:{
            categories:categories3,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 2
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:22.00, 
              tickAmount: 6,   
              tickPositions: [12.00, 14.00, 16.00, 18.00, 20.00, 22.00],          
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,
              plotLines: [
                  {
                      value: 20,        // 최대 기준선 값
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
                      value: 15,        // 최소 기준선 값
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
            { name:'N.V 1호기', data:nv_result, yAxis:0 },
            { name:'N.V 2호기', data:nv_result2, yAxis:0 }
        ]
    });
}

//ph 차트
function fetchData4() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/getLiquidChart",
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
            categories4 = uniqueOrder.slice();

            // 시리즈 데이터 구성
            ph_result=uniqueOrder.map(rt=>safeNum(grouped[rt].ph_result));
            ph_result2=uniqueOrder.map(rt=>safeNum(grouped[rt].ph_result2));

            const newSeriesData=[ ph_result, ph_result2];

            if(!kccPhChart) getTrend4();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            kccPhChart.xAxis[0].setCategories(categories4,false);
            
            // 시리즈 2개
            for(let i=0; i<2; i++){
            	kccPhChart.series[i].setData(newSeriesData[i] || [], false);
            }

            kccPhChart.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

//ph 차트
function getTrend4(){
	kccPhChart = Highcharts.chart('kccPhChart',{
        chart:{ type:'line' },
        title:{ text:'pH<br>(Spec.5.5~6.2)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                },
                connectNulls: true
            }
        },
        xAxis:{
            categories:categories4,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 2
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:7.0, 
              tickAmount: 5,   
              tickPositions: [5.0, 5.5, 6.0, 6.5, 7.0],          
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,
              plotLines: [
                  {
                      value: 6.2,        // 최대 기준선 값
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
                      value: 5.4,        // 최소 기준선 값
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
                    var regtime = categories4[pointIndex] || '';
                    var labelHtml = signListObj[regtime] || "";
                    if (labelHtml) s += '<hr/>' + labelHtml;
                } else {
                    s += '데이터 없음';  // 옵션: 빈 툴팁 시 메시지 (제거 가능)
                }
                return s;
            }
        },
        series:[
            { name:'pH 1호기', data:ph_result, yAxis:0 },
            { name:'pH 2호기', data:ph_result2, yAxis:0 }
        ]
    });
}

//conductivity 차트
function fetchData5() {
    $.ajax({
        type:"POST",
        url:"/geomet/quality/getLiquidChart",
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
            categories5 = uniqueOrder.slice();

            // 시리즈 데이터 구성
            conductivity_result=uniqueOrder.map(rt=>safeNum(grouped[rt].conductivity_result));
            conductivity_result2=uniqueOrder.map(rt=>safeNum(grouped[rt].conductivity_result2));

            const newSeriesData=[ conductivity_result, conductivity_result2];

            if(!kccConductivityChart) getTrend5();
/*             else{
                chart.xAxis[0].setCategories(categories,false);
                chart.series.forEach((s,i)=>s.setData(newSeriesData[i]||[],false));
                // ✅ 메모 시리즈 갱신
                const memoIdx = chart.series.length - 1;
                chart.series[memoIdx].setData(memoSeries,false);
                chart.redraw();
            } */
            kccConductivityChart.xAxis[0].setCategories(categories5,false);
            
            // 시리즈 2개
            for(let i=0; i<2; i++){
            	kccConductivityChart.series[i].setData(newSeriesData[i] || [], false);
            }

            kccConductivityChart.redraw();
        },
        error:function(xhr,status,error){ console.error("❌ 에러:",error); alert("데이터 조회 중 오류가 발생했습니다."); }
    });
}

//MEQ 차트
function getTrend5(){
	kccConductivityChart = Highcharts.chart('kccConductivityChart',{
        chart:{ type:'line' },
        title:{ text:'전도도<br>(Spec.1000~1800)' },
        plotOptions: {
            line: { // 혹은 series: 로 작성 가능
                marker: {
                    enabled: true // 마커(도형) 표시 안 함
                },
                connectNulls: true
            }
        },
        xAxis:{
            categories:categories5,
            title:{ text:'시간' },
            labels: {
                formatter: function() { return dataLabelFormat(this.value); },
                step: 2
            },
            tickInterval:1
        },
        yAxis:[
            { title:{ text:"결과값", rotation:0 }, labels:{ align:"right", x:-10 }, 
              min:0, max:2600, 
              tickAmount: 11,   
              tickPositions: [600, 800, 1000, 1200, 1400, 1600, 1800, 2000, 2200, 2400, 2600],          
              minorTickInterval: null, 
              endOnTick: true,
              maxPadding: 0,
              plotLines: [
                  {
                      value: 1800,        // 최대 기준선 값
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
                      value: 1000,        // 최소 기준선 값
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
                    var regtime = categories5[pointIndex] || '';
                    var labelHtml = signListObj[regtime] || "";
                    if (labelHtml) s += '<hr/>' + labelHtml;
                } else {
                    s += '데이터 없음';  // 옵션: 빈 툴팁 시 메시지 (제거 가능)
                }
                return s;
            }
        },
        series:[
            { name:'전도도 1호기', data:conductivity_result, yAxis:0 },
            { name:'전도도 2호기', data:conductivity_result2, yAxis:0 }
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

$('#liquidAnalyzePageButton').click(function() {
	window.location.href = "/geomet/quality/liquidAnalyze";
});
</script>

</body>
</html>
