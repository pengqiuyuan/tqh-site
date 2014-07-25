<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>台球会<sitemesh:title/></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
	<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/3.1.1/js/jquery-1.10.2.js"></script>
	<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
	<sitemesh:head/>
	<style type="text/css">
		.header_footer_img{width:100%;}
		.friend_link{padding-top:40px;padding-left:100px;color:#E9EBEB;}
		 .friend_link a{color:#E9EBEB;}
		a:link {text-decoration: none;} 
		.tqh_logo{margin-left:72%;margin-top:-100px;}
		.shar{margin-top:-20px;padding-left:100px;}
		.shar span{padding-right:10px;}
		#nav{padding-left:27%;background:url(${ctx}/static/images/assets/example/dh_bg.png);}
 		#nav a{color:#FFFFFF;font-family:"Microsoft YaHei";font-size:16px;}
 		#nav a:hover{background-color:#15E2B9}
 		.copyRight{color:#FFFFFF;font-size:12px;}
	</style>
</head>

<body style="background:url(${ctx}/static/images/assets/example/body_bg.png) repeat;">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
			<sitemesh:body/>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	<%-- <script src="${ctx}/static/freelancer/js/bootstrap.min.js"></script> --%>
</body>
</html>