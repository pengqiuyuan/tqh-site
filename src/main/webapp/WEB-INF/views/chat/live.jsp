<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>整改的直播间</title>
<%-- <script src="${ctx}/static/chat/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/static/chat/js/socket.io.js"></script>
<script src="${ctx}/static/chat/js/pomeloclient.js"></script>
<script src="${ctx}/static/chat/js/client.js"></script>
<script src="${ctx}/static/chat/js/pop.js"></script>   
<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script> 
<script src="${ctx}/static/chat/swfobject.js"></script> --%>

 <style type="text/css">
 .red_border{border:1px solid red;}
 .green_border{border:1px solid green;}
 .active,.active1{font-size:14px;font-weight:bold;color:#666666;}
 .against p{text-align:center;}
 .against_head{padding:10px 0px;font-size:20px;color:#666666;}
 .against_foot{font-size:12px;color:#666666;}
 .turn_num{width:56px;margin-left:-10px;}
 .more_against{background-color:#EDEDED;margin-top:0px;height:65px;text-align:center;padding-top:20px;font-size:22px;color:#666666;}
 .more_against a{font-size:22px;padding-left:10px;color:#666666;}
/* .tab-pan{padding-bottom:15px;} */
.chat-container-left{margin-top:15px;margin-bottom:60px;}
.chat-container-right{min-width:325px;background-color:#FFFFFF;margin-top:15px;margin-bottom:60px;}
.chat-content{color:#151717;font-weight:normal;}
.chat-office-container{overflow-y:auto; overflow-x:hidden; height:410px;}
.chat-visitor-container{overflow-y:auto; overflow-x:hidden; height:340px;}
.chat-core-container{overflow-y:auto; overflow-x:hidden; height:410px;}
.chat-container{padding-left:10px;margin-top:10px;margin-bottom:5px;}
.chat-container-head{color:#148c74;}
.msg-button{float:left;margin-left:-15px;background-color: #148c74;color:#FFFFFF;font-weight:bold;}
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {background-color: #148c74;color:#FFFFFF;}
.nav-tabs > li > a {background:#A0CBC2;color:#FFFFFF;font-weight:bold;}
.nav-tabs > li > a:hover {background:#A0CBC2;color:#FFFFFF;font-weight:bold;}
</style>
</head>
<body>
    <div class="container-fluid" style="min-width:1000px;margin-bottom:-55px;">
    	<div class="row">
    		<!-- 直播模块背景图片 -->
    		<img src="${ctx}/static/images/assets/example/live_02.jpg" style="width:100%;min-height:544px;max-height:544px;position:absolute;z-index:-666;"/>
       		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 chat-container-left">
          		<div class="">
          			<img style="float:right;" src="${ctx}/static/images/assets/example/r.jpg" />
          		</div>
    		</div>
    		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 chat-container-right">
    			<div class="row">
    				<ul class="nav nav-list" style="background-color:#EDEDED;">
	              		<li class="nav-header" style="background:#323232;height:74px;">
		              		<div class="" style="font-size:18px;color:#cfcfcf; font-family:宋体;padding-top:15px;padding-left:15px;">2014英国国际锦标赛 1/4决赛</div>
		              		<div class="" style="font-size:16px;color:#989797; font-family:宋体;margin-top:6px;padding-left:15px;">时间：10月17日-10月27日</div>
	              		</li>
              		</ul>
    			</div>
    			<div class="row tab-pan">
		       		<div class="bs-example bs-example-tabs">
					    <ul id="myTab" class="nav nav-tabs" role="tablist">
					      <li class=""><a href="#home" role="tab" data-toggle="tab">官方直播</a></li>
					      <li class="active"><a href="#profile" role="tab" data-toggle="tab">聊天室</a></li>
					      <li class=""><a href="#core" role="tab" data-toggle="tab">比分</a></li>
					    </ul>
					    <div id="myTabContent" class="tab-content">
					    	<!-- 官方直播 -->
						    <div class="tab-pane fade  chat-office-container" id="home">
						    	<div class="container-fluid chat-container">
						    		<div class="row chat-container-head">
						    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">官方直播员</div>
						    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">2014/7/23</div>
						    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">10:51</div>
						    		</div>
						    		<div class="row chat-content">
						    			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">比赛开始了，大家速度集合了</div>
						    		</div>
						    	</div>
						    	<div class="container-fluid chat-container">
						    		<div class="row chat-container-head">
						    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">官方直播员</div>
						    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">2014/7/23</div>
						    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">10:51</div>
						    		</div>
						    		<div class="row chat-content">
						    			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">比赛开始了，大家速度集合了</div>
						    		</div>
						    	</div>
						    </div>
						    <!-- 聊天室-->
						    <div class="tab-pane fade active in" id="profile">
						    	<div class="container-fluid">
						    		<div class="row chat-visitor-container">
						    			<div class="container-fluid chat-container">
						    				<div class="row chat-container-head">
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">树袋熊</div>
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">2014/7/23</div>
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">10:51</div>
						    				</div>
								    		<div class="row chat-content">
								    			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">比赛开始了，大家速度集合了</div>
								    		</div>
						    			</div>
								    	<div class="container-fluid chat-container">
								    		<div class="row chat-container-head">
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">树袋熊</div>
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">2014/7/23</div>
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">10:51</div>
								    		</div>
								    		<div class="row chat-content">
								    			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">比赛开始了，大家速度集合了</div>
								    		</div>
								    	</div>
								    	<div class="container-fluid chat-container">
								    		<div class="row chat-container-head">
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">树袋熊</div>
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">2014/7/23</div>
								    			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">10:51</div>
								    		</div>
								    		<div class="row chat-content">
								    			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">比赛开始了，大家速度集合了</div>
								    		</div>
								    	</div>
						    		</div>
						    		<div class="row" id="sendMessage" style="background-color:#C7C7C7;height:65px;">
						    			<div class="container-fluid">
						    				<div class="row" style="color:#148c74;margin-top:5px;">
						    					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">游客：大笨熊</div>
						    				</div>
						    				<div class="row">
						    					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
						    						 <input type="text" class="form-control" id="msgContent" placeholder="我想说...">
						    					</div>
						    					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
						    							<button type="button" class="btn msg-button">发送</button>
						    					</div>
						    				</div>
						    			</div>
						    		</div>
						    	</div>
						    </div>
						    <!-- 比分 -->
						    <div class="tab-pane fade" id="core">
						    	<ul class="nav nav-list" style="background-color:#EDEDED;">
				              		<li class="active" style="background-color: #c7c7c7;margin-top:5px;max-height:110px;">
				              			<a href="#">
				              				<div class="container-fluid against">
				              					<div class="row" style="max-height:56px;">
				              						<div class="col-xs-3 col-sm-3 col-md-3" style="max-height:56px;">
				              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">16</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">：</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">24</p>
				              						</div>
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
				              						</div>
				              					</div>
				              					<div class="row" style="max-height:10px;">
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p class="against_foot">丁俊晖啊</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_foot">(2)</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="turn_num against_foot">第(5)轮</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_foot">(1)</p>
				              						</div>
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p class="against_foot">奥沙利文</p>
				              						</div>
				              					</div>
				              				</div>
										</a>
									</li>
									<li class="active" style="background-color: #c7c7c7;margin-top:5px;max-height:110px;">
				              			<a href="#">
				              				<div class="container-fluid against">
				              					<div class="row" style="max-height:56px;">
				              						<div class="col-xs-3 col-sm-3 col-md-3" style="max-height:56px;">
				              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">16</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">：</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">24</p>
				              						</div>
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
				              						</div>
				              					</div>
				              					<div class="row" style="max-height:10px;">
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p class="against_foot">丁俊晖啊</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_foot">(2)</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="turn_num against_foot">第(5)轮</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_foot">(1)</p>
				              						</div>
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p class="against_foot">奥沙利文</p>
				              						</div>
				              					</div>
				              				</div>
										</a>
									</li>
									<li class="active" style="background-color: #c7c7c7;margin-top:5px;max-height:110px;">
				              			<a href="#">
				              				<div class="container-fluid against">
				              					<div class="row" style="max-height:56px;">
				              						<div class="col-xs-3 col-sm-3 col-md-3" style="max-height:56px;">
				              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">16</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">：</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_head">24</p>
				              						</div>
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
				              						</div>
				              					</div>
				              					<div class="row" style="max-height:10px;">
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p class="against_foot">丁俊晖啊</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_foot">(2)</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="turn_num against_foot">第(5)轮</p>
				              						</div>
				              						<div class="col-xs-2 col-sm-2 col-md-2">
				              							<p class="against_foot">(1)</p>
				              						</div>
				              						<div class="col-xs-3 col-sm-3 col-md-3">
				              							<p class="against_foot">奥沙利文</p>
				              						</div>
				              					</div>
				              				</div>
										</a>
									</li>
	          					</ul>
				            	<div class="more_against"> 
									<span>1/5<a href="#"><img src="${ctx}/static/images/assets/example/live1_12.png"></a></span>
								</div> 
				   			</div>
		  				</div><!-- 选项卡end-->
					</div>
				</div>
    		</div>
		</div>   
	</div>
	<script>
    
	</script>

</body>
</html>
