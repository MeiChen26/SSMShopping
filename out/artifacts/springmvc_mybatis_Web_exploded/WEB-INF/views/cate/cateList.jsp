<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav li").removeClass("active");
		$("#nav>li").eq(3).addClass("active");
	});	
</script>
<div class="container-fluid">
	<div class="row">		
		<div class="col-md-12">
			<div class="row">
			<c:if test="${!empty cates }">
			<c:forEach items="${cates}" var="c">
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${c.cateId}">
			    		<img src="${pageContext.request.contextPath}${c.catePic}" alt="${c.cateName}"></a>
			    		<div class="caption" align="center"><p>${c.cateName}</p></div>
					</div>
				</div>
			</c:forEach>
			</c:if>		
			</div>
			<c:if test="${empty cates}">
				<div class="alert alert-danger col-md-2" role="alert">对不起，暂无商品分类</div>
			</c:if>			
		</div>
	</div>
</div>
<%@include file="../common/userFooter.jsp" %>	
</body>
</html>