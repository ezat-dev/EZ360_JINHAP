<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사이드바 템플릿 사용-->
<script type="text/javascript" src="/tkheat/js/jquery.min.js"></script>

<!-- 제이쿼리홈페이지 js -->
<script type="text/javascript" src="/tkheat/js/jquery.js"></script>
<script type="text/javascript" src="/tkheat/js/jquery-migrate-1.2.1.min.js"></script>

<!-- popper 드롭다운-->
<script src="/tkheat/js/popper.js"></script>

<!-- 사이드바 템플릿 사용-->
<script type="text/javascript" src="/tkheat/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/tkheat/css/bootstrap.min.css" />

<!-- fontawesome 4.7.0 버전 -->
<link rel="stylesheet" href="/tkheat/css/font-awesome.min.css" />

<!-- selectinput 플러그인 -->
<script type="text/javascript" src="/tkheat/js/chosen.js"></script>
<link rel="stylesheet" href="/tkheat/css/chosen.css">

<!-- jqgrid 플러그인 -->
<script type="text/javascript" src="/tkheat/js/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/tkheat/js/jqgrid/grid.setcolumns.js"></script>
<script type="text/javascript" src="/tkheat/js/jqgrid/grid.celledit.js"></script>
<script type="text/javascript" src="/tkheat/js/jqgrid/grid.locale-kr.js"></script>


<link rel="stylesheet" href="/tkheat/css/jqgrid/ui.jqgrid.css">

<!-- 제이쿼리 ui -->
<script type="text/javascript" src="/tkheat/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/tkheat/css/jquery-ui.css">
<link rel="stylesheet" href="/tkheat/css/jquery-ui.theme.css">


<!-- datepicker -->
<script type="text/javascript" src="/tkheat/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/tkheat/js/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="/tkheat/css/bootstrap-datepicker.css">


<!-- krajee 파일업로드 -->
<script type="text/javascript" src="/tkheat/js/file-krajee/piexif.js"></script>
<script type="text/javascript" src="/tkheat/js/file-krajee/fileinput.js"></script>
<script type="text/javascript" src="/tkheat/js/file-krajee/kr.js"></script>
<script type="text/javascript" src="/tkheat/js/file-krajee/theme.js"></script>

<link rel="stylesheet" href="/tkheat/css/file-krajee/fileinput.css">
<link rel="stylesheet" href="/tkheat/css/file-krajee/fileinput-rtl.css">

<!-- 빌보드차트 -->
<script type="text/javascript" src="/tkheat/js/billboard/d3.min.js"></script>

<link rel="stylesheet" href="/tkheat/css/billboard/graph.css?ver=2">
<link rel="stylesheet" href="/tkheat/css/billboard/billboard.css?ver=2">
<script type="text/javascript" src="/tkheat/js/billboard/billboard.js?ver=2"></script>


<!-- 타임피커 -->
<script type="text/javascript" src="/tkheat/js/timepicker/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="/tkheat/css/timepicker/jquery.timepicker.css">


<!-- dataTable -->
<script type="text/javascript" src="/tkheat/js/datatables.min.js"></script>
<link rel="stylesheet" href="/tkheat/css/datatables.min.css">

<!-- Tabulator 테이블 -->
<script type="text/javascript" src="/tkheat/js/tabulator/tabulator.js"></script>
<link rel="stylesheet" href="/tkheat/css/tabulator/tabulator_simple.css">

<!-- moment -->
<script type="text/javascript" src="/tkheat/js/moment/moment.min.js"></script>

<!-- 화면캡쳐용 -->
<script type="text/javascript" src="/tkheat/js/html2canvas.js"></script>

<!-- 구글차트 -->
<script type="text/javascript" src="/tkheat/js/google_chart/loader.js"></script>

<!-- 하이차트 -->
<script type="text/javascript" src="/tkheat/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="/tkheat/js/highchart/exporting.js"></script>
<script type="text/javascript" src="/tkheat/js/highchart/export-data.js"></script>
<script type="text/javascript" src="/tkheat/js/highchart/data.js"></script>
<style>
	
</style>
<script>

$(function(){
	rpImagePopup();
});

function rpImagePopup() {
    var img = document.createElement("img");
//    console.log(img);
    
    // $(img).attr("src", "imgs/noimage_01.gif");
    $(img).css("width", "600");
    $(img).css("height", "500");
    
    var div = document.createElement("div");
    $(div).css("position", "absolute");
    $(div).css("display", "none");
    $(div).css("z-index", "24999");
    $(div).append(img);
    $(div).hide();
    $("body").append(div);

    $(document).on("mouseover", ".rp-img-popup > img", function(){
            $(img).attr("src", $(this).attr("src"));
            $(div).show();
            var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
            var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
            $(div).css("left", iWidth);
            $(div).css("top", 100);
        })
        .on("mouseout", ".rp-img-popup > img", function(){
            $(div).hide();
        });
    
    $(document).on("mouseover", ".rp-img-popup", function(){
        $(img).attr("src", $(this).attr("src"));
        $(div).show();
        var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
        var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
        $(div).css("left", iWidth);
        $(div).css("top", 100);
    })
    .on("mouseout", ".rp-img-popup", function(){
        $(div).hide();
    });
}

</script>
