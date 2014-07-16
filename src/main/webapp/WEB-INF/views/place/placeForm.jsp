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
 <link href="${ctx}/static/jasny/css/jasny-bootstrap.css" rel="stylesheet" type="text/css"> 
 <script src="${ctx}/static/jasny/js/jasny-bootstrap.js" type="text/javascript"></script>
 <style type="text/css">
 .form_bg{background:url(${ctx}/static/images/assets/example/login_bg.png);}
 #nav{padding-left:30%;background:url(${ctx}/static/images/assets/example/dh_bg.png);}
 #nav a{color:#333333;}
 .palce_form_head{padding-left:50px;background:url(${ctx}/static/images/assets/example/dh_bg.png);color:#FFFFFF;font-size:14px;}
 </style>
</head>
<body>
	<!--导航  -->
		<ul class="nav nav-pills" id="nav" role="tablist">
	      <li><a href="${ctx }/index">首页</a></li>
	      <li><a href="#">台球地图</a></li>
	      <li><a href="#">赛事直播间</a></li>
	      <li><a href="#">赛事活动</a></li>
	      <li><a href="#">推荐</a></li>
	      <li><a href="#">商城</a></li>
	      <li><a href="#">圈子话题</a></li>
	    </ul>
 	<!--  -->
        <div class="container" style="margin-top:20px;">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 form_bg">
					<form id="inputForm" action="${ctx}/place/save" method="post" class="form-horizontal" enctype="multipart/form-data">
						<fieldset>		  
							<div class="form-group">
								<div class="palce_form_head">
		                    		<span >台球地图&gt;球房入驻</span>
		                		</div>
							</div> 
							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*球房名称:</label>
    							<div class="col-sm-4">
      								<input class="form-control" type="text" id="place_name" name="name" value="${place.name}" placeholder="请输入球房名称">
    							</div>
  							</div>
  							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*球房电话:</label>
    							<div class="col-sm-4">
      								<input class="form-control" type="text" id="place_tel" name="tel" value="${place.tel}" placeholder="请输入联系方式">
    							</div>
  							</div>                         
							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*球房地址:</label>
    							<div class="col-sm-4">
      								<input class="form-control" type="text" id="place_addr" name="addr" value="${place.addr}" placeholder="请输入球房地址">
    							</div>
  							</div>
							<div class="form-group" >
								<label for="name" class="col-sm-2 control-label">*球房图片:</label>
								<div class="col-sm-10" id="pics">
							  		<div class="fileinput fileinput-new" data-provides="fileinput">
										<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
											<img data-src="holder.js/100%x100%" alt=""/>
										</div>
											 <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
											 </div>  
										<div>
											<span class="btn btn-default btn-file">
											<span class="fileinput-new">添加图片</span>
											<span class="fileinput-exists">更改</span>
											<input type="file" class="file-input" name="fileInput_pic" id="file" />
										 </span>
											<a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"><span class="glyphicon glyphicon-remove"></span>移除</a>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
							<label for="name" class="col-sm-2 control-label"></label>
								<div class="col-sm-10 controls">
									<input type="button" class="btn btn-success" name="contiueadd" id="contiueadd" value="继续添加">
									<input type="button" class="btn btn-danger" name="deleteAll" id="deleteAll" value="移除全部">
								</div>
							</div>
							
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label"></label>
								<div class="col-xs-4 controls">
									<button type="submit" class="btn btn-lg btn-success">上传球房信息</button>
								</div>
							</div>
				
						</fieldset>
					</form>
                </div>
            </div>
        </div>
    <!-- </section> -->
	<script>
	$(function(){
		$("#inputForm").validate({
			errorPlacement: function(error, element) {  
			    error.appendTo(element.parent().parent());  
			},
			rules:{
				name:{
					required:true
				},
				tel:{
					required:true
				},
				addr:{
					required:true
				}
			},
			messages:{
				name:{
					required:"请输入球房名称"
				},
				tel:{
					required:"请输入联系方式"
				},
				addr:{
					required:"请输入球房地址"
				}
			}
		}); 
	});
	$("#contiueadd").click(function(){
		$("#pics").append("<div class='fileinput fileinput-new' data-provides='fileinput' style='margin-right:5px'>"
				+"<div class='fileinput-new thumbnail' style='width: 200px; height: 150px;'>"
						+"<img data-src='holder.js/100%x100%' alt=''/>"
				+"</div>"
				+"<div class='fileinput-preview fileinput-exists thumbnail' style='max-width: 200px; max-height: 150px;'>"
				+"</div>"  
				+"<div>"
					+"<span class='btn btn-default btn-file'>"
						+"<span class='fileinput-new'>添加图片</span>"
						+"<span class='fileinput-exists'>更改</span>"
						+"<input type='file' class='file-input' name='fileInput_pic' id='file' />"
					+"</span>"
					+"<a href='#' class='btn btn-danger fileinput-exists' data-dismiss='fileinput' style='margin-left:5px'><span class='glyphicon glyphicon-remove'></span>移除</a>"
				+"</div>"
			+"</div>");
		//$('.fileinput').fileinput();
		$('.fileinput:last').fileinput();
	});
	$("#deleteAll").click(function(){
		$("#pics .fileinput").remove();
	});
	
	</script>
</body>
</html>
