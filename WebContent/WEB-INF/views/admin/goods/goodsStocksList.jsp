<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../../common/setReferUrl.jsp" %>
<%@include file="../../common/adminTopNav.jsp" %>


    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div class="row">
        	<div class="col-md-10">
            <form class="form-inline" role="form" id="searchForm"  method="post" 
          action="${pageContext.request.contextPath}/admin/goods/getGoodsStocks">			
				<div class="form-group">
					<label for="cateId">  商品类别</label> 
					<select class="form-control input-sm" name="cateId" id="cateId">
					  <option value="0">---所有类别---</option>
					  <c:forEach items="${cates }" var="c">
					  	<option value="${c.cateId }" ${param.cateId==c.cateId?'selected':''}>${c.cateName }</option>
					  </c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="goodsName"> 商品名称</label> 
					<input class="form-control input-sm" name="goodsName" id="goodsName" value="${param.goodsName}" type="text" placeholder="商品名称" />
				</div>
				<div class="form-group">
					<label for="price"> 价格 </label> 
					<input class="form-control input-sm" name="startPrice" id="startPrice" value="${param.startPrice}" type="number" placeholder="起始价格" />-
					<input class="form-control input-sm" name="endPrice" id="endPrice" value="${param.endPrice}" type="number" placeholder="终止价格" />
				</div>	
				<button class="btn btn-primary btn-sm" type="submit" >搜索</button>
			</form>
			</div>
			<div class="col-md-2">
			<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle btn-sm" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			    	排序
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    
					<li>
						<a href="${pageContext.request.contextPath}/admin/goods/getGoodsSizesAndColors?cateId=${param.cateId}&goodsName=${param.goodsName}&startPrice=${param.startPrice}&endPrice=${param.endPrice }&sort=1">按价格从低到高</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/goods/getGoodsSizesAndColors?cateId=${param.cateId}&goodsName=${param.goodsName}&startPrice=${param.startPrice}&endPrice=${param.endPrice }&sort=2">按价格从高到低</a>
					</li>								
					<li class="divider">
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/goods/getGoodsSizesAndColors?cateId=${param.cateId}&goodsName=${param.goodsName}&startPrice=${param.startPrice}&endPrice=${param.endPrice }&sort=3">按销量从高到低</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/goods/getGoodsSizesAndColors?cateId=${param.cateId}&goodsName=${param.goodsName}&startPrice=${param.startPrice}&endPrice=${param.endPrice }&sort=4">按销量从低到高</a>
					</li>
				
			  </ul>
		    </div>
		    </div>
		  </div>
		  
          
        
		  <h2 class="sub-header">商品信息列表</h2>
						
          <c:if test="${!empty goods.list }">
          <div class="table-responsive ">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品名称</th>
                  <th>商品图片</th>
                  <th>商品总库存</th>
                  <th>商品总销量</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${goods.list}" var="g" varStatus="vs">
                <tr>
                  <td>${vs.count }</td>
                  <td>${g.goodsName }</td>
                  <td><img src="${pageContext.request.contextPath}${g.goodsPic}" width="50" height="50"></td>
                  <td>${g.goodsStock }</td>
                  <td>${g.goodsSales }</td>
                  <td>
                  	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/goods/handleGoodsStocks?goodsId=${g.goodsId}">管理商品库存</a> 
                  	
				  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
            <%@include file="../../common/pageList.jsp" %>
          </div>
          </c:if>
          <c:if test="${empty goods.list }">暂无商品信息</c:if>
        </div>
      </div>
    </div>

<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>