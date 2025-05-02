<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/pluginpage.jsp" %>
<jsp:include page="../include/tabBar.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쇼트 (4호기)</title>
<style>
    .view {
        display: flex;
        flex-direction: column;
        gap: 20px;
        padding: 20px;
        box-sizing: border-box;
        width: 100%;
    }
    .view > div {
        width: 100%;
    }

  h2 {
    margin-left: 20px;
}
    .tabulator .tabulator-cell,
    .tabulator .tabulator-header .tabulator-col .tabulator-col-title {
        text-align: center !important;
        justify-content: center !important;
        display: flex;
        align-items: center;
    }
</style>

</head>
<body>
    <main>
        <h2>쇼트 (4호기)</h2>
        <div class="view">
            <div id="table1"></div>
            <div id="table2"></div>
            <div id="table3"></div>
        </div>
    </main>

<script>
    $(function(){
        initTables();
    });

    function initTables(){
        new Tabulator("#table1", {
            height: "115px",
            layout: "fitColumns",
            ajaxURL: "",
            columns: [
                { title: "점도",        field: "1" },
                { title: "예열존온도", field: "2" },
                { title: "가열존온도", field: "3" },
                { title: "액온도",     field: "4" },
                { title: "비중",       field: "5" }
            ],

        });

        new Tabulator("#table2", {
            height: "115px",
            layout: "fitColumns",
            ajaxURL: "",
            columns: [
                {title:"일 작업통수",    field:"6"},
                {title:"생산량",        field:"7"},
                {title:"평균생산중량",  field:"8"},
                {title:"누적 생산통수", field:"9"},
                {title:"누적 생산량",   field:"10"},
                {title:"평균중량",      field:"11"},
                {title:"가동시간",      field:"12"},
                {title:"가동률",        field:"13"},
                {title:"월누적", columns:[
                    {title:"가동시간",      field:"14"},
                    {title:"가동율",        field:"15"},
                    {title:"UPH",           field:"16"},
                    {title:"UPH(월누적)",   field:"17"},
                ]},
            ],
        });

        new Tabulator("#table3", {
            height: "400px",
            layout: "fitColumns",
            ajaxURL: "",
            columns: [
                {title:"순서",             field:"18"},
                {title:"투입시간",         field:"19"},
                {title:"완료시간",         field:"20"},
                {title:"투입통수",         field:"21"},
                {title:"작업중량(kg)",     field:"22"},
                {title:"분할횟수",         field:"23"},
                {title:"품명",             field:"24"},
                {title:"품번",             field:"25"},
                {title:"후처리 사양",      field:"26"},
                {title:"검사항목", columns:[
                    {title:"외관",          field:"27"},
                    {title:"밀착성 테스트", field:"28"},
                    {title:"합부판정",     field:"29"},
                ]},
                
                {title:"구분</br>(신규/재작업)", field:"30"},
                {title:"비고",             field:"31"},
            ],
        });
    }
</script>
</body>
</html>
