<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="reqPath" value="${pageContext.request.servletPath}"/> 
<ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
<li ${fn:contains(reqPath,"/admin/home")?"class='active'":""}>
    <a href="${pageContext.request.contextPath}/admin/home">
        <i class="glyphicon glyphicon-th-large"></i>
        首页 		
    </a>
</li>
<li ${fn:contains(reqPath,"/admin/cate")?"class='active'":""}>
    <a href="#cate" class="nav-header ${fn:contains(reqPath,'/admin/cate')?'':'collapsed'}" data-toggle="collapse">
        <i class="glyphicon glyphicon-th-list"></i>
        	商品分类管理
        
        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
    </a>
    <ul id="cate" class="nav nav-list secondmenu ${fn:contains(reqPath,'/admin/cate')?'':'collapse'}" style="height: auto;">
    	<li><a href="${pageContext.request.contextPath}/admin/cate/handleCate"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加商品分类</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/cate/getAdminCates"><i class="glyphicon glyphicon-list"></i>&nbsp;查看商品分类</a></li>
    </ul>
</li>
<li ${fn:contains(reqPath,"/admin/size")||fn:contains(reqPath,"/admin/color")?"class='active'":""}>
    <a href="#base" class="nav-header ${fn:contains(reqPath,'/admin/size')||fn:contains(reqPath,'/admin/color')?'':'collapsed'}" data-toggle="collapse">
        <i class="glyphicon glyphicon-briefcase"></i>
        	基本参数管理
        
        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
    </a>
    <ul id="base" class="nav nav-list secondmenu ${fn:contains(reqPath,'/admin/size')||fn:contains(reqPath,'/admin/color')?'':'collapse'}" style="height: auto;">
    	<li><a href="${pageContext.request.contextPath}/admin/size/getAdminSizes"><i class="glyphicon glyphicon-resize-full"></i>&nbsp;尺寸设置</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/color/getAdminColors"><i class="glyphicon glyphicon-edit"></i>&nbsp;颜色设置</a></li>
    </ul>
</li>

  <li ${fn:contains(reqPath,"/admin/goods")?"class='active'":""}>
	  <a href="#goods" class="nav-header ${fn:contains(reqPath,'/admin/goods')?'':'collapsed'}" data-toggle="collapse" > 
	  	<i class="glyphicon glyphicon-gift"></i>
       		 商品管理
        
        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span></a>
	  
	  <ul id="goods" class="nav nav-list secondmenu ${fn:contains(reqPath,'/admin/goods')?'':'collapse'}" style="height: auto;">
	    <li><a href="${pageContext.request.contextPath}/admin/goods/handleGoods"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加商品信息</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/goods/getAdminGoods"><i class="glyphicon glyphicon-list"></i>&nbsp;查看商品信息</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/goods/getGoodsPics"><i class="glyphicon glyphicon-picture"></i>&nbsp;商品图片管理</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/goods/getGoodsSizesAndColors"><i class="glyphicon glyphicon-tint"></i>&nbsp;尺寸颜色管理</a></li>
	    <li><a href="${pageContext.request.contextPath}/admin/goods/getGoodsStocks"><i class="glyphicon glyphicon-oil"></i>&nbsp;商品库存管理</a></li>
	  </ul>
	  
  </li>

   <li ${fn:contains(reqPath,"/admin/order")?"class='active'":""}>
	  <a href="#order" class="nav-header ${fn:contains(reqPath,'/admin/order')?'':'collapsed'}" data-toggle="collapse" >
	  <i class="glyphicon glyphicon-menu-hamburger"></i>
	  	订单管理
	  <span class="pull-right glyphicon glyphicon-chevron-toggle"></span></a>
	  
	  <ul id="order" class="nav nav-list secondmenu ${fn:contains(reqPath,'/admin/order')?'':'collapse'}" style="height: auto;">
	    <li><a href="${pageContext.request.contextPath}/admin/order/getAdminOrders"><i class="glyphicon glyphicon-list"></i>&nbsp;查看订单信息</a></li>
	    <li><a href="#sass-installation"><i class="glyphicon glyphicon-grain"></i>&nbsp;订单状态管理</a></li>
	  </ul>
	  
  </li>  

   <li ${fn:contains(reqPath,"/admin/user")?"class='active'":""}>
	  <a href="#user" class="nav-header ${fn:contains(reqPath,'/admin/user')?'':'collapsed'}" data-toggle="collapse" >
	  <i class="glyphicon glyphicon-user"></i>
	  	用户管理<span class="pull-right glyphicon glyphicon-chevron-toggle"></span></a>
	  
	  <ul id="user" class="nav nav-list secondmenu ${fn:contains(reqPath,'/admin/user')?'':'collapse'}" style="height: auto;">
	    <li><a href="#sass-installation"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加用户信息</a></li>
	    <li><a href="#sass-installation"><i class="glyphicon glyphicon-list"></i>&nbsp;查看用户信息</a></li>
	  </ul>
	  
  </li>  
  </ul>



