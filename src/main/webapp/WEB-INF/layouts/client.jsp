<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="cn" ng-app='<decorator:getProperty property="ng-app" default=""/>'>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><decorator:getProperty property="title" default="台球会"/></title>
		<!-- Le styles -->
     	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
		<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" />
		<script src="${ctx}/static/bootstrap/3.1.1/js/jquery-1.10.2.js"></script>
		<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script>
		<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
		<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
		<!--  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
		<decorator:head/>
		<style type="text/css">
		.header_footer_img{width:100%;}
		.friend_link{padding-top:30px;padding-left:100px;color:#E9EBEB;}
		 .friend_link a{color:#E9EBEB;}
		a:link {text-decoration: none;} 
		.shar{padding-top:30px;padding-left:100px;}
		.shar span{padding-right:10px;}
		</style>
	</head>
	<body ng-controller='<decorator:getProperty property="body.ng-controller" default=""/>'>
		<div class="container-fluid">
			<div class="row">
				<img class="header_footer_img" src="${ctx}/static/images/assets/example/header.png"/>
			</div>
		</div>
		<decorator:body />
		<div class="container-fluid">
			<footer>
				<div class="row" >
					<div style="background:url(${ctx}/static/images/assets/example/footer.png);background-size:cover;height:200px;">
						<p class="friend_link">友情链接： <a href="http://www.appchina.com">应用汇| </a><a href="http://app.mi.com">小米应用商店 | </a><a href="http://apk.hiapk.com">安卓市场 | </a><a href="http://www.fzhuake.com">华科信息 </a></p>
						<p class="shar"><span><img src="${ctx}/static/images/assets/example/index_31.png"/></span><span><img src="${ctx}/static/images/assets/example/index_34.png"/></span></p>
					</div>
					<%-- <img class="header_footer_img" src="${ctx}/static/images/assets/example/footer.png"/> --%>
				</div>
			</footer>
		</div>
		<script type="text/javascript">
		</script>
	</body>
</html>