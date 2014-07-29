<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>台球视界-客户端下载</title>
<style type="text/css">
.red-border{border:1px solid red}
.green-border{border:1px solid green}
.back_bg{position:absolute;z-index:-666;width:100%;min-width:1000px;height:650px;}
.head_container{border-bottom:1px solid #5A505B;margin-top:30px;}
.head_container >button,.head_container > div{font-size:20px;color:#FFFFFF;font-weight:bold;}
.head_container >button:hover,.head_container >button:focus{color:#FFFFFF;}
.btn-tqh{background:none;}
.btn-tqsj{background:#707578;}
</style>
</head>
<body>
	<!--app head start  -->
	<div class="container" style="margin:0px 0px 190px -16px;min-width:1000px;">
		<img class="back_bg" src="${ctx}/static/images/assets/app/tqsj_bg.png"/>
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"></div>
			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="head_container">
								<button class="btn btn-tqsj" id="tqsj_app">台球视界</button>
								<button class="btn btn-tqh" id="tqh_app">台球会</button>
								<div class="pull-right" style="margin-top:10px;">台球视界下载</div>
							</div>
						</div>
					</div>
				</div>
	  		</div>
		</div>
		<div class="row">
			<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7"></div>
			<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="margin-top:350px;">
				<a class="pull-right" href="${iosUrl }"><img src="${ctx}/static/images/assets/app/ios_app.png" /></a>
				<a class="pull-right" href="${androidUrl }" style="margin-right:5px;"><img src="${ctx}/static/images/assets/app/android_app.png" /></a>
			</div>
		</div>
	</div><!--app head end  -->
	<!-- app description -->
	<div class="container-fluid" style="background-color:#FFFFFF;margin-top:0px;padding-top:60px;">
		<div class="row text-center">
			<img src="${ctx}/static/images/assets/app/tqsj_1.png" style="width:1268px;height:431px;"/>
		</div>
		<div class="row text-center">
			<img src="${ctx}/static/images/assets/app/tqsj_2.png" style="width:1268px;height:480px;"/>
		</div>
		<div class="row text-center">
			<img src="${ctx}/static/images/assets/app/tqsj_3.png" style="width:1268px;height:375px;"/>
		</div>
		<div class="row text-center">
			<img src="${ctx}/static/images/assets/app/tqsj_4.png" style="width:1268px;height:417px;"/>
		</div>
		<div class="row text-center">
			<img src="${ctx}/static/images/assets/app/tqsj_5.png" style="width:1268px;height:501px;"/>
		</div>
	</div><!--app description end  -->
	<script type="text/javascript">
		$("#tqh_app").click(function(){
			window.location.href="${ctx}/app/tqh";
		});
		$("#tqsj_app").click(function(){
			window.location.href="${ctx}/app/tqsj";
		});
	</script>
</body>
</html>
