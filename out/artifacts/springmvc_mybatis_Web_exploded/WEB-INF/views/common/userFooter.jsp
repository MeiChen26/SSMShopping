<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	var winHeight=$(window).height(); //浏览器当前窗口可视区域高度	
	var bodyHeight=$(document.body).height();//浏览器当前窗口文档body的高度
	var footerHeight=$('#bottomNav').height();
	
	if(bodyHeight<=winHeight-50){ 
		$("#bottomNav").addClass("navbar-fixed-bottom");
	}
	else{
		$("#bottomNav").removeClass("navbar-fixed-bottom");
	}
});


</script>
<div class="bottom">
  	<nav id="bottomNav">
    <div class="col-md-12">
    <ul class="breadcrumb text-center">
		<li><a href="#">店铺信息</a> <span class="divider"></span></li>
		<li><a href="#">商品目录</a> <span class="divider"></span></li>
		<li class="active"><a href="#">联系我们</a></li>
		<div class="text-primary">&copy;&nbsp;neusoft.2016</div>
	</ul>
	
	</div>
  	</nav>
</div>

