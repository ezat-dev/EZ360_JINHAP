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
                    
                    <label class="daylabel">발생일자 :</label>
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
    $(function () {
        $(".headerP").text("모니터링 - 온도경향 모니터링");
    });

    $(document).ready(function () {

        function loadChart(startDate, endDate) {
            console.log(" 검색 기간:", startDate, "~", endDate);

            $.ajax({
                type: "POST",
                url: "/geomet/machine/tempMonitoring/list",
                data: {
                    startDate: startDate,
                    endDate: endDate
                },
                dataType: "json",
                success: function (data) {
                    console.log("받아온 데이터:", data);

                    if (data.status !== "success") {
                        alert("데이터 로딩 실패: " + data.message);
                        return;
                    }

                    const raw = data.data;
                    if (!raw || raw.length === 0) {
                        alert("데이터가 없습니다.");
                        return;
                    }

                    const categories = raw.map(item => item.temp_time);

                    const seriesNames = [
                        "t_600_D12000", "t_600_D12001",
                        "t_800_D12000", "t_800_D12001",
                        "blk_D12000", "blk_D12001",
                        "mlpl_D12000", "mlpl_D12001"
                    ];

                    const series = seriesNames.map(name => ({
                        name: name,
                        data: raw.map(item => item[name])
                    }));

                    if (!document.getElementById('chartContainer')) {
                        console.error("❌ 'chartContainer' div가 없습니다.");
                        return;
                    }

                    Highcharts.chart('chartContainer', {
                        chart: { type: 'line' },
                        title: {
                            text: '온도 경향'
                        },
                        xAxis: {
                            categories: categories,
                            title: { text: '시간' },
                            labels: {
                                rotation: -45,
                                formatter: function () {
                                    const time = this.value.split(' ')[1];
                                    return time ? time.split('.')[0] : this.value;
                                }
                            }
                        },
                        yAxis: {
                            title: { text: '(℃) ' }
                        },
                        series: series
                    });
                },
                error: function (xhr, status, error) {
                    console.error("❌ 데이터 불러오기 실패:", status, error);
                }
            });
        }

        $(".select-button").click(function () {
            const startDate = $("#startDate").val() || "";
            const endDate = $("#endDate").val() || "";
            loadChart(startDate, endDate);
        });

        function getFormattedDate(offsetDays = 0) {
            const date = new Date();
            date.setDate(date.getDate() + offsetDays);
            return date.toISOString().slice(0, 16).replace('T', ' ');
        }

        const endDate = getFormattedDate();
        const startDate = getFormattedDate(-5);

        $("#startDate").val(startDate);
        $("#endDate").val(endDate);

        loadChart(startDate, endDate);
    });
</script>

</body>
</html>
