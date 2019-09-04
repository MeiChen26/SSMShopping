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
		  

          <h2 class="sub-header">商品分类列表</h2>
          <c:if test="${!empty cates.list }">
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品分类名称</th>
                  <th>商品分类图片</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${cates.list}" var="cate" varStatus="vs">
                <tr>
                  <td>${vs.count }</td>
                  <td>${cate.cateName }</td>
                  <td><img src="${pageContext.request.contextPath}${cate.catePic}" width="50" height="50"></td>
                  <td>
                  	<a href="${pageContext.request.contextPath}/admin/cate/handleCate?cateId=${cate.cateId}">修改</a> |
                  	<a href="${pageContext.request.contextPath}/admin/cate/delCate?cateId=${cate.cateId}" onclick="confirm('将删除此分类和此分类下所有商品，确定要删除这个分类吗？')">删除</a>   
				  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
            <%@include file="../../common/pageList.jsp" %>
          </div>
          </c:if>
          <c:if test="${empty cates.list }">暂无商品分类信息</c:if>
        </div>
      </div>
    </div>

<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>