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
<title>球房入驻</title>
<%-- <link href="${ctx}/static/bootstrap/3.1.1/css/live.css" rel="stylesheet" type="text/css">  --%>
 <%-- <script src="${ctx}/static/jasny/js/jasny-bootstrap.js" type="text/javascript"></script> --%>
 <style type="text/css">
 .red_border{border:1px solid red;}
 .green_border{border:1px solid green;}
 .active,.active1{font-size:14px;font-weight:bold;color:#666666;}
 .against p{text-align:center;}
 .against_head{padding:10px 0px;font-size:24px;color:#666666;}
 .against_foot{font-size:13px;color:#666666;}
 .turn_num{width:56px;margin-left:-10px;}
 .more_against{background-color:#EDEDED;margin-top:0px;height:90px;text-align:center;padding-top:30px;font-size:22px;color:#666666;}
 .more_against a{font-size:22px;padding-left:10px;color:#666666;}
.left-point
{
  width:0px; 
  height:0px; 
  border-bottom:15px solid transparent;  
  border-top:15px solid transparent; 
  border-right:15px solid #c7c7c7;
  font-size:0px;
  line-height:0px;
  margin-top:50px;
  margin-left:-12px;
}
.right-point
{
  width:0px; 
  height:0px; 
  border-bottom:15px solid transparent;  
  border-top:15px solid transparent; 
  border-left:15px solid #c7c7c7;
  font-size:0px;
  line-height:0px;
}
.tab-pan{padding-bottom:15px;}
.chat-row{margin-top:24px;}
.chat-time-left{padding-top:60px;color:#b8b8b8;font-weight:normal;}
.chat-time-right{padding-top:37px;color:#b8b8b8;font-weight:normal;}
.chat-container{padding-left:10px;}
.chat-min-left-container{margin-top:-80px;background-color:#c7c7c7;min-height:120px;}
.chat-min-right-container{margin-top:0px;background-color:#c7c7c7;min-height:120px;}
.chat-img{margin-top:20px;margin-left:0px;}
.chat-name-left{color:#1ABC9C;font-size:16px;font-weight:bold;}
.chat-name-right{color:#1ABC9C;font-size:16px;font-weight:bold;float:right;}
.chat-content-left{color:#727071;font-size:16px;font-weight:normal;margin-top:10px;}
.chat-content-right{color:#666363;font-size:16px;font-weight:normal;margin-top:30px;}
.chat-right-point{margin-top:30px;margin-left:-20px;}
</style>
        <title>视频直播间</title>
        <script src="${ctx}/static/chat/js/jquery-1.8.0.min.js"></script>
        <script src="${ctx}/static/chat/js/socket.io.js"></script>
        <script src="${ctx}/static/chat/js/pomeloclient.js"></script>
        <script src="${ctx}/static/chat/js/client.js"></script>
        <script src="${ctx}/static/chat/js/pop.js"></script>   
		<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script> 
		
		
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-transition.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-alert.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-modal.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-dropdown.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-scrollspy.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-tab.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-tooltip.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-popover.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-button.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-collapse.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-carousel.js"></script>
    <script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap-typeahead.js"></script>
     
</head>
<body>
    <div class="container-fluid">
    	<div class="row">
    		<!-- 直播模块背景图片 -->
    		<img src="${ctx}/static/images/assets/example/live_02.jpg" style="width:100%;min-height:544px;max-height:544px;position:absolute;z-index:-666;"/>
       		<div class="col-md-7" style="margin-top:15px;margin-bottom:60px;">
          		<div class="" style="padding-left:18%;">
          			<img src="${ctx}/static/images/assets/example/r.jpg">
          		</div>
    		</div>
    		<div class="col-md-4" style="margin-top:15px;margin-bottom:60px;">
    			<ul class="nav nav-list" style="background-color:#EDEDED;">
              		<li class="nav-header" style="background:#323232;height:74px;">
	              		<div class="" style="font-size:18px;color:#cfcfcf; font-family:宋体;padding-top:15px;padding-left:15px;">2014英国国际锦标赛 1/4决赛</div>
	              		<div class="" style="font-size:16px;color:#989797; font-family:宋体;margin-top:6px;padding-left:15px;">时间：10月17日-10月27日</div>
              		</li>
              		<li class="active" style="background-color: #c7c7c7;margin-top:5px;">
              			<a href="#">
              				<div class="container-fluid against">
              					<div class="row">
              						<div class="col-md-3">
              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">16</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">：</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">24</p>
              						</div>
              						<div class="col-md-3">
              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
              						</div>
              					</div>
              					<div class="row">
              						<div class="col-md-3">
              							<p class="against_foot">丁俊晖</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_foot">(2)</p>
              						</div>
              						<div class="col-md-2">
              							<p class="turn_num against_foot">第(5)轮</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_foot">(1)</p>
              						</div>
              						<div class="col-md-3">
              							<p class="against_foot">奥沙利文</p>
              						</div>
              					</div>
              				</div>
						</a>
					</li>
					<li class="active" style="background-color: #c7c7c7;margin-top:5px;">
              			<a href="#">
              				<div class="container-fluid against">
              					<div class="row">
              						<div class="col-md-3">
              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">16</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">：</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">24</p>
              						</div>
              						<div class="col-md-3">
              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
              						</div>
              					</div>
              					<div class="row">
              						<div class="col-md-3">
              							<p class="against_foot">丁俊晖</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_foot">(2)</p>
              						</div>
              						<div class="col-md-2">
              							<p class="turn_num against_foot">第(5)轮</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_foot">(1)</p>
              						</div>
              						<div class="col-md-3">
              							<p class="against_foot">奥沙利文</p>
              						</div>
              					</div>
              				</div>
						</a>
					</li>
              		<li class="active" style="background-color: #c7c7c7;margin-top:5px;">
              			<a href="#">
              				<div class="container-fluid against">
              					<div class="row">
              						<div class="col-md-3">
              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">16</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">：</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_head">24</p>
              						</div>
              						<div class="col-md-3">
              							<p><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></p>
              						</div>
              					</div>
              					<div class="row">
              						<div class="col-md-3">
              							<p class="against_foot">丁俊晖</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_foot">(2)</p>
              						</div>
              						<div class="col-md-2">
              							<p class="turn_num against_foot">第(5)轮</p>
              						</div>
              						<div class="col-md-2">
              							<p class="against_foot">(1)</p>
              						</div>
              						<div class="col-md-3">
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
		</div>   
		<!-- 评论模块 -->    
    	<div class="row tab-pan">
       		<div class="col-lg-10 col-lg-offset-1" style="margin-top:-25px;background:#f0f0f0;">
       		<div class="bs-example bs-example-tabs">
			    <ul id="myTab" class="nav nav-tabs" role="tablist">
			      <li class="active"><a href="#home" role="tab" data-toggle="tab">大家的评论</a></li>
			      <li class=""><a href="#profile" role="tab" data-toggle="tab">小编的评论</a></li>
			    </ul>
			    <div id="myTabContent" class="tab-content">
			    <!-- 大家的评论 -->
				    <div class="tab-pane fade active in" id="home">
				    <input type="hidden" id="nickName" name="nickName" value="${member.nickName}" >
	        	<input type="hidden" id="channelName" name="channelName" value="${channelName}" >       
	        	<input type="hidden" id="avatar" name="avatar" value="${member.avatar}" > 
	        	<input type="hidden" id="avatarMoRen" name="avatarMoRen" value="${ctx}/static/images/avatar.png" >  
				    	<div class="contain-fluid" id="chatHistory">
				    	
				    	</div>
				    	<!-- send message content-->
				    	<div class="container-fluid" style="margin:24px -15px 0px -15px;padding:10px 20px 10px 20px;background-color:#c7c7c7;">
				    		<div class="row">
					    		<div class="form-horizontal" role="form">
	  								<div class="form-group">
	  									<div class="col-sm-1" style="margin:5px 0px -7px 20px;">
	    									<c:choose>
	    									<c:when test="${member.avatar ==null or member.avatar eq ''}">
	    										<img class="img-rounded" style="width: 51px;height: 51px;" src="${ctx}/static/images/avatar.png" />
	    									</c:when>
	    									<c:otherwise>
	    										<img class="img-rounded" style="width: 51px;height: 51px;" src="${member.avatar}" />
	    									</c:otherwise>
	    									</c:choose>
	    								
	    								</div>
	    								<div class="col-sm-9" style="margin:5px 0px -7px -35px;padding-top:17px;">
	      									<input type="text" class="form-control" id="entry" placeholder="我想说:">
	    								</div>
  										 <input type="hidden" id="usersList"  value="*" > 
	    								<div class="col-sm-1" style="margin-top:20px;">
	      									<button id="sayButton" class="btn btn-sm" style="width:90px;background-color:#128C73"><span style="font-size:16px;color:#FFFFFF;font-weight:bold;">发送</span></button>
	    								</div>
	  								</div>
	  							</div>
				    		</div>
				    	</div>
				    </div>
				    
				    
				    
				    
				    <!-- 小编的评论 -->
				    <div class="tab-pane fade" id="profile" style="padding-bottom:10px;">
				    	<div class="contain-fluid">
				    		<div class="row chat-row">
								<div class="col-md-1 chat-time-left">19分钟前</div>
								<div class="col-md-5 chat-container">
									<div class="left-point"></div> 
									<div class="col-md-12 chat-min-left-container">
										<div class="col-md-2">
											<img class="chat-img" src="${ctx}/static/images/assets/example/live_05.png"/> 
										</div>
										<div class="col-md-10" style="margin-top:20px;">
											<div class="chat-name-left">树枝孤鸟</div>
											<p class="chat-content-left">
												属性如果单独属性如果单独属性如果单独属性如果单独属性如果单独属性如
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row chat-row">
								<div class="col-md-1 chat-time-left">19分钟前</div>
								<div class="col-md-5 chat-container">
									<div class="left-point"></div> 
									<div class="col-md-12 chat-min-left-container">
										<div class="col-md-2">
											<img class="chat-img" src="${ctx}/static/images/assets/example/live_05.png"/> 
										</div>
										<div class="col-md-10" style="margin-top:20px;">
											<div class="chat-name-left">树枝孤鸟</div>
											<p class="chat-content-left">
											属性如果单独属性如果单独属性如果单独属性如果单
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row chat-row">
								<div class="col-md-1 chat-time-left">19分钟前</div>
								<div class="col-md-5 chat-container">
									<div class="left-point"></div> 
									<div class="col-md-12 chat-min-left-container">
										<div class="col-md-2">
											<img class="chat-img" src="${ctx}/static/images/assets/example/live_05.png"/> 
										</div>
										<div class="col-md-10" style="margin-top:20px;">
											<div class="chat-name-left">树枝孤鸟</div>
											<p class="chat-content-left">
												属性如果单独属性如果单独属性如果单独属性如果单独属性如果单独属性如
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row chat-row">
								<div class="col-md-1"></div>
								<div class="col-md-4"></div>
								<div class="col-md-6 chat-container">
									<div class="col-md-11 chat-min-right-container">
										<div class="col-md-10" style="margin-top:20px;">
											<div class="chat-name-right">树枝孤鸟</div>
											<p class="chat-content-right">
												属性如果单独属性如果单独属性如果单独属性如果单独属性如果
											</p>
										</div>
										<div class="col-md-2">
											<img class="chat-img" src="${ctx}/static/images/assets/example/live_05.png"/> 
										</div>
									</div>
									<div class="col-md-1 chat-right-point">
										<div class="right-point"></div> 
									</div>
								</div>
								<div class="col-md-1 chat-time-right">11月19日</div>
							</div>
				   		</div>
		   			</div><!-- 选项卡end-->
  				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
