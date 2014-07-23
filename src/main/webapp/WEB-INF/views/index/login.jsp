<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>登录-注册</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
	<link href="${ctx}/static/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/3.1.1/js/jquery-1.10.2.js"></script>
	<script src="${ctx}/static/bootstrap/3.1.1/js/bootstrap.js"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
<style type="text/css">
	.rg{background:url(${ctx}/static/images/assets/example/login_bg.png);padding-top:30px;}
	.rg_left{padding-top:70px;padding-bottom:70px;}
	.warn{color:#FF0000;}
	.ok{color:#009933;}
	.display{display:none}
	*{ margin:0; padding:0;}
	a{ text-decoration:none; color:#333;}
	.box_163css{position:relative;}
	.nav{ width:100%;padding-left:200px;height:34px;}
	.nav li{ font-size:20px;  float:left; width:100px; height:34px;-webkit-transition:all 0.35s linear; cursor:pointer; text-align:center; line-height:32px; list-style-type:none;}
	.nav li.on{ color:#f00;}
	.line{width:1px;float:left; position:relative; left:36%; top:0px;height: 2px;background:#dadada;}
	.s_line{position: absolute;display:block;width:100px;z-index: 1;top: -7px;left: 0;height: 7px;border-bottom: 2px solid #19A78D;overflow: hidden;text-align: center;}
	.s_line b{display: inline-block;margin-top: -8px;width: 0;height: 0;border-style: dashed dashed solid;border-width: 10px;border-color: transparent transparent #E4393C;overflow: hidden;zoom: 1;font-size: 0;}
	.zlbox_content{width:500px; margin: 1px auto; }
	.item_tab{min-height: 310px; border:1px solid #dadada;padding: 20px;text-align:center;margin-top:5px;}
	.header_footer_img{width:100%;}
	.friend_link{padding-top:50px;padding-left:100px;color:#E9EBEB;}
	.friend_link a{color:#E9EBEB;}
	a:link {text-decoration: none;} 
	.tqh_logo{margin-left:72%;margin-top:-100px;}
	.shar{margin-top:-15px;padding-left:100px;}
	.shar span{padding-right:10px;}	
	.copyRight{color:#FFFFFF;font-size:12px;}
</style>
<script type="text/javascript">
	$(function(){
		//var l=0;
		$('.navs_li').hover(function(){
			$(this).siblings().removeClass('on');
			$(this).addClass('on');
			var i=$(this).index();	
			var a1=100*i;	
			$(".s_line").animate({left:a1},100);
			var index = $(".navs_li").index($(this));
			$(".item_tab").hide();
			$(".item_tab").eq(index).show();
		});	
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<img class="header_footer_img" src="${ctx}/static/images/assets/example/header.png"/>
		</div>
	</div>
	<div class="container-fluid rg">
		<div class="row">
			<div class="col-md-6 text-center rg_left">
				<img alt="" src="${ctx}/static/images/assets/example/logo.png">
			</div>
		 	<div class="col-md-5 border_green">
		 		<div class="text-center">
		 			<ul class="nav">
				        <li class="navs_li on">登录</li>
				        <li class="navs_li">快速注册</li>
				    </ul>
		 		</div>
		 		<div class="line">
			    	<span class="s_line">	    		
						<b></b>
			    	</span>
					<div style="clear: both;"></div>
				</div>		
				<div style="clear: both;"></div>
				<div class="zlbox_content">
				<!-- <br style="width:1px;"/> -->
					<div class="item_tab" style="display: block;">
						<form id="loginForm" class="form-horizontal" name ="loginForm" action="${ctx }/login" method="post">
							<c:if test="${not empty loginMember}">
								<label class="warn">帐号与密码不符</label>
							</c:if>
							<%
								String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
								if(error != null){
							%>
							<div class="alert alert-error input-medium controls">
								<button class="close" data-dismiss="alert">×</button>登录失败，请重试.
							</div>
							<%
							}
							%>
						<c:if test="${currentMember.email != null}">
							<div class="alert alert-error input-medium controls">
								<button class="close" data-dismiss="alert">×</button>您已登录，请不要重复.
							</div>
						</c:if>
						<div class="form-group">
   							<label for="inputEmail4" class="col-sm-4 control-label">帐号:</label>
    						<div class="col-sm-6">
      							<input type="email" name="username" value="${username }" class="form-control" id="inputEmail3" placeholder="请输入邮箱">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="inputPassword4" class="col-sm-4 control-label">密码:</label>
	    					<div class="col-sm-6">
	      						<input type="password" name="password" class="form-control" id="inputPassword3" placeholder="请输入密码">
	    					</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-4 col-sm-4">
      							<div class="checkbox">
        							<label for="rememberMe">
        								<input type="checkbox" id="rememberMe" name="rememberMe" />下次自动登录
        							</label>
        						</div>
        					</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-4 col-sm-6">
      							<button type="submit" id="loginSubmit" class="btn btn-sm btn-success" style="width:200px;"> 登录</button>
   							 </div>
  						</div>
					</form>
				</div>
				<div class="item_tab" style="display: none;">
					 <form id="registerForm" name="registerForm"  class="form-horizontal" method="post" enctype="multipart/form-data">
					 	<div class="form-group">
   							<label for="inputEmail4" class="col-sm-4 control-label">帐号:</label>
    						<div class="col-sm-6">
      							<input type="text" name="email" class="form-control" id="resiter_email" placeholder="请输入邮箱">
    							<span id="back_email_message"></span>
    						</div>
  						</div>
  						<div class="form-group">
   							<label for="inputEmail4" class="col-sm-4 control-label">昵称:</label>
    						<div class="col-sm-6">
      							<input type="text" name="nickName"  class="form-control" id="register_nickName" placeholder="请输入昵称">
    							<span id="back_nickName_message"></span>
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="inputPassword4" class="col-sm-4 control-label">密码:</label>
	    					<div class="col-sm-6">
	      						<input type="password" id="password_" name="password_" class="form-control" id="inputPassword3" placeholder="请输入密码">
	    					</div>
  						</div>
  						<div class="form-group">
    						<label for="inputPassword4" class="col-sm-4 control-label">确认密码:</label>
	    					<div class="col-sm-6">
	      						<input type="password" id="surePassword" name="password"  class="form-control" id="inputPassword3" placeholder="请输入密码">
	    					</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-4 col-sm-6">
      							<button type="button" id="registerSubmit" class="btn btn-sm btn-success" style="width:200px;">快速注册</button>
   							 </div>
  						</div>
					</form> 
				</div>
			</div>
		 </div>
	</div>
</div>
<div class="container-fluid">
	<div class="row" >
		<div style="background:url(${ctx}/static/images/assets/example/footer.png);background-size:cover;height:200px;">
			<p class="friend_link">友情链接： <a href="http://www.appchina.com">应用汇| </a><a href="http://app.mi.com">小米应用商店 | </a><a href="http://apk.hiapk.com">安卓市场 | </a><a href="http://www.fzhuake.com">华科信息 </a></p>
			<span class="tqh_logo"><img style="margin-top:-30px;" src="${ctx}/static/images/assets/example/tqh_footer_logo.png"/></span>
			<p class="shar">
				<span><a href="http://weibo.com/yqkhengdeli"><img src="${ctx}/static/images/assets/example/sina_logo.png"/></a></span>
				<span><img src="${ctx}/static/images/assets/example/tengxun_logo.png"/></span>
				<span class="copyRight">版权所有 福州华科信息科技有限公司 保留一切权利 闽ICP备13018017</span>
			</p>
		</div>
	</div>
</div>
	<script type="text/javascript">
		function vilidateEmailOrNickName(category, value){
			var element;
			if(category=='email'){
				 element = $("#back_email_message");
			}else{
				 element = $("#back_nickName_message");
			}
			 $.ajax({
				url: "${ctx}/member/validate?"+category+"="+value, 
				type: 'GET',
				async:false,
				contentType: "application/json;charset=UTF-8",
				success: function(data){
					element.removeClass("war ok");
					if(data.message =='ok'){
						element.empty();
						element.addClass("ok");
						element.text("");
					}else{
						element.empty();
						element.addClass("warn");
						element.text(data.message);
					}
				},error:function(xhr){
					alert("验证出错了");
				}
			}); 
		}
		
		$(function(){
			$("#resiter_email").blur(function(){
				var element=$("#resiter_email");
				if(element.val()!=null && element.val().trim()!=''){
					vilidateEmailOrNickName('email',element.val());
				}
			});
			$("#register_nickName").blur(function(){
				var element=$("#register_nickName");
				if(element.val()!=null && element.val().trim()!=''){
					vilidateEmailOrNickName("nickName",element.val());
				}
			});
			 $("#loginForm").validate({
				rules:{
					username:{
						required:true,
						email:true 
					},
					password:{
						required:true,
					}
				},
				messages:{
					username:{
						required:"请输入帐号",
						email:"请输入正确的邮箱"
					},
					password:{
						required:"请输入密码"
					}
				}
			}); 
			$("#registerForm").validate({
				rules:{
					email:{
						required:true,
						email:true 
					},
					nickName:{
						required:true
					},
					password:{
						required:true,
						equalTo:"#password_"
					}
				},
				messages:{
					email:{
						required:"请输入帐号",
						eamil:"请输入正确的邮箱"
					},
					nickName:{
						required:"请输入昵称"
					},
					password:{
						required:"请输入密码",
						equalTo:"两次密码输入不一样"
					}
				}
		});
		 $("#registerSubmit").click(function(){
			var rs = $("#registerForm").valid();//判断validate格式验证是否正确
			if(rs){
				var emailValue = $("#resiter_email").val();
				var nickNameValue = $("#register_nickName").val();
				var passwordValue = $("#surePassword").val();
				$.ajax({
					url: "${ctx}/member/register", 
					type: 'POST',
					data: JSON.stringify({"email":emailValue,"nickName":nickNameValue,"password":passwordValue}),
					contentType: "application/json;charset=UTF-8",
					async:true,
					success: function(data){
						//alert(data.message);
						if(data.message == 'email_used'){
							var showEmail = $("#back_email_message");
							showEmail.empty();
							showEmail.addClass("warn");
							showEmail.text('该帐号已使用');
						}else if(data.message == 'nickName_used'){
							var showEmail = $("#back_nickName_message");
							showEmail.empty();
							showEmail.addClass("warn");
							showEmail.text('该昵称已使用');
						}else if(data.message =='success'){
							alert('注册成功');
						}
					},error:function(xhr){
						alert("注册出错了");
					}
				}); 
			}else{
				//alert("失败");
			}
		});
	});
	</script>
</body>
</html>
