<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#table {display: table; width: 100%;}
.row1 {display: table-row;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
.col1 {width: 20%;}
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}

#footer {
		position: absolute;
		bottom: 0px;
		right: 0px;
}
#footer1 {
		position: absolute;
		bottom: 0px;
		left: 0px;
}

#modalversion{
		white-space: normal;
}

#center{
		height: 250px;
}

#right{
		height: 250px;
}
</style>
<meta charset="UTF-8">
<title>프로젝트</title>
</head>
<body>
<%@include file="../home.jsp"%>
<c:set var="i" value="3"/>
<c:set var="j" value="3"/>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
        <c:if test="${user.id == 'admin'}">
        	<a href="${pageContext.request.contextPath}/project/register"><button type="button" class="btn btn-default" >프로젝트 등록</button></a>
        </c:if>
        
        <div id="table">  
        	<c:forEach var="list" items="${projectlist}" varStatus="status">
        <br/><br/>
        <c:if test="${i%j == 0}">
       		<p class="row1">
        </c:if>
        	<span class="cell col1">
        		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/${list.image}"/ width="320" height="250"
        							     id="detail${status.index}" value="${list.pno}" class="detail"></a>
        		&nbsp&nbsp&nbsp
        		<cite id="title">${list.title} / ${list.pno}</cite>
        	</span>
 	    <c:set var="i" value="${i+1}"/>      
        <c:if test="${i%j == 0}">
        	</p>
        </c:if>

      	  </c:forEach>
        </div>
	</div>

     <div class="col-md-2"></div> 
</div>
         
         <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="diglog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
         	<div class="modal-content">
     
         	<div class="row">
         		 <div class="col-md-3">
         		 	<div id="imgdiv">
         		 	</div>
         		 </div> 
         		 
         		 <div class="col-md-6" id="center">
         		 	<div class="container" id="modaltitle"></div>
         		 	<div class="container" id="modalcontent">&nbsp&nbsp
         		 		<div id="footer">
         		 			<button type="button" class="btn btn-default">Link</button>
         		 			<button type="button" class="btn btn-default">Git</button>
         		 		</div>
        		 </div>
        		
         		 </div> 
         		 
         		 <div class="col-md-2" id="right">
         		 	<p id="modalversion">
       
         		 	zzzzzs dkflj ksdlafjkldsjfklsdajflksj dklfs ldafkl skldjlfjl sdajfl
    
         		 			
         		 	</p>
         		 	<div id="footer1">
         		 		<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>
         		 	</div>
         		 </div> 
         	</div>
         	</div>
         </div>
         </div>
         
<c:if test="${pregistermsg != null}">
<script>
alert("${pregistermsg}");
</script>
</c:if>

<script>

	$(document).ready(function (){
		var disp = '';
		$('img').click(function(){
			var $detail = $(this).attr('id');
			var pno = $('#'+$detail).attr('value');
		
		$.ajax({
			url : 'detail',
			data : {'pno' : pno},
			dataType : 'json',
			success : function(data){											       
				document.getElementById("imgdiv").innerHTML = "<img src='${pageContext.request.contextPath}/resources/image/"+data.image+"'/ width='250' height='250'>";
				document.getElementById("modaltitle").innerHTML = "<h3>&nbsp&nbsp"+data.title+"</h3>";
			/* 	document.getElementById("modalcontent").innerHTML = "<small>&nbsp&nbsp"+data.content+"</small>";  */
				$('#myModal').modal();      
				},
			error : function(){
					alert("실패");
				}
		});
		})
	});
		

</script>
</body>
</html>