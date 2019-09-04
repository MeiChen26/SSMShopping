<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(
			function(){
				$('#execute_result').modal();
			}
	);
	
</script>
</head>
<body>
<c:set var="er" value="${execute_result}"/>

<c:forEach items="${er.redirURLs}" var="ru"> 
    <c:set var="redirKey" value="${ru.key}"/> 
    <c:set var="redirValue" value="${ru.value}"/> 
</c:forEach>

<div class="row">
	<div class="modal fade" id="execute_result" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					 
					<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
						×
					</button>
					<h4 class="modal-title" id="myModalLabel">
						信息提示
					</h4>
				</div>
				<div class="modal-body">
					<ul><c:forEach var="msg" items="${er.message}"><li>${msg}</li></c:forEach></ul>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal" 
					onclick="<c:if test="${redirValue=='@back'}">javaScript:history.go(-1)</c:if>
							 <c:if test="${redirValue=='@close'}">javaScript:window.close()</c:if>
							 <c:if test="${redirValue!=''&&redirValue!='@back'&&redirValue!='@close'}">javaScript:location.href='${pageContext.request.contextPath}${redirValue}'</c:if> ">
						${redirKey}
					</button> 
					
				</div>
			</div>
			
		</div>
		
	</div>
		
</div>
</body>
</html>