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

    <h2>권한 설정</h2>

    <div class="container">
        <div id="tab1" class="tabulator"></div>
        <div id="tab2" class="tabulator"></div>
        <div id="tab3" class="tabulator"></div>
        <div id="tab4" class="tabulator"></div>
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
        selectedRowData = row.getData();
        console.log("Row data:", selectedRowData);
        
        $("#tab2").css("visibility", "visible");
        $("#tab1 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");

        fetchData2();
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

    var table2 = new Tabulator("#tab2", {
        height: "640px",
        layout: "fitColumns",
        responsiveLayout: "hide",
        pagination: false,
        columns: [
            { title: "B_C", field: "page_big", hozAlign: "center", width: 66 },
            { title: "P_C", field: "page_code", hozAlign: "center", width: 120 },
            { title: "B_N", field: "page_big_name", hozAlign: "center", width: 241 }
        ]
    });

    table2.on("rowClick", function(e, row) {
        var pageBig = row.getData().page_big;
        console.log("클릭된 page_big:", pageBig);

        fetchData3(pageBig);

        $("#tab2 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");
    });

    function fetchData2() {
        $.ajax({
            url: '/tkheat/management/authority/big_Page',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            success: function(response) {
                console.log("테이블 2 데이터:", response);
                table2.clearData();
                table2.setData(response);
            },
            error: function(xhr, status, error) {
                console.error("테이블 2 데이터 가져오기 실패:", error);
            }
        });
    }

    var table3 = new Tabulator("#tab3", {
        height: "640px",
        layout: "fitColumns",
        responsiveLayout: "hide",
        pagination: false,
        columns: [
            { title: "P_C", field: "page_code", hozAlign: "center", width: 120 },
            { title: "B_C", field: "page_sml", hozAlign: "center", width: 66 },
            { title: "B_N", field: "page_sml_name", hozAlign: "center", width: 240 }
        ]
    });

    function fetchData3(pageBig) {
        $.ajax({
            url: '/tkheat/management/authority/small_page',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ page_big: pageBig }),
            success: function(response) {
                console.log("테이블 3 데이터:", response);
                table3.clearData();
                table3.setData(response);
                $("#tab3").css("visibility", "visible");
            },
            error: function(xhr, status, error) {
                console.error("테이블 3 데이터 가져오기 실패:", error);
            }
        });
    }

    table3.on("rowClick", function(e, row) {
        var pageBig = row.getData().page_big;
        console.log("클릭된 page_big:", pageBig);

        $("#tab4").css("visibility", "visible");

        $("#tab3 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");
    });

    var table4 = new Tabulator("#tab4", {
        height: 200,
        data: [
            {NO: 1, LV: "Lv_1", 범위: "보기"},
            {NO: 2, LV: "Lv_2", 범위: "수정"},
            {NO: 3, LV: "Lv_3", 범위: "삭제"},
            {NO: 4, LV: "Lv_100", 범위: "작업자"},
            {NO: 5, LV: "Lv_999", 범위: "Master"}
        ],
        columns: [
            {title: "NO", field: "NO", hozAlign: "center", width: 80 },
            {title: "LV", field: "LV", hozAlign: "center", width: 171 },
            {title: "범위", field: "범위", hozAlign: "center", width: 175 }
        ]
    });

    table4.on("rowClick", function(e, row) {
        $("#tab4 .tabulator-row").removeClass("row_select");
        $(row.getElement()).addClass("row_select");
    });

});
</script>

</body>
</html>
