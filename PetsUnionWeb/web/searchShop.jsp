<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Products</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
				function hideURLbar(){ window.scrollTo(0,1); } </script>
				
		<!-- Custom Theme files -->
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
		<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->  
		<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" />   
		<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
		<!-- //Custom Theme files -->
		
		<!-- font-awesome icons -->
		<link href="css/font-awesome.css" rel="stylesheet"> 
		<!-- //font-awesome icons -->
		
		<!-- js -->
		<script src="js/jquery-2.2.3.min.js"></script> 
		<script src="js/owl.carousel.js"></script>
		<!-- //js --> 
		
		<!-- web-fonts -->
		<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
		<!-- web-fonts --> 
		
		<!-- scroll to fixed--> 
		<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
		<script>
		<!-- @@ 全局变量 pageNumber计数器 -->
		var pageNumber=1;
		<!-- @@ pageNumber计数器 -->
		$(document).ready(function() {

			// Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

			$('.header-two').scrollToFixed();   
			// previous summary up the page.

			var summaries = $('.summary');
			summaries.each(function(i) {
				var summary = $(summaries[i]);
				var next = summaries[i + 1];

				summary.scrolltofixed({
					margintop: $('.header-two').outerheight(true) + 10, 
					zindex: 999
				});
			});
		});
		</script>
		<!-- //scroll to fixed--> 
		
		<!-- start-smooth-scrolling -->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>	
		<script type="text/javascript">
				jQuery(document).ready(function($) {
					$(".scroll").click(function(event){		
						event.preventDefault();
						$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
					});
				});
		</script>
		<!-- //end-smooth-scrolling -->
		
		<!-- smooth-scrolling-of-move-up -->
		<script type="text/javascript">
			$(document).ready(function() {
	
				var defaults = {
					containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
				};
		
				$().UItoTop({ easingType: 'easeOutQuart' });
		
			});
		</script>
		<!-- //smooth-scrolling-of-move-up --> 
		
		<!-- the jScrollPane script -->
		<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
		<!-- //the jScrollPane script -->
		
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<!-- the mousewheel plugin --> 
		
	</head>
	
<body>
	<!-- header -->
	<div class="header">
		<div class="uniform-header"><!--header-one--> 
			<div class="uniform-header-right">
				<ul>
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i> 我的账号<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.html">登录 </a></li> 
							<li><a href="signup.html">注册</a></li> 
							<li><a href="login.html">我的订单</a></li>  
						</ul> 
					</li> 
					<li class="dropdown head-dpdn">
						<a href="help.html" class="dropdown-toggle"><i class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div> 
		</div>
		
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.html"><span>PETS</span>union </a></h1>
					<h2>Your stores. Your friends.</h2> 
				</div>	
				<div class="header-search">
					<form method="#" action="#">
						<input type="search" id="search" name="Search" placeholder="请输入宠物类型或服务类型..." required="">
						<button type="button" id="submit" class="btn btn-default" aria-label="Left Align" >
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="header-cart"> 
					<div class="my-account">
						<a href="contact.html"><i class="fa fa-map-marker" aria-hidden="true"></i> 联系我们</a>						
					</div>
					<div class="clearfix"> </div> 
				</div> 
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="move-text">
					<div class="marquee" style="width:1100px;float:none;"><a href="offers.html"> 双十一萌宠PARTY，单身宠物不孤单...... <span>THU宠物护理中心开放日 </span> <span> 昌平宠物滑雪场，给您的宠物放个假吧!</span></a></div>
					<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
					<script>
					  $('.marquee').marquee({ pauseOnHover: true });
					  //@ sourceURL=pen.js
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- //header --> 	
	
	<!-- products -->
	<div class="products">	 
		<div class="container">
			<div class="col-md-9 product-uniform-right" >
				<ol class="breadcrumb breadcrumb1">
					<li><a href="index.jsp">首页</a></li>
					<li class="active">搜索页面</li>
				</ol> 
				<div class="clearfix"> </div>
				
				<div class="product-top" >
					<p>搜索结果: 第1页</p>
					<div class="clearfix"> </div>
				</div>
				
				<button type="button" id="nextpage" class="btn btn-default" aria-label="Left Align" >
					<p class="nextpage">下一页</p>
				</button>
				<button type="button" id="lastpage" class="btn btn-default" aria-label="Left Align" >
					<p class="lastpage">上一页</p>
				</button>
				<div class="products-block" margin-top=4em>
				</div>
			</div>
			
			<!-- @@ get the shop information -->
			<script>
			function getQuery(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null) return unescape(r[2]); return null;
			}
			</script>
			<!-- get the shop information -->

			<!-- @**@ load the shop information when first enter -->
		    <script type="text/javascript">
			/* $(document).ready(function(){
				alert("开始加载搜索界面！");
				
				var $search=decodeURI(getQuery("search"));
				alert("上一个页面请求的search是："+$search);
				
				$("input#search").attr("value",$search);
			
				$.ajax({
					url:"SearchShopServlet",
					type:"post",
					data:{
						page:1,
						petsType: $search,
						serviceType: $search
					},
					cache:false,
					dataType:"json",
					success:function(data) {
						console.log(data);
						var resp=data.shop;
						
						var $product=$("<div>").addClass("products-block");
						for(var i = 0; i < resp.length; i ++) {
							var $shopTel=$("<p>").text("电话:").addClass("tel").attr("value",resp[i].shopTel).append(resp[i].shopTel);
							var $credit=$("<p>").text("评分:").addClass("credit").attr("value",resp[i].instruction).append(resp[i].instruction);
							var $address=$("<p>").text("地点:").addClass("address").attr("value",resp[i].address).append(resp[i].address);
							var $name=$("<p>").text("店名:").addClass("name").attr("value",resp[i].shopName).append(resp[i].shopName);
							var $picture=$("<img>").addClass("img").attr("src", resp[i].shopImgUrl).attr("alt", resp[i].shopName);
							var $content=$("<article>");
							var $link=$("<a>").attr("herf", "shopDetail.jsp?shopName="+resp[i].shopName+"&credit="+resp[i].instruction+"&address="+resp[i].address
								+"&img="+resp[i].shopImgUrl+"&shopTel="+resp[i].shopTel);
							var $move=$("<div>").addClass("clearfix");
							var $goodbox=$("<div>").addClass("products-row");
							var $jump=$("<button>").attr("value",resp[i].shopImgUrl).attr("id","jump").append($("<P>").text("查看详情/预约"));
							
							$link.append($picture);
							$content.append($name);
							$content.append($credit);
							$content.append($shopTel);
							$content.append($address);
							$content.append($jump);
							
							$goodbox.append($link);
							$goodbox.append($content);
							$goodbox.append($move);
							$goodbox.find("*").attr("style","border:0px;");
							
							$product.append($goodbox);
							
							$jump.click(function(){
								var $shopImg=$(this).val();
								var $cre=encodeURI(encodeURI($(this).parent().find(".credit").attr("value")));
								var $add=encodeURI(encodeURI($(this).parent().find(".address").attr("value")));
								var $Name=encodeURI(encodeURI($(this).parent().find(".name").attr("value")));
								var $search=encodeURI(encodeURI(document.getElementById("search").value));
								var $tel=$(this).parent().find(".tel").attr("value");
								
								alert("您点击了"+$Name);
								window.open("shopDetail.jsp?shopName="+$Name+"&credit="+$cre+"&address="+$add+"&img="+$shopImg+"&shopTel="+$tel+"&search="+$search);
								alert("已经打开了新窗口");
							});
						}
						$(".col-md-9").append($product);
					}
				});
						
				alert("搜索界面加载完成！");
			}); */
			</script>
			<!-- //load the shop information when first enter -->
			
			<!-- @$$@ just for test of last section-->
			<script type="text/javascript">
			$(document).ready(function(){
				alert("开始加载搜索界面！");
				
				var $search=decodeURI(getQuery("search"));
				alert("上一个页面的搜索请求是："+$search);
				$("input#search").attr("value",$search);
			
				$(".products-block").remove();
				for(var i = 0; i < 1; i ++) {
					var $shopTel=$("<p>").attr("value","110").text("电话:").addClass("tel").append(" 110");
					var $credit=$("<p>").attr("value","100分").text("评分:").addClass("credit").addClass("credit").append(" 100分");
					var $address=$("<p>").attr("value","THU紫荆网球场西侧").text("地点:").addClass("address").append(" THU紫荆网球场西侧");
					var $name=$("<p>").attr("value","THU宠物中心").addClass("name").text("店名:").append(" THU宠物护理中心");
					var $picture=$("<img>").attr("src", "images/e1.jpg").attr("alt", "THU宠物中心");
					var $content=$("<article>");
					var $link=$("<a>").attr("herf", "shopDetail.jsp?shopName=THU宠物中心");
					var $move=$("<div>").addClass("clearfix");
					var $goodbox=$("<div>").addClass("products-row");
					var $product=$("<div>").addClass("products-block");
					var $jump=$("<button>").attr("value","images/e1.jpg").attr("id","jump").append($("<P>").text("查看详情/预约"));
					
					$link.append($picture);
					$content.append($name);
					$content.append($credit);
					$content.append($shopTel);
					$content.append($address);
					$content.append($jump);
					
					$goodbox.append($link);
					$goodbox.append($content);
					$goodbox.append($move);
					$goodbox.find("*").attr("style","border:0px;");
					
					$product.append($goodbox);
					$jump.click(function(){
						var $shopImg=$(this).val();
						var $cre=encodeURI(encodeURI($(this).parent().find(".credit").attr("value")));
						var $add=encodeURI(encodeURI($(this).parent().find(".address").attr("value")));
						var $Name=encodeURI(encodeURI($(this).parent().find(".name").attr("value")));
						var $search=encodeURI(encodeURI(document.getElementById("search").value));
						var $tel=$(this).parent().find(".tel").attr("value");
						
						alert("您点击了"+$Name);
						window.open("shopDetail.jsp?shopName="+$Name+"&credit="+$cre+"&address="+$add+"&img="+$shopImg+"&shopTel="+$tel+"&search="+$search);
						alert("已经打开了新窗口");
					});
				}
				$(".col-md-9").append($product);
						
				alert("搜索界面加载完成！");
			});
			</script>
			<!-- //just for test of last section-->
			
			<!-- @**@ load the shop information when click search button-->
			<script>
			/* $("button#submit").click(function(){
				var $value=document.getElementById("search").value;
				
				alert("您的搜索请求："+$value);
				if($value==""){
					alert("您的输入不能为空");
				    return false;
				}
				
				$("div.product-top").find("p").text("搜索结果: 第1页");
				pageNumber=1;
				$(".products-block").remove();
				$.ajax({
					url:"SearchShopServlet",
					type:"post",
					data:{
						page:pageNumber,
						petsType: $value,
						serviceType: $value
					},
					cache:false,
					dataType:"json",
					success:function(data) {
						console.log(data);
						var resp=data.shop;
						
						var $product=$("<div>").addClass("products-block");
						for(var i = 0; i < resp.length; i ++) {
							var $shopTel=$("<p>").text("电话:").addClass("tel").attr("value",resp[i].shopTel).append(resp[i].shopTel);
							var $credit=$("<p>").text("评分:").addClass("credit").attr("value",resp[i].instruction).append(resp[i].instruction);
							var $address=$("<p>").text("地点:").addClass("address").attr("value",resp[i].address).append(resp[i].address);
							var $name=$("<p>").text("店名:").addClass("name").attr("value",resp[i].shopName).append(resp[i].shopName);
							var $picture=$("<img>").addClass("img").attr("src", resp[i].shopImgUrl).attr("alt", resp[i].shopName);
							var $content=$("<article>");
							var $link=$("<a>").attr("herf", "shopDetail.jsp?shopName="+resp[i].shopName+"&credit="+resp[i].instruction+"&address="+resp[i].address
								+"&img="+resp[i].shopImgUrl+"&shopTel="+resp[i].shopTel);
							var $move=$("<div>").addClass("clearfix");
							var $goodbox=$("<div>").addClass("products-row");
							var $jump=$("<button>").attr("value",resp[i].shopImgUrl).attr("id","jump").append($("<P>").text("查看详情/预约"));
							
							$link.append($picture);
							$content.append($name);
							$content.append($credit);
							$content.append($shopTel);
							$content.append($address);
							$content.append($jump);
							
							$goodbox.append($link);
							$goodbox.append($content);
							$goodbox.append($move);
							$goodbox.find("*").attr("style","border:0px;");
							
							$product.append($goodbox);
							
							$jump.click(function(){
								var $shopImg=$(this).val();
								var $cre=encodeURI(encodeURI($(this).parent().find(".credit").attr("value")));
								var $add=encodeURI(encodeURI($(this).parent().find(".address").attr("value")));
								var $Name=encodeURI(encodeURI($(this).parent().find(".name").attr("value")));
								var $search=encodeURI(encodeURI(document.getElementById("search").value));
								var $tel=$(this).parent().find(".tel").attr("value");
								
								alert("您点击了"+$Name);
								window.open("shopDetail.jsp?shopName="+$Name+"&credit="+$cre+"&address="+$add+"&img="+$shopImg+"&shopTel="+$tel+"&search="+$search);
								alert("已经打开了新窗口");
							});
						}
						$(".col-md-9").append($product);
					}
				});
				
				alert("加载完成！");
			}); */
			</script>
			<!-- load the shop information when click search button-->
			
			<!-- @$$@ just for test of last section-->
			<script>
			$("button#submit").click(function (){
				var $value=document.getElementById("search").value;
				alert("您的搜索请求："+$value);
				if($value==""){
					alert("您的输入不能为空");
				    return false;
				}
				
				$("div.product-top").find("p").text("搜索结果: 第1页");
				pageNumber=1;
				$(".products-block").remove();
				for(var i = 0; i < 1; i ++) {
					var $shopTel=$("<p>").attr("value","110").text("电话:").addClass("tel").append(" 110");
					var $credit=$("<p>").attr("value","100分").text("评分:").addClass("credit").addClass("credit").append(" 100分");
					var $address=$("<p>").attr("value","THU紫荆网球场西侧").text("地点:").addClass("address").append(" THU紫荆网球场西侧");
					var $name=$("<p>").attr("value",'THU宠物中心').addClass("name").text("店名:").append(" THU宠物中心");
					var $picture=$("<img>").attr("src", "images/e1.jpg").attr("alt", "THU宠物中心");
					var $content=$("<article>");
					var $link=$("<a>").attr("herf", "shopDetail.jsp?shopName=THU宠物中心");
					var $move=$("<div>").addClass("clearfix");
					var $goodbox=$("<div>").addClass("products-row");
					var $product=$("<div>").addClass("products-block");
					var $jump=$("<button>").attr("value","images/e1.jpg").attr("id","jump").append($("<P>").text("查看详情/预约"));
					
					$link.append($picture);
					$content.append($name);
					$content.append($credit);
					$content.append($shopTel);
					$content.append($address);
					$content.append($jump);
					
					$goodbox.append($link);
					$goodbox.append($content);
					$goodbox.append($move);
					$goodbox.find("*").attr("style","border:0px;");
					
					$product.append($goodbox);
					$jump.click(function(){
						var $shopImg=$(this).val();
						var $cre=encodeURI(encodeURI($(this).parent().find(".credit").attr("value")));
						var $add=encodeURI(encodeURI($(this).parent().find(".address").attr("value")));
						var $Name=encodeURI(encodeURI($(this).parent().find(".name").attr("value")));
						var $search=encodeURI(encodeURI(document.getElementById("search").value));
						var $tel=$(this).parent().find(".tel").attr("value");
						
						alert("您点击了"+$Name);
						window.open("shopDetail.jsp?shopName="+$Name+"&credit="+$cre+"&address="+$add+"&img="+$shopImg+"&shopTel="+$tel+"&search="+$search);
						alert("已经打开了新窗口");
					});
				}
				$(".col-md-9").append($product);
				
				alert("搜索界面再次加载完成");
			});
		    </script>
			<!-- //just for test of last section-->
			
			<!-- @||@ turn to last page-->
			<script>
			$("button#lastpage").click(function(){
				alert("您点击了前一页按钮");
				pageNumber=pageNumber-1;
				if(pageNumber==0){
					alert("这已经是最前一页了");
					pageNumber=1;
					return false;
				}
				
				$.ajax({
					url:"SearchShopServlet",
					type:"post",
					data:{
						page: pageNumber,
						petsType: document.getElementById("search").value,
						serviceType: document.getElementById("search").value
					},
					cache:false,
					dataType:"json",
					success:function(data) {
						console.log(data);
						var resp=data.shop;
						
						var $product=$("<div>").addClass("products-block");
						if(resp.length==0){
							alert("接受List的长度为零");
							return false;
						}
						
						$("div.product-top").find("p").text("搜索结果: 第"+pageNumber+"页");
						$(".products-block").remove();
						for(var i = 0; i < resp.length; i ++) {
							var $shopTel=$("<p>").text("电话:").addClass("tel").attr("value",resp[i].shopTel).append(resp[i].shopTel);
							var $credit=$("<p>").text("评分:").addClass("credit").attr("value",resp[i].instruction).append(resp[i].instruction);
							var $address=$("<p>").text("地点:").addClass("address").attr("value",resp[i].address).append(resp[i].address);
							var $name=$("<p>").text("店名:").addClass("name").attr("value",resp[i].shopName).append(resp[i].shopName);
							var $picture=$("<img>").addClass("img").attr("src", resp[i].shopImgUrl).attr("alt", resp[i].shopName);
							var $content=$("<article>");
							var $link=$("<a>").attr("herf", "shopDetail.jsp?shopName="+resp[i].shopName+"&credit="+resp[i].instruction+"&address="+resp[i].address
								+"&img="+resp[i].shopImgUrl+"&shopTel="+resp[i].shopTel);
							var $move=$("<div>").addClass("clearfix");
							var $goodbox=$("<div>").addClass("products-row");
							var $jump=$("<button>").attr("value",resp[i].shopImgUrl).attr("id","jump").append($("<P>").text("查看详情/预约"));
							
							$link.append($picture);
							$content.append($name);
							$content.append($credit);
							$content.append($shopTel);
							$content.append($address);
							$content.append($jump);
							
							$goodbox.append($link);
							$goodbox.append($content);
							$goodbox.append($move);
							$goodbox.find("*").attr("style","border:0px;");
							
							$product.append($goodbox);
							
							$jump.click(function(){
								var $shopImg=$(this).val();
								var $cre=encodeURI(encodeURI($(this).parent().find(".credit").attr("value")));
								var $add=encodeURI(encodeURI($(this).parent().find(".address").attr("value")));
								var $Name=encodeURI(encodeURI($(this).parent().find(".name").attr("value")));
								var $search=encodeURI(encodeURI(document.getElementById("search").value));
								var $tel=$(this).parent().find(".tel").attr("value");
								
								alert("您点击了"+$Name);
								window.open("shopDetail.jsp?shopName="+$Name+"&credit="+$cre+"&address="+$add+"&img="+$shopImg+"&shopTel="+$tel+"&search="+$search);
								alert("已经打开了新窗口");
							});
						}
						$(".col-md-9").append($product);
					}
				};
				
				alert("前一页加载完成");
			});
			</script>
			<!-- //turn to last page-->
			
			<!-- @||@ turn to next page-->
			<script>
			$("button#nextpage").click(function(){
				alert("您点击了后一页按钮");
				pageNumer=pageNumber+1;
				
				$.ajax({
					url:"SearchShopServlet",
					type:"post",
					data:{
						page: pageNumber,
						petsType: document.getElementById("search").value,
						serviceType: document.getElementById("search").value
					},
					cache:false,
					dataType:"json",
					success:function(data) {
						console.log(data);
						var resp=data.shop;
						
						var $product=$("<div>").addClass("products-block");
						if(resp.length==0){
							alert("这已经是最后一页了");
							pageNumber=pageNumber-1;
							return false;
						}
						
						$("div.product-top").find("p").text("搜索结果: 第"+pageNumber+"页");
						$(".products-block").remove();
						for(var i = 0; i < resp.length; i ++) {
							var $shopTel=$("<p>").text("电话:").addClass("tel").attr("value",resp[i].shopTel).append(resp[i].shopTel);
							var $credit=$("<p>").text("评分:").addClass("credit").attr("value",resp[i].instruction).append(resp[i].instruction);
							var $address=$("<p>").text("地点:").addClass("address").attr("value",resp[i].address).append(resp[i].address);
							var $name=$("<p>").text("店名:").addClass("name").attr("value",resp[i].shopName).append(resp[i].shopName);
							var $picture=$("<img>").addClass("img").attr("src", resp[i].shopImgUrl).attr("alt", resp[i].shopName);
							var $content=$("<article>");
							var $link=$("<a>").attr("herf", "shopDetail.jsp?shopName="+resp[i].shopName+"&credit="+resp[i].instruction+"&address="+resp[i].address
								+"&img="+resp[i].shopImgUrl+"&shopTel="+resp[i].shopTel);
							var $move=$("<div>").addClass("clearfix");
							var $goodbox=$("<div>").addClass("products-row");
							var $jump=$("<button>").attr("value",resp[i].shopImgUrl).attr("id","jump").append($("<P>").text("查看详情/预约"));
							
							$link.append($picture);
							$content.append($name);
							$content.append($credit);
							$content.append($shopTel);
							$content.append($address);
							$content.append($jump);
							
							$goodbox.append($link);
							$goodbox.append($content);
							$goodbox.append($move);
							$goodbox.find("*").attr("style","border:0px;");
							
							$product.append($goodbox);
							
							$jump.click(function(){
								var $shopImg=$(this).val();
								var $cre=encodeURI(encodeURI($(this).parent().find(".credit").attr("value")));
								var $add=encodeURI(encodeURI($(this).parent().find(".address").attr("value")));
								var $Name=encodeURI(encodeURI($(this).parent().find(".name").attr("value")));
								var $search=encodeURI(encodeURI(document.getElementById("search").value));
								var $tel=$(this).parent().find(".tel").attr("value");
								
								alert("您点击了"+$Name);
								window.open("shopDetail.jsp?shopName="+$Name+"&credit="+$cre+"&address="+$add+"&img="+$shopImg+"&shopTel="+$tel+"&search="+$search);
								alert("已经打开了新窗口");
							});
						}
						$(".col-md-9").append($product);
					}
				};
				
				alert("后一页加载完成");
			});
			</script>
			<!-- //turn to next page-->
			
			<div class="col-md-3 rsidebar">
				<div class="rsidebar-top">
					<div class="slider-left">
						<h4>按均价筛选</h4>            
						<div class="row row1 scroll-pane">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>0 - $100 </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$100 - $200 </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$200 - $250  </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$250 - $300 </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$350 - $400 </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$450 - $500  </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>More</label> 
						</div> 
					</div>
					<div class="sidebar-row">
						<h4>按距离筛选</h4>            
						<div class="row row1 scroll-pane">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>0 - 500米 </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>500米 - 1公里 </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>1公里 - 5公里  </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>5公里 - 20公里 </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>同城 </label> 
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>More</label> 
						</div> 
					</div>
					<div class="sidebar-row">
						<h4>按折扣筛选</h4>
						<div class="row row1 scroll-pane">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>70%以上 </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>70% - 60% </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>50% - 40% </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% </label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>5%以下</label>
						</div>
					</div>		 
				</div>
			</div>
			<div class="clearfix"> </div>
			
			<!-- recommendations -->
			<div class="recommend">
				<h3 class="uniform-title">我们的推荐 </h3> 
				<script>
					$(document).ready(function() { 
						$("#owl-demo5").owlCarousel({
					 
						  autoPlay: 3000, //Set AutoPlay to 3 seconds
					 
						  items :4,
						  itemsDesktop : [640,5],
						  itemsDesktopSmall : [414,4],
						  navigation : true
					 
						});
						
					}); 
				</script>
				<div id="owl-demo5" class="owl-carousel">
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>优惠 </h6></div>
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>距离近 </h6></div>
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>高评价 </h6></div>
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>新开业 </h6></div>
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>距离近 </h6></div>
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>开业 </h6></div>
							<a href="products1.html"><img src="images/f2.jpg" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">THU宠物中心1</a></h4>
								<p>业务：宠物护理</p>
								<h5>5星</h5>
							</div>        
						</div> 
					</div>
				</div>    
			</div>
			<!-- //recommendations -->
		</div>
	</div>
	<!--//products-->  
	
	<!-- footer-top -->
	<div class="w3agile-ftr-top">
		<div class="container">
			<div class="ftr-toprow">
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>更便捷</h4>
						<p>不用再为爱宠找不到合适的店家而烦恼 </p>
					</div> 
					<div class="clearfix"> </div>
				</div> 
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-user" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>更通畅</h4>
						<p>留言系统让万水千山不再是阻隔挂念的屏障 </p>
					</div> 
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>更诚信</h4>
						<p>用户的评价让您获知更多关于店家的信息 </p>
					</div>
					<div class="clearfix"> </div>
				</div> 
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //footer-top -->  		
	
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
        uniform.render();

        uniform.cart.on('w3sb_checkout', function (evt) {
        	var items, len, i;

        	if (this.subtotal() > 0) {
        		items = this.items();

        		for (i = 0, len = items.length; i < len; i++) {
        			items[i].set('shipping', 0);
        			items[i].set('shipping2', 0);
        		}
        	}
        });
    </script>  
	<!-- //cart-js -->  
	
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	
    <script src="js/bootstrap.js"></script>
</body>
</html>