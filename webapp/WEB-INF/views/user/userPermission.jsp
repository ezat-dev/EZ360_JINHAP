<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 권한부여</title>
<%@include file="../include/pluginpage.jsp" %>

    
    <style>
	
    body { font-family: Arial, sans-serif; margin: 20px; }
    .permission-container { margin-top: 20px; display: grid; grid-template-columns: repeat(6, 1fr); gap: 16px; }
    .section { background: #f9f9f9; padding: 12px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
    .section h3 { margin: 0 0 8px; font-size: 16px; color: #333; }
    .section .control { display: flex; align-items: center; margin-bottom: 6px; }
    .section .control label { width: 160px; font-weight: bold; color: #555; }
    .section .control select,
    .section .control input[type=number] { flex: 1; padding: 4px 8px; border: 1px solid #ccc; border-radius: 4px; }
    .actions { grid-column: span 2; text-align: right; margin-top: 12px; }
    .actions button { margin-left: 8px; padding: 6px 12px; border: none; border-radius: 4px; background: #007bff; color: #fff; cursor: pointer; }
    .actions button.clearAut { background: #6c757d; }
     .row_select {
	    background-color: #ffeeba !important;
	    }     
   .actions button {
    margin-bottom: 8px; 
  	}
    
	.actions button:hover {
    background-color: #2980b9;
 	 }
    </style>
 
    


    <body>
	<div class="section">
	  <div class="actions">
	    <button type="button" class="allNo">전체없음</button>
	    <button type="button" class="allUpdate">최고권한</button>
	    <button type="button" class="saveAut">저장</button>
	    <button type="button" class="clearAut">초기화</button>
	
	    <div class="view">
	      <div id="dataList" class="tabulator"></div>
	    </div>
	  </div>
	</div>
	
  <form id="permissionForm" class="permission-container">
  <input type="text" style="display:none;" id="user_code" name="user_code" />
    <div class="section">
      <h3>모니터링</h3>
      <div class="control"><label for="a01">통합 모니터링</label><select id="a01" name="a01"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="a02">설비별 모니터링</label><select id="a02" name="a02"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="a03">경보 모니터링</label><select id="a03" name="a03"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="a04">경보 발생빈도</label><select id="a04" name="a04"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="a05">온도경향 모니터링</label><select id="a05" name="a05"><option value="N">없음</option><option value="R">조회</option></select></div>
    </div>
    <div class="section">
      <h3>생산관리</h3>
      <div class="control"><label for="b01">생산실적</label><select id="b01" name="b01"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="b02">설비효율</label><select id="b02" name="b02"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="b03">모니터링 현황</label><select id="b03" name="b03"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="b04">작업일보</label><select id="b04" name="b04"><option value="N">없음</option><option value="R">조회</option></select></div>
      <div class="control"><label for="b05">재고관리</label><select id="b05" name="b05"><option value="N">없음</option><option value="R">조회</option></select></div>
    </div>
    <div class="section">
      <h3>조건관리</h3>
      <div class="control"><label for="c01">TC/조절계 이력</label><select id="c01" name="c01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="c02">설비별 조건</label><select id="c02" name="c02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="c03">관리일지</label><select id="c03" name="c03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="c04">일상점검</label><select id="c04" name="c04"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="c05">기준정보</label><select id="c05" name="c05"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
    </div>
    <div class="section">
      <h3>품질관리</h3>
      <div class="control"><label for="d01">온도균일성</label><select id="d01" name="d01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="d02">테스트/시험</label><select id="d02" name="d02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="d03">수입검사</label><select id="d03" name="d03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="d04">액분석</label><select id="d04" name="d04"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
    </div>
    <div class="section">
      <h3>인원/안전관리</h3>
      <div class="control"><label for="e01">자격인증</label><select id="e01" name="e01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="e02">근무현황</label><select id="e02" name="e02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="e03">장비점검</label><select id="e03" name="e03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="e04">유해화학물질</label><select id="e04" name="e04"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="e05">권한부여</label><select id="e05" name="e05"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
      <div class="control"><label for="e06">사용자등록</label><select id="e06" name="e06"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option></select></div>
    </div>
    
    
  	<div class="section">
	  <h3>투입 운전관리</h3>
	  <div class="control"><label for="f01">LOT 보고서</label><select id="f01" name="f01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="f02">생산조건 모니터링</label><select id="f02" name="f02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	</div>
	
	<div class="section">
	  <h3>취출 운전관리</h3>
	  <div class="control"><label for="g01">LOT 보고서</label><select id="g01" name="g01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="g02">생산조건 모니터링</label><select id="g02" name="g02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	</div>
	
	<div class="section">
	  <h3>설비관리</h3>
	  <div class="control"><label for="h01">정기점검 계획</label><select id="h01" name="h01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="h02">설비 비가동 현황</label><select id="h02" name="h02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="h03">설비이력 관리</label><select id="h03" name="h03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="h04">부품교체 이력관리</label><select id="h04" name="h04"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="h05">스페어부품 관리</label><select id="h05" name="h05"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="h06">공무 일지</label><select id="h06" name="h06"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option></select></div>
	</div>
	
	<div class="section">
	  <h3>문서관리</h3>
	  <div class="control"><label for="i01">온도 균일성</label><select id="i01" name="i01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="i02">사양별 대기통수</label><select id="i02" name="i02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="i03">점검일정 체크</label><select id="i03" name="i03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	</div>
	
	<div class="section">
	  <h3>AGV 관리</h3>
	  <div class="control"><label for="j01">AGV 미션수행횟수</label><select id="j01" name="j01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="j02">AGV 오류발생 횟수</label><select id="j02" name="j02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="j03">AGV 배터리 소모이력</label><select id="j03" name="j03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="j04">AGV 작업지시 조회</label><select id="j04" name="j04"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	</div>
	
	<div class="section">
	  <h3>세척 관리</h3>
	  <div class="control"><label for="k01">세척투입리스트</label><select id="k01" name="k01"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="k02">세척투입</label><select id="k02" name="k02"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="k03">세척,쇼트 일 생산량</label><select id="k03" name="k03"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="k04">세척,쇼트 예약상태</label><select id="k04" name="k04"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="k05">작업지시 조회</label><select id="k05" name="k05"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="k06">라인별 입출고이력</label><select id="k06" name="k06"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	  <div class="control"><label for="k07">설비별 작업실적</label><select id="k07" name="k07"><option value="N">없음</option><option value="R">조회</option><option value="I">저장</option><option value="U">수정</option><option value="D">삭제</option></select></div>
	</div>


  </form>
	    


<script>
$(function(){
  var userTable;
  var user_code = 0;

  $('.headerP').text('인원 및 안전관리 - 사용자 권한부여');
  getAllUserList();

  // 전체 없음
  $(document).on('click', '.allNo', function(){
    $('select').val('N');
  });

  // 최고권한
  $(document).on('click', '.allUpdate', function(){
    $('select').val('R');
  });

  // 행 더블클릭 시 권한 로드
  function getAllUserList(){
	  userTable = new Tabulator('#dataList', {
		  height: '250px',
          columnHeaderVertAlign: "middle",
          rowVertAlign: "middle",
		  layout: 'fitColumns',
		  reactiveData: true,
		  ajaxConfig: { method: 'POST' },
		  ajaxLoader: false,
		  ajaxURL: '/geomet/user/userPermission/userSelect',
		  ajaxResponse: function(url, params, response){
			  console.log('✅ ajaxResponse 응답:', response.data);
		    return response.data;
		  },
		  placeholder: '조회된 데이터가 없습니다.',
		  paginationSize: 20,
		  columns: [
		    { title: 'NO', field: 'idx', hozAlign: 'center',  visible: true },
		    { title: '아이디', field: 'user_id', hozAlign: 'center'  },
		    { title: '성명', field: 'user_name', hozAlign: 'center'  },
		    { title: '부서', field: 'user_busu', hozAlign: 'center' },
		    { title: '직책', field: 'user_jick', hozAlign: 'center' },
		    { title: 'user_code', field: 'user_code', hozAlign: 'center', visible: false }
		  ],
		  rowClick: function(e, row){
			  var data = row.getData();
			  console.log('클릭된 행 데이터:', data);

			  user_code = data.user_code;
			  $('#user_code').val(user_code);
			  $('.userName').text(data.user_name);
			  getPermissionUserSelectPermission();
			
			  userTable.getRows().forEach(r => r.getElement().classList.remove('row_select'));			  
			  row.getElement().classList.add('row_select');
			}

		    });
		  }

  function getPermissionUserSelectPermission(){
	  var code = $('#user_code').val();
	  console.log('user_code 전송 값:', code); 
	  $.post(
	    '/geomet/user/userPermission/userSelectPermission',
	    { user_code: code },
	    function(result){
	      var data = result.data || {};
	      for(var key in data){
	        $('[name="' + key + '"]').val(data[key]);
	      }
	    },
	    'json'
	  );
	}


  // 저장
// 저장
$(document).on('click', '.saveAut', function(){
  var formData = new FormData($('#permissionForm')[0]);

  // 콘솔 확인용 로그 출력
  console.log('📤 FormData 전송 시작');
  for (let pair of formData.entries()) {
    console.log(`${pair[0]}: ${pair[1]}`);
  }

  $.ajax({
    url: '/geomet/user/userPermission/update',
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(){
      alert('권한이 수정되었습니다.');
    },
    error: function(xhr, status, error){
      alert('수정 중 오류가 발생했습니다.');
      console.error('❌ AJAX 오류:', status, error);
      console.error('응답 내용:', xhr.responseText);
    }
  });
});

  // 초기화
  $(document).on('click', '.clearAut', function(){
    $('#permissionForm')[0].reset();
  });
});
</script>


	</body>
</html>
