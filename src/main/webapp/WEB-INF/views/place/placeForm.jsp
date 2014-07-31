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
 <!-- Add fancybox mousewheel plugin (this is optional) -->
 <script type="text/javascript" src="${ctx}/static/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
 <!-- Add fancyBox -->
 <link rel="stylesheet" href="${ctx}/static/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
 <script type="text/javascript" src="${ctx}/static/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
 <style type="text/css">
 .form_bg{background:url(${ctx}/static/images/assets/example/place_form_bg.png);}
 .palce_form_head{padding-left:50px;background:url(${ctx}/static/images/assets/example/dh_bg.png);height:32px;padding-top:6px;color:#FFFFFF;font-size:14px;}
 .instruction{float:right;margin-right:10px;}
 .expander {
    position: absolute;
    top: -2px;
    right: -2px;
    width: 25px;
    height: 25px;
    background: #FFFFFF url(${ctx}/static/images/assets/example/place_close.png?raw=true) center center no-repeat;
   }
   .red{border:1px solid red}
   .green{border:1px solid green}
 </style>
</head>
<body>
        <div class="container" style="margin-top:16px;">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 form_bg">
					<form id="inputForm" action="${ctx}/place/save" method="post" class="form-horizontal" enctype="multipart/form-data">
						<fieldset>		  
							<div class="form-group">
								<div class="palce_form_head">
		                    		<span >台球地图&gt;球房入驻</span>
		                    		<div class="instruction"><a href="${ctx}/static/images/assets/example/place_des.png" id="place_des" style="text-decoration:underline;color:#FFFFFF;" href="#">球房入驻说明</a></div>
		                		</div>
							</div> 
							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*球房名称:</label>
    							<div class="col-sm-4">
      								<input class="form-control" type="text" id="place_name" name="name" value="${place.name}" placeholder="请输入球房名称" data-container="body" data-trigger="hover focus" data-toggle="popover" data-placement="right" data-content="/*球房名称不超过20个字符*/">
    							</div>
  							</div>
  							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*球房电话:</label>
    							<div class="col-sm-4">
      								<input class="form-control" type="text" id="place_tel" name="tel" value="${place.tel}" placeholder="请输入联系方式" data-container="body" data-trigger="hover focus" data-toggle="popover" data-placement="right" data-content="/*手机号为11位，电话格式如：0568-5858888 或者5858888*/">
    							</div>
  							</div> 
  							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*归属省/区:</label>
    							<div class="col-sm-4">
	    							<select class="form-control" id="province" name="province">
	    									<option value="">-----------请选择省---------</option>
									  	<c:forEach items="${province }" var="pv">
									  		<option value="${pv.id }">${pv.name }</option>
									  	</c:forEach>
									</select>
    							</div>
  							</div>
  							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*归属城市:</label>
    							<div class="col-sm-4">
      								<select class="form-control" id="city" name="city">
									  	<option value="">-----------请选择城市---------</option>
									</select>
    							</div>
  							</div>                         
							<div class="form-group">
   								<label for="name" class="col-sm-2 control-label">*球房地址:</label>
    							<div class="col-sm-4">
      								<input class="form-control" type="text" id="place_addr" name="addr" value="${place.addr}" placeholder="请输入球房地址"/>
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
											<a href="#"  class="btn btn-danger fileinput-exists" data-dismiss="fileinput"><span class="glyphicon glyphicon-remove"></span>移除</a>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
							<label for="name" class="col-sm-2 control-label"></label>
								<div class="col-sm-10 controls">
									<input type="button" class="btn" style="width:90px;background-color:#128C73;color:#FFFFFF;" name="contiueadd" id="contiueadd" value="继续添加" />
									<input type="button" class="btn" style="width:90px;background-color:#c2632d;color:#FFFFFF;" name="deleteAll" id="deleteAll" value="移除全部" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label"></label>
								<div class="col-xs-4 controls">
									<button type="submit" style="background-color:#18a88b;color:#FFFFFF;" class="btn btn-lg">上传球房信息</button>
								</div>
							</div>
				
						</fieldset>
					</form>
                </div>
            </div>
        </div>
    <!-- </section> -->
	<script>
	//$("#map").addClass("active");
	$(function(){
		 $("[data-toggle='popover']").popover();
		$.validator.addMethod("selectProvince",function(value,element){
			 var provinceCode = $("#province").val();
            return provinceCode !='';
        },"请选择省/区");
		 $.validator.addMethod("selectCity",function(value,element){
			 var cityCode = $("#city").val();
             return cityCode !='';
         },"请选择城市");
		  $.validator.addMethod("telVali",function(value,element){
			 var phone = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
			 var tel=/^1[358]\d{9}$/;
			 var telValue = $("#place_tel").val();
			 var b = false;
			 if(phone.test(telValue) || tel.test(telValue)){
				 b = true;
			 }
             return b;
         },"请输入正确的联系方式");
		$("#inputForm").validate({
			errorPlacement: function(error, element) {  
			    error.appendTo(element.parent().parent());  
			},
			rules:{
				name:{
					required:true,
					maxlength:20
				},
				tel:{
					required:true,
					telVali:""
				},
				addr:{
					required:true
				},
				province:{
					selectProvince:""
				},
				city:{
					selectCity:""
				}
			},
			messages:{
				name:{
					required:"请输入球房名称",
					maxlength:"名称最多20个字符"
				},
				tel:{
					required:"请输入联系方式",
					telVali:"请输入正确的联系方式"
				},
				addr:{
					required:"请输入球房地址"
				}
			}
		}); 
		$("#province").change(function(){
			var parentLevel = $(this).val();
			if(parentLevel !=null && parentLevel!=''){
				$.ajax({
					url:'${ctx}/place/city?parentLevel='+parentLevel, 
					type: 'GET',
					contentType: "application/json;charset=UTF-8",
					dataType: 'text',
					success: function(data){
						var parsedJson = $.parseJSON(data);
						$("#city").empty();
						/* $("#city").append("<option value=''>"+"-----------请选择城市---------"+"</option>"); */
						jQuery.each(parsedJson, function(index, itemData) {
						$("#city").append("<option value='"+itemData.areaCode+"'>"+itemData.name+"</option>"); 
					});
				},error:function(xhr){
					alert('错误了\n\n'+xhr.responseText)
					}
				});
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
	
	 $(document).ready(function() {
		$("#place_des").fancybox({
			openEffect: 'none',
		    closeEffect: 'none',
		    autoScale : false,
		    closeBtn:false,
		    minWidth:1040,
		    minHeight:644,
		    maxWidth:1040,
		    maxHeight:644,
			afterShow: function() { 
		        $('<div class="expander"></div>').appendTo(this.inner).click(function() {
		        	$.fancybox.close();
		        });
		    },
		}
	);
});
</script>
</body>
</html>
