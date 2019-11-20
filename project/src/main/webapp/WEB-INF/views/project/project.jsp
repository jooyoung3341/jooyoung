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
<!--     	<div class="row">
  		<div class="col-md-4"></div>
  		
        <div class="col-md-4"> -->
        <c:if test="${user.id == 'admin'}">
        	<a href="${pageContext.request.contextPath}/project/register"><button type="button" class="btn btn-default" >프로젝트 등록</button></a>
        </c:if>
        <div id="table">  
        <c:forEach var="list" items="${projectlist}">
        <br/><br/>
        <c:if test="${i%j == 0}">
       		<p class="row1">
        </c:if>
        	<span class="cell col1"><button type="button"><img src="${pageContext.request.contextPath}/resources/image/${list.image}"/ width="300" height="250"></button>&nbsp&nbsp&nbsp
        		<span align="center">${list.title}</span>
        	</span>
 	    <c:set var="i" value="${i+1}"/>      
        <c:if test="${i%j == 0}">
        	</p>
        </c:if>
        </c:forEach>
        </div>
<!--         </div>
        <div class="col-md-4"></div>
        </div> -->
        </div>


     <div class="col-md-2"></div> 
</div>


<c:if test="${pregister != null}">
<script>
alert("${pregistermsg}");
</script>
</c:if>
</body>
</html>