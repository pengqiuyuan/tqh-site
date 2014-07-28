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
<title>直播间</title>
<script src="${ctx}/static/chat/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/static/chat/js/socket.io.js"></script>
<script src="${ctx}/static/chat/js/pomeloclient.js"></script>
<script src="${ctx}/static/chat/js/client.js"></script>
<script src="${ctx}/static/chat/js/pop.js"></script>   
<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script> 
<script src="${ctx}/static/chat/swfobject.js"></script>

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
    	<input type="hidden" id="nickName" name="nickName" value="${member.nickName}" >
	    <input type="hidden" id="channelName" name="channelName" value="${channelName}" >       
	    <input type="hidden" id="avatar" name="avatar" value="${member.avatar}" > 
	    <input type="hidden" id="avatarMoRen" name="avatarMoRen" value="${ctx}/static/images/avatar.png" >
	    <input type="hidden" id="zhiboMoRen" name="zhiboMoRen" value="${ctx}/static/images/zhibo.png" >  
	  	<input style="display: none" class="form-control" id="usersList" value="*">
	  	<input style="display: none" class="form-control" id="name" >
	  	<input style="display: none" class="form-control" id="room" >	        
        		<img src="${ctx}/static/images/assets/example/live_02.jpg" style="width:100%;min-height:544px;max-height:544px;position:absolute;z-index:-666;margin-right: -15px;margin-left: -15px;"/>
 		
    	<div class="row">
    		<!-- 直播模块背景图片 -->
      		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 chat-container-left">
          		<div class="">
          			<div id="player" class="" style="float:right;">
          			</div>
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
					      <li class="active"><a href="#chat" role="tab" data-toggle="tab" id="downchat">聊天室</a></li>
					      <li class=""><a href="#chatoff" role="tab" data-toggle="tab" id="downoffchat">官方直播</a></li>
					      <li class=""><a href="#core" role="tab" data-toggle="tab">比分</a></li>
					    </ul>
					    <div id="myTabContent" class="tab-content">
					    	<!-- 官方直播 -->
						    <div class="tab-pane fade" id="chatoff">
						    	<div class="container-fluid">
						  			<div class="row chat-office-container" id="chatOffHistory">
						    		</div>
						    	</div>
						    </div>
						    <!-- 聊天室-->
						    <div class="tab-pane fade active in" id="chat">
						    	<div class="container-fluid">
						    		<div class="row chat-visitor-container" id="chatHistory">
						    		</div>
						    		<div class="row" style="background-color:#C7C7C7;height:65px;">
						    			<div class="container-fluid">
						    				<div class="row" style="color:#148c74;margin-top:5px;">
						    					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="nickna"></div>
						    				</div>
						    				<div class="row">
						    					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
						    						 <input id="entry" type="text" class="form-control" id="msgContent" placeholder="我想说...">
						    					</div>
						    					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
						    							<button id="sendentry" type="button" class="btn msg-button">发送</button>
						    					</div>
						    				</div>
						    			</div>
						    		</div>
						    	</div>
						    </div>
						    <!-- 比分 -->
							<div class="tab-pane fade" id="core">
								<ul class="nav nav-list" style="background-color: #EDEDED;">
									<input type="hidden" id="id" value="${id}" />
									<div id="showLiving" style="height: 400px; overflow: auto;">
										${htmlContent }</div>
								</ul>
							</div>
						</div><!-- 选项卡end-->
					</div>
				</div>
    		</div>
		</div>   
	</div>
	<script>

		var flashvars = {
			// M3U8 url, or any other url which compatible with SMP player (flv, mp4, f4m)
			// escaped it for urls with ampersands
			src : escape("http://video.taiqiuhui.cn/hls/test.m3u8"),
			// url to OSMF HLS Plugin
			plugin_m3u8 : "${ctx}/static/chat/HLSProviderOSMF.swf",
		};
		var params = {
			// self-explained parameters
			allowFullScreen : true,
			allowScriptAccess : "always",
			bgcolor : "#000000"
		};
		var attrs = {
			name : "player",
			style : "visibility: visible;float: right;"
		};

		swfobject.embedSWF(
		// url to SMP player
		"${ctx}/static/chat/StrobeMediaPlayback.swf",
		// div id where player will be place
		"player",
		// width, height
		"700", "524",
		// minimum flash player version required
		"10.2",
		// other parameters
		null, flashvars, params, attrs);
		
	    if (!document.addEventListener ){
	    	alert("您的浏览器有系统不支持的特性，建议使用谷歌，苹果浏览器访问");
	    }
	</script>

</body>
</html>
