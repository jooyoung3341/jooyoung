<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#topdiv {
		position: absolute;
		top: 0px;
}
#guestbookadd{
		
}
</style>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
<%@include file="../home.jsp"%>
<div class="row">
    <div class="col-md-2"></div>
    
    <div class="col-md-6">
	    <div id="topdiv">
	   		<button type="button" class="btn btn-default" id="guestbookadd">방명록 쓰기</button>
	    </div>
	    
    </div>
		
    <div class="col-md-3">
    	

    	</div>
    	
	</div>
</div>

<div class="modal fade bs-example-modal-sm" id="guestbookmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">방명록</h4>
			</div>
			<form method="post" id="form">
			<div class="modal-body">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="${user.id}" readonly>
				</div>
				<div class="form-group">
					<textarea class="form-control" id="content" name="content" placeholder="Content" required="required" rows="5"></textarea>
				</div>
				<button></button>
			</form>
			</div>
		</div>
	</div>
</div>


<%-- 
<div style="display:none" id="guestbookform">
	<div class="form-group">
    	<input type="text" class="form-control" placeholder="${user.id}" readonly>
    </div>
    <div class="form-group">
    	<textarea class="form-control" id="content" name="content" placeholder="Content" required="required" rows="5"></textarea>
    </div>
</div> --%>

<script>

$(document).ready(function(){
	$("#guestbookadd").click(function(){
			$("#guestbookmodal").modal();
		});
	$("#guestbookmodal").on("hidden.bs.modal", function(e){
		$("#guestbookmodal").find("#form")[0].reset();
	});	
})       


		
</script>
</body>
</html>