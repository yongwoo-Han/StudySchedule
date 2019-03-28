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
				      <input type="text" class="form-control" placeholder="Search for..." aria-label="Search for...">
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
                	<c:forEach var="item" items="${subjectList}" varStatus="status">
                	<tr>
                		<td>
                			<input type="checkbox"/>
                			<input type="hidden" id="orgDayAndGrade" name="orgDayAndGrade" value="${item.ORG_DAYSANDGRADE}">
                			<input type="hidden" id="orgUniqueSeq" name="orgUniqueSeq" value="${item.UNIQUE_GRP_SEQ}">
                		</td>
                		<td id="subname">${item.SUBJECT_NAME }</td>
                		<td id="dayandgrade">${item.DAYSANDGRADE }</td>
                		<td id="subgrade">${item.SUBJECT_GRADE }학점</td>
               		</tr>
                	</c:forEach>
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
    </div>
    <script src="/webjars/jquery/3.3.1-2/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="/js/common.js"></script>
    
    <script type="text/javascript">
    	
   		var userList = JSON.parse('${userList}');
    
		$(function () {
			// 페이지 호출 시 내 수강목록 테이블 그려준다.
			createUserTable();
			
			// 페이지 호출 시 수강신청 목록 테이블 그려준다.
		});
	    
		$(document).on('click',':checkbox',function() {
			var $data = $(this).siblings('#orgDayAndGrade');
			var compareToTime = $data.val().split(',');
			
			if($(this).is(":checked")){
				for(var i in compareToTime) {
					for(var j in userList) {
						if(userList[j].DAYANDGRADE == compareToTime[i]){
							alert("이미 해당 시간에 수강목록이 존재합니다.");
							$(this).prop("checked",false);
							return;
						}
					}
				}
				
				// 수간신청 완료되면 호출
				successEnrolementSubject($(this).siblings('#orgUniqueSeq'), compareToTime);
			}
		});
		
		// 수강과목 검색
		$(document).bind('click','#searchEvent',function() {
			
		});
		
		// 수강신청 완료
		$(document).bind('click','#confirmSubjectSchedule', function(){
			
		});
		
		// 현재 유저별 수강목록 들고있는 부분 테이블 그리기
		function createUserTable() {
			$.ajax({
				 url : "/data/searchEnroleUserlist"
		  		,type : "post"
		  		,dataType : "json"
				,success : function(data) {
					//데이터 기반으로 목록 생성
					
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
					
					$("#stb").find(":checkbox").each(function(){
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
		  			subjectGrpSeq : $data.val()
		  		}
				,success : function(response) {
					createUserTable();
					$(this).prop("disabled",true);
				}
				,exception : function(response) {
					alert("내부시스템 에러 입니다." + response);
					$(this).prop("disabled",true);
				}
			});
		}
		
		// 탭 이동 (공통)
	    function onClickScheduleForward(url) {
	   		commonRedirect(url);
	    }
	    
    </script>
</body>
</html>