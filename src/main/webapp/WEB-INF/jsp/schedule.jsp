<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link rel="stylesheet" href="<c:url value='/css/reset.css'/>" /> <!-- CSS reset --> --%>
<%-- <link rel="stylesheet" href="<c:url value='/css/style.css'/>" /> <!-- Resource style --> --%>
<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/common.css">
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
	</div>
	<div class="container">
		<table class="table table-bordered" style="margin-top: 10px;" id="tb">
			<tr align="center">
				<td width="50"></td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
			</tr>
		</table>
	</div>
	<script src="/webjars/jquery/3.3.1-2/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="/js/common.js"></script>
    
    <script>
    	var userList = JSON.parse('${userList}');
		$(function() {
			drawTableForSchedule();
		});
		
		function onClickScheduleForward(url) {
	   		commonRedirect(url);
	    }
		
		function drawTableForSchedule() {
			//console.log(dataList.REGDATE);
			var days = 5;
			var grades = 8;
			var view = "";
			
// 			$("#tb").append() // TR 마지막에 붙히며 1 ~ 8 교시까지 검사하면서 TD를 그린다
			for(var i = 1; i <= grades ; i++) {
				var tr = document.createElement('tr');
				var td = document.createElement('td');
				$(tr).append($(td).append(i));
				
				for(var j = 1; j <= days ; j++) {
					td = document.createElement('td');
					
					// 내 수강목록에 있는 데이터와 8x5 테이블에 일치하는 부분 찾아서 데이터 삽입
					$.each(userList, function(v,data) {
						if(data.GRADE == i && data.DAYS == j) {
							$(td).append(data.SUBJECT_NAME);
							return false;
						}
					});
					$(tr).append(td);
				}
				$("#tb").append(tr);
			}
		}
	
		
	// 	$.ajax({
			
	// 	});
	</script>
</body>
</html>