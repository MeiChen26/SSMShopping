<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>
<script type="text/javascript">
function payForOrder(orderId){
	window.open(getContextPath()+"/order/pay?orderId="+orderId);
	clearCart();
	$("#confirmTitle").html("请确认");
	$("#confirmBody").html("请选择您属于下列哪种情况：");
	$("#confirmOk").html("付款成功");
	$("#confirmNo").html("付款遇到问题，未完成支付");  
	$("#confirmModal").modal();
	
	$("#confirmOk").click(function(){
		location.href=getContextPath()+"/order/payForOrder?orderId="+orderId;
	});
}
</script>


<div class="container-fluid">
	<div class="row">
	请选择付款方式：
	<form  method="post">
		<div class="col-md-10 col-md-offset-1">
		<button class="btn btn-primary" type="button" onclick="payForOrder(${orderId})">去网银付款</button>
		<button class="btn btn-primary" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/order/getMyOrders'">返回订单列表页面</button>
		</div>
	</form>
	</div>
</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>