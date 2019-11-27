<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<%@include file="include/header.jsp" %>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
		<ul class="nav nav-pills nav-justified">
  			<li><a href="${pageContext.request.contextPath}/project/project">프로젝트</a></li>
  			<li><a href="${pageContext.request.contextPath}/guestbook/guestbook">방명록</a></li>
		</ul>
    </div>

    <div class="col-md-2"></div>
</div>		  
<c:if test="${signupmsg != null}">
<script type="text/javascript">
alert("${signupmsg}");
</script>
</c:if>
</body>
</html>