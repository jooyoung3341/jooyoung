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
   	<button type="submit" class="btn btn-default">방명록 쓰기</button>
    </div>
    </div>
		
    <div class="col-md-3">
    	

    	</div>
    	
	</div>
</div>
<%-- 
	<form class="form-horizontal" method="post">
    			<div class="form-group">
    				<input type="text" class="form-control" placeholder="${user.id}" readonly>
    			</div>
    			<div class="form-group">
    				<textarea class="form-control" name="content" placeholder="Content" required="required" rows="5"></textarea>
    			</div>
    			</form> --%>
<script type="text/javascript">
	$(document).ready(function(){
		$('.show2').hide();
			$('.show1').click(function(){
					$('.show2').show();
					return false;
				})
		})
		
		$('#zzz').click(function(){
				$('.show2').hide();
				$('.show1').show();
			})
		
</script>
</body>
</html>