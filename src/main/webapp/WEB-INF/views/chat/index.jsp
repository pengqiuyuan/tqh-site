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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>视频直播间</title>
        <script src="${ctx}/static/chat/js/jquery-1.8.0.min.js"></script>
        <script src="${ctx}/static/chat/js/socket.io.js"></script>
        <script src="${ctx}/static/chat/js/pomeloclient.js"></script>
        <script src="${ctx}/static/chat/js/client.js"></script>
        <script src="${ctx}/static/chat/js/pop.js"></script>   
        <link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" type="text/css">
		<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script> 
		<script src="${ctx}/static/chat/swfobject.js"></script>
</head>
<body>
<div id="player">
</div>
        <div class="jumbotron container" style="margin-top:20px;">
            <div id="app"> 
	        	<input type="hidden" id="nickName" name="nickName" value="${member.nickName}" >
	        	<input type="hidden" id="channelName" name="channelName" value="${channelName}" >       
	        	<input type="hidden" id="avatar" name="avatar" value="${member.avatar}" > 
	        	<input type="hidden" id="avatarMoRen" name="avatarMoRen" value="${ctx}/static/images/avatar.png" >               
	            <div id="loginError">
            </div>
            <div id="chatHistory" class="jumbotron container">
            </div>
            <div id="toolbar">
                <ul id="status">
                    <li>
                        users:
                        <select name="users" id="usersList">
                            <option value="*">
                                all
                            </option>
                        </select>
                    </li>
                    <li>
                        name:
                        <span id="name">
                        </span>
                    </li>
                    <li>
                        room:
                        <span id="room">
                        </span>
                    </li>
                    <li>
                        avatar:
                        <img id="avatarimg" src="" style="width: 60px; height: 60px;">
                        </img>
                    </li>
                </ul>
                <input tabindex="1" type="text" id="entry" />
            </div>
        </div>
        </div>
    <!-- </section> -->
	<script>
    var flashvars = {
            // M3U8 url, or any other url which compatible with SMP player (flv, mp4, f4m)
            // escaped it for urls with ampersands
            src: escape("http://video.taiqiuhui.cn/hls/test.m3u8"),
            // url to OSMF HLS Plugin
            plugin_m3u8: "${ctx}/static/chat/HLSProviderOSMF.swf",
        };
        var params = {
            // self-explained parameters
            allowFullScreen: true,
            allowScriptAccess: "always",
            bgcolor: "#000000"
        };
        var attrs = {
            name: "player"
        };

        swfobject.embedSWF(
            // url to SMP player
            "${ctx}/static/chat/StrobeMediaPlayback.swf",
            // div id where player will be place
            "player",
            // width, height
            "800", "485",
            // minimum flash player version required
            "10.2",
            // other parameters
            null, flashvars, params, attrs
        );
	</script>
</body>
</html>
