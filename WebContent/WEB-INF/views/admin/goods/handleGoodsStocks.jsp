<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../../common/adminTopNav.jsp" %>


    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  

          <h2 class="sub-header">管理商品库存</h2>
          <div class="col-sm-6 col-sm-offset-3 col-md-8 col-md-offset-2">
            <c:if test="${!empty goodsStocks }">
            
  				<div class="table-responsive ">
  				<form class="form" role="form" method="post" action="${pageContext.request.contextPath}/admin/goods/doHandleGoodsStocks" >
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>#</th>
	                  <th>商品名称</th>
	                  <th>商品尺寸</th>
	                  <th>商品颜色</th>
	                  <th>商品库存量</th>
	                  
	                </tr>
	              </thead>
	              <tbody>
	              	<c:forEach items="${goodsStocks }" var="s" varStatus="vs">              	
	                <tr>
	                  <td>${vs.count }</td>
	                  <td>${s.goodsName }
	                  <input type="hidden" name="goodsId" value="${s.goodsId }">
	                  
	                  </td>
	                  <td>${s.sizeName }
	                  <input type="hidden" name="sizeId" value="${s.sizeId }">
	                  
	                  </td>
	                  <td>${s.colorName }
	                  <input type="hidden" name="colorId" value="${s.colorId }">
	                  
	                  </td>
	                  <td><input type="number" name="stockNum" value="${s.stockNum }"></td>
	                  
	                </tr>
	               	</c:forEach>
	              </tbody>
	            </table>
	            <button type="submit" class="btn btn-primary">更新商品库存</button> 
				<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href='<%=CommonBaseAction.getFullReferUrl()%>'">返回列表</button>	           
	            </form>   
	               	
	          	</div>
			
			</c:if>
			<c:if test="${empty goodsStocks }">
				<h3>暂无商品库存信息<br>请先<a href="${pageContext.request.contextPath}/admin/goods/getGoodsSizesAndColors">添加商品尺寸和颜色信息</a></h3>
			</c:if>
			
		   </div>
		   
		   
        </div>
      </div>
    </div>

<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>