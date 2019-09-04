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
		  

          <h2 class="sub-header">${empty color.colorId?"添加":"修改" }商品颜色</h2>
          <div class="col-sm-4 col-sm-offset-3 col-md-5 col-md-offset-2">
         	<form class="form" role="form" id="addrForm"  method="post" action="${pageContext.request.contextPath}/admin/color/doHandleColor" >
					
					<input type="hidden" id="colorId" name="colorId" value="${empty color.colorId?0:color.colorId}"/>
					<div class="form-group">
						<label for="colorName"> 商品颜色名称 </label> 
						<input class="form-control" name="colorName" id="colorName" value="${color.colorName}" type="text"  placeholder="商品颜色名称" required/>
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