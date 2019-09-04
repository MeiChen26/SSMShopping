<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="loginFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button"
					data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">用户登录</h4>
			</div>
			<div class="modal-body">
				<form class="form-signin" id="loginForm" method="post" >
					<h2 class="form-signin-heading">Please sign in</h2>
					<label for="userName" class="sr-only">Email address</label> 
					<input type="email" name="userName" id="userName" class="form-control"
						placeholder="Email address" required autofocus> 
					<label for="userPass" class="sr-only">Password</label> 
					<input type="password" name="userPass" id="userPass" class="form-control"
						placeholder="Password" required>
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							Remember me
						</label>
					</div>
					
				</form>

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" onclick="login('${redirUrl}')">登录</button>
				<button class="btn btn-default" type="button"
					data-dismiss="modal" 
					<c:if test="${!empty backUrl}">onclick=closeLogForm('${backUrl}')</c:if>   >关闭窗口</button>
				
			</div>
		</div>

	</div>

</div>
		
