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
<style type="text/css">
	.warn{color:#FF0000;}
	.ok{color:#009933;}
	.display{display:none}
	*{ margin:0; padding:0;}
	a{ text-decoration:none; color:#333;}
	.box_163css{ width:640px; margin:170px auto; position:relative;}
	.nav{ width:100%; float:left; height:34px;}
	.nav li{ font-size:14px;  float:left; width:160px; height:34px;-webkit-transition:all 0.35s linear; cursor:pointer; text-align:center; line-height:32px; list-style-type:none;}
	.nav li.on{ color:#f00;}
	.line{ width:640px; float:left; position:relative; left:0; top:0px;height: 2px; background:#dadada;}
	.s_line{
		position: absolute;
		display:block;
		width:160px;
		z-index: 1;
		top: -7px;
		left: 0;
		height: 7px;
		border-bottom: 2px solid #E4393C;
		overflow: hidden;
		text-align: center;
	}

	.nav{
		background: #efefef;
	}
	.s_line b{
		display: inline-block;
		margin-top: -8px;
		width: 0;
		height: 0;
		border-style: dashed dashed solid;
		border-width: 10px;
		border-color: transparent transparent #E4393C;
		overflow: hidden;
		zoom: 1;
		font-size: 0;
	}
	.zlbox_content{
		width:640px; 
		margin: 0px auto; 
	}
	.item_tab{
		min-height: 300px;
		border: 1px solid #dadada;
		border-top: 0px;
		padding: 20px;
		text-align:center;
	}	
</style>
<script type="text/javascript">
	$(function(){
		var l=0;
		$('.navs_li').hover(function(){
			$(this).siblings().removeClass('on');
			$(this).addClass('on');
			var i=$(this).index();	
			var a1=160*i;	
			$(".s_line").animate({left:a1},200);
			var index = $(".navs_li").index($(this));
			$(".item_tab").hide();
			$(".item_tab").eq(index).show();
		});	
	});
</script>
</head>
<body>
	<div class="box_163css">
	    <ul class="nav">
	        <li class="navs_li on">登录</li>
	        <li class="navs_li">注册</li>
	    </ul>
	    <div class="line">
	    	<span class="s_line">	    		
				<b></b>
	    	</span>
			<div style="clear: both;"></div>
		</div>		
		<div style="clear: both;"></div>
	</div>
	
	<div class="zlbox_content">
		<div class="item_tab" style="display: block;">
			<form id="loginForm"  name ="loginForm" action="${ctx }/login" method="post">
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
				<label>帐号：</label>
				<input name="username" class="input-large required" value="${username}" placeholder="请输入邮箱"/>
				<label>密码：</label>
				<input type="password" name="password" class="input-large required" value="" placeholder="请输入密码"/><br/>
				<label class="checkbox" for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe"/> 下次自动登录，使用公用电脑勿勾选 </label>	
				<!-- <input type="checkbox" value="1">下次自动登录，使用公用电脑勿勾选 --><br/>
				<button type="submit" id="loginSubmit" class="btn btn-primary">登录</button>
			</form>
		</div>
		<div class="item_tab" style="display: none;">
			 <form id="registerForm" name="registerForm"  method="post" enctype="multipart/form-data">
				<div>帐号：<input name="email" placeholder="请输入邮箱" id="resiter_email"/><span id="back_email_message"></span></div>
				<div>昵称：<input name="nickName" placeholder="请输入昵称" id="register_nickName"/><span id="back_nickName_message"></span></div>
				<div>密码：<input type="password" id="password_" name="password_" placeholder="请输入密码"/></div>
				<div>确认密码：<input type="password" id="surePassword" name="password" placeholder="请再次输入密码"/></div>
				<button type="button" id="registerSubmit" class="btn btn-primary">注册</button>
			</form> 
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
						element.text("*");
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
					email:{
						required:true,
						email:true 
					},
					password:{
						required:true,
					}
				},
				messages:{
					email:{
						required:"请输入帐号",
						eamil:"请输入正确的邮箱"
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
