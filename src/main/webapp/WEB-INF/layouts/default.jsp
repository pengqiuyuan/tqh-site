<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>台球会:<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>

    <!-- Bootstrap Core CSS -->
    <link href="${ctx}/static/freelancer/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/freelancer/css/freelancer.css" rel="stylesheet" type="text/css">
    <!-- Fonts -->
    <link href="${ctx}/static/freelancer/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <!--  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
 -->
    <!-- IE8 support for HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <%-- <script src="${ctx}/static/freelancer/js/jquery-1.10.2.js"></script> --%>
    <script src="${ctx}/static/freelancer/js/bootstrap.min.js"></script>
   <!--  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> -->
    <script src="${ctx}/static/freelancer/js/classie.js"></script>
    <script src="${ctx}/static/freelancer/js/cbpAnimatedHeader.js"></script>
    <script src="${ctx}/static/freelancer/js/freelancer.js"></script>

<sitemesh:head/>
</head>

<body>
	<div class="container">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div id="content">
			<sitemesh:body/>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
	<%-- <script src="${ctx}/static/freelancer/js/bootstrap.min.js"></script> --%>
</body>
</html>