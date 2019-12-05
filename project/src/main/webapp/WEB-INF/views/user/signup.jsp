<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<body>
<%@include file="../include/header.jsp"%>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
    	
    	<div class="row">
    	<div class="col-md-3"></div>
    	<div class="col-md-6">
    	<form class="form-horizontal" method="post" onsubmit="return signupcheck()">
			<div class="form-group">
				<label for="exampleInputName2">사용자 아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="User ID" onblur="confirmId()">
				<div id=iddiv></div>
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw" placeholder="User Password">
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">비밀번호 확인</label>
				<input type="password" class="form-control" id="confirmpw" name="confirmpw" placeholder="Confirm Password">
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">이메일</label>
				<input type="email" class="form-control" id="email" name="email" placeholder="Email">
			</div>
			
			<button type="submit" class="btn btn-default">회원가입</button>
	
	</form>
	</div>
	<div class="col-md-3"></div>
	</div>
    </div>

    <div class="col-md-2"></div>
</div>

<script>
var idcheck = false;

//id중복체크 함수
function confirmId(){
	//id에 입력된 값 가져오기
	var id = $("#id").val();
	//var id = document.getElementById("id").value;
	//메시지 출력 영역 가져오기
	var iddiv = $("iddiv").val();
	//var iddiv = document.getElementById("iddiv");
	$.ajax({
			url : 'idcheck',
			data : { "id" : id}, 
			dataType : 'json',
			success : function(data){
					if(data.result == true){
						iddiv.innerHTML = "사용 가능한 아이디";
						iddiv.style.color = 'blue';
						idcheck = true;
					}
					else{
						iddiv.innerHTML = "사용 불가능한 아이디";
						iddiv.style.color = 'red';
						idcheck = false;
						}
				}
			
		});
}

function signupcheck(){
	//idcheck의 값이 false 이면 서버로 전송하지 않기
	if(idcheck == false){
			alert("아이디를 입력해야 합니다.");
			document.getElementById("id").focus();
			return false;
		}

	//id값에 공백을 넣을시
	if(id.value.indexOf(" ") >= 0){
			alert("아이디에 공백을 사용할 수 없습니다.");
			id.focus();
			return false;
		}

	var pw = document.getElementById("pw");
	var confirmpw = document.getElementById("confirmpw");
	//비밀번호 정규식 - 숫자, 영문자 5자이상
	var p1 = /[0-9]/;
	var p2 = /[a-zA-Z]/;
	//var p3 = /[~!@#$%^&*()]/;
	if(!p1.test(pw.value) || !p2.test(pw.value) || pw.value.length < 5){
			alert("비밀번호는 5자이상 숫자, 영문자를 포함해야 합나디.");
			pw.focus();
			return false; 
		}

	//비밀번호 확인
	if(pw.value != confirmpw.value){
			alert("두 개의 비밀번호는 일치해야 합니다.");
			pw.focus();
			return false;
		}
	var email = document.getElementById("email");
	if(email.value.length < 5){
			alert("email을 입력하셔야 합니다.");
			email.focus();
			return false;
		}
}
	
</script>
</body>
</html>