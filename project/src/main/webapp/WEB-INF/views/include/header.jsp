<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>
<!-- jQuery 설정 -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> 

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 스타일시트 파일 링크 설정 / contextPath는 절대 경로를 만들기 위해서 추가 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%-- <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> --%>

</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">&nbsp&nbsp&nbsp&nbsp&nbsp <span class="glyphicon glyphicon-home"></span></a>
		</div>

		<ul class="nav navbar-nav navbar-right">
		<c:if test="${user != null}">
			<li><a href="#">${user.id}</a></li>
				<li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
			<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
			<li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
		</c:if>
		<c:if test="${user == null}">
			<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/signup">회원가입</a></li>
			<li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
		</c:if>
		</ul>
		
	</div>
</nav>


</body>
</html>