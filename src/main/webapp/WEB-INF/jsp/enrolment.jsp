<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">

<%-- <link rel="stylesheet" href="<c:url value='/css/reset.css'/>" /> <!-- CSS reset --> --%>
<link rel="stylesheet" href="<c:url value='/css/style.css'/>" /> <!-- Resource style -->
</head>
<body>
    <div class="container">
       	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item">
		        <a class="nav-link" href="#">Home</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="javascript:onClickScheduleForward('<c:url value='/enrolment'/>')" id="searchEnrolement">수강신청</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="javascript:onClickScheduleForward('<c:url value='/schedule'/>')" id="identificationSchedule">개인시간표</a>
		      </li>
		    </ul>
		  </div>
		</nav>
        <section>
        	<h4>내 수강목록</h4>
            <article>
                <table class="table" id="tb">
                	<thead>
                		<tr>
		               		<th>과목명</th>
		               		<th>시간</th>
		               		<th>학점</th>
	               		</tr>
                	</thead>
                	<tbody>
                	</tbody>
                </table>
                <div style="text-align: right;">
                	<button type="button" class="btn btn-primary btn-lg" id="confirmSubjectSchedule">수강신청 완료</button>
                </div>
            </article>
            <!-- 페이징 처리 -->
            <nav aria-label="...">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">Previous</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item active">
			      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
        </section>
        <section>
        	<div>
        		<h4>수강신청 목록</h4>
        		<div class="col-lg-6 offset-lg-6">
				    <div class="input-group" style="margin-bottom: 5px;">
				      <input type="text" class="form-control" placeholder="Search for..." aria-label="Search for..." id="searchText">
				       <span class="input-group-btn">
				       <button class="btn btn-secondary" type="button" id="searchEvent">검색</button>
				      </span>
				    </div>
			  	</div>
        	</div>
            <article>
                <table class="table" id="stb">
                	<thead>
	                	<tr>
	                		<th></th>
	                		<th>과목명</th>
	                		<th>시간</th>
	                		<th>학점</th>
	                	</tr>
                	</thead>
                	<tbody>
                	</tbody>
<%--                 	<c:forEach var="item" items="${subjectList}" varStatus="status"> --%>
                	
<%--                 	</c:forEach> --%>
                </table>
            </article>
            <!-- 페이징 처리 -->
            <nav aria-label="...">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">Previous</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item active">
			      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
        </section>
        
        <!-- 수강 테이블 생성 위한 -->
        <table style="display:none;" id="clonetable">
        	<tr>
          		<td>
          			<input type="checkbox"/>
          			<input type="hidden" id="orgDayAndGrade" name="orgDayAndGrade" value="">
          			<input type="hidden" id="orgUniqueSeq" name="orgUniqueSeq" value="">
          			<input type="hidden" id="orgSubgrade" name="orgSubgrade" value="">
          			<input type="hidden" id="subjectSeq" name="subjectSeq" value="">
          		</td>
          		<td id="subname"></td>
          		<td id="dayandgrade"></td>
          		<td id="subgrade"></td>
      		</tr>
        </table>
    </div>
    <script src="/webjars/jquery/3.3.1-2/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="/js/common.js"></script>
    
    <script type="text/javascript">
    	
   		var userList = JSON.parse('${userList}');
   		var subjectList = JSON.parse('${subjectList}');
   		
   		var maxGrade = 21; // 최대 21학점
   		var minGrade = 18; // 최소 18학점
    
		$(function () {
			// 페이지 호출 시 내 수강목록 테이블 그려준다.
			createUserTable();
			
			// 페이지 호출 시 수강신청 목록 테이블 그려준다.
			creatSubjectTable();
		});
	    
		$(document).on('click',':checkbox',function() {
			var $data = $(this).siblings('#orgDayAndGrade');
			var compareToTime = $data.val().split(',');
			
			if($(this).is(":checked")){
				
				if(!validation($(this), compareToTime)) {
					return;
				}
				
				// 수간신청 완료되면 호출
				successEnrolementSubject($(this), compareToTime);
			}
		});
		
		// 수강과목 검색
		$(document).on('keydown, click','#searchEvent',function(key) {
			
			var searchText = $('#searchText').val();
			
			$.ajax({
				 url : "/data/searchSubjectList"
		  		,type : "post"
		  		,dataType : "json"
		  		,data : {
		  			subjectName : searchText
		  		}
				,success : function(data) {
					
					//데이터 기반으로 목록 생성
					subjectList = data;
					creatSubjectTable();
				}
				,exception : function(response) {
				}
			});
			
		});
		
		// 수강신청 완료
		$(document).on('click','#confirmSubjectSchedule', function(){
			
		});
		
		// 수강신청 목록 테이블 생성
		function creatSubjectTable() {
			
			$("#stb tbody").empty();
			
			$(subjectList).each(function(i, data){
				var table = $('#clonetable').clone();
				var tr = $(table).find('tr');
				
				$(tr).find('#orgDayAndGrade').val(data.ORG_DAYSANDGRADE);
				$(tr).find('#orgUniqueSeq').val(data.UNIQUE_GRP_SEQ);
				$(tr).find('#orgSubgrade').val(data.SUBJECT_GRADE);
				$(tr).find('#subjectSeq').val(data.SEQ);
				
				$(tr).find('#subname').html(data.SUBJECT_NAME);
				$(tr).find('#dayandgrade').html(data.DAYSANDGRADE);
				$(tr).find('#subgrade').html(data.SUBJECT_GRADE+'학점');
				
				// 체크박스 선택
				$(userList).each(function(j, subData){
					if(subData.UNIQUE_GRP_SEQ == data.UNIQUE_GRP_SEQ){
						$(tr).find(':checkbox').prop("checked",true);
						$(tr).find(':checkbox').prop("disabled",true);
						return false;
					}
				});
				
          		$('#stb tbody').append($(table).find('tr'));
			});
		}
		
		// 현재 유저별 수강목록 들고있는 부분 테이블 그리기
		function createUserTable() {
			$.ajax({
				 url : "/data/searchEnroleUserlist"
		  		,type : "post"
		  		,dataType : "json"
				,success : function(data) {
					//데이터 기반으로 목록 생성
					
					userList = data;
					$("#tb tbody").empty();
					
					var len = 3;
					var cancelButton = "<button type='button' class='btn btn-danger' onclick='cancelButtenEvent(this)'>취소</button>";

					for(var i = 0 ; i < data.length; i++){
						var tr = document.createElement('tr');
						var uniqueGrpSeq = "<input type='hidden' id='uniqueGrpSeq' value="+data[i].UNIQUE_GRP_SEQ+" />";
						
						$(tr).append($(document.createElement('td')).append(data[i].SUBJECT_NAME));
						$(tr).append($(document.createElement('td')).append(data[i].DAYSANDGRADE));
						$(tr).append($(document.createElement('td')).append(data[i].SUBJECT_GRADE+'학점' + cancelButton + uniqueGrpSeq));
						$("#tb tbody").append(tr);
					}
				}
				,exception : function(response) {
				}
			});
		}
		
		// 수강취소 선택
		function cancelButtenEvent(data) {
			
			var uniqueGrpSeq = $(data).siblings('#uniqueGrpSeq').val();
			
			$.ajax({
				 url : "/data/removeUserSubject"
		  		,type : "post"
		  		,dataType : "json"
		  		,data: {
		  			subjectGrpSeq : uniqueGrpSeq
		  		}
				,success : function(response) {
					// 신청과목 삭제 후 체크박스 해제
					createUserTable();
					
					$("#stb").find("input:checked").each(function(){
						if(uniqueGrpSeq == $(this).siblings('#orgUniqueSeq')) {
							$(this).prop("disabled",false);
							return false;
						}
					});
				}
				,exception : function(response) {
					alert("내부시스템 에러 입니다." + response);
					$(this).prop("disabled",true);
				}
			});
			
			
			console.log(uniqueGrpSeq);
		}
		
		// 선택된 과목이 수강신청 완료되면 호출
		function successEnrolementSubject($data) {
			// 선택된 수강과목은 유저리스트에 등록되고 수강신청 목록에서 disable 처리
			$.ajax({
				 url : "/data/successEnrolementSubject"
		  		,type : "post"
		  		,dataType : "json"
		  		,data: {
		  			subjectGrpSeq : $data.siblings('#orgUniqueSeq').val()
		  			,subjectGrade : $data.siblings('#orgSubgrade').val()
		  			,subjectSeq   : $data.siblings('#subjectSeq').val()
		  		}
				,success : function(response) {
					createUserTable();
					$data.prop("disabled",true);
				}
				,exception : function(response) {
					alert("내부시스템 에러 입니다." + response);
					$data.prop("disabled",true);
				}
			});
		}
		
		// validation 
		function validation($data, compareToTime) {
			
			var subjectSeq = $data.siblings('#subjectSeq').val();
			var totalGrade = 0;
			var subjectList = '';
			
			for(var i in userList) {
				totalGrade += userList[i].SUBJECT_GRADE;
				
				// 같은 과목이 있는지 검사
				if(userList[i].SEQ == subjectSeq) {
					if(!confirm('수강목록에 같은 과목이 존재합니다. 시간대를 변경하겠습니까?')){
						return false;
					}
				}
			}
			
			// 21학점을 초과하는지 검사
			if(totalGrade >= maxGrade) {
				alert('21학점을 초과할 수 없습니다.');
				return false;
			}
			
			for(var i in compareToTime) {
				for(var j in userList) {
					if(userList[j].ORG_DAYSANDGRADE.indexOf(compareToTime[i]) > -1){
						alert("이미 해당 시간에 수강목록이 존재합니다.");
						$data.prop("checked",false);
						return false;
					}
				}
			}
			
			return true;
		}
		
		// 탭 이동 (공통)
	    function onClickScheduleForward(url) {
	   		commonRedirect(url);
	    }
	    
    </script>
</body>
</html>