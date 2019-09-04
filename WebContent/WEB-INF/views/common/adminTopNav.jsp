<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.edu.neu.core.Constants"%>
<%@page import="cn.edu.neu.core.common.CommonBaseAction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/style.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/prettify.min.js"></script>
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/multiselect.min.js"></script>


<script type="text/javascript">

	$(document).ready(
		function(){
			
		});
	

	function logout(){
		$.post(getContextPath()+"/user/logout",null,function(){
			location.href=getContextPath()+"/admin";
		});
	}

	function checkLogin(result){
		if(result.login){
			//$("#msgTitle").html(result.login);
			//$("#msgBody").html(result.login);
			//$("#msgModal").modal();
			$("#loginFormModal").modal();
			return false;
		}
		return true;
	}

</script>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">后台管理</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath}/admin/cate/getAdminCates">商品分类管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/size/getAdminSizes">基本参数管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/goods/getAdminGoods">商品信息管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/order/getAdminOrders">订单信息管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/user/getAdminUsers">用户信息管理</a></li>
        <li><a href="#" onclick="logout()">退出登录</a></li>
      </ul>
      
    </div>
  </div>
</nav>
<%@include file="loginFormModal.jsp" %>

<%@include file="msgModal.jsp" %>

<%@include file="confirmModal.jsp" %>
</div>
