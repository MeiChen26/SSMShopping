<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/userCenterTopNav.jsp" %>
<script type="text/javascript">
function handleAddressForm(addrId){
	if(addrId){
		$.post(getContextPath()+"/address/getAddressById",{addrId:addrId},function(result){
			if(checkLogin(result)){
				if(result.addr){
					$("#addressFormModal").modal();
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
		$("#addressFormModal").modal();
	}
	
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
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@include file="../common/userCenterLefNav.jsp" %>
		</div>
		<div class="col-md-10">
			<div><button class="btn btn-primary" type="submit" onclick="handleAddressForm()">添加收货地址</button></div>		
			<table class="table table-condensed table-hover">
			<thead>
					<tr>
						<th>#</th><th>省-市-区</th><th>街道</th><th>收件人</th><th>电话</th><th>默认地址</th><th>操作</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${addrs}" var="a" varStatus="vs">
				<tr>
					 <td>${vs.count }</td>
					 <td>
					 	${a.addrProvince} ${a.addrCity} ${a.addrArea}
					 </td>
					 <td>
					 	${a.addrContent}</td><td>${a.addrReceiver}
					 </td>
					 <td> 
					 	${a.addrTel} 
					 </td>
					 <td class="isDefault">${a.addrIsdefault==1?'默认地址':'' }</td>
					 <td>
					 	<a href="#" onclick="handleAddressForm(${a.addrId})">修改</a> | 
					 	<a href="${pageContext.request.contextPath}/address/delAddress?addrId=${a.addrId}" onclick="return confirm('确定要删除这个收货地址吗？')">删除</a>	| 
					 	<a href="#" onclick="setDefault(${a.addrId},event)">设为默认地址</a>				
					 </td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
					 
		</div>
	</div>
</div>

<%@include file="../common/addressFormModal.jsp" %>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>