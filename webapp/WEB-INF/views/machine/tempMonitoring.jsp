<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온도경향 모니터링</title>
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
        .datetimeSet {
            width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
	  .highcharts-title {
	    font-size: 18px !important;
	    font-weight: bold !important;
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
        		 .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        
</style>
    
    
<body>
    <main class="main">
        <div class="tab">
            <div class="button-container">
                <div class="box1">
                    <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
                    
                    <label class="daylabel">검색일자 :</label>
                    <input type="text" class="datetimeSet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
                    
                    <span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
                    
                    <input type="text" class="datetimeSet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
                </div>

                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
            </div>
        </div>

         <div id="chartWrapper" style="height: 100vh;">
		    <div id="chartContainer" style="width:100%; height:calc(100vh - 100px);"></div>
		  </div>
    </main>

 <script>
 let now_page_code = "a05";

 $(function () {
     $(".headerP").text("모니터링 - 온도경향 모니터링");
 });

 $(document).ready(function () {

     function loadChart(startDate, endDate) {
         console.log(" 검색 기간:", startDate, "~", endDate);

         $.ajax({
             type: "POST",
             url: "/geomet/machine/tempMonitoring/list",
             data: { startDate, endDate },
             dataType: "json",
             success: function (data) {
                 if (data.status !== "success") {
                     alert("데이터 로딩 실패: " + data.message);
                     return;
                 }

                 const raw = data.data;
                 if (!raw || raw.length === 0) {
                     alert("데이터가 없습니다.");
                     return;
                 }

                 // X축 카테고리(시간)
                 const categories = raw.map(item => item.temp_time);

                 // key와 출력 레이블을 직접 지정
                 const seriesInfo = [
                     { key: "t_600_d12000", label: "t_600 예열" },
                     { key: "t_600_d12001", label: "t_600 가열" },
                     { key: "t_800_d12000", label: "t_800 예열" },
                     { key: "t_800_d12001", label: "t_800 가열" },
                     { key: "blk_d12000",    label: "blk 예열"   },
                     { key: "blk_d12001",    label: "blk 가열"   },
                     { key: "mlpl_d12000",   label: "mlpl 예열"  },
                     { key: "mlpl_d12001",   label: "mlpl 가열"  }
                 ];

                 // series 생성
                 const series = seriesInfo.map(info => ({
                     name: info.label,
                     data: raw.map(item => item[info.key])
                 }));

                 // 차트 렌더링
                 Highcharts.chart('chartContainer', {
                     chart: { type: 'line' },
                     title: {
                         text: '온도 경향 모니터링',
                         style: {
                             fontSize: '18px',
                             fontWeight: 'bold'
                         }
                     },
                     exporting: { enabled: false },
                     xAxis: {
                         categories,
                         title: { text: '시간' },
                         // 약 20개만 라벨 표시
                         tickInterval: Math.max(1, Math.floor(categories.length / 20)),
                         labels: {
                             rotation: 0,
                             align: 'center',
                             style: {
                                 whiteSpace: 'normal',
                                 fontSize: '14px'
                             },
                             formatter: function () {
                                 const [date, time] = this.value.split(' ');
                                 const mmdd = date.slice(5);                    // MM-DD
                                 const hhmm = time.split('.')[0].slice(0,5);   // hh:mm
                                 return mmdd + '</br>' + hhmm;
                             }
                         }
                     },
                     yAxis: {
                         title: { text: '(℃)' }
                     },
                     series: series
                 });
             },
             error: function (xhr, status, error) {
                 console.error("❌ 데이터 불러오기 실패:", status, error);
             }
         });
     }

     // 조회 버튼 클릭
     $(".select-button").click(function () {
         const startDate = $("#startDate").val() || "";
         const endDate   = $("#endDate").val()   || "";
         loadChart(startDate, endDate);
     });

     // 날짜 포맷 함수
     function formatDate(date) {
         return date.toISOString().slice(0, 16).replace('T', ' ');
     }

     // 초기 날짜 세팅 (오늘 00:00 ~ 현재 시각)
     const now = new Date();
     const todayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0);
     const startDate = formatDate(todayStart);
     const endDate   = formatDate(now);

     $("#startDate").val(startDate);
     $("#endDate").val(endDate);

     // 최초 차트 로드
     loadChart(startDate, endDate);
 });
</script>

</body>
</html>
