<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>台球�?/title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
		<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="${ctx}/static/bootstrap/3.1.1/css/styles.css" rel="stylesheet">
		<!-- script references -->
	    <script src="${ctx}/static/bootstrap/3.1.1/js/jquery-1.10.2.js"></script>
		<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<%-- <script src="${ctx}/static/bootstrap/3.1.1/js/scripts.js"></script> --%>
		<%--bootStrap  兼容问题 --%>
		<%-- <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-ie.js"></script> --%>
		<%-- <link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap-ie6.css" rel="stylesheet"> --%>
		<style type="text/css">
			.col-md-4 {width:16.666%;float:left;} 
			.fill {width:100%;height:100%;background-position: center;background-size: cover;}
			.friend_link{margin-top:40px;padding-left:160px;}
			.friend_link a{color:#515151;}
			a:link {color: #000;text-decoration: none;}
			a:visited {color: #000;text-decoration: none;}
			a:active {color: #bc2931;text-decoration: none;}
			.login_p{float:left; margin-left:30px; margin-top:25px; font-size:30px; color:#FFF; font-family:黑体;}
			.login_p a{color:#FFFFFF;}
		</style>
	</head>
	<body>
<div class="navbar-wrapper">
	<!-- login register-->
	<div class="container">
		<div style="margin-left:240px; height:101px;margin-top:-80px; background:url(${ctx}/static/images/assets/example/index1_02.png) no-repeat ">
			<!-- <span class="nav-pills"></span> -->
			<p class="login_p"> <a href="${ctx}/login">登录</a>  <a href="${ctx}/login">注册</a></p>
		</div>
	</div>
</div>
<!-- /container -->
<!-- /navbar wrapper -->
<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
	    <div class="item active">
	      <div class="fill" style="background-image:url('${ctx}/static/images/assets/example/index_01.png');"></div>
	       <%--  <div class="fill" ><img src="${ctx}/static/images/assets/example/index_01.png" style="width:100%;"/></div> --%>
	        <div class="carousel-caption">
	            <h1></h1>
	        </div>
	    </div>
	    <div class="item">
	      <div class="fill" style="background-image:url('${ctx}/static/images/assets/example/index_01.png');"></div>
	        <%-- <div class="fill" ><img src="${ctx}/static/images/assets/example/index_01.png" style="width:100%;"/></div> --%>
	        <div class="carousel-caption">
	            <h1></h1>
	        </div>
	    </div>
	    <div class="item">
	      <div class="fill" style="background-image:url('${ctx}/static/images/assets/example/index_01.png');"></div>
	    	<%-- <div class="fill" ><img src="${ctx}/static/images/assets/example/index_01.png" style="width:100%;"/></div> --%>
	        <div class="carousel-caption">
	            <h1></h1>
	        </div>
	    </div>
  </div>
  <!-- Controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="icon-next"></span>
  </a> 
</div> 
<!-- /.carousel -->
<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
 <div class="container">
  <!-- Three columns of text below the carousel --> 
  <div class="row">
  	<div class="col-md-4 text-center">
    	<img class="img-circle" src="${ctx}/static/images/assets/example/index_08.png">
      	<h2><a href="#">台球地图</a></h2>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_10.png">
      <h2><a href="#">赛事直播�?/a></h2>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_12.png">
      <h2><a href="#">活动</a></h2>
    </div>
	<div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_14.png">
      <h2><a href="#">推荐</a></h2>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_16.png">
      <h2><a href="#">商城</a></h2>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_19.png">
   	  <h2><a href="#">台球圈子</a></h2>
    </div>
  </div><!-- /.row -->
  <!-- START THE FEATURETTES -->
  <!-- FOOTER -->
  <div class="row" style="background:url(${ctx}/static/images/assets/example/index1_33.png);height:140px;">
    <div class="col-lg-12">
    	<p class="friend_link">友情链接�?<a href="">九游手机游戏 | </a><a href="">天网手机软件 | </a><a href="">历趣手机软件 | </a><a href="">软吧手机软件 | </a><a href="">宝软�?| </a><a href="">应用�?| </a><a href="">安智�?| </a><a href="">雷锋�?/a></p>
  	</div>
  </div>
</div> 
 
<!-- /.container -->
	</body>
</html>