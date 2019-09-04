<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="regFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">新用户注册</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="regForm"  method="post">
					<div class="form-group">
						<label for="userName"> 用户名 </label> 
						<input class="form-control" name="userName" id="userName" type="text" placeholder="用户名" required/>

					</div>
					<div class="form-group">
						<label for="userPass"> 密码 </label> 
						<input class="form-control" name="userPass" id="userPass" type="password" required/>
					</div>
					<div class="form-group">
						<label for="userPass1"> 密码确认 </label> 
						<input class="form-control" id="userPass1" type="password" required/>
					</div>	
					<div class="form-group"> 
						<label for="userAge"> 年龄</label>
						<input class="form-control" name="userAge" id="userAge" type="number" />
					</div>				
					<div class="form-group">
						<label for="userSex"> 性别 </label> 
						<div class="radio">
						  <label>
						    <input type="radio" name="userSex" id="sex1" value="0" checked> 男
						  </label>
						  <label>
						    <input type="radio" name="userSex" id="sex2" value="1"> 女
						  </label>
						</div>						
					</div>					
					<div class="form-group"> 
						<label for="userEmail">	邮箱</label>
						<input class="form-control" name="userEmail" id="userEmail" type="email" />
					</div>				
				</form>

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" onclick="reg()">注册</button>
				<button class="btn btn-default" type="button"
					data-dismiss="modal">关闭窗口</button>
				
			</div>
		</div>

	</div>

</div>