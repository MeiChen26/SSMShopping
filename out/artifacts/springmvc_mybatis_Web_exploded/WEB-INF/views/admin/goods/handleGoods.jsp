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
<script type="text/javascript">
function updatePic(){
	if($("#updatePicBut").val()=="修改商品图片"){
		$("#goodsPicDiv").append("<input class=\"form-control\" name=\"goodsPicFile\" id=\"goodsPicFile\" type=\"file\"  required/>");
		$("#updatePicBut").val("取消修改商品图片");
	}
	else{
		$("#goodsPicDiv").children("#goodsPicFile").remove();
		$("#updatePicBut").val("修改商品图片");
	}
	
}
</script>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  

          <h2 class="sub-header">${empty goods.goodsId?"添加":"修改" }商品</h2>
          <div class="col-sm-6 col-sm-offset-3 col-md-8 col-md-offset-2">
            <c:if test="${!empty goods.goodsPic }">
            	<img src="${pageContext.request.contextPath}${goods.goodsPic}" width="242" height="200">
            </c:if>
         	<form class="form" role="form" method="post" action="${pageContext.request.contextPath}/admin/goods/doHandleGoods" enctype="multipart/form-data">
					
					<input type="hidden" id="goodsId" name="goodsId" value="${empty goods.goodsId?0:goods.goodsId}"/>
					<div class="form-group">
					<label for="cateId">  所属商品类别</label> 
					<select class="form-control input-sm" name="cateId" id="cateId">
					  <c:forEach items="${cates }" var="c">
					  	<option value="${c.cateId }" ${goods.cateId==c.cateId?'selected':''}>${c.cateName }</option>
					  </c:forEach>
					</select>
					</div>
					<div class="form-group">
						<label for="goodsName"> 商品名称 </label> 
						<input class="form-control" name="goodsName" id="goodsName" value="${goods.goodsName}" type="text"  placeholder="商品名称" required/>
					</div>
					<div class="form-group">
						<label for="goodsDisc"> 商品描述 </label> 
						<textarea class="form-control" name="goodsDisc" id="goodsDisc" rows="3" placeholder="商品描述" required>${goods.goodsDisc}</textarea>
					</div>
					<div class="form-group">
						<label for="goodsPrice"> 商品原价</label> 
						<input class="form-control" name="goodsPrice" id="goodsPrice" value="${goods.goodsPrice}" type="text"  placeholder="商品原价" required/>
					</div>
					<div class="form-group">
						<label for="goodsDiscount"> 商品折后价格 </label> 
						<input class="form-control" name="goodsDiscount" id="goodsDiscount" value="${goods.goodsDiscount}" type="text"  placeholder="商品折后价格" required/>
					</div>
					<div class="form-group">
						<label for="goodsStock"> 商品库存 </label> 
						<input class="form-control" name="goodsStock" id="goodsStock" value="${empty goods.goodsStock?0:goods.goodsStock}" type="number"  placeholder="商品库存" disabled required/>
					</div>
					<div class="form-group">
						<label for="goodsOrigin"> 商品产地 </label> 
						<input class="form-control" name="goodsOrigin" id="goodsOrigin" value="${goods.goodsOrigin}" type="text"  placeholder="商品产地" required/>
					</div>
					<div class="form-group">
						<label for="goodsMaterial"> 商品材质</label> 
						<input class="form-control" name="goodsMaterial" id="goodsMaterial" value="${goods.goodsMaterial}" type="text"  placeholder="商品材质" required/>
					</div>
					<div class="form-group">
						<label for="goodsPostalfee"> 商品运费</label> 
						<input class="form-control" name="goodsPostalfee" id="goodsPostalfee" value="${goods.goodsPostalfee}" type="number"  placeholder="商品运费" required/>
					</div>
					<div class="form-group">
						<label for="goodsDate"> 商品入货日期（格式yyyy-mm-dd，如2016-01-01）</label> 
						<jsp:useBean id="today" class="java.util.Date"/>
						<input class="form-control" name="goodsDate" id="goodsDate" 
						value="<c:if test="${empty goods.goodsDate}"><fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/></c:if><c:if test="${!empty goods.goodsDate}"><fmt:formatDate value='${goods.goodsDate}' pattern='yyyy-MM-dd'/></c:if>"
						type="date"  placeholder="商品入货日期" />
					</div>
					<div class="form-group">
						<label for="goodsSales"> 商品销量</label> 
						<input class="form-control" name="goodsSales" id="goodsSales" value="${empty goods.goodsSales?0:goods.goodsSales}" type="number"  placeholder="商品销量" disabled required/>
					</div>
					<div class="form-group" id="goodsPicDiv">
						<label for="goodsPic"> 商品图片（图片规格：242*200）</label> 
						<c:if test="${empty goods.goodsId }">
						<input class="form-control" name="goodsPicFile" id="goodsPicFile" type="file"  required/>
						</c:if>
						<c:if test="${!empty goods.goodsId }">
						<input class="form-control btn-info" type="button" id="updatePicBut" value="修改商品图片" onclick="updatePic()"/>
						</c:if>
						<input type="hidden" name="goodsPic" value="${goods.goodsPic}"/>
					
					</div>
					
		
				<button class="btn btn-primary" type="submit" >确定</button>
				<button class="btn btn-default" type="reset" >重置</button>
			
			</form>
		   </div>
        </div>
      </div>
    </div>

<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>