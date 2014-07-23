<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>台球会</title>
		<meta name="generator" content="Bootply" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
		<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet">
		<link href="${ctx}/static/bootstrap/3.1.1/css/styles.css" rel="stylesheet">
		<!-- script references -->
	    <script src="${ctx}/static/bootstrap/3.1.1/js/jquery-1.10.2.js"></script>
		<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script>
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		<style type="text/css">
			body{padding-bottom:0px}
			.down-des{color:#a9a8a8;margin-right:5px;font-size:16px;}
			.head-container{background-color:#faf9f9;padding-top:4px;}
			.member-name{color:#ff9900;}
			a:link {color: #000;text-decoration: none;}
			 a:visited {color: #000;text-decoration: none;}
			 .friend_link{padding-top:40px;padding-left:170px;color:#000;}
			.friend_link a{color:#9ca3a2;font-size:14px;}
			/*a:active {color: #bc2931;text-decoration: none;} */
			.login_p{float:left; margin-left:50px; margin-top:25px; font-size:30px; color:#FFF; font-family:黑体;}
			.login_p a{color:#FFFFFF;} 
			.shar{margin-top:-30px;padding-left:170px;}
			.shar span{padding-right:10px;}
			.tqh_logo{margin-left:72%;margin-top:-100px;}
			.copyRight{color:#9ca3a2;font-size:12px;}
			.red-border{border:1px solid red}
			.green-border{border:1px solid green}
		</style>
	</head>
	<body style="background:url(${ctx}/static/images/assets/example/body_bg.png) repeat;">
<%-- <div class="navbar-wrapper">
	<!-- login register-->
	<div class="container">
		<div style="margin-left:130px; height:101px;margin-top:-40px; background:url(${ctx}/static/images/assets/example/index1_02.png) no-repeat ">
			<!-- <span class="nav-pills"></span> -->
			<p class="login_p"> <a href="${ctx}/login">登录</a>  <a href="${ctx}/login">注册</a></p>
		</div>
	</div>
</div> --%>
<div class="container-fluid head-container">
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				<img src="${ctx}/static/images/assets/example/nav-tqh.png" />
				<label class="down-des">去下载台球会</label>
				<a href="#"><img src="${ctx}/static/images/assets/example/nav-down.png" /></a>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				<div class="pull-right">
					<c:choose>
						<c:when test="${memberName != null}">
							<img src="${ctx}/static/images/assets/example/user.png">
							<label class="member-name">${memberName }</label>
							<a href="${ctx }/logout"><img src="${ctx}/static/images/assets/example/nav-logout.png" /></a>
							<a href="${ctx }/login"><img src="${ctx}/static/images/assets/example/nav-register.png" /></a>
						</c:when>
						<c:otherwise>
							<a href="${ctx }/login"><img src="${ctx}/static/images/assets/example/nav-login.png" /></a>
							<a href="${ctx }/login"><img src="${ctx}/static/images/assets/example/nav-register.png" /></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /container -->
<!-- /navbar wrapper -->
<!-- Carousel
================================================== -->
<div class="bs-example">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
      	<c:forEach items="${banners}" var="banner" varStatus="num">
      		<c:choose>
      			<c:when test="${num.index==0 }">
      				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      			</c:when>
      			<c:otherwise>
      				<li data-target="#carousel-example-generic" data-slide-to="${num.index }" class=""></li>
      			</c:otherwise>
      		</c:choose>
      	</c:forEach>
      </ol>
      <div class="carousel-inner" style="height:480px;min-height:480px;max-height:480px;" role="listbox">
      	<c:forEach items="${banners}" var="banner" varStatus="num">
      		<c:choose>
      			<c:when test="${num.index==0 }">
      				<div class="item active">
      					<c:choose>
      						<c:when test="${banner.value !=null && banner.value!=''}">
      							<a  href="${banner.value}"><img style="width:100%;" data-src="" alt="First slide" src="${banner.thumb}"></a>
      						</c:when>
      						<c:otherwise>
      							<img style="width:100%;" data-src="" alt="First slide" src="${banner.thumb}">
      						</c:otherwise>
      					</c:choose>
        			</div>
      			</c:when>
      			<c:otherwise>
	      			<div class="item">
	          			<c:choose>
      						<c:when test="${banner.value !=null && banner.value!=''}">
      							<a  href="${banner.value}"><img style="width:100%;" data-src="" alt="First slide" src="${banner.thumb}"></a>
      						</c:when>
      						<c:otherwise>
      							<img style="width:100%;" data-src="" alt="First slide" src="${banner.thumb}">
      						</c:otherwise>
      					</c:choose>
	        		</div>
      			</c:otherwise>
      	</c:choose>
      </c:forEach>
      </div>
      <a class="left carousel-control" id="left_pb" style="max-height:100px;margin-top:190px;" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" id="right_pb" style="max-height:100px;margin-top:190px;" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
<!-- /.carousel -->
<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
 <div class="container" style="padding-top:20px;padding-bottom:30px;">
  <!-- Three columns of text below the carousel --> 
  <div class="row">
  	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
    	<a href="${ctx}/place/index">
    		<img class="img-circle" src="${ctx}/static/images/assets/example/tqh_map_logo.png">
      		<h3>台球地图</h3>
      	</a>
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
    	<a href="${ctx}/chat/liveRoom">
      		<img class="img-circle" src="${ctx}/static/images/assets/example/tqh_live_map.png">
      		<h3>赛事直播间</h3>
      	</a>
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
    	<a href="javascript:void(0)" class="unUse">
      		<img class="img-circle" src="${ctx}/static/images/assets/example/tqh_active_logo.png">
      		<h3>活动</h3>
      	</a>
    </div>
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
      	<a href="javascript:void(0)" class="unUse">
      		<img class="img-circle" src="${ctx}/static/images/assets/example/tqh_recomment_logo.png">
      		<h3>推荐</h3>
      	</a>
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
      	<a href="javascript:void(0)" class="unUse">
      		<img class="img-circle" src="${ctx}/static/images/assets/example/tqh_mall_logo.png">
      		<h3>商城</h3>
      	</a>
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
      	<a href="javascript:void(0)" class="unUse">
      		<img class="img-circle" src="${ctx}/static/images/assets/example/index_19.png">
   	  		<h3>台球圈子</h3>
   	  	</a>
    </div>
  </div><!-- /.row -->
  <!-- START THE FEATURETTES -->
  <!-- FOOTER -->
</div> 
 <div class="container-fluid" style="margin-top:30px;">
 	<div style="background:url(${ctx}/static/images/assets/example/friend_link_bg.png) repeat-x;margin-left:-15px;margin-right:-15px;padding-bottom:30px;">
		<p class="friend_link"><label style="color:#9ca3a2;font-size:14px;">友情链接：</label> <a href="http://www.appchina.com">应用汇| </a><a href="http://app.mi.com">小米应用商店 | </a><a href="http://apk.hiapk.com">安卓市场 | </a><a href="http://www.fzhuake.com">华科信息 </a></p>
		<span class="tqh_logo"><img style="margin-top:-30px;" src="${ctx}/static/images/assets/example/tqh_footer_logo.png"/></span>
		<p class="shar">
			<span><a href="http://weibo.com/yqkhengdeli"><img src="${ctx}/static/images/assets/example/sina_logo.png"/></a></span>
			<span><img src="${ctx}/static/images/assets/example/tengxun_logo.png"/></span>
			<span class="copyRight">版权所有 福州华科信息科技有限公司 保留一切权利 闽ICP备13018017</span>
		</p>
	</div>
 </div>
 <script>
    $('.carousel').carousel({
        interval: 3000 //changes the speed
    });
    $(function(){
    	$("#left_pb").css("background-image","none");
    	$("#right_pb").css("background-image","none");
    	$(".unUse").click(function(){
    		alert("该功能正在开发中");
    	});
    });
    </script>
	</body>
</html>