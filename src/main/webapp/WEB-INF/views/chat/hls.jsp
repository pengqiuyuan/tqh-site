<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
html>
<head>
<title>the5fire m3u8 test</title>
<script src="${ctx}/static/chat/swfobject.js"></script>
</head>
<body>
<div id="player">
</div>
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