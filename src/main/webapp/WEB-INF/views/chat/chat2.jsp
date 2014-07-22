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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

        <title>视频直播间</title>
        <script src="${ctx}/static/chat/js/jquery-1.8.0.min.js"></script>
        <script src="${ctx}/static/chat/js/socket.io.js"></script>
        <script src="${ctx}/static/chat/js/pomeloclient.js"></script>
        <script src="${ctx}/static/chat/js/client.js"></script>
        <script src="${ctx}/static/chat/js/pop.js"></script>   
        <link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" type="text/css">
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
     

    <!-- Le styles -->
   <link href="${ctx}/static/chat/css/bootstrap_live.css" rel="stylesheet" type="text/css">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
   <link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

  </head>

  <body style="">
 <!--<div class="container_map"> 
<div class="nav">
		<div class="navigation">
			<ul style="font-size:14px;">
				<li ><a href="#">首 页</a></li>
				<li><a href="#">球房入驻</a></li>
				<li ><a href="#">赛事直播间</a></li>
				<li><a href="#">赛事活动</a></li>
				<li><a href="#">推荐</a></li>
				<li><a href="#">商城</a></li>
				<li><a href="#">圈子话题</a></li>
		
			</ul>
			
		</div>
	</div>
 
        
 </div>  -->
   <!--<div class="span9">
          <div class="hero-unit">
            <h1>Hello, world!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm" class="btn btn-primary btn-large">Learn more »</a></p>
          </div>
          
      
    </div>--><!--/.fluid-container-->
    <div class="container-fluid" style="background:url(${ctx}/static/images/assets/example/live_02.jpg) no-repeat; width:100%; margin:0 auto;">
      <div class="row-fluid" style="margin-top:15px;">
       <div class="span8">
          <div class="hero-unit">
          <img src="${ctx}/static/images/assets/example/r.jpg">
         <!--   <<!--h1>Hello, world!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm" class="btn btn-primary btn-large">Learn more »</a></p>-->
          </div>
          
      
    </div>
        <div class="span4">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header" style="background:#323232;height:74px;"><div class="ttt1" style="font-size:18px;color:#cfcfcf; font-family:宋体;margin-top:21px;">2014英国国际锦标赛 1/4决赛</div><div class="ttt2" style="font-size:16px;color:#989797; font-family:宋体;margin-top:6px;">时间：10月17日-10月27日</div></li>
              <li class="active" style="background-color: #c7c7c7;
margin-top:10px;"><a
href="#"><div class="tline"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></div><div class="ttt3"><span>16</span><span style="margin-left:30px;">:</span><span style="margin-left:30px;">24</span></div><div class="img22" style="margin-left:20px;"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle" ></div>
<div class="ttt6" style="text-align:center">丁俊晖   (2) 第3轮  (1)    奥沙利文</div></a>
</li>
                
              <li class="active1" style="
margin-top:10px; "><a href="#"><div class="tline"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></div><div class="ttt3"><span>16</span><span style="margin-left:30px;">:</span><span style="margin-left:30px;">24</span></div><div class="img22" style="margin-left:20px;"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle" ></div>
<div class="ttt6" style="text-align:center">丁俊晖   (2) 第3轮  (1)    奥沙利文</div></a>
</li>
              <li class="active1" style="
margin-top:10px; "><a href="#"><div class="tline"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></div><div class="ttt3"><span>16</span><span style="margin-left:30px;">:</span><span style="margin-left:30px;">24</span></div><div class="img22" style="margin-left:20px;"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle" ></div>
<div class="ttt6" style="text-align:center">丁俊晖   (2) 第3轮  (1)    奥沙利文</div></a>
</li>
       
              <li class="active1" style="
margin-top:10px; "><a href="#"><div class="tline"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle"></div><div class="ttt3"><span>16</span><span style="margin-left:30px;">:</span><span style="margin-left:30px;">24</span></div><div class="img22" style="margin-left:20px;"><img src="${ctx}/static/images/assets/example/live1_04.png" class="img-circle" ></div>
<div class="ttt6" style="text-align:center">丁俊晖   (2) 第3轮  (1)    奥沙利文</div></a>
</li>
             <!-- <li class="nav-header">Sidebar</li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li class="nav-header">Sidebar</li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>
              <li><a href="./Bootstrap, from Twitter_files/Bootstrap, from Twitter.htm">Link</a></li>-->
            </ul>
            
            <div class="yahoo"> 
<span class="disabled">&lt; </span>
<span class="current">1</span>
<a href="http://www.divcss5.com/">2</a>
<a href="#?page=3">3</a>
<a href="#?page=4">4</a>
<a href="#?page=5">5</a>
<a href="#?page=6">6</a>

...
<a href="#?page=200">200</a>
<a href="#?page=2"> 
&gt; </a></div> 
          </div><!--/.well -->
        </div><!--/span-->
</div>       
    <div class="container-fluid" style=" width:100%; margin:0 auto;">
      <div class="row-fluid" style="margin-top:15px;background:#f0f0f0;">
       <div class="span12">
          <div class="tabbable"> <!-- Only required for left/right tabs -->
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">大家的评论</a></li>
    <li><a href="#tab2" data-toggle="tab">小编的评论</a></li>
  </ul>
        <!--/span-->
<input type="hidden" id="nickName" name="nickName" value="${member.nickName}" >
	        	<input type="hidden" id="channelName" name="channelName" value="${channelName}" >       
	        	<input type="hidden" id="avatar" name="avatar" value="${member.avatar}" > 
	        	<input type="hidden" id="avatarMoRen" name="avatarMoRen" value="${ctx}/static/images/avatar.png" >               
	            <div id="loginError">
            </div>        
<div id="chatHistory" class="tabbable">
        
        
        
   
  </div>
  
 
</div></div> 


   <div class="kk">
   <div class="span12">
   <div class="org_box5"><div class="pg8">
   <img id="avatarimg" src="" style="width: 51px; height: 51px;" class="img-rounded">
   </div>
   <input type="text" id="entry" style="width: 725px; height: 30px;" placeholder="我想说…" class="rr">
   <button class="btn btn-large btn-primary ppp" type="button" >发送</button>
   </div>
   <input type="hidden" id="usersList"  value="*" > 
   </div>   
    </div>
       
     
       



</body></html>