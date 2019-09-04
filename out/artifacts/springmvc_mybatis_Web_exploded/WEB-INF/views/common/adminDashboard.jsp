<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1 class="page-header">后台管理</h1>

<div class="row placeholders">
  <div class="col-xs-5 col-sm-2 ">
    <img src="${pageContext.request.contextPath}/images/admin/cate.png" width="150" height="150"  alt="商品分类管理">
    <h4><a href="${pageContext.request.contextPath}/admin/cate/getAdminCates">商品分类管理</a></h4>
    <span class="text-muted">对商品分类进行添加、修改和删除</span>
  </div>
  <div class="col-xs-5 col-sm-2 ">
    <img src="${pageContext.request.contextPath}/images/admin/settings.png" width="150" height="150" alt="基本参数管理">
    <h4><a href="${pageContext.request.contextPath}/admin/size/getAdminSizes">基本参数管理</a></h4>
    <span class="text-muted">对商品尺寸和颜色进行添加、修改和删除</span>
  </div>
  <div class="col-xs-5 col-sm-2 ">
    <img src="${pageContext.request.contextPath}/images/admin/goods.png" width="150" height="150" alt="商品信息管理">
    <h4><a href="${pageContext.request.contextPath}/admin/goods/getAdminGoods">商品信息管理</a></h4>
    <span class="text-muted">对商品进行添加、修改和删除</span>
  </div>
  <div class="col-xs-5 col-sm-2 ">
    <img src="${pageContext.request.contextPath}/images/admin/orders.png" width="150" height="150" alt="订单信息管理">
    <h4><a href="${pageContext.request.contextPath}/admin/order/getAdminOrders">订单信息管理</a></h4>
    <span class="text-muted">对订单状态进行维护</span>
  </div>
  <div class="col-xs-4 col-sm-2 ">
    <img src="${pageContext.request.contextPath}/images/admin/user.png" width="150" height="150" alt="用户信息管理">
    <h4><a href="${pageContext.request.contextPath}/admin/user/getAdminUsers">用户信息管理</a></h4>
    <span class="text-muted">对用户进行添加、修改和删除</span>
  </div>
</div>