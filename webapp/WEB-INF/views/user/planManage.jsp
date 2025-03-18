<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자격인증관리</title>
<%@include file="../include/pluginpage.jsp" %>    
		<jsp:include page="../include/tabBar.jsp"/>
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
 .view{
	display: flex; 
	justify-content: center;
	margin-top:1%;
}   
</style>
    
    
<body>

	<main class="main">
    	<!-- 조회조건 표시 -->
    	<div class="search">
    		
    	</div>
    	
    	
 		<div class="tab">
            <p class="tabP" style="font-size:20px; margin-left:40px; color : white; font-weight:800;"></p>
            <div class="button-container">
                <button class="select-button">
                    <img src="/jinhap/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/jinhap/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                <button class="excel-button">
                    <img src="/jinhap/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
                <button class="printer-button">
                    <img src="/jinhap/css/tabBar/printer-icon.png" alt="printer" class="button-image">출력
                </button>
            </div>  
        </div>
        
	   
	    
	    <!-- 화면표시 -->
	    <div class="view">
			<div id="dataList"></div>
	    </div>

	</main>
<script>
	//전역변수

	//로드
	$(function(){
		$(".headerP").text("인원 및 안전관리 - 자격인증관리");
		
		getDataList();
	});

	
	//이벤트
	
	
	//함수
	function getDataList(){
		
		dataTable = new Tabulator("#dataList", {
		    height:"560px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/jinhap/quality/tustest/selectList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#dataList .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
			        {title:"자격분류(CODE)", field:"g800", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"담당업무", field:"g600", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"사번", field:"gongyong", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"성명", field:"kblack", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"학력", field:"cool", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"경력(년/개월)", field:"ecoat1", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"교육", field:"ecoat2", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"자격인정 신청명", field:"wash1", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"취득일", field:"wash2", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},		    	
			        {title:"차기갱신일", field:"wash2", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},		    	
			        {title:"비고(첨부)", field:"wash2", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},		    	
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#dataList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#dataList div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});


			},
		});		
		
	}

</script>

</body>
</html>
