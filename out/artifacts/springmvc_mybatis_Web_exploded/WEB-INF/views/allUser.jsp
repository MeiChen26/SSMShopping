<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
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
    <title>用户列表</title>
    
	<script type="text/javascript">
	function edit(id){
		$.get("<%=basePath%>user/getUser?id="+id,function(data){
			if(data){
				$("#userName").val(data.userName);
				$("#userAge").val(data.userAge);
				$("#userPass").val(data.userPass);
				$("#userPass1").val(data.userPass);
				$("#userId").val(data.userId);
				$("#regFormModal").modal();
			}else{
				alert("操作异常");
			}
		});
	}
	function update(){
		$("#regForm").submit();
	}
	function del(id){
		$.get("<%=basePath%>user/delUser?id=" + id,function(data){
			if("success" == data.result){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败");
			}
		});
	}
</script>
  </head>
  
  <body>
    <h6><a href="<%=basePath%>user/toAddUser">添加用户</a></h6>
	<table border="1">
		<tbody>
			<tr>
				<th>姓名</th>
				<th>年龄</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty userList }">
				<c:forEach items="${userList.list}" var="user">
					<tr>
						<td>${user.userName }</td>
						<td>${user.userAge }</td>
						<td>
							<a href="javascript:edit(${user.userId })">编辑</a>
							<a href="javascript:del(${user.userId })" onclick="return confirm('确定要删除吗？')">删除</a>
						</td>
					</tr>				
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<%@ include file="./common/pageList.jsp"%>
	
	<div class="modal fade" id="regFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">新用户注册</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="regForm"  method="post" action="<%=basePath%>user/updateUser">
					<input name="userId" id="userId" type="hidden" value=""/>
					<div class="form-group">
						<label for="userName"> 用户名 </label> 
						<input class="form-control" name="userName" id="userName" type="text" placeholder="用户名" required/>
						<span id="checkNameResult"></span>
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
				<button class="btn btn-primary" type="button" onclick="update()">修改</button>
				<button class="btn btn-default" type="button"
					data-dismiss="modal">关闭窗口</button>
				
			</div>
		</div>

	</div>

</div>
  </body>
</html>
