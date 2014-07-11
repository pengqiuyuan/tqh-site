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
		<title>3 Carousel Layout (BS 3)</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
		<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="${ctx}/static/bootstrap/3.1.1/css/styles.css" rel="stylesheet">
		<style type="text/css">
			.col-md-4 {
				width: 16.333333%;
				}
		</style>
	</head>
	<body>
<div class="navbar-wrapper">
  
  <div class="container login" style="margin-left:240px; height:101px;margin-top:-30px; background:url(${ctx}/static/images/assets/example/index1_02.png) no-repeat ">
<span class="nav-pills"></span>
<p class="p" style="float:left; margin-left:30px; margin-top:25px; font-size:30px; color:#FFF; font-family:黑体;" > <a href="">登录</a>  <a href="">注册</a></p>

</div><!-- /container -->
</div><!-- /navbar wrapper -->


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="${ctx}/static/images/assets/example/index_01.png" style="center no-repeat;" class="img-responsive">
      <div class="container">
             <div class="carousel-caption" style="float:left; width:8%;">
         <a class="btn btn-lg btn-primary-p" href="http://www.baidu.com" ><img class="img-responsive-i" src="${ctx}/static/images/assets/example/index1_06.png"></a> 
          </div>
             <div class="carousel-caption" style="float:left; margin-left:18%; width:8%;">
         <a class="btn btn-lg btn-primary-p" href="http://www.baidu.com" ><img class="img-responsive-i" src="${ctx}/static/images/assets/example/index1_09.png"></a> 
          </div>

      </div>

      
    </div>
    <div class="item">
      <img src="${ctx}/static/images/assets/example/index_01.png" style="center no-repeat;" class="img-responsive">
  <div class="container">
             <div class="carousel-caption" style="float:left; width:8%;">
         <a class="btn btn-lg btn-primary-p" href="http://www.baidu.com" ><img class="img-responsive-i" src="${ctx}/static/images/assets/example/index1_06.png"></a> 
          </div>
             <div class="carousel-caption" style="float:left; margin-left:18%; width:8%;">
         <a class="btn btn-lg btn-primary-p" href="http://www.baidu.com" ><img class="img-responsive-i" src="${ctx}/static/images/assets/example/index1_09.png"></a> 
          </div>
      </div>
    </div>
    <div class="item">
      <img src="${ctx}/static/images/assets/example/index_01.png" style="center no-repeat;" class="img-responsive">
      <div class="container">
             <div class="carousel-caption" style="float:left; width:8%;">
         <a class="btn btn-lg btn-primary-p" href="http://www.baidu.com" ><img class="img-responsive-i" src="${ctx}/static/images/assets/example/index1_06.png"></a> 
          </div>
             <div class="carousel-caption" style="float:left; margin-left:18%; width:8%;">
         <a class="btn btn-lg btn-primary-p" href="http://www.baidu.com" ><img class="img-responsive-i" src="${ctx}/static/images/assets/example/index1_09.png"></a> 
          </div>
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

<div class="container marketing">

  <!-- Three columns of text below the carousel -->
  <div class="row">
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_08.png">
      <h2>台球地图</h2>
     
      <p><a class="btn btn-default" href="#">点击详情 »</a></p>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_10.png">
      <h2>赛事直播间</h2>
      
      <p><a class="btn btn-default" href="#">点击详情 »</a></p>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_12.png">
      <h2>活动</h2>
      
      <p><a class="btn btn-default" href="#">点击详情 »</a></p>
    </div>
	<div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_14.png">
      <h2>推荐</h2>
      
      <p><a class="btn btn-default" href="#">点击详情 »</a></p>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_16.png">
      <h2>商城</h2>
      
      <p><a class="btn btn-default" href="#">点击详情 »</a></p>
    </div>
    <div class="col-md-4 text-center">
      <img class="img-circle" src="${ctx}/static/images/assets/example/index_19.png">
      <h2>台球圈子</h2>
      
      <p><a class="btn btn-default" href="#">点击详情 »</a></p>
    </div>
  </div><!-- /.row -->


  <!-- START THE FEATURETTES -->

 


  <!-- FOOTER -->
 



</div>
  <div class="container-footer" style="background:url(${ctx}/static/images/assets/example/index1_33.png)
  ;height:167px; margin-top:30px; width:100%;">
    <div class="lk-999 " style="margin-left:147px; padding-top:50px; color:#9ca3a2;"><p class="pull-right" ><a href="#"></a></p>
    <p style="font-color:#9ca3a2">友情链接： <a href="">九游手机游戏 | </a><a href="">天网手机软件 | </a><a href="">历趣手机软件 | </a><a href="">软吧手机软件 | </a><a href="">宝软网 | </a><a href="">应用汇 | </a><a href="">安智网 | </a><a href="">雷锋网</a></p>
   </div>
   <div class="container l" style="margin-left:250px; margin-top:30px; color:#9ca3a2; font-size:12px;"><p>版权所有 福州华科信息科技有限公司 保留一切权利 闽ICP备13018017号</p></div> 
   </div>
<!-- /.container -->
	<!-- script references -->
	    <script src="${ctx}/static/bootstrap/3.1.1/js/jquery-1.10.2.js"></script>
		<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<script src="${ctx}/static/bootstrap/3.1.1/js/scripts.js"></script>
	</body>
</html>