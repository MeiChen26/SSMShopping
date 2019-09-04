<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function handleOrder(orderId,status,msg,e){
	if(confirm(msg)){
		var os=$("#orderStatus");			
		$.post(getContextPath()+"/admin/order/handleOrderStatus",{orderId:orderId,status:status},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					if(status==9){
						os.html("交易关闭");
					}
					else if(status==3){
						os.html("退款成功");
					}
					else if(status==7){
						os.html("退货中");
					}
					else if(status==8){
						os.html("退货成功");
					}
					
					$(e.target).attr("disabled","disabled");
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
function sendGoods(orderId,status){

	var os=$("#orderStatus");
	var pc=$("#orderPC");
	var pn=$("#orderPN");
	var orderPostname=$("#orderPostname").val();
	var orderPostcode=$("#orderPostcode").val();
	$.post(getContextPath()+"/admin/order/sendGoods",{orderId:orderId,status:status,orderPostname:orderPostname,orderPostcode:orderPostcode},function(result){
		if(checkLogin(result)){
			if(result.handle=="success"){
				if(status==4){
					os.html("已发货");
					pc.html(orderPostcode);
					pn.html(orderPostname)
				}
				
				$("#send").attr("disabled","disabled");
				
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
</script>
</head>
<body>
<%@include file="../../common/adminTopNav.jsp" %>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <div class="row">
        	<div class="col-md-12">
        	
        	
        	
        	
        	<c:if test="${!empty orderDetail}">
		
				<h3>订单详细信息</h3>
				<table class="table table-condensed table-hover">
					<tbody>
						<tr>
							<td>订单编号：${orderDetail.orderCode}</td>
							<td>创建时间：<fmt:formatDate value="${orderDetail.orderDate }" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td><c:set var="statusDisc" value="<%=Constants.ORDER_STATUS_DISC%>" />  
								订单状态：<span id="orderStatus">
									  ${statusDisc[orderDetail.orderStatus] } 
									  </span>
							</td>
							<td>送货地址：${orderDetail.orderAddress}</td>
						</tr>
						
						<tr>
							 <td>运单编号：<span id="orderPC">${empty orderDetail.orderPostcode?"暂无":orderDetail.orderPostcode}</span></td>
							 <td>快递名称：<span id="orderPN">${empty orderDetail.orderPostname?"暂无":orderDetail.orderPostname}</span></td>			 
						</tr>
						
					</tbody>
					</table>
				
				
				
					<div class="panel panel-info">
					<div class="panel-heading">商品列表</div>
					<div class="panel-body">	
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>#</th><th>商品图片</th><th>商品名称</th><th>商品单价</th><th>数量</th><th>小计</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="totalAmount" value="0"/>
							<c:set var="postalfee" value="${paramValues.goodsPostalfee[0]}"/>
							<c:forEach items="${orderDetail.odetails}" var="o" varStatus="vs">
		
							<tr ${vs.count%2==0?'class=\"info\"':''}>
								<td>
									${vs.count}
								</td>
								<td>
									<img src="${pageContext.request.contextPath}${o.odetailPic}" width="30" height="30">
								</td>
								<td>
									${o.odetailName}&nbsp;&nbsp;
									${o.odetailSize}&nbsp;&nbsp;${o.odetailColor}
								</td>
								<td>
									单价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${o.odetailPrice}
								</td>
								<td>
									${o.odetailNum}
								</td>
								<td>
									<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
									${o.odetailNum*o.odetailPrice}
								</td>
								<c:set var="totalAmount" value="${totalAmount+o.odetailNum*o.odetailPrice}"/>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					</div></div>
					<table class="table table-condensed">
						<tr><td class="text-right">运费：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${orderDetail.orderPostalfee}</td></tr>
						<tr><td class="text-right">订单总金额（含运费）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${totalAmount+orderDetail.orderPostalfee}</td></tr>
					</table>
					<div class="col-md-12 text-right">
					<c:if test="${orderDetail.orderStatus==0}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${orderDetail.orderId},9,'确定要取消这个订单吗？',event);">取消订单</button>
						
					</c:if>
					<c:if test="${orderDetail.orderStatus==1}">
						<button class="btn btn-primary" type="button" onclick="$('#postInfoFormModal').modal();" id="send">去发货</button>
					</c:if>
					<c:if test="${orderDetail.orderStatus==2}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${orderDetail.orderId},3,'确定要同意这个订单退款吗？',event);">同意退款</button>
					</c:if>
					
					<c:if test="${orderDetail.orderStatus==6}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${orderDetail.orderId},7,'确定要同意这个订单退货吗？',event);">同意退货</button>
					</c:if>
					<c:if test="${orderDetail.orderStatus==7}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${orderDetail.orderId},8,'确定收到这个订单退货吗？',event);">确认收到退货</button>
					</c:if>
					<c:if test="${orderDetail.orderStatus==5||orderDetail.orderStatus==9||orderDetail.orderStatus==3||orderDetail.orderStatus==8}">
						<button class="btn btn-primary" type="button" onclick="if(confirm('确定要删除这个订单吗？')) javascript:location.href='${pageContext.request.contextPath}/admin/order/delOrder?orderId=${orderDetail.orderId}'">删除订单</button>
					</c:if>
					<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href='<%=CommonBaseAction.getFullReferUrl()%>'">返回订单列表</button>
					</div>			 
				
			</c:if>
        	
        	
        	
        	
        	
        	
            </div>
          <c:if test="${empty orderDetail }">暂无订单详细信息</c:if>
        </div>
      </div>
    </div>
   </div>


<div class="modal fade" id="postInfoFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-inline" role="form" id="postForm"  method="post" action="">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加发货信息</h4>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<label for="orderPostname"> 快递公司名称 </label> 
						<input class="form-control" name="orderPostname" id="orderPostname" type="text"  placeholder="快递公司名称" required/>
					</div>
					<div class="form-group">
						<label for="orderPostcode"> 快递单号</label> 
						<input class="form-control" name="orderPostcode" id="orderPostcode" type="text" placeholder="快递单号" required/>
					</div>

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" data-dismiss="modal" onclick="sendGoods(${orderDetail.orderId },4)">确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>
<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>