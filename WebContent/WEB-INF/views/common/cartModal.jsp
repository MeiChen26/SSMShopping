<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="cartModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">					 
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
					×
				</button>
				<h4 class="modal-title" id="cartTitle">
					我的购物车
				</h4>
			</div>
			<form class="form-inline" role="form" action="${pageContext.request.contextPath}/order/buyGoods" method="post">
			<div class="modal-body" id="cartBody">					 
			
			</div>		
			<div class="modal-footer">
				<button class="btn btn-primary" type="submit" id="ok">去结算</button>		 
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>	
			</div>
			</form>	
		</div>
		
	</div>
</div>
		
    