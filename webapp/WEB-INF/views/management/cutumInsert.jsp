<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래처등록</title>
    <%@ include file="../include/sideBar.jsp" %>
    
    
    <style>
    .main {
    margin-left: 225px;
    margin-right:8px; 
    margin-top : 70px;
    width : 87.85%;
    height: calc(100vh - 80px); 
    background-color: #ffffff; 
    padding: 1rem; 
     /* border : 1px solid rgb(53, 53, 53);  */
    border-radius: 0px 0px 6px 6px;
	}
	.tab {
    margin-left: 117px;
    margin-right:8px;
    margin-top: 5px; 
    height: 33px;
    /* padding: 1rem; */
    background-color: #ffffff; 
     /* border : 1px solid rgb(53, 53, 53);   */
    border-radius: 6px 6px 0px 0px;
	}
	
	
	
	.container {
		display: flex;
		justify-content: space-between;
		padding: 20px;
/*		margin-left:1008px;
		margin-top:200px;*/
	}

        #tab1, #tab2, #tab3, #tab4 {
            visibility: hidden;
        }

        #tab1 {
            visibility: visible;
        }

        .tabulator {
            width: 90%;
            max-width: 100%;
            max-height: 900px;
            overflow-x: hidden !important;  
        }
        
        .tabulator .tabulator-cell {
            white-space: normal !important;
            word-break: break-word; 
            text-align: center;
        }
        
.row_select{
	background-color:#9ABCEA !important;
}
    
    
    </style>
    
    
    <body>
    
    <div class="tab"></div>
    <main class="main">
		<div class="container">
			<div id="tab1" class="tabulator"></div>
		</div>
	</main>
	    
	    
<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		//전체 거래처목록 조회
		getCutumList();
	});

	//이벤트
	
	//함수
	function getCutumList(){
		
		userTable = new Tabulator("#tab1", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    selectableRows:true,
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/management/cutumInsert/userList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"아이디", field:"user_no", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"부서", field:"user_buso", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"직책", field:"user_jick", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"성명", field:"user_name", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"유저코드", field:"user_code", sorter:"int", width:100,
		        	hozAlign:"center", visible:false},
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#tab1 .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#tab1 div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
//				console.log(rowData.user_code);
				user_code = rowData.user_code;
				$("#user_code").val(rowData.user_code);
				$(".userName").text(rowData.user_name);
				
				getPermissionUserSelect();
			},
		});		
	}
	
	function getPermissionUserSelect(){
		
		var userCode = $("#user_code").val();
		
		$.ajax({
			url:"/tkheat/management/authority/userSelect",
			type:"post",
			dataType:"json",
			data:{"user_code":userCode},
			success:function(result){
				
				
				var data = result.data;
				for(let key in data){
					console.log(key);
					console.log(data[key]);
					$("#"+key).val(data[key]);		
				}
			}
		})
	}
	
	function saveAut(){
		var permissionData = new FormData($("#permissionForm")[0]);
/*		
		console.log(permissionData);
		
		return false;
*/		
		
		$.ajax({
			url:"/tkheat/management/authority/userSelectSave",
			type:"post",
			contentType: false,
			processData: false,
			dataType: "json",
			data:permissionData,
			success:function(result){
				alert("권한이 수정되었습니다.");
				getPermissionUserSelect();
			}
		});		
	}

    </script>

	</body>
</html>
