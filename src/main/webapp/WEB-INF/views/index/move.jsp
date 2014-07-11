<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>第二个页面</title>
</head>
<body>
<div style="margin-top:170px;">
第二个页面<a href="${ctx}/logout">推出</a>
<div>${currentMember.memberId}</div>
<div>${currentMember.nickName}</div>
<div>${currentMember.salt}</div>
</div>
</body>
</html>
