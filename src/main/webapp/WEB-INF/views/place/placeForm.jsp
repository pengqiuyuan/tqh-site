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
</head>
<body>
	<form id="inputForm" action="${ctx}/place/save" method="post" class="form-horizontal" enctype="multipart/form-data">
		<fieldset>		                            
			<div class="control-group">
				<label for="place_name" class="control-label">球房名称:</label>
				<div class="controls">
					<input type="text" id="place_name" name="name"  value="${place.name}" class="input-large required" minlength="2"/>
				</div>
			</div>
			<div class="control-group">
				<label for="place_tel" class="control-label">球房电话:</label>
				<div class="controls">
					<input type="text" id="place_tel" name="tel"  value="${place.tel}" class="input-large required" />
				</div>
			</div>
			<div class="control-group">
				<label for="place_addr" class="control-label">球房地址:</label>
				<div class="controls">
					<input type="text" id="place_addr" name="addr"  value="${place.addr}" class="input-large required"/>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="fileInput_pic">图片上传：</label>
					<div class="controls">
						<input class='input-file' multiple name='fileInput_pic'
							id='fileInput' type='file'> <span style="color: green">*按住Ctrl键可选择多张*
							建议640*360，JPEG/PNG格式</span>
					</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
			</div>

		</fieldset>
	</form>
	<script type="text/javascript">
		
	</script>
</body>
</html>
