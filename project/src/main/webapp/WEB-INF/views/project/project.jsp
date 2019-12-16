<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>																									
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/css/table.css">
<style type="text/css">
/* modal 위치 조절 */
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

/* 아래 오른쪽 고정 */
#footer {
		position: absolute;
		bottom: 0px;
		right: 0px;
}

/* 아래 왼쪽 고정 */
#footer1 {
		position: absolute;
		bottom: 0px;
		left: 0px;
}

/* 모달 가운데 높이 값 */
#center{
		height: 250px;
}

/* 모달 오른쪽 높이 값 */
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
        							     id="detail${status.index}" value="${list.pno}" class="detail"></a>&nbsp&nbsp&nbsp<br/>
        		<cite id="title">${list.title} / ${list.pno}</cite><br/><br/>
        		<c:if test="${user.id == 'admin'}">
        		<button class="btn btn-warning" id="updatebtn${status.index}" value="${list.pno}" name="update">수정</button>
        		<button class="btn btn-danger" id="deletebtn${status.index}" value="${list.pno}" name="delete">삭제</button>
        		</c:if>
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
        
        <!-- Modal --> 
         <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="diglog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
         	<div class="modal-content">
     
         	<div class="row">
         		 <div class="col-md-3">
         		 	<div id="modalimg"></div>
         		 </div> 
         		 
         		 <div class="col-md-6" id="center">
         		 	<div class="container" id="modaltitle"></div>
         		 	<div class="container" id="modalcontent"></div>
        		<div id="footer">
        			<span id="modallink"></span>
        			<span id="modalgit"></span>
         		</div>
         		</div> 
         		 
         		<div class="col-md-2" id="right">
         			<p id="modaltechnology"></p>
         		 	<div id="footer1">
         		 		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
		$("img").click(function(){
			var $detail = $(this).attr('id');
			var pno = $('#'+$detail).attr('value');
		$.ajax({
			url : "detail",
			data : {"pno" : pno},
			dataType : "json",
			success : function(data){
				$("#modalimg").html("<img src='${pageContext.request.contextPath}/resources/image/"+data.image+"'/ width='250' height='250'>");
				$("#modaltitle").html("<h3>&nbsp&nbsp"+data.title+"</h3>");
				$("#modalcontent").html("<h5>&nbsp&nbsp"+data.content+"</h5>");
				$("#modaltechnology").html("<h5>"+data.technology+"</h5>");
		 		$("#modallink").html("<button type='button' class='btn btn-default' onClick="+"window.open('"+data.link+"')>Link</button>");
		 		$("#modalgit").html("<button type='button' class='btn btn-default' onClick="+"window.open('"+data.git+"')>Git</button>");
				$("#myModal").modal();      
				},
			error : function(){
					alert("실패");
				}
		});
		})
	});

	//프로젝트 수정화면
	$(document).ready(function(){
		$("button[name=update]").click(function(){
			var $update = $(this).attr("id");
			var pno = $("#"+$update).attr("value");
			location.href="update?pno="+pno;
		});
	});

	//프로젝트 삭제
	$(document).ready(function(){
		$("button[name=delete]").click(function(){
			var $delete = $(this).attr("id");
			var pno = $("#"+$delete).attr("value");
			location.href="delete?pno="+pno;
		});
	});
	

</script>
</body>
</html>