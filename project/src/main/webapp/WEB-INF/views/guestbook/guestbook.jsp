<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/table.css" href="${pageContext.request.contextPath}/resources/css/table.css">
<style type="text/css">
#topdiv {
		position: absolute;
		top: 0px;
		text-align: center;
		width: 100%;
}
#guestbookadd{
		
}
</style>
<meta charset="UTF-8">

<title>방명록</title>

</head>
<body>
<%@include file="../home.jsp"%>
<c:set var="i" value="4"/>
<c:set var="j" value="4"/>

<div class="row">
    <div class="col-md-2"></div>
    
    <div class="col-md-7">
	    <div id="topdiv">
	   		<button type="button" class="btn btn-default btn-block" id="guestbookadd">방명록 쓰기</button>
	    </div>
	    
	    <div id="table">
			<div id="guestbooklist">
	    	<c:forEach var="list" items="${guestbooklist}">
	    	<c:if test="${i%j == 0}">
	    		<p class="row1">
	    	</c:if>
	    	<span class="cell col1">
	    		<cite>${list.content}</cite>
	    	</span>
	    	<c:set var="i" value="${i+1}"/>
	    	<c:if test="${i%j == 0}">
	    		</p>
	    	</c:if>
	    	</c:forEach>
	    	</div>
	    </div>
    </div>
		
    <div class="col-md-2"></div>
    	
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
				<button type="button" class="btn btn-default" id="guestbook" data-dismiss="modal"></button>
			</form>
			</div>
		</div>
	</div>

<script>


$(document).ready(function(){
	$("#guestbookadd").click(function(){
			$("#guestbookmodal").modal();
		});
	$("#guestbookmodal").on("hidden.bs.modal", function(e){
		$("#guestbookmodal").find("#form")[0].reset();
	});	
})       

$(document).ready(function(){
	$("#guestbook").click(function(){
	var content = $("textarea#content").val();
			$.ajax({
					url : "register",
					type : "POST",
					data : {"id" : "${user.id}",
							   "content" : content},
					dataType : "json",
					success : function(data){
					
						 	getGuestbook(data); 
						}
				})
		});
});

function getGuestbooklist(data){
	var i = 3;
	var j = 3;
	var disp = "";
/* 	disp += "<c:forEach var='list' items='${guestbooklist}'>";
	disp += "<c:if test='${i%j == 0}'>";
	disp += "<p class='row1'>";
	disp += "</c:if>";
	disp += "<span class='cell col1'>";
	disp +=  "<cite>${list.content}</cite>";
	disp += "</span>";
	disp += "<c:set var='i' value='${i+1}'/>";
	disp += "<c:if test='${i%j == 0}'>";
	disp += "</p>";
	disp += "</c:if>";
	disp += "</c:forEach>"; */
/* 	$("#guestbooklist").html(disp);  */
	
	$(data).each(function(idx, item){
	if(i%j == 0){
			disp += "<p class='row1'>";	
		}
	disp += "<span class='cell cel1'>";
	disp += "<cite>"+item.content+"</cite>";
	disp += "</span>";
	i += 1;
	if(i%j == 0){
			disp += "</p>";
		}
	});   
	document.getElementById("guestbooklist").innerHTML = disp;/* 
	$("#guestbooklist").innerHTML = disp;  */
}

function getGuestbook(data){
	$.ajax({
			url : "list",
			dataType : "json",
			success : function(data){
					getGuestbooklist(data)
				}
			
		})
	
}

		
</script>
</body>
</html>