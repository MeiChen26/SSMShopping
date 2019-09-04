<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="list-group" >
   	<ul class="nav nav-pills nav-stacked"  id="left_order">
   		<li  ${param.status==null?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders">全部订单</a></li>
		<li ${param.status==0?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=0">待付款订单</a></li>
		<li ${param.status==1?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=1">待发货订单</a></li>
		<li ${param.status==4?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=4">待收货订单</a></li>
		<li ${param.status==3?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=3">已退款订单</a></li>
		<li ${param.status==8?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=8">已退货订单</a></li>
		<li ${param.status==5?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=5">交易成功订单</a></li>
		<li ${param.status==9?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders?status=9">交易关闭订单</a></li>
   	</ul>				
</div>