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
                <table class="table">
                	<thead>
                	<tr>
                		<th>과목명</th>
                		<th>시간</th>
                		<th>학점</th>
                	</tr>
                	<tr>
                		<td>전자기학</td>
                		<td>1교시 (9:00 ~ 9:50)</td>
                		<td>
                			3학점 <span><button type="button" class="btn btn-danger">취소</button></span>
                		</td>
                	</tr>
                	<tr>
                		<td>전자기학</td>
                		<td>1교시 (9:00 ~ 9:50)</td>
                		<td>
                			3학점 <span><button type="button" class="btn btn-danger">취소</button></span>
                		</td>
                	</tr>
                </table>
                <div style="text-align: right;">
                	<button type="button" class="btn btn-primary btn-lg">적용</button>
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
				       <button class="btn btn-secondary" type="button">검색</button>
				      </span>
				    </div>
			  	</div>
        	</div>
            <article>
                <table class="table">
                	<thead>
                	<tr>
                		<th></th>
                		<th>과목명</th>
                		<th>시간</th>
                		<th>학점</th>
                	</tr>
                	<c:forEach var="item" items="${subjectList}" varStatus="status">
                	<tr>
                		<td><input type="checkbox"/></td>
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
		$(function () {
			console.log("jQuery ready");
		});
	    
		$(document).on('click',':checkbox',function(){
			var $tdGroup = $(this).parent().siblings();
			var compareToTime = $tdGroup.find('dayandgrade').split(',');
		});
	    
	    function onClickScheduleForward(url) {
	   		commonRedirect(url);
	    }
	    
    </script>
</body>
</html>