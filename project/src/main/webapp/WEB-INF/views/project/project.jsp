<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<style type="text/css">
#table {display: table; width: 100%;}
.row1 {display: table-row;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
.col1 {width: 20%;}
</style>
</head>
<body>
<%@include file="../include/header.jsp"%>
<c:set var="i" value="3"/>
<c:set var="j" value="3"/>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">
        <c:if test="${user.id == 'admin'}">
        	<a href="${pageContext.request.contextPath}/project/register"><button type="button" class="btn btn-default" >프로젝트 등록</button></a>
        </c:if>
        
        <div id="table">  
        	<c:forEach var="list" items="${projectlist}">
        <br/><br/>
        <c:if test="${i%j == 0}">
       		<p class="row1">
        </c:if>
        	<span class="cell col1">
        		<button type="button" id="detail" value="${list.pno}"  data-toggle="modal" data-target="#myModal" >
        			<input type="hidden" id="pno" value="${list.pno}"/>
        			<img src="${pageContext.request.contextPath}/resources/image/${list.image}"/ width="300" height="250">
        		</button>&nbsp&nbsp&nbsp
        		<cite id="title">${list.title}</cite>
        	</span>
 	    <c:set var="i" value="${i+1}"/>      
        <c:if test="${i%j == 0}">
        	</p>
        </c:if><!-- 
       -->

      	  </c:forEach>
        </div>
	</div>

     <div class="col-md-2"></div> 
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <cite class="modal-title" id="myModalLabel">zzz</cite>
      </div>
      <div class="modal-body">
        Modal 내용
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>
         

<c:if test="${pregistermsg != null}">
<script>
alert("${pregistermsg}");
</script>
</c:if>
<script>

var pno = $('#pno').val();
document.getElementById("detail").addEventListener("click", function(){
	
	$.ajax({
			url : 'detail',
			data : {'pno' : pno},
			dataType : 'json',
			success : function(data){
					$('myMdal').modal();
					alert(pno)
				} 
	
		});
}); 

function getDetail(data){
	disp = '';
	disp += "<div class='modal fade' id='myModal' tabindex=''-1' role='dialog' aria-labelledby='myModalLabel'>";
	disp += "<div class='modal-dialog' role='document'>";
	disp += "<div class='modal-content'>";
	disp += "<div class='modal-header'>";
	disp += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
	disp += "<cite class='modal-title' id='myModalLabel'>zzz</cite>";
	disp += "</div>";
	disp += "div class='modal-body'>";
	disp += "Modal 내용";
	disp += "</div>";
	disp += "<div class='modal-footer'>";
	disp += "<button type='button' class='btn btn-default' data-dismiss='modal'>닫기</button>";
	disp += "</div>";
	disp += "</div>";
	disp += "</div></div>";

	
	
};
</script>
</body>
</html>