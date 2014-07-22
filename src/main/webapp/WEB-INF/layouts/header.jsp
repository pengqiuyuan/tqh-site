<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="container-fluid">
	<div class="row">
		<img class="header_footer_img" src="${ctx}/static/images/assets/example/header.png"/>
	</div>
</div>
<ul class="nav nav-pills" id="nav" role="tablist">
	<li id="index"><a href="${ctx }/index">首页</a></li>
	<li id="map"><a href="${ctx}/place/index">台球地图</a></li>
	<li><a href="${ctx}/chat/liveRoom">赛事直播间</a></li>
	<li><a href="#">赛事活动</a></li>
	<li><a href="#">推荐</a></li>
	<li><a href="#">商城</a></li>
	<li><a href="#">圈子话题</a></li>
</ul>