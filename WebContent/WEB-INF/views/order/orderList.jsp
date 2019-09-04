<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="cn.edu.neu.core.Constants"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/setReferUrl.jsp" %>
<%@include file="../common/userTopNav.jsp" %>
<script>
function handleOrder(orderId,status,msg,e){
	if(confirm(msg)){
		var os=$(e.target).parent().parent("#orderStatus");
		//alert($(e.target).parent().parent("#orderStatus").attr("id"))
		$.post(getContextPath()+"/order/handleOrderStatus",{orderId:orderId,status:status},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					if(status==2){
						os.html("已提交退款申请，请等待商家处理");
					}
					else if(status==5){
						os.html("交易成功<div class=\"text-right\"><a href=\"${pageContext.request.contextPath}/order/delOrder?orderId="+orderId+" onclick=\"return confirm('确定要删除这个订单吗？')\">删除订单</a></div>");
					}
					else if(status==6){
						os.html("已提交退货申请，请等待商家处理");
					}
					else if(status==9){
						os.html("交易关闭<div class=\"text-right\"><a href=\"${pageContext.request.contextPath}/order/delOrder?orderId="+orderId+" onclick=\"return confirm('确定要删除这个订单吗？')\">删除订单</a></div>");
					}
					$("#msgTitle").html("操作成功");
					$("#msgBody").html("订单操作成功");
					$("#msgModal").modal();	
				}else if(result.handle=="failure"){
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("抱歉，目前的订单状态无法进行此操作");
					$("#msgModal").modal();
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("操作订单失败");
					$("#msgModal").modal();
				}
			}
		});
	}
}
</script>
<div class="container-fluid">
	<div class="row">
	<div class="col-md-2">		
		<%@include file="../common/userorderLeftNav.jsp" %>
	</div>
	<div class="col-md-10"></div>
	<c:if test="${!empty orders.list}">
		
		<div class="col-md-10 ">
				<c:forEach items="${orders.list}" var="o" varStatus="vs">
				<div class="panel panel-info">
				<div class="panel-heading ">
					下单日期：<fmt:formatDate value="${o.orderDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 订单号：<a href="${pageContext.request.contextPath}/order/getOrderDetailById?orderId=${o.orderId}">${o.orderCode}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					订单状态：    <span id="orderStatus">
							<c:if test="${o.orderStatus==0}">
								等待付款
								<div class="text-right">
									<a href="#" onclick="handleOrder(${o.orderId},9,'确定要取消这个订单吗？',event);">取消订单</a> |
									<a href="${pageContext.request.contextPath}/order/toPay?orderId=${o.orderId}">去付款</a>
								</div>
							</c:if>
							<c:if test="${o.orderStatus==1}">
								未发货
								<div class="text-right"><a href="#" onclick="handleOrder(${o.orderId},2,'确定要申请退款吗？',event)">申请退款</a></div>
							</c:if>
							<c:if test="${o.orderStatus==2}">
								已提交退款申请，请等待商家处理
							</c:if>
							<c:if test="${o.orderStatus==3}">
								退款成功
							</c:if>
							<c:if test="${o.orderStatus==4}">
								已发货
								<div class="text-right">
									<a href="#" onclick="handleOrder(${o.orderId},5,'确定要收货吗？',event)">确认收货</a> | 
									<a href="#" onclick="handleOrder(${o.orderId},6,'确定要申请退货吗？',event)">申请退货</a>
								</div>
							</c:if>
							<c:if test="${o.orderStatus==5}">
								交易成功
								<div class="text-right">
									<a href="${pageContext.request.contextPath}/order/delOrder?orderId=${o.orderId}" onclick="return confirm('确定要删除这个订单吗？')">删除订单</a> 
								</div>
							</c:if>
							<c:if test="${o.orderStatus==6}">
								已提交退货申请，请等待商家处理
							</c:if>
							<c:if test="${o.orderStatus==7}">退货中</c:if>
							<c:if test="${o.orderStatus==8}">退货成功</c:if>
							<c:if test="${o.orderStatus==9}">
								交易关闭
								<div class="text-right">
									<a href="${pageContext.request.contextPath}/order/delOrder?orderId=${o.orderId}" onclick="return confirm('确定要删除这个订单吗？')">删除订单</a> 
								</div>
							</c:if>
							</span>
				</div>
				<div class="panel-body">		
				<table class="table table-hover table-condensed table-bordered">	
					<tbody>	
					<c:set var="orderDetails" value="${o.odetails }"/>
					<c:set var="totalAmount" value="0"/>
					<c:forEach items="${orderDetails}" var="od" varStatus="odvs">
					<tr>
						<td>
							<img src="${pageContext.request.contextPath}${od.odetailPic}" width="30" height="30">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=${od.goodsId}">${od.odetailName}</a>&nbsp;&nbsp;
							${od.odetailSize}&nbsp;&nbsp;${od.odetailColor}
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${od.odetailPrice}				
						</td>
						<td>
							${od.odetailNum}
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${od.odetailPrice*od.odetailNum }
							<c:set var="totalAmount" value="${totalAmount+od.odetailPrice*od.odetailNum}"/>
						</td>
					</tr>
					</c:forEach>
					
					</tbody>
				</table>
				<table class="table table-condensed">
					<tr>
						<td>
						<button class="btn btn-info" id="back" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/order/getOrderDetailById?orderId=${o.orderId}'">查看订单详情</button>
						</td>
						<td class="text-right">总金额（含运费${o.orderPostalfee}元）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${totalAmount+o.orderPostalfee }</td>
					</tr>
				</table>
				</div>
				</div>
				</c:forEach>
				<%@include file="../common/pageList.jsp" %>
		</div>
	</c:if>
	<c:if test="${empty orders.list}">
		<div class="alert alert-danger col-md-2 col-md-offset-1" role="alert">对不起，暂无此类订单信息</div>
	</c:if>
	</div>
</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>