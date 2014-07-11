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
<%-- <link href="${ctx}/static/zxxFile/zxxFile.css" rel="stylesheet" type="text/css"> --%>
 <style>
.upload_box{width:800px; margin:1em auto;}
.upload_main{border-width:1px 1px 2px; border-style:solid; border-color:#ccc #ccc #ddd; background-color:#fbfbfb;}
.upload_choose{padding:1em;}
.upload_drag_area{display:inline-block; width:103%; padding:4em 0; margin-left:-0.5em;margin-top:0.5em; border:1px dashed #ddd; background:#fff url(http://rescdn.qqmail.com/zh_CN/htmledition/images/func/dragfile07bf38.gif) no-repeat 20px center; color:#999; text-align:center; vertical-align:middle;}
.upload_drag_hover{border-color:#069; box-shadow:inset 2px 2px 4px rgba(0, 0, 0, .5); color:#333;}
.upload_preview{width:103%;border-top:1px solid #eee; border-bottom:1px solid #eee; background-color:#fff; overflow:hidden; _zoom:1;}
.upload_append_list{height:300px; padding:0 1em; float:left; position:relative;}
.upload_delete{margin-left:2em;}
.upload_image{max-height:170px; padding:5px;max-width:210px}
.upload_submit{padding-top:1em; padding-left:1em;}
.upload_submit_btn{display:none; height:32px; font-size:14px;}
.upload_loading{height:250px; background:url(http://www.zhangxinxu.com/study/image/loading.gif) no-repeat center;}
.upload_progress{display:none; padding:5px; border-radius:10px; color:#fff; background-color:rgba(0,0,0,.6); position:absolute; left:25px; top:45px;}
</style>
 
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

							<div class="control-group">
									<div class="form-group col-xs-12 floating-label-form-group">
										<label class="control-label" for="fileInput_pic">图片上传：</label>
<!-- 										<input class='input-file' multiple name='fileInput_pic'
											id='fileInput' type='file'> <span style="color: green">*按住Ctrl键可选择多张*
											建议640*360，JPEG/PNG格式</span> -->
			                                <input class="form-control" id="fileImage" type="file" size="30" name="fileInput_pic" multiple />
			                                <span id="fileDragArea" class="upload_drag_area">或者将图片拖到此处</span>
			                         		<div id="preview" class="upload_preview"></div>
									</div>
							</div>
							<div class="control-group">
								<div class="form-group col-xs-12">
									<button type="submit" class="btn btn-lg btn-success">Send</button>
								</div>
							</div>
				
						</fieldset>
					</form>
                </div>
            </div>
        </div>
    </section>
    <script src="${ctx}/static/zxxFile/zxxFile.js" type="text/javascript"></script>
 	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script>
	var params = {
		fileInput: $("#fileImage").get(0),
		dragDrop: $("#fileDragArea").get(0),
		upButton: $("#fileSubmit").get(0),
		url: $("#uploadForm").attr("action"),
		filter: function(files) {
			var arrFiles = [];
			for (var i = 0, file; file = files[i]; i++) {
				if (file.type.indexOf("image") == 0) {
					if (file.size >= 512000) {
						alert('您这张"'+ file.name +'"图片大小过大，应小于500k');	
					} else {
						arrFiles.push(file);	
					}			
				} else {
					alert('文件"' + file.name + '"不是图片。');	
				}
			}
			return arrFiles;
		},
		onSelect: function(files) {
			var html = '', i = 0;
			$("#preview").html('<div class="upload_loading"></div>');
			var funAppendImage = function() {
				file = files[i];
				if (file) {
					var reader = new FileReader()
					reader.onload = function(e) {
						html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p><strong>' + file.name + '</strong>'+ 
							'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
							'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>'+ 
							'<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
						'</div>';
						
						i++;
						funAppendImage();
					}
					reader.readAsDataURL(file);
				} else {
					$("#preview").html(html);
					if (html) {
						//删除方法
						$(".upload_delete").click(function() {
							ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
							return false;	
						});
						//提交按钮显示
						$("#fileSubmit").show();	
					} else {
						//提交按钮隐藏
						$("#fileSubmit").hide();	
					}
				}
			};
			funAppendImage();		
		},
		onDelete: function(file) {
			$("#uploadList_" + file.index).fadeOut();
		},
		onDragOver: function() {
			$(this).addClass("upload_drag_hover");
		},
		onDragLeave: function() {
			$(this).removeClass("upload_drag_hover");
		},
		onProgress: function(file, loaded, total) {
			var eleProgress = $("#uploadProgress_" + file.index), percent = (loaded / total * 100).toFixed(2) + '%';
			eleProgress.show().html(percent);
		},
		onSuccess: function(file, response) {
			$("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
		},
		onFailure: function(file) {
			$("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");	
			$("#uploadImage_" + file.index).css("opacity", 0.2);
		},
		onComplete: function() {
			//提交按钮隐藏
			$("#fileSubmit").hide();
			//file控件value置空
			$("#fileImage").val("");
			$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
		}
	};
	ZXXFILE = $.extend(ZXXFILE, params);
	ZXXFILE.init();
	</script>
</body>
</html>
