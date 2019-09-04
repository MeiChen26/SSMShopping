<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){ 
	$('#myCarousel').carousel(); 
});
</script>
<div class="col-md-12">
<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img  src="${pageContext.request.contextPath}/images/adver/1.jpg" alt="First slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>良品专卖</h1>
          <p></p>
          <p><a class="btn btn-lg btn-primary" href='#loginFormModal' data-toggle='modal'>登录</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="second-slide" src="${pageContext.request.contextPath}/images/adver/2.jpg" alt="Second slide">
      <div class="container">
        <div class="carousel-caption">       
          <p><a class="btn btn-lg btn-primary" href='#regFormModal' data-toggle='modal'>注册</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="third-slide" src="${pageContext.request.contextPath}/images/adver/3.jpg" alt="Third slide">
      <div class="container">
        <div class="carousel-caption">
          <p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=1" role="button">进入店铺</a></p>
        </div>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- /.carousel -->
</div>
    