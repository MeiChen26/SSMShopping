<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>
<script type="text/javascript">

	/*全局变量*/
	var gwidth=360;//商品图片宽度
	var gheight=360;//商品图片高度
	var ctx;
	var img;
	var canvas1,canvas2;//原图像使用的canvas元素与放大镜中图像使用的canvas元素
	$(document).ready(function(){
		$("#nav li").removeClass("active");
		//$("#nav>li").eq(3).addClass("active");
		//$("#left_cate").removeAttr("data-spy");
		$("#rightPanel").affix({
	        offset: {
	            top: 125,
	            bottom: function () {
	                return (this.bottom = $('.bottom').outerHeight(true))
	            }
	     	}
	    });
		$("#rightPanel").on("affixed.bs.affix",function(){
			$("#rightPanel").removeClass("col-md-offset-1").addClass("col-md-offset-9");
		}).on("affix-top.bs.affix",function(){
			$("#rightPanel").removeClass("col-md-offset-9").addClass("col-md-offset-1");
		});
		
		/* var wd = $(".panel-pills").width();
		jQuery(window).scroll(function() {
			$("#rightPanel").css("width", wd);   
			 if($(window).scrollTop()>100){   
				 $("#rightPanel").removeClass("col-md-offset-1").addClass("col-md-offset-11");
			 }
		}); */
		
		$("[name='sizeButton']").click(function(){
			$(this).siblings().removeClass("btn-info");
			$(this).addClass("btn-info");
			var size=$(this).html();
			$("#size").val(size);
		});
		$("[name='colorButton']").click(function(){
			$(this).siblings().removeClass("btn-info");
			$(this).addClass("btn-info");	
			var color=$(this).html();
			$("#color").val(color);
		});
		
		
		canvas1=$("#canvas1").get(0);//获取原图像使用的canvas元素
	    canvas2=$("#canvas2").get(0);//获取放大镜中图像使用的canvas元素
		$("#canvas1").mousemove(canvas1_onmouse_move);//添加原图像获取鼠标焦点时的处理函数
		$("#canvas1").mouseout(canvas1_onmouse_out);//添加原图像失去鼠标焦点时的处理函数
		ctx=canvas1.getContext("2d");
		var image=$("#first_img").get(0);
		ctx.drawImage(image,0,0,canvas1.width,canvas1.height);//绘制第一幅
	});	

	//切换商品图片
	function changePic(image){ 
		ctx.clearRect(0,0,canvas1.width,canvas1.height);//擦除画布1中原图像
		ctx.drawImage(image,0,0,canvas1.width,canvas1.height);
		img=image;
	}
	//原图像获取鼠标焦点时的处理函数
	function canvas1_onmouse_move(ev){
	    var x,y;//鼠标在canvas元素中的相对坐标点
	    var drawWidth=canvas2.width;
	    var drawHeight=canvas2.height;//鼠标所指区域的宽度与高度
	    var context = canvas2.getContext('2d'); //获取放大镜中图像使用的canvas元素的图形上下文对象
	    $("#canvas2").css("display","inline");//显示放大镜
	    context.clearRect(0,0,canvas2.width,canvas2.height);//擦除放大镜中原图像
	    x=ev.pageX-$("#canvas1").offset().left+2;//鼠标在canvas元素中X轴上的相对坐标点+2,+2是为了避免鼠标移动到放大镜上
	    y=ev.pageY-$("#canvas1").offset().top+2;//鼠标在canvas元素中Y轴上的相对坐标点+2,+2是为了避免鼠标移动到放大镜上
	    $("#canvas2").css("left",x+"px");//设置放大镜在原图上的X轴上的坐标点
	    $("#canvas2").css("top",y+"px");//设置放大镜在原图上的Y轴上的坐标点
	    
	    //获取放大镜图像的图像源
	    var image = new Image(); 
		if(img==null){
			
			image.src=$("#first_img").attr("src");
		}
		else
			image.src=img.src;
		//alert(image.src);
	   /*  //获取鼠标所指区域的宽度  
	    if(x+40>canvas1.width)//如果鼠标所指区域的宽度超出原图宽度
	        drawWidth=canvas1.width-x;//设置鼠标所指区域宽度为原图中剩余宽度
	    else
	        drawWidth=200;//设置鼠标所指区域的宽度
	    //获取鼠标所指区域的高度  
	    if(y>canvas1.height)//如果鼠标所指区域的高度超出原图高度
	        drawHeight=canvas1.height-y;//设置鼠标所指区域高度为原图中剩余高度
	    else
	        drawHeight=200;//设置鼠标所指区域的高度 */

	    //放大2倍绘制放大镜图像
	    image.onload=function(){  
	        context.drawImage(image,x,y,drawWidth,drawHeight,0,0,drawWidth*2,drawHeight*2);
	    }
	}
	
	//鼠标移出原图像外
	function canvas1_onmouse_out(){

	    //重置canvas元素的位置
	    $("#canvas2").css("left","0px");
	    $("#canvas2").css("top","0px");
	    //隐藏放大镜
	    $("#canvas2").css("display","none");
	}
	function add(){
		var num=$("#num").val();
		var btn=$(".btn-info");
		var size,color;
		for(var i=0;i<btn.length;i++){
			if($(btn[i]).attr("name")=="sizeButton")
				size=$(btn[i]).html();
			else if($(btn[i]).attr("name")=="colorButton")
				color=$(btn[i]).html();
		}
		//alert(num+","+size+","+color);
		addCart(num,size,color);
		$("#cartBadge").html(cart.getGoodsList().length);
	}
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				
				<div class="col-md-2">		
					<%@include file="../common/userLeftNav.jsp" %>
				</div>	
				<form class="form-inline" role="form" action="${pageContext.request.contextPath}/order/buyGoods" method="post">	
				<input type="hidden" name="goodsId" value="${goodsDetail.goodsId}"/>
			  <input type="hidden" name="goodsName" value="${goodsDetail.goodsName}"/>
			    <input type="hidden" name="goodsPrice" value="${goodsDetail.goodsPrice}"/>
			 <input type="hidden" name="goodsDiscount" value="${goodsDetail.goodsDiscount}"/>
			  <input type="hidden" name="goodsPostalfee" value="${goodsDetail.goodsPostalfee}"/>
				<div class="col-md-6">
					<div class="row">
					
					<div class="col-md-12">
						<canvas id="canvas1" ></canvas>
						<canvas id="canvas2" ></canvas>
					</div>

					<div class="col-md-12">
					<c:if test="${!empty goodsDetail }">
					<label class="sr-only" id="cateId">${goodsDetail.cateId}</label>
						<c:forEach items="${goodsDetail.pics}" var="g" varStatus="vs">
							<c:if test="${vs.first }">
								<label class="sr-only" id="pic">${g.picUrl}</label>
								<%-- --%>
							</c:if>
							<div class="col-xs-2 col-sm-2" >
							    <a href="#" class="thumbnail" >
							      <img onmouseover="changePic(this)" src="${pageContext.request.contextPath}${g.picUrl}" alt="暂无图片" id="${vs.first?'first_img':''}">
							    </a>
						  	</div>
						</c:forEach>
					</c:if>	
					</div>

					<div class="col-md-12">
						<h3>商品详情</h3>
					</div>
					<div class="col-md-12">
						${goodsDetail.goodsDisc}
					</div>
					<c:forEach items="${goodsDetail.pics}" var="g" varStatus="vs">
						<div class="col-md-12">
						    <a href="#" class="thumbnail" >
						      <img src="${pageContext.request.contextPath}${g.picUrl}" alt="暂无图片" >
								<input type="hidden" name="pic" value="${g.picUrl}"/>
						    </a>
					  	</div>
					</c:forEach>
						
					</div>
					
					<c:if test="${empty goodsDetail}">
						<div class="alert alert-danger col-md-3" role="alert">对不起，暂无此商品信息</div>
					</c:if>			
				</div>

				<div class="col-md-3 col-md-offset-1 panel-pills" id="rightPanel" >
					
					<c:if test="${!empty goodsDetail && !empty goodsSizes && !empty goodsColors}">
					
					<div class="panel panel-info col-md-offset-1"  >
					  <!-- Default panel contents -->
					  
					  <label class="sr-only" id="goodsId">${param.goodsId }</label>
					  <div class="panel-heading text-success"><label id="goodsName">${goodsDetail.goodsName}</label></div>
					  <div class="panel-body">					 
					    <p><label>原价：</label><span class="glyphicon glyphicon-yen" aria-hidden="true"></span><label id="goodsPrice">${goodsDetail.goodsPrice}</label>
					    
						<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
						<label>现售：</label><span class="label label-pill label-info "><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
						<label id="goodsDiscount">${goodsDetail.goodsDiscount}</label></span>
						</p>

						<p><label>运费：</label><span class="glyphicon glyphicon-yen" aria-hidden="true"></span><label id="goodsPostalfee">${goodsDetail.goodsPostalfee}</label></p>
						<p>
							共售出${goodsDetail.goodsSales}件
						</p>
						<p>
							<label>尺寸选择：</label>
							<div class="btn-group" role="group">
							<c:forEach items="${goodsSizes.sizes }" var="s" varStatus="vs">
								<c:if test="${vs.first }">
									<input type="hidden" name="size" id="size" value="${s.sizeName}"/>
									
								</c:if>
								<button type="button" class="btn btn-default btn-xs ${vs.first?'btn-info':'' }" name="sizeButton">${s.sizeName}</button>						
							</c:forEach>
							</div>
						</p>
						<p>
							<label>颜色选择：</label>
							<div class="btn-group" role="group">
							<c:forEach items="${goodsColors.colors }" var="c" varStatus="vs">
								<c:if test="${vs.first }">
									<input type="hidden" name="color" id="color" value="${c.colorName}"/>
									
								</c:if>
								<button type="button" class="btn btn-default btn-xs ${vs.first?'btn-info':'' }" name="colorButton">${c.colorName}</button>						
							</c:forEach>
							</div>
						</p>
												
						<p>		
							<div class="form-group ">			 
								<label for="num">数量：</label>
								<div class="input-group input-group-sm col-xs-3">
								<input class="form-control" id="num" name="num" type="number" value="1"/>
								</div>
							</div>
							
						</p>
						<p>
							<button class="btn btn-primary btn-sm" type="submit">
								立即购买
							</button>
							<button class="btn btn-primary btn-sm" type="button" onclick="add()">
								加入购物车
							</button>
						</p>
						
					  </div>
					  
					  <!-- List group -->
					  <ul class="list-group">
					    <li class="list-group-item">产地：${goodsDetail.goodsOrigin}</li>
					    <li class="list-group-item">材质：${goodsDetail.goodsMaterial}</li>
					    <!--<li class="list-group-item">${goodsDetail.goodsDisc}</li>-->
					  </ul>
					</div>
					
					</c:if>		
					
				</div>
				</form>	
			</div>
		</div>
	</div>
</div>

<%@include file="../common/userFooter.jsp" %>
</body>
</html>