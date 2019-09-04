<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>



<title>首页</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form class="form-signin" id="logform" method="post" action="${pageContext.request.contextPath}/user/login">
					<h2 class="form-signin-heading">Please sign in</h2>
					<label for="userName" class="sr-only">Email address</label> <input
						type="email" name="userName" id="userName" class="form-control"
						placeholder="Email address" required autofocus> <label
						for="password" class="sr-only">Password</label> <input
						type="password" name="password" id="password" class="form-control"
						placeholder="Password" required>
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							Remember me
						</label>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
						in</button>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>


	<!-- /container -->


	<div class="container-fluid">
		<div class="row">

			<div class="col-md-12">
				<p class="text-center">
					<a class="btn" id="modal-793086" role="button"
						href="#modal-container-793086" data-toggle="modal">用户注册</a>
				</p>

				<div class="modal fade" id="modal-container-793086" role="dialog"
					aria-hidden="true" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">

								<button class="close" aria-hidden="true" type="button"
									data-dismiss="modal">×</button>
								<h4 class="modal-title" id="myModalLabel">新用户注册</h4>
							</div>
							<div class="modal-body">
								<form role="form">
									<div class="form-group">

										<label for="userName"> 用户名 </label> <input
											class="form-control" id="userName" type="text" placeholder="用户名"/>
									</div>
									<div class="form-group">

										<label for="password"> 密码 </label> <input
											class="form-control" id="password" type="password" />
									</div>
									<div class="form-group">

										<label for="password1"> 密码确认 </label> <input
											class="form-control" id="password1"
											type="password" />
									</div>
									
									<div class="form-group">

										<label for="sex"> 性别 </label> 
										<div class="radio">
										  <label>
										    <input type="radio" name="sex" id="sex1" value="0" checked> 男
										  </label>
										  <label>
										    <input type="radio" name="sex" id="sex2" value="1"> 女
										  </label>
										</div>
										
									</div>
									<div class="form-group">
					 
										<label for="email">	邮箱</label>
										<input class="form-control" id="email" type="email" />
									</div>
									
									<div class="form-group">

										<label for="exampleInputFile"> File input </label> <input
											id="exampleInputFile" type="file" />
										<p class="help-block">Example block-level help text here.
										</p>
									</div>
									<div class="checkbox">

										<label> <input type="checkbox" /> Check me out
										</label>
									</div>
									
								</form>

							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" type="submit">注册</button>
								<button class="btn btn-default" type="button"
									data-dismiss="modal">关闭窗口</button>
								
							</div>
						</div>

					</div>

				</div>

			</div>

		</div>
		
	</div>
	
</body>
</html>
