<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="<c:url value='/css/reset.css'/>" /> <!-- CSS reset -->
	<link rel="stylesheet" href="<c:url value='/css/style.css'/>" /> <!-- Resource style -->
	<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <a class="navbar-brand" href="#">Navbar</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
		        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#" id="sheduleList">Features</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Pricing</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link disabled" href="#">Disabled</a>
		      </li>
		    </ul>
		  </div>
		</nav>
	</div>
<div class="cd-schedule loading">
	<div class="timeline">
		<ul>
			<li><span>1교시<br>(9:00 ~ 9:50)</span></li>
			<li><span>2교시<br>(10:00 ~ 10:50)</span></li>
			<li><span>3교시<br>(11:00 ~ 11:50)</span></li>
			<li><span>4교시<br>(12:00 ~ 12:50)</span></li>
			<li><span>5교시<br>(13:00 ~ 13:50)</span></li>
			<li><span>6교시<br>(14:00 ~ 14:50)</span></li>
			<li><span>7교시<br>(15:00 ~ 15:50)</span></li>
			<li><span>8교시<br>(16:00 ~ 16:50)</span></li>
		</ul>
	</div> <!-- .timeline -->

	<div class="events">
		<ul>
			<li class="events-group">
				<div class="top-info"><span>Monday</span></div>
				<ul></ul>
			</li>

			<li class="events-group">
				<div class="top-info"><span>Tuesday</span></div>
				<ul></ul>
			</li>

			<li class="events-group">
				<div class="top-info"><span>Wednesday</span></div>
					<ul>
						<li style="background: gainsboro">Test</li>
					</ul>
<!-- 				<ul> -->
<!-- 					<li class="single-event" data-start="09:00" data-end="10:15" data-content="event-restorative-yoga" data-event="event-4"> -->
<!-- 						<a href="#0"> -->
<!-- 							<em class="event-name">Restorative Yoga</em> -->
<!-- 						</a> -->
<!-- 					</li> -->

<!-- 					<li class="single-event" data-start="10:45" data-end="11:45" data-content="event-yoga-1" data-event="event-3"> -->
<!-- 						<a href="#0"> -->
<!-- 							<em class="event-name">Yoga Level 1</em> -->
<!-- 						</a> -->
<!-- 					</li> -->

<!-- 					<li class="single-event" data-start="12:00" data-end="13:45"  data-content="event-rowing-workout" data-event="event-2"> -->
<!-- 						<a href="#0"> -->
<!-- 							<em class="event-name">Rowing Workout</em> -->
<!-- 						</a> -->
<!-- 					</li> -->

<!-- 					<li class="single-event" data-start="13:45" data-end="15:00" data-content="event-yoga-1" data-event="event-3"> -->
<!-- 						<a href="#0"> -->
<!-- 							<em class="event-name">Yoga Level 1</em> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
			</li>

			<li class="events-group">
				<div class="top-info"><span>Thursday</span></div>
				<ul></ul>
			</li>

			<li class="events-group">
				<div class="top-info"><span>Friday</span></div>
				<ul></ul>
			</li>
		</ul>
	</div>

	<div class="event-modal">
		<header class="header">
			<div class="content">
				<span class="event-date"></span>
				<h3 class="event-name"></h3>
			</div>

			<div class="header-bg"></div>
		</header>

		<div class="body">
			<div class="event-info"></div>
			<div class="body-bg"></div>
		</div>

		<a href="#0" class="close">Close</a>
	</div>

	<div class="cover-layer"></div>
</div> <!-- .cd-schedule -->
<script src="/webjars/jquery/3.3.1-2/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(function() {
		console.log("schedule List");
	});
</script>
</body>
</html>