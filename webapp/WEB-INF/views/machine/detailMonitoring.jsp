<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비별 모니터링</title>
<link rel="stylesheet" href="/geomet/css/searchBar/searchBar.css">
<%@include file="../include/pluginpage.jsp" %> 
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
            margin-top:10px;
        }
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.3s ease-in-out;
        }
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	       
	        overflow-y: auto; 
	        margin: 6% auto 0;
	        padding: 20px;
	        border-radius: 10px;
	        position: relative;
	        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	        transform: scale(0.8);
	        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
	        opacity: 0;
	    }
        .modal.show {
            display: block;
            opacity: 1;
        }
        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }
        .close {
            background-color:white;
            position: absolute;
            right: 15px;
            top: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .modal-content form {
            display: flex;
            flex-direction: column;
        }
        .modal-content label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content input, .modal-content textarea {
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button {
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover {
            background-color: #a9a9a9;
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
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
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
        
        
.legend {
  position: absolute;
  top: 20px;
  right: 190px;
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 6px;
  padding: 10px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  
  display: flex;         
  gap: 12px;              
}

.legend-item {
  display: flex;
  align-items: center;
  margin: 0;               
}

.legend-color {
  width: 14px;
  height: 14px;
  border-radius: 2px;
  margin-right: 6px;
}

    .color-red        { background: #e74c3c;        }
    .color-orange     { background: #e67e22;     }
    .color-yellow     { background: #f1c40f;     }
    .color-lightgreen { background: #2ecc71; }
        
   #dataList .tabulator-tableHolder .tabulator-row {
    height: 37px !important;
     font-size: 17px !important;
  }

  #dataList .tabulator-tableHolder .tabulator-cell {
    line-height: 37px !important;
     font-size: 17px !important;
  }

  #dataList .tabulator-tableHolder .tabulator-header .tabulator-col {
    height: 37px !important;
    line-height: 37px !important;
     font-size: 17px !important;
  }
      .custom-progress {
      background: #f0f0f0;
      border-radius: 4px;
      overflow: hidden;
      height: 27px;
      position: relative;
      box-shadow: inset 0 1px 3px rgba(0,0,0,0.2);
    }
    .custom-progress .bar {
      height: 100%;
      border-radius: 4px;
      transition: width 0.5s ease-in-out;
    }
    /* 값 범위별 색상 */
    .bar.color-red { background: #e74c3c; }
    .bar.color-orange { background: #e67e22; }
    .bar.color-yellow { background: #f1c40f; }
    .bar.color-lightgreen { background: #2ecc71; }
    .custom-progress .label {
      position: absolute;
      width: 100%;
      text-align: center;
      font-size: 17px;
      font-weight: bold;
      color: #333;
      top: 0;
      left: 0;
      line-height: 19px;
    }
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

	<div class="legend">
	  <div class="legend-item">
	    <div class="legend-color color-red"></div> 0~25%
	  </div>
	  <div class="legend-item">
	    <div class="legend-color color-orange"></div> 26~50%
	  </div>
	  <div class="legend-item">
	    <div class="legend-color color-yellow"></div> 51~75%
	  </div>
	  <div class="legend-item">
	    <div class="legend-color color-lightgreen"></div> 76~100%
	  </div>
	</div>


        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	
	 


    <script>

    let now_page_code = "a02";
    $(function() {
        getDataList();
    });

    function getDataList() {
    
    	  if (!document.getElementById('progress-styles')) {
    	    const style = document.createElement('style');
    	    style.id = 'progress-styles';
    	    style.innerHTML = `
    	      .custom-progress { background: #f0f0f0; border-radius: 4px; overflow: hidden; height: 27px; position: relative; box-shadow: inset 0 1px 3px rgba(0,0,0,0.2); }
    	      .custom-progress .bar { height: 100%; border-radius: 4px; transition: width 0.5s ease-in-out; }
    	      .bar.color-red { background: #e74c3c; }
    	      .bar.color-orange { background: #e67e22; }
    	      .bar.color-yellow { background: #f1c40f; }
    	      .bar.color-lightgreen { background: #2ecc71; }
    	      .custom-progress .label { position: absolute; width: 100%; text-align: center; font-size: 16px; font-weight: bold; color: #333; top: -4; left: 0; line-height: 16px; }
    	    `;
    	    document.head.appendChild(style);
    	  }

    	  // 퍼센트 포맷터 정의: 범위별 색상 적용
    	  var percentFormatter = function(cell, formatterParams, onRendered) {
    	    var value = cell.getValue() || 0;
    	    var colorClass = value <= 25 ? 'color-red'
    	                   : value <= 50 ? 'color-orange'
    	                   : value <= 75 ? 'color-yellow'
    	                   : 'color-lightgreen';
    	    var wrapper = document.createElement('div');
    	    wrapper.className = 'custom-progress';

    	    var bar = document.createElement('div');
    	    bar.className = 'bar ' + colorClass;
    	    bar.style.width = value + '%';
    	    wrapper.appendChild(bar);

    	    var label = document.createElement('div');
    	    label.className = 'label';
    	    label.textContent = value + '%';
    	    wrapper.appendChild(label);

    	    return wrapper;
    	  };

    	  // Tabulator 초기화
    	  dataTable = new Tabulator('#dataList', {
    	    height: '760px',
    	    layout: 'fitColumns',
    	    rowHeight: '220px',
    	    layout: 'fitDataFill',
    	      headerSort: false,
    	      reactiveData: true,
    	      columnHeaderVertAlign: "middle",
    	      rowVertAlign: "middle",
    	      headerHozAlign: 'center',
    	      fontsize:'19px',
    	      ajaxParams: {},
    	      ajaxConfig: { method: 'POST' },
    	    ajaxURL: '/geomet/machine/detailMonitoring/list',
   
 
    	    placeholder: '조회된 데이터가 없습니다.',

    	    ajaxResponse: function(url, params, response) {

    	      return response;
    	    },
    	    columns: [
    	      {
        	      
    	        title: '일일 생산 현황', hozAlign: 'center', headerSort: false, colspan: 6,
    	        columns: [
    	          { title: '설비명', field: 'mach_code', hozAlign: 'center', width: 250, headerSort: false },
    	          { title: '목표 생산량', field: 'target', hozAlign: 'center', width: 180, headerSort: false },
    	          { title: '현재 생산량', field: 'prodqty', hozAlign: 'center', width: 180 , headerSort: false},
    	       
    	          { title: '달성률%', field: 'rate', formatter: percentFormatter, width: 300, headerSort: false },
    	          { title: '진도율%', field: 'n_rate', formatter: percentFormatter, width: 300, headerSort: false },
    	          { title: '버스켓효율%', field: 'c_rate', formatter: percentFormatter, width: 300 , headerSort: false},
    	        ]
    	      }
    	    ],
    	    rowFormatter: function(row) {
                var data = row.getData();
                row.getElement().style.fontWeight = "700";
                row.getElement().style.backgroundColor = "#FFFFFF";
            },


        });
    }
</script>


</body>
</html>
