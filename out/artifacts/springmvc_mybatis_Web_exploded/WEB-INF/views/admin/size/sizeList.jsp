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
		  

          <h2 class="sub-header">商品尺寸列表</h2>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/size/handleSize" >添加商品尺寸</a>
          <c:if test="${!empty sizes.list }">
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品尺寸名称</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${sizes.list}" var="size" varStatus="vs">
                <tr>
                  <td>${vs.count }</td>
                  <td>${size.sizeName }</td>
                  <td>
                  	<a href="${pageContext.request.contextPath}/admin/size/handleSize?sizeId=${size.sizeId}">修改</a> |
                  	<a href="${pageContext.request.contextPath}/admin/size/delSize?sizeId=${size.sizeId}" onclick="confirm('确定要删除这个尺寸吗？')">删除</a>   
				  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
            <%@include file="../../common/pageList.jsp" %>
          </div>
          </c:if>
          <c:if test="${empty sizes.list }">暂无商品尺寸信息</c:if>
        </div>
      </div>
    </div>

<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>