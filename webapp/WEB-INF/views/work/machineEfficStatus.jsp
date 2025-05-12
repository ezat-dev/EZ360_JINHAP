<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>설비효율관리</title>
    <%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>
   <style>
        #legend { position:absolute; top:20px; right:100px; background:#fff; border:1px solid #ccc; border-radius:6px; padding:8px 12px; font-family:Arial,sans-serif; font-size:14px; white-space:nowrap; box-shadow:0 2px 6px rgba(0,0,0,0.1); }
        #legend span { margin-right:16px; vertical-align:middle; }
        #dataList { margin:80px auto 0; width:90%; }
        .tabulator .tabulator-row.tabulator-selected { background-color: inherit !important; }
   
    .tabulator-cell.grade-S-cell { color: #2ca02c !important; }
    .tabulator-cell.grade-A-cell { color: #1f77b4 !important; }
    .tabulator-cell.grade-B-cell { color: #ff7f0e !important; }
    .tabulator-cell.grade-C-cell { color: #d62728 !important; }
    .tabulator-cell.grade-D-cell { color: #7f7f7f !important; }
    </style>
</head>
<body>
    <div id="legend">
        <span style="display:inline-block;width:12px;height:12px;background:#2ca02c;border-radius:2px;margin-right:4px;"></span>85% 이상 S
        <span style="display:inline-block;width:12px;height:12px;background:#1f77b4;border-radius:2px;margin:0 4px 0 16px;"></span>80%~84.9% A
        <span style="display:inline-block;width:12px;height:12px;background:#ff7f0e;border-radius:2px;margin:0 4px 0 16px;"></span>75%~79.9% B
        <span style="display:inline-block;width:12px;height:12px;background:#d62728;border-radius:2px;margin:0 4px 0 16px;"></span>70%~74.9% C
        <span style="display:inline-block;width:12px;height:12px;background:#7f7f7f;border-radius:2px;margin:0 4px 0 16px;"></span>70% 이하 D
    </div>
    <main class="main">
        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
    <script>
    let now_page_code = "b02";

    
        $(document).ready(function() {
            new Tabulator("#dataList", {
                height: "760px",
                layout: "fitDataFill",
                columnMinWidth: 170,
                selectable: true,
                tooltips: true,
                headerHozAlign: "center",
                ajaxConfig: "POST",
                ajaxURL: "/geomet/work/machineEfficStatus/list",
                placeholder: "조회된 데이터가 없습니다.",
                ajaxResponse: function(url, params, response) {
                    return response;
                },
                columns: [
                    { title: "설비명",      field: "facility_name", width: 260, sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "생산효율(%)",    field: "a",              width: 260, sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "가동효율(%)",    field: "b",              width: 260, sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "양품율(%)",      field: "c",              width: 260, sorter: "string", hozAlign: "center", headerSort: false },
                    { title: "종합효율(%)",    field: "d",              width: 270, sorter: "string", hozAlign: "center", headerSort: false },
                    {
                        title: "등급", field: "d", sorter: "string", hozAlign: "center", headerSort: false,
                        formatter: function(cell) {
                          var v = cell.getValue() * 100,
                              grade,
                              el = cell.getElement();

                         
                          el.classList.remove("grade-S-cell","grade-A-cell","grade-B-cell","grade-C-cell","grade-D-cell");

                          if (v >= 85) { grade = "S"; el.classList.add("grade-S-cell"); }
                          else if (v >= 80) { grade = "A"; el.classList.add("grade-A-cell"); }
                          else if (v >= 75) { grade = "B"; el.classList.add("grade-B-cell"); }
                          else if (v >= 70) { grade = "C"; el.classList.add("grade-C-cell"); }
                          else              { grade = "D"; el.classList.add("grade-D-cell"); }

                          return grade;
                        }
                    }
                  ]
                });
              });
    </script>
</body>
</html>







