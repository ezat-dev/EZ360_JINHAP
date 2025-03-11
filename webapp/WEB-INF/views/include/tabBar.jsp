<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/jinhap/css/tabBar/tabBar.css">
  <title>진합</title>
</head>

<style>	

</style>

<body>

	    <div class="tab">
	    	<!-- 버튼동작 표시  --> 
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

<script>



//함수
function selectButtonNone(){
	$(".select-button").css("pointer-events","none");
	$(".select-button").css("opacity","0.5");	
}

function insertButtonNone(){
	$(".insert-button").css("pointer-events","none");
	$(".insert-button").css("opacity","0.5");	
}

function excelButtonNone(){
	$(".excel-button").css("pointer-events","none");
	$(".excel-button").css("opacity","0.5");	
}

function printButtonNone(){
	$(".printer-button").css("pointer-events","none");
	$(".printer-button").css("opacity","0.5");	
}

</script>
    
</body>
</html>