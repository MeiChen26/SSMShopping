<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>确认收货地址</h3>
<table class="table table-condensed table-hover">
	<tbody>				
		<c:forEach items="${addrs}" var="a" varStatus="vs">
		<tr>
			<td>
				<div class="radio">
				  <label>
				    <input type="radio" name="address" id="address" value="${a.addrProvince} ${a.addrCity} ${a.addrArea} ${a.addrContent} (${a.addrReceiver}收) ${a.addrTel}" ${a.addrIsdefault==1?'checked':'' }>
				   
				  </label>
				</div>						
			</td>
			<td>${a.addrProvince} ${a.addrCity} ${a.addrArea}</td><td>${a.addrContent}</td>
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
