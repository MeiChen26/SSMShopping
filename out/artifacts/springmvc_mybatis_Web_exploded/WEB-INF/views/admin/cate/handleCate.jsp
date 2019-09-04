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
	if($("#updatePicBut").val()=="修改商品分类图片"){
		$("#catePicDiv").append("<input class=\"form-control\" name=\"catePicFile\" id=\"catePicFile\" type=\"file\"  required/>");
		$("#updatePicBut").val("取消修改商品分类图片");
	}
	else{
		$("#catePicDiv").children("#catePicFile").remove();
		$("#updatePicBut").val("修改商品分类图片");
	}
	
}
</script>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  

          <h2 class="sub-header">${empty cate.cateId?"添加":"修改" }商品分类</h2>
          <div class="col-sm-4 col-sm-offset-3 col-md-5 col-md-offset-2">
            <c:if test="${!empty cate.catePic }">
            	<img src="${pageContext.request.contextPath}${cate.catePic}" width="171" height="180">
            </c:if>
         	<form class="form" role="form" id="addrForm"  method="post" action="${pageContext.request.contextPath}/admin/cate/doHandleCate" enctype="multipart/form-data">
					
					<input type="hidden" id="cateId" name="cateId" value="${empty cate.cateId?0:cate.cateId}"/>
					<div class="form-group">
						<label for="cateName"> 商品分类名称 </label> 
						<input class="form-control" name="cateName" id="cateName" value="${cate.cateName}" type="text"  placeholder="商品分类名称" required/>
					</div>
					<div class="form-group" id="catePicDiv">
						<label for="catePic"> 商品分类图片（图片规格：171*180）</label> 
						<c:if test="${empty cate.cateId }">
						<input class="form-control" name="catePicFile" id="catePicFile" type="file"  required/>
						</c:if>
						<c:if test="${!empty cate.cateId }">
						<input class="form-control btn-info" type="button" id="updatePicBut" value="修改商品分类图片" onclick="updatePic()"/>
						</c:if>
						<input type="hidden" name="catePic" value="${cate.catePic}"/>						
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