<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
</head>
<body>
<%@include file="../include/header.jsp"%>
<c:set var="i" value="1"/>
<c:set var="j" value="1"/>
<div class="row">
    <div class="col-md-3"></div>
    
    <div class="col-md-6">

        <a href="${pageContext.request.contextPath}/project/register"><button type="button" class="btn btn-default" >프로젝트 등록</button></a>
        <div id="table"></div>
        <c:forEach var="list" items="${projectlist}">
        <div id="table">
        <div class="row">
        	11
        	12
        	13
        	    	
        </div>
        </div>
        
        <c:if test="${i%j == 0}">
        	<tr>	
        </c:if>
        
        		<td><img src="${pageContext.request.contextPath}/image/${list.id}"/></td>
        	
        		<td>${list.title}</td>

        	
        <c:if test="${i%j == j-1}">
        	</tr>
        </c:if>
        <c:set var="i" value="${i+1}"/>
        </c:forEach>
        </table>

		
        </div>



    <div class="col-md-4"></div>
</div>

<c:if test="${pregister != null}">
<script>
alert("${pregistermsg}");
</script>
</c:if>
</body>
</html>