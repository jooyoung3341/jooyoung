<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 삭제</title>
</head>
<body>
<%@include file="../include/header.jsp"%>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
        <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-5">
        

        	<br/><br/><br/>
			<form method="post">
				<button type="submit" class="btn-default">삭제하기</button>
				<button type="button" class="btn-default" id="backbtn">뒤로가기</button>
			</form>

		</div>
        <div class="col-md-4"></div>
    </div>

    <div class="col-md-2"></div>
</div>
</div>
<script>
	$(document).ready(function(){
			$("#backbtn").click(function(){
					location.href="../project/project";
				})
		})
</script>
</body>
</html>