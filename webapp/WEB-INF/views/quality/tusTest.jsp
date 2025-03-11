<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온도균일성 테스트</title>
<style>
.search{
	border-radius: 5px;
	display: flex;
	align-items: center;
	margin:1rem 0 0 2rem;	
	/*상 우 하 좌*/
}

.search label{
	font-size:12pt;
	font-weight:700;
	margin-right:1%;
}


.search input{
	font-size:13pt;
	font-weight:700;
	width:120px;
	text-align:center;
}
	
	
.view{
	display: flex; 
	justify-content: center;
	margin-top:1%;
}
</style>
    
    
<body>
    <jsp:include page="../include/sideBar.jsp"/>
    <jsp:include page="../include/headerBar.jsp"/>

	<main class="main">
    	<!-- 조회조건 표시 -->
    	<div class="search">
    		<label for="startDate">시작날짜:</label>
			<input type="text" id="startDate" class="daySet" style="margin-right:1%;"/>
			
			<label for="endDate">종료날짜:</label>
			<input type="text" id="endDate" class="daySet"/>
    	</div>
    	
		<jsp:include page="../include/tabBar.jsp"/>
	    
	    <!-- 화면표시 -->
	    <div class="view">
	    
	    	<div id="dataList"></div>
	    </div>

	</main>
	
<script>
	//전역변수

	//로드
	$(function(){
		//헤더에 페이지명 적용
		$(".headerP").text("품질관리 - 온도균일성테스트");
//		insertButtonNone();
		excelButtonNone();
		printButtonNone();
		
		//오늘날짜
		$("#startDate").val(yesterDate());
		$("#endDate").val(todayDate());
		
		getDataList();
	});

	//이벤트
	$(".select-button").on("click", function(){
		alert("조회버튼 클릭");
	});
	
	$(".insert-button").on("click", function(){
		alert("추가버튼 클릭");
	});
	
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
		    	{
		    		title:"설비명",
		    		columns:[
				        {title:"G-800", field:"g800", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"G-600", field:"g600", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"공용설비", field:"gongyong", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"K-BLACK", field:"kblack", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"방청", field:"cool", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"이코팅 1호기", field:"ecoat1", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"이코팅 2호기", field:"ecoat2", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"세척 1호기", field:"wash1", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
				        {title:"세척 2호기", field:"wash2", sorter:"string", width:140,
				        	hozAlign:"center", headerSort:false},
		    		]
		    	}
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
