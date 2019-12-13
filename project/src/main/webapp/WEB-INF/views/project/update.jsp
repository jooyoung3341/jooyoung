<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 수정</title>
</head>
<body>
<%@include file="../include/header.jsp"%>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
        <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-5">
																			
		<form class="form-horizontal" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pno" value="${project.pno}"/>
			<div class="form-group">
				<label for="exampleInputName2">아이디</label>
				<input type="text" class="form-control" placeholder="${user.id}" readonly>
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">제목</label>
				<input type="text" class="form-control" name="title" required="required" value="${project.title}">
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">프로젝트 이미지</label>
				<input type="file" name="image" id="image" required="required" value="${project.image}">
				<img id="img" width="300" height="300" border="1" src="../../../resources/image/${project.image}"/>
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">프로젝트 기술</label>
				<textarea class="form-control" name="technology" placeholder="Technology" required="required" rows="4"></textarea>
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">프로젝트 내용</label>
				<textarea class="form-control" name="content" required="required" rows="5">${project.content}</textarea>
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">Git 주소</label>
				<input type="text" class="form-control" name="git" placeholder="Git" required="required">
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">Link 주소</label>
				<input type="text" class="form-control" name="link" placeholder="Link" required="required">
			</div>
			
			<button type="submit" class="btn btn-default">수정</button>
		</form>
 	
        </div>

        <div class="col-md-4"></div>
    	</div>
	</div>
	
    <div class="col-md-2"></div>
</div>
<script>
var filename = "";

document.getElementById("image").addEventListener('change', function(){
	readURL(this);	
});

function readURL(input){
	if(input.files && input.files[0]){
		filename = input.files[0].name;
		var ext = filename.substr(filename.length - 3, filename.length);
		var isCheck = false;
		if((ext.toLowerCase() == "jpg" || ext.toLowerCase() == "gif" || ext.toLowerCase() == "png")){
				isCheck = true;
			};
			if(isCheck == false){
				alert("jpg나 gif, png 만 업로드가 가능합니다.");
				return;
			};
		var reader = new FileReader();				
		reader.onload = function(e){
				document.getElementById("img").src = e.target.result;
			}
		reader.readAsDataURL(input.files[0]);
		}	
	};

</script>

</body>
</html>