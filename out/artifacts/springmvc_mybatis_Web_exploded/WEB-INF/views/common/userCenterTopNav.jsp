<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(
		function(){
			//验证用户名是否可用
			$("#regForm #userName").blur(function(){
				$.post(getContextPath()+"/user/checkUserName",{userName:$("#regForm #userName").val()},function(result){
					if(result.available){
						$("#checkNameResult").html("该用户名可用");
					}
					else{
						$("#checkNameResult").html("对不起，该用户名已被占用，请更换");
					}
				});
			});
			//修改导航菜单选中状态
			$("#nav li").click(function(){
				$(this).siblings().removeClass("active");
				$(this).addClass("active");
			});
			//显示购物车中商品数量
			if(cart.getGoodsList()==false)
				$("#cartBadge").html(0);
			else
				$("#cartBadge").html(cart.getGoodsList().length);
			
			$.post(getContextPath()+"/cate/getAllCates",null,function(result){
			var cates=result.cates;
			if(cates && cates.length>0){
				var cateId=$.getUrlParam("cateId");
				for(var i=0;i<cates.length;i++){
					//上方导航下拉菜单-商品分类
					var s="<li><a href='"+getContextPath()+"/goods/getGoodsByCate?cateId="+cates[i].cateId+"'>"+cates[i].cateName+"</a></li>";
					$("#dropdown_cate").append(s);
					/* //左侧导航listgroup-商品分类						
					if(i==cateId-1)
						s="<a href='"+getContextPath()+"/goods/getGoodsByCate?cateId="+cates[i].cateId+"' class='list-group-item active'>"+cates[i].cateName+"</a>";
					else
						s="<a href='"+getContextPath()+"/goods/getGoodsByCate?cateId="+cates[i].cateId+"' class='list-group-item '>"+cates[i].cateName+"</a>";
					$("#left_cate").append(s); */
				}
			}
			else{
				$("#dropdown_cate").html("暂无相关信息");	
			}
		},"json");
		}
	);
	
	function login(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		$.post(getContextPath()+"/user/login",{userName:userName,password:password},
				function(result){
					$('#loginFormModal').modal('hide');
					if(result.login=="yes"){
						//alert("true");
						$("#info").html("<li id='li1'><span>"+userName+"您好，欢迎来到良品专卖店！</span>"+										
								 		"<li><a href='#' onclick='showCart()'>购物车 <span class='badge' id='cartBadge'></span></a></li>"+
								  		"<li><a href='${pageContext.request.contextPath}/order/getMyOrders'>我的订单</a></li>"+
								  		"<li><a href='${pageContext.request.contextPath}/usercenter/index'>个人中心</a></li>"+
								  		"<li><a href='#' onclick='logout()'>退出登录</a></li>");
						//显示购物车中商品数量
						$("#cartBadge").html(cart.getGoodsList().length);
					}
					else{
						//alert("false");
						$("#msgTitle").html("登录失败");
						$("#msgBody").html("用户名或密码错误");
						$("#msgModal").modal();
		
					}
				});
	}
	function logout(){
		$.post(getContextPath()+"/user/logout",null,function(){
			$("#info").html("<li id='li1'><span>游客您好，欢迎来到专卖店！</span>"+	
							"<a href='#loginFormModal' data-toggle='modal'>[登录]</a>&nbsp;<a href='#regFormModal' data-toggle='modal'>[新用户注册]</a></li>"+
			 				"<li><a href='#' onclick='showCart()'>购物车 <span class='badge' id='cartBadge'></span></a></li>");
			//显示购物车中商品数量
			$("#cartBadge").html(cart.getGoodsList().length);
		});
	}
	function reg(){
		$.post(getContextPath()+"/user/reg",$('#regForm').serialize(),function(result){
			$('#regFormModal').modal('hide');
			if(result.reg=="yes"){
				$("#msgTitle").html("注册成功");
				$("#msgBody").html("恭喜您，注册成功");
				$("#msgModal").modal();
			}
			else{
				$("#msgTitle").html("注册失败");
				$("#msgBody").html("对不起，注册失败");
				$("#msgModal").modal();
			}
		});
	}
	function checkLogin(result){
		if(result.login){
			//$("#msgTitle").html(result.login);
			//$("#msgBody").html(result.login);
			//$("#msgModal").modal();
			$("#loginFormModal").modal();
			return false;
		}
		return true;
	}
	function showCart(){
		var goodsList=cart.getGoodsList();//取出购物车商品
		var s="<h3>目前购物车为空，快去购物吧</h3>";
		if(goodsList!=null&&goodsList.length>0){
			$("#ok").removeAttr("disabled");
			s="<div class='table-responsive'><table class='table table-hover table-striped table-condensed '><thead><tr>"+
			"<th >#</th><th >商品图片</th><th >商品名称</th><th >商品单价</th><th >数量</th><th >小计</th><th >操作</th></tr></thead><tbody>";
			for(var i=0;i<goodsList.length;i++){
				var goods=goodsList[i];
				s+="<input type='hidden' name='goodsId' value='"+goods.id+"'/>";
				s+="<input type='hidden' name='size' value='"+goods.size+"'/>";
				s+="<input type='hidden' name='color' value='"+goods.color+"'/>";
				s+="<input type='hidden' name='goodsName' value='"+goods.name+"'/>";
				s+="<input type='hidden' name='pic' value='"+goods.pic+"'/>";
				s+="<input type='hidden' name='goodsPrice' value='"+goods.price+"'/>";
				s+="<input type='hidden' name='goodsDiscount' value='"+goods.discount+"'/>";
				s+="<input type='hidden' name='goodsPostalfee' value='"+goods.postalfee+"'/>";
				
				s+="<tr><td>"+(i+1)+"</td>";
				s+="<td><img src='"+getContextPath()+goods.pic+"' width='50' height='50'></td>";
				s+="<td><a href='"+getContextPath()+"/goods/getGoodsDetailById?goodsId="+goods.id+"&cateId="+goods.cateId+"'>"+goods.name+"</a><br>"+goods.size+"&nbsp;&nbsp;"+goods.color+"</td>";
				s+="<td>原价<span class='glyphicon glyphicon-yen' aria-hidden='true'></span>"+goods.price+
					"<br>现售<span class='glyphicon glyphicon-yen' aria-hidden='true'></span>"+goods.discount+"</td>";
				s+="<td><div class='input-group input-group-sm col-xs-5'><input class='form-control input-small' onblur='changeCart("+i+")' id='cartnum' name='num' type='number' value='"+goods.num+"'/></div></td>";	
				s+="<td><span class='glyphicon glyphicon-yen' aria-hidden='true'></span>"+goods.num*goods.discount+"</td>";
				s+="<td><a href='#' onclick='delCart("+i+")'>删除</a></td></tr>";
			}
			s+="</tbody></table></div>";
			s+="<a href='#' onclick='clearCart()'>清空购物车</a>";
			s+="<div class='text-right'>已选"+orderdetail.totalNumber+"件商品&nbsp;&nbsp;合计（不含运费）<span class='glyphicon glyphicon-yen' aria-hidden='true'></span>"+orderdetail.totalAmount+"</div>";
		}
		else{
			$("#ok").attr("disabled","disabled");
		}
		
		$("#cartBody").html(s);
		$("#cartModal").modal();
	}
	function delCart(index){
		cart.deleteGoods(index);
		showCart(); 
		$("#cartBadge").html(parseInt($("#cartBadge").html())-1);
	}
	function clearCart(){
		$("#cartBadge").html("0");
		$("#ok").attr("disabled","disabled");
		$("#cartBody").html("<h3>目前购物车为空，快去购物吧</h3>");
		cart.clearGoods();
	}
	function changeCart(index){
		var newnum=$("#cartnum").val();
		cart.updateGoodsNum(index,newnum);
		showCart();
	}
/* 	function makesure(msg){
		$("#confirmTitle").html("请确认");
		$("#confirmBody").html(msg);
		$("#confirmModal").modal();
		return flag;
	} */
</script>

<div class="container-fluid">
<div class="row">
		
		<div class="col-md-12 text-right">
			
			<ol class="breadcrumb" id="info">
				<c:if test="${sessionScope['_LOGIN_USER_']==null}">
					<li id="li1"><span>游客您好，欢迎来到良品专卖店！</span>
					<a href="#loginFormModal" data-toggle="modal">[登录]</a>&nbsp;<a href="#regFormModal" data-toggle="modal">[新用户注册]</a></li>
					<li><a href="#" onclick="showCart()">购物车 <span class="badge" id="cartBadge"></span></a></li>
				</c:if>
				<c:if test="${sessionScope['_LOGIN_USER_']!=null}">
					<li id="li1"><span>${sessionScope['_LOGIN_USER_'].userName }您好，欢迎来到良品专卖店！</span>										
					<li><a href="#" onclick="showCart()">购物车 <span class="badge" id="cartBadge"></span></a></li>
					<li><a href="${pageContext.request.contextPath}/order/getMyOrders">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath}/usercenter/index">个人中心</a></li>
					<li><a href="#" onclick="logout()">退出登录</a></li>
				</c:if>
			</ol>
			
		</div>
		
		<div class="col-md-12">
			<nav class="navbar navbar-default navbar-static-top" role="navigation">
					
				<div class="navbar-header">
				 
					<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button> <a class="navbar-brand" href="#">良品服装专卖店</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav" id="nav">
						<li class="active">
							<a href="${pageContext.request.contextPath}/">网站首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/getNewGoods">新到商品</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/getSalesGoods">热销商品</a>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" data-toggle="dropdown">商品分类<strong class="caret"></strong></a>
							<ul class="dropdown-menu" id="dropdown_cate">
								
							</ul>
						</li>
					</ul>

					<form class="navbar-form navbar-left form-inline " role="search" method="post" action="${pageContext.request.contextPath}/goods/searchGoods">
						<div class="form-group">
							<input class="form-control " type="text" name="keyword" value="${param.keyword}"/>
						</div> 
						
						<button class="btn btn-default" type="submit">
							店内搜索
						</button>
					</form>

					<ul class="nav navbar-nav navbar-right">
						
						<li class="dropdown" >
							<a class="dropdown-toggle" href="#" data-toggle="dropdown">排序<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<c:if test="${param.keyword!=null}">
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods?keyword=${param.keyword}&sort=1">按价格从低到高</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods?keyword=${param.keyword}&sort=2">按价格从高到低</a>
									</li>								
									<li class="divider">
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods?keyword=${param.keyword}&sort=3">按销量从高到低</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods?keyword=${param.keyword}&sort=4">按销量从低到高</a>
									</li>
								</c:if>
								<c:if test="${param.keyword==null}">
									
									<li>
										<a href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${param.cateId==null?1:param.cateId}&sort=1">按价格从低到高</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${param.cateId==null?1:param.cateId}&sort=2">按价格从高到低</a>
									</li>								
									<li class="divider">
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${param.cateId==null?1:param.cateId}&sort=3">按销量从高到低</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${param.cateId==null?1:param.cateId}&sort=4">按销量从低到高</a>
									</li>
								</c:if>
							</ul>
						</li>
						<li class="col-md-2"></li>
					</ul>
				</div>
				
			</nav>
		</div>
</div>
<%@include file="loginFormModal.jsp" %>

<%@include file="msgModal.jsp" %>

<%@include file="regFormModal.jsp" %>

<%@include file="cartModal.jsp" %>

<%@include file="confirmModal.jsp" %>
</div>