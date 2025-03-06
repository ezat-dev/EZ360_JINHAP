<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>권한 설정</title>
    <link href="https://unpkg.com/tabulator-tables@5.0.7/dist/css/tabulator.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/tabulator-tables@5.0.7/dist/js/tabulator.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script>
    
    <%@ include file="../include/sideBar.jsp" %>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left:108px;
        }

        #tab1, #tab2, #tab3, #tab4 {
            visibility: hidden;
        }

        #tab1 {
            visibility: visible;
        }

        .tabulator {
            width: 24%;
            max-width: 100%;
            max-height: 640px;
            overflow-x: hidden !important;  
        }
        
        .tabulator .tabulator-cell {
            white-space: normal !important;
            word-break: break-word; 
            text-align: center;
        }

		.row_select {
		    background-color: red;
		}

    </style>
</head>
<body>

    <h2>작업자 등록</h2>

    <div class="container">
        <div id="tab1" class="tabulator"></div>
    </div>

<script>
$(document).ready(function() {
    $("#tab2, #tab3, #tab4").css("visibility", "hidden");

    var table1 = new Tabulator("#tab1", {
        height: "640px",
        layout: "fitColumns",
        responsiveLayout: "hide",
        pagination: false,
        columns: [
            { title: "code", field: "user_code", hozAlign: "center", width: 73 },
            { title: "id", field: "user_id", hozAlign: "center", width: 73 },
            { title: "pw", field: "user_pw", hozAlign: "center", width: 73 },
            { title: "name", field: "user_name", hozAlign: "center", width: 78 },
            { title: "level", field: "user_level", hozAlign: "center", width: 70 },
            { title: "Y/N", field: "user_yn", hozAlign: "center", width: 45 }
        ]
    });

    table1.on("rowClick", function(e, row) {
        
    });

    function fetchData1() {
        $.ajax({
            url: '/tkheat/management/authority/user',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            success: function(response) {
                console.log("받아온 데이터:", response);
                table1.clearData();
                table1.setData(response);
            },
            error: function(xhr, status, error) {
                console.error("데이터 가져오기 실패:", error);
            }
        });
    }

    fetchData1();

   

});
</script>

</body>
</html>
