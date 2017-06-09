<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<%-- ignore=true 없으면 무시 --%>
	<title><tiles:insertAttribute name="title" ignore="true"/></title>
 	<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- calendar -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<link href="http://fullcalendar.io/js/fullcalendar-3.4.0/fullcalendar.css" rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/moment.min.js"></script>
	<script src="http://fullcalendar.io/js/fullcalendar-3.4.0/fullcalendar.js"></script>
	
</head>

<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

			<div id="header" ><tiles:insertAttribute name="header"/></div>
			<div class="text-center">    
		 	
			<div id="main" class="text-center"><tiles:insertAttribute name="main"/></div>
			</div>
			<footer id="footer" class="text-center"><tiles:insertAttribute name="footer"/></footer>
			<!-- jQuery -->
    <%-- <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> --%>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script>
    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/freelancer.min.js"></script>
</body>
</html>