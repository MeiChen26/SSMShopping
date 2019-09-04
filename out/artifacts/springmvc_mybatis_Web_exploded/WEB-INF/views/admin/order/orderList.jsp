<%@page import="cn.edu.neu.core.Constants"%>
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
<script type="text/javascript">
function selOrdersBut(formName,cbName){
	if($("#selAllOrders").is(":checked"))
		selectAll(formName,cbName);
	else
		unSelectAll(formName,cbName);
}
function check(){
	if(!validateCheckbox("orderIds","请至少选中一个订单"))
		return false;
	else
		return confirm("确实要删除选中的所有订单吗？");
}
function handleOrder(orderId,status,msg,e){
	if(confirm(msg)){
		var os=$(e.target).parent().siblings(".orderStatus");	
		
		$.post(getContextPath()+"/admin/order/handleOrderStatus",{orderId:orderId,status:status},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					
					var tdTag=$(e.target).parent();
					tdTag.html("");
					if(status==9){
						os.html("交易关闭");
					}
					else if(status==3){
						os.html("退款成功");
					}
					else if(status==7){
						os.html("退货中");
						tdTag.html("<a href=\"#\" onclick=\"handleOrder("+orderId+",8,'确定收到这个订单退货吗？',event);\">确认收到退货</a>");
					}
					else if(status==8){
						os.html("退货成功");
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
function sendGoods(orderId,status,e){
	$('#postInfoFormModal').modal();
	$("#ok").click(function(){
		var os=$(e.target).parent().siblings(".orderStatus");
		
		var orderPostname=$("#orderPostname").val();
		var orderPostcode=$("#orderPostcode").val();
		$.post(getContextPath()+"/admin/order/sendGoods",{orderId:orderId,status:status,orderPostname:orderPostname,orderPostcode:orderPostcode},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					if(status==4){
						os.html("已发货");
						$(e.target).parent().html("");
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
	});

	
	
}
</script>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <div class="row">
        	<div class="col-md-12">
        	<c:set var="statusDisc" value="<%=Constants.ORDER_STATUS_DISC%>" /> 
            <form class="form-inline" role="form" id="searchForm"  method="post" 
          action="${pageContext.request.contextPath}/admin/order/getAdminOrders">			
				<div class="form-group">
					<label for="orderStatus">  </label> 
					<select class="form-control input-sm" name="orderStatus" id="orderStatus">
					  <option value="-1">---所有状态---</option>
					  <c:forEach begin="0" end="9" var="i">
					  	<option value="${i}" ${param.orderStatus==i?'selected':''}>${statusDisc[i] }</option>
					  </c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="orderCode"> 订单号</label> 
					<input class="form-control input-sm" name="orderCode" id="orderCode" value="${param.orderCode}" type="number" placeholder="订单号" />
				</div>
				<div class="form-group">
					<label for="userName"> 用户名</label> 
					<input class="form-control input-sm" name="userName" id="userName" value="${param.userName}" type="text" placeholder="用户名" />
				</div>
				<div class="form-group">
					<label for="orderDate"> 下单日期 </label> 
					<input class="form-control input-sm" name="startDate" id="startDate" value="${param.startDate}" type="date" placeholder="起始日期" />-
					<input class="form-control input-sm" name="endDate" id="endDate" value="${param.endDate}" type="date" placeholder="终止日期" />
				</div>	
				<button class="btn btn-primary btn-sm" type="submit" >搜索</button>
			</form>
			</div>

		  </div>
		  
          
        
		  <h2 class="sub-header">订单信息列表</h2>
		  
          <c:if test="${!empty orders.list }">
          <div class="table-responsive ">
          	<form name="orderForm" method="post" action="${pageContext.request.contextPath}/admin/order/delOrderByIds" onsubmit="return check()">
          	<div class="row">
          	<div class="col-md-3"><button class="btn btn-primary" type="submit">批量删除</button></div>
          	<div class="col-md-2 col-md-offset-7">	
          	<div class="dropdown ">
			  <button class="btn btn-default dropdown-toggle btn-sm " type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			    	排序    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    
					<li>
						<a href="${pageContext.request.contextPath}/admin/order/getAdminOrders?orderStatus=${param.orderStatus}&orderCode=${param.orderCode}&userName=${param.userName}&startDate=${param.startDate}&endDate=${param.endDate }&sort=1">按订单日期排序</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/order/getAdminOrders?orderStatus=${param.orderStatus}&orderCode=${param.orderCode}&userName=${param.userName}&startDate=${param.startDate}&endDate=${param.endDate }&sort=2">按订单状态排序</a>
					</li>								
					<li>
						<a href="${pageContext.request.contextPath}/admin/order/getAdminOrders?orderStatus=${param.orderStatus}&orderCode=${param.orderCode}&userName=${param.userName}&startDate=${param.startDate}&endDate=${param.endDate }&sort=3">按用户名排序</a>
					</li>	
			  </ul>
		    </div>	
		    </div>
		    </div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th><input type="checkbox" id="selAllOrders" onchange="selOrdersBut('orderForm', 'orderIds')"/> 全选</th>
                  <th>#</th>
                  <th>订单号</th>
                  <th>用户名</th>
                  <th>订单状态</th>
                  <th>运费</th>
                  <th>下单日期</th>
                  
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${orders.list}" var="o" varStatus="vs">
                <tr>
                  <td><input type="checkbox" name="orderIds" value="${o.orderId }"/></td>
                  <td>${vs.count }</td>
                  <td><a href="${pageContext.request.contextPath}/admin/order/getOrderDetailById?orderId=${o.orderId}">${o.orderCode }</a></td>
                  <td>${o.userName }</td>
                  <td class="orderStatus">${statusDisc[o.orderStatus] }</td>
                  <td>${o.orderPostalfee }</td>
                  <td><fmt:formatDate value="${o.orderDate }" pattern="yyyy-MM-dd"/></td>

                  <td>
                  	
                  	<c:if test="${o.orderStatus==0}">
						<a href="#" onclick="handleOrder(${o.orderId},9,'确定要取消这个订单吗？',event);">取消订单</a>
						
					</c:if>
					<c:if test="${o.orderStatus==1}">
						<a href="#" onclick="sendGoods(${o.orderId},4,event)">去发货</a>
					</c:if>
					<c:if test="${o.orderStatus==2}">
						<a href="#" onclick="handleOrder(${o.orderId},3,'确定要同意这个订单退款吗？',event);">同意退款</a>
					</c:if>
					
					<c:if test="${o.orderStatus==6}">
						<a href="#" onclick="handleOrder(${o.orderId},7,'确定要同意这个订单退货吗？',event);">同意退货</a>
					</c:if>
					<c:if test="${o.orderStatus==7}">
						<a href="#" onclick="handleOrder(${o.orderId},8,'确定收到这个订单退货吗？',event);">确认收到退货</a>
					</c:if>
					<c:if test="${o.orderStatus==5||o.orderStatus==9||o.orderStatus==3||o.orderStatus==8}">
						<a href="#" onclick="if(confirm('确定要删除这个订单吗？')) javascript:location.href='${pageContext.request.contextPath}/admin/order/delOrder?orderId=${o.orderId}'">删除订单</a>
					</c:if>
                  	
				  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
            </form>
            <%@include file="../../common/pageList.jsp" %>
          </div>
          </c:if>
          <c:if test="${empty orders.list }">暂无订单信息</c:if>
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
				<button class="btn btn-primary" type="button" data-dismiss="modal" id="ok" >确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>
<%@include file="../../common/adminFooter.jsp" %>
</body>
</html>