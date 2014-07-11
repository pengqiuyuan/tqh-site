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
</head>
<body>
	<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>球房入驻</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
					<form id="inputForm" action="${ctx}/place/save" method="post" class="form-horizontal" enctype="multipart/form-data">
						<fieldset>		                            
							<div class="control-group">
				                   <div class="form-group col-xs-12 floating-label-form-group">
				                        <label for="name">球房名称</label>
				                        <input class="form-control" type="text" id="place_name" name="name" value="${place.name}" placeholder="球房名称">
				                   </div>
							</div>
							<div class="control-group">
				                  <div class="form-group col-xs-12 floating-label-form-group">
				                        <label for="email">球房电话</label>
				                       	<input class="form-control"  type="text" id="place_tel" name="tel" value="${place.tel}" placeholder="球房电话">
				                  </div>
							</div>
							<div class="control-group">
				                  <div class="form-group col-xs-12 floating-label-form-group">
				                        <label for="message">球房地址</label>
				                        <input class="form-control" type="text" id="place_addr" name="addr"  value="${place.addr}" placeholder="球房地址"></input>
				                  </div>
							</div>
							<div class="control-group" id="pics">
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
							<div class="form-group">
								<div class="col-sm-10 controls">
									<input type="button" class="btn btn-success" name="contiueadd" id="contiueadd" value="继续添加">
									<input type="button" class="btn btn-danger" name="deleteAll" id="deleteAll" value="移除全部">
								</div>
							</div>
							
							<div class="control-group">
								<div class="form-group col-xs-12">
									<button type="submit" class="btn btn-lg btn-success">上传球房信息</button>
								</div>
							</div>
				
						</fieldset>
					</form>
                </div>
            </div>
        </div>
    </section>
 	<script src="${ctx}/static/jasny/js/jasny-bootstrap.js" type="text/javascript"></script>
	<script>
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
