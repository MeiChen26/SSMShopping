<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	var winHeight=$(window).height(); //浏览器当前窗口可视区域高度	
	var bodyHeight=$(document.body).height();//浏览器当前窗口文档body的高度
	var footerHeight=$('#bottomNav').height();
	//alert(bodyHeight)
	//alert(winHeight)
	if(bodyHeight<=winHeight-100){ 
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
		
		<li><a href="http://glyphicons.com/">glyphicons.com</a> <span class="divider"></span></li>
		<li class="active"><a href="#">contact us</a></li>
		<div class="text-primary"><a href="#">Current version is: 1.0.1 (released 15. 02. 2016). </a> &copy;&nbsp;2010 - 2016 lby</div>
	</ul>
	
	</div>
  	</nav>
</div>

