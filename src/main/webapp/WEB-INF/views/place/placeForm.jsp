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
										<input class='input-file' multiple name='fileInput_pic'
											id='fileInput' type='file'> <span style="color: green">*按住Ctrl键可选择多张*
											建议640*360，JPEG/PNG格式</span>
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
	<script type="text/javascript">
		
	</script>
</body>
</html>
