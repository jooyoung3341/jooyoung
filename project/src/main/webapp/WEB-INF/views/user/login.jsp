<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%@include file="../include/header.jsp"%>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
    
    	<div class="row">
    	<div class="col-md-3"></div>
    	<div class="col-md-5">
    	

		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label for="exampleInputName2">사용자 아이디</label>
				<input type="text" class="form-control" name="id" placeholder="User ID" required="required">
			</div>
			<div class="form-group">
				<label for="exampleInputName2">비밀번호</label>
				<input type="password" class="form-control" name="pw" placeholder="User Paasword" required="required">
			</div>
			<button type="submit" class="btn btn-default">로그인</button>
		</form>

		</div>
		<div class="col-md-4"></div>
    </div>
	</div>
	
    <div class="col-md-2"></div>
</div>
<c:if test="${loginmsg != null}">
<script>
	alert("${loginmsg}");
</script>
</c:if>
</body>
</html>