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
function handleAddressForm(addrId){
	if(addrId){
		$.post(getContextPath()+"/address/getAddressById",{addrId:addrId},function(result){
			if(checkLogin(result)){
				if(result.addr){
					$("#addressAjaxFormModal").modal();
					$("#addrProvince").val(result.addr.addrProvince);
					$("#addrCity").val(result.addr.addrCity);
					$("#addrArea").val(result.addr.addrArea);
					$("#addrContent").val(result.addr.addrContent);
					$("#addrReceiver").val(result.addr.addrReceiver);
					$("#addrTel").val(result.addr.addrTel);
					$("#addrId").val(result.addr.addrId);		
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("未读到当前地址信息");
					$("#msgModal").modal();
				}
			}
		});
	}
	else{
		$("#addressAjaxFormModal").modal();
	}
	
}
function handleAddress(){
	$("#addressAjaxFormModal").modal("hide");
	$.post(getContextPath()+"/address/handleAddressAjax",{addrId:$("#addrId").val(),addrProvince:$("#addrProvince").val(),addrCity:$("#addrCity").val(),addrArea:$("#addrArea").val(),
														addrContent:$("#addrContent").val(),addrReceiver:$("#addrReceiver").val(),addrTel:$("#addrTel").val()},
	function(result){
		if(checkLogin(result)){
			if(result){
				
				$("#myAddress").html(result);
				$("#submitOrder").removeAttr("disabled");
			}
			else{
				$("#msgTitle").html("操作失败");
				$("#msgBody").html("操作当前地址信息失败");
				$("#msgModal").modal();
			}
		}
	});
}
function delAddress(addrId){
	$.post(getContextPath()+"/address/delAddressAjax",{addrId:addrId},function(result){
		if(checkLogin(result)){
			if(result){
				$("#myAddress").html(result);
				
			}
			else{
				$("#msgTitle").html("操作失败");
				$("#msgBody").html("删除当前地址信息失败");
				$("#msgModal").modal();
			}
		}
	});
}
function setDefault(addrId,e){
	$.post(getContextPath()+"/address/setDefaultAddress",{addrId:addrId},function(result){
		if(checkLogin(result)){
			if(result.setDefault=="success"){
				$(".isDefault").html("");
				$(e.target).parent().siblings("[class='isDefault']").html("默认地址");
			}
			else{
				$("#msgTitle").html("操作失败");
				$("#msgBody").html("设置默认收货地址失败");
				$("#msgModal").modal();
			}
		}	
	});
}
function check(){
	return validateRadio("address","请选择收货地址");
}
</script>
<div class="container-fluid">
	<div class="row">
	<form action="${pageContext.request.contextPath}/order/addOrder" method="post" onsubmit="return validateRadio('address','请选择收货地址');">
		<div class="col-md-10 col-md-offset-1" id="myAddress">
		<c:if test="${!empty addrs}">
		<h3>确认收货地址</h3>
		<table class="table table-condensed table-hover">
			<tbody>				
				<c:forEach items="${addrs}" var="a" varStatus="vs">
				<tr>
					<td>
						<div class="radio">
						  <label>
						    <input type="radio" name="address" value="${a.addrProvince} ${a.addrCity} ${a.addrArea} ${a.addrContent} (${a.addrReceiver}收) ${a.addrTel}" ${a.addrIsdefault==1?'checked':'' }>
						   
						  </label>
						</div>						
					</td>
					<td>${a.addrProvince} ${a.addrCity} ${a.addrArea}</td>
					<td>${a.addrContent}</td>
					<td>(${a.addrReceiver}收) ${a.addrTel} </td>
					<td class="isDefault">${a.addrIsdefault==1?'默认地址':'' }</td>
					<td>
					 	<a href="#" onclick="handleAddressForm(${a.addrId})">修改</a> | 
					 	<a href="#" onclick="if(confirm('确定要删除这个收货地址吗？')) delAddress(${a.addrId});">删除</a>	| 
					 	<a href="#" onclick="setDefault(${a.addrId},event)">设为默认地址</a>				
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="btn btn-primary" type="button" onclick="handleAddressForm()">添加收货地址</button>
		</c:if>
		
		<c:if test="${empty addrs}">
			<h3>您目前没有收货地址，请先 <button class="btn btn-primary" type="button" onclick="handleAddressForm()">添加收货地址</button></h3>
			可以到个人中心<a href="${pageContext.request.contextPath}/address/getMyAddress">管理您的收货地址</a>
		</c:if>
		
		</div>
		<div class="col-md-10 col-md-offset-1">
			<h3>确认订单信息</h3>
			
			<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>#</th><th>商品图片</th><th>商品名称</th><th>商品单价</th><th>数量</th><th>小计</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalAmount" value="0"/>
					<c:set var="postalfee" value="${paramValues.goodsPostalfee[0]}"/>
					<c:forEach items="${paramValues.goodsId}" var="g" varStatus="vs">

					<tr ${vs.count%2==0?'class=\"info\"':''}>
						<td>
							${vs.count}
						</td>
						<td>
							<img src="${pageContext.request.contextPath}${paramValues.pic[vs.index]}" width="30" height="30">
						</td>
						<td>
							${paramValues.goodsName[vs.index]}&nbsp;&nbsp;
							${paramValues.size[vs.index]}&nbsp;&nbsp;${paramValues.color[vs.index]}
						</td>
						<td>
							原价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${paramValues.goodsPrice[vs.index]}&nbsp;&nbsp;
							现售<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${paramValues.goodsDiscount[vs.index]}
						</td>
						<td>
							${paramValues.num[vs.index]}
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
							${paramValues.num[vs.index]*paramValues.goodsDiscount[vs.index]}
						</td>
						<c:set var="totalAmount" value="${totalAmount+paramValues.num[vs.index]*paramValues.goodsDiscount[vs.index]}"/>
						<c:set var="postalfee" value="${postalfee>paramValues.goodsPostalfee[vs.index]?paramValues.goodsPostalfee[vs.index]:postalfee}"/>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table table-condensed">
				<tr><td class="text-right">运费：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${postalfee}</td></tr>
				<tr><td class="text-right">合计（含运费）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${totalAmount+postalfee}</td></tr>
			</table>
			<div ></div>
			<div class="col-md-12 text-right"><button id="submitOrder" class="btn btn-primary" type="submit" ${empty addrs?"disabled='disabled'":"" }>提交订单</button></div>				 
		</div>
		<input type="hidden" name="orderPostalfee" value="${postalfee}"/>
	</form>	
	</div>
</div>

<div class="modal fade" id="addressAjaxFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="form-inline" role="form" id="addrForm"  method="post" >
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加/修改收货地址</h4>
			</div>
			<div class="modal-body">
				
					<input type="hidden" id="addrId" name="addrId" value="0"/>
					<div class="form-group">
						<label for="addrProvince"> 省 </label> 
						<input class="form-control" name="addrProvince" id="addrProvince" type="text"  placeholder="省" required/>
					</div>
					<div class="form-group">
						<label for="addrCity"> 市</label> 
						<input class="form-control" name="addrCity" id="addrCity" type="text" placeholder="市" required/>
					</div>
					<div class="form-group">
						<label for="addrArea"> 区 </label> 
						<input class="form-control" name="addrArea" id="addrArea" type="text" placeholder="区" required/>
					</div>	
					<div class="form-group"> 
						<label for="addrContent"> 街道</label>
						<input class="form-control" name="addrContent" id="addrContent" type="text" placeholder="街道" required/>
					</div>				
					<div class="form-group">
						<label for="addrReceiver"> 收件人 </label> 
						<input class="form-control" name="addrReceiver" id="addrReceiver" type="text" placeholder="收件人" required/>					
					</div>					
					<div class="form-group"> 
						<label for="addrTel">	联系电话</label>
						<input class="form-control" name="addrTel" id="addrTel" type="text" placeholder="联系电话" required/>
					</div>				
				

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" onclick="handleAddress()">确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>