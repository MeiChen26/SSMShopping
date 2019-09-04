<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/carousel.css" rel="stylesheet">

</head>
<body>
<%@include file="./common/userTopNav.jsp" %>

<div class="container-fluid">
	<div class="row">
		<%@include file="./common/adver.jsp" %>
		<div class="col-md-12">
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3>商品分类<a class="btn" href="${pageContext.request.contextPath}/cate/getAllCatesList">查看更多 »</a></h3>
			  </div>
			  <div class="panel-body" id="category">
			  <c:if test="${!empty cates }">
			    <c:forEach items="${cates}" var="c" varStatus="vs">
			    	<c:if test="${vs.count<=8}">
			    	<div class="col-xs-6 col-md-3">
			    		<div class="thumbnail">
			    			<a href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${c.cateId}">
			    			<img src="${pageContext.request.contextPath}${c.catePic}" alt="${c.cateName}"></a>
			    			<div class="caption" align="center"><p>${c.cateName}</p></div>
			    		</div>
			    	</div>
			    	</c:if>
			    </c:forEach>
			  </c:if>
			  <c:if test="${empty cates}">
				<div class="alert alert-danger col-md-2" role="alert">对不起，暂无相关信息</div>
			  </c:if>	
			  </div>
			</div>
		</div>

		<div class="col-md-12">
			<div class="panel panel-success">
			  <div class="panel-heading">
			    <h3>新到商品<a class="btn" href="${pageContext.request.contextPath}/goods/getNewGoods">查看更多 »</a></h3>
			  </div>
			  <div class="panel-body">			    			   		    
				<div id="newGoodsCarousel" class="carousel slide goods" data-ride="carousel">								   
				  	<div class="carousel-inner" id="newGoods">
					  <c:if test="${!empty newGoods }">

					  	<c:set var="index" value="0"/>
					    <c:forEach begin="0" end="${fn:length(newGoods)/4-1}" var="i" varStatus="vs">								
								<div class="item ${vs.first?'active':''} goods" >
								<div class="row">									
								<c:forEach begin="0" end="3" var="j">
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=${newGoods[index].goodsId}" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}${newGoods[index].goodsPic}" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">${newGoods[index].goodsName}
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${newGoods[index].goodsDiscount}</span></div>
				                		</div>
				                	</div>
				                	<c:set var="index" value="${index+1}"/>								
								</c:forEach>
				                </div>
								</div>
					    </c:forEach>
					  </c:if>
					  <c:if test="${empty newGoods}">
						<div class="alert alert-danger col-md-2" role="alert">对不起，暂无相关信息</div>
					  </c:if>	
				   	</div>
					<a class="left carousel-control" href="#newGoodsCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
					<a class="right carousel-control" href="#newGoodsCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
				</div>
			  </div>
			</div>
		</div>

		<div class="col-md-12">
			<div class="panel panel-warning">
			  <div class="panel-heading">
			    <h3>销售排行榜<a class="btn" href="${pageContext.request.contextPath}/goods/getSalesGoods">查看更多 »</a></h3>
			  </div>
			  <div class="panel-body" >
			    <div id="salesGoodsCarousel" class="carousel slide goods" data-ride="carousel">								   
				  	<div class="carousel-inner" id="salesGoods">
					  <c:if test="${!empty salesGoods }">
					  	<c:set var="index" value="0"/>
					    <c:forEach begin="0" end="${fn:length(salesGoods)/4-1}" var="i" varStatus="vs">								
								<div class="item ${vs.first?'active':''} goods" >
								<div class="row">									
								<c:forEach begin="0" end="3" var="j">
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=${salesGoods[index].goodsId}" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}${salesGoods[index].goodsPic}" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">${salesGoods[index].goodsName}
	                					<br>共售出<span class="badge">${salesGoods[index].goodsSales}件</span></div>
				                		</div>
				                	</div>
				                	<c:set var="index" value="${index+1}"/>								
								</c:forEach>
				                </div></div>							
					    </c:forEach>
					  </c:if>
					  <c:if test="${empty salesGoods}">
						<div class="alert alert-danger col-md-2" role="alert">对不起，暂无相关信息</div>
					  </c:if>	
				   	</div>
					<a class="left carousel-control" href="#salesGoodsCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
					<a class="right carousel-control" href="#salesGoodsCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
				</div>   
			  </div>
			</div>
			
		</div>
	</div>
</div>

<%@include file="./common/userFooter.jsp" %>
</body>
</html>