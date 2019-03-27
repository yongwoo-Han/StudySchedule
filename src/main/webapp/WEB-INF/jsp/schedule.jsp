<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		        <a class="nav-link" href="javascript:onClickScheduleForward('<c:url value='/scheduleList'/>')" id="identificationSchedule">개인시간표</a>
		      </li>
		    </ul>
		  </div>
		</nav>
	</div>
	<div class="container">
		<table class="table table-bordered" style="margin-top: 10px;">
			<thead>
				<tr align="center">
					<td width="50"></td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
				</tr>
				<tr>
					<td>1</td>
					<td></td>
					<td>전산실무</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td></td>
					<td>포토샾</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>플레시</td>
					<td>포토샾</td>
					<td>플래시</td>
					<td></td>
					<td>컴퓨터그래픽</td>
				</tr>
				<tr>
					<td>4</td>
					<td>플래시</td>
					<td></td>
					<td></td>
					<td>전산개론</td>
					<td>컴퓨터그래픽</td>
				</tr>
				<tr>
					<td>5</td>
					<td></td>
					<td>전산개론</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6</td>
					<td></td>
					<td>전산개론</td>
					<td>웹디자인</td>
					<td></td>
					<td>웹디자인</td>
				</tr>
				<tr>
					<td>7</td>
					<td>웹디자인</td>
					<td></td>
					<td>웹디자인</td>
					<td>운영체제</td>
					<td></td>
				</tr>
				<tr>
					<td>8</td>
					<td></td>
					<td></td>
					<td></td>
					<td>운영체제</td>
					<td></td>
				</tr>
		</table>
	</div>
	<script src="/webjars/jquery/3.3.1-2/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="/js/common.js"></script>
    
    <script>
		$(function() {
		});
		
		function onClickScheduleForward(url) {
	   		commonRedirect(url);
	    }
	
		
	// 	$.ajax({
			
	// 	});
	</script>
</body>
</html>