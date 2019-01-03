<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>shop</title>
		
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
		
		<!--flex slider-->
		<script defer src="js/jquery.flexslider.js"></script>
		<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
		<script>
			// Can also be used with $(document).ready()
			$(window).load(function() {
			  $('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
			  });
			});
		</script>
		<!--flex slider-->

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
					</li> 
				</ul>
			</div>
			<div class="clearfix"> </div> 
		</div>
		
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.jsp"><span>PETS</span>union </a></h1>
					<h2>Your stores. Your friends.</h2> 
				</div>	
				<div class="header-search">
					<label for="petsType_select" style="font-size:1.4em;font-weight:400;">宠物类型：</label>
					<select id="petsType" name="petsType_select" style="font-size:1.2em;font-weight:500;width:150px;height:40px;padding: 0 0 0 45px;">
						<option value='-1' style='display: none'></option>
						<option value="狗狗" style="">狗  狗</option> 
						<option value="猫猫">猫  猫</option> 
						<option value="仓鼠">仓  鼠</option>
						<option value="蜘蛛">蜘  蛛</option>
					</select>
					<label for="serviceType_select" style="padding-left:80px;font-size:1.4em;font-weight:400;">服务类型：</label>
					<select id="serviceType" name="serviceType_select" style="font-size:1.2em;font-weight:500;width:150px;height:40px;padding: 0 0 0 30px;">
						<option value='-1' style='display: none'></option>
						<option value="宠物护理">宠物护理</option> 
						<option value="宠物寄养">宠物寄养</option> 
						<option value="宠物美容">宠物美容</option>
					</select>
					<button type="button" id="submit" style="margin-left:50px;width: 50px;height: 45px;background: #FF5809;" >
						<i class="fa fa-search" aria-hidden="true"> </i>
					</button>
				</div>
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		
		<!-- return to searchShop -->
		<script type="text/javascript">
			$("button#submit").click(function (){
				var $petsType=document.getElementById("petsType").value;
				var $serviceType=document.getElementById("serviceType").value;
				
				if($petsType==-1){
					alert("宠物类型的输入不能为空");
					return false;
				}
				if($serviceType==-1){
					alert("服务类型的输入不能为空");
					return false;
				}
					
				window.location.href = "searchShop.jsp?petsType="+encodeURI(encodeURI($petsType))+"&serviceType="+encodeURI(encodeURI($serviceType));
			});
		</script>
		<!-- return to searchShop -->
		
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="move-text">
					<div class="marquee" style="width:1100px;float:none;"><a href="*"> 双十一萌宠PARTY，单身宠物不孤单...... <span>THU宠物护理中心开放日 </span> <span> 昌平宠物滑雪场，给您的宠物放个假吧!</span></a></div>
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
	
	<!-- reservation --> 
	<div class="reservation-page">
		<div class="container">
		    <div class="reserve"><br><h1 class="reserve">您好，请确认您的订单信息！</h1><br></div>
			<p id="name" class="reserve">宠物店名：</p>
			<p id="date" class="reserve">所选时间：</p>
			<p id="pet" class="reserve">宠物种类：</p>
			<p id="service" class="reserve">服务类型：</p>
			<p id="tel" class="reserve">您的电话：</p>
			<p class="reserve">备注：</p>
			<textarea placeholder="请填写对店家的留言..." class="reserve" required=""></textarea>
			<br>
			<button type="submit" id="submit" class="btn btn-default reserve" aria-label="Center Align" >正式提交</button>
			<br>
			<div class="clearfix"> </div> 
		</div>
	</div> 
	<!-- //reservation --> 
	
	<!-- get the shop information -->
	<script>
	function getQuery(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
	</script>
	<!-- get the shop information -->

	<!-- @--@ load the shop information -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#name").append(decodeURI(getQuery("shopName")));
			$("#date").append(decodeURI(getQuery("serBeginTime"))+" - "+decodeURI(getQuery("serEndTime")));
			$("#pet").append(decodeURI(getQuery("petsType")));
			$("#service").append(decodeURI(getQuery("serviceType")));
			$("#tel").append(decodeURI(getQuery("petsOwnerTel")));
					
			$(".reservation-page").find("*").not("button").attr("style","border:0px;");
			//$(".reservation-page").find("textarea").attr("style","border:2px solid blue;");
			$(".reservation-page").find("p").not("#comment").attr("style","border:0px;color:black;");
		});
	</script>
	<!-- load the shop information -->
	
	<!-- @||@ pass the data -->
	<script>
		$("button#submit").click(function (){
			if("<%=session.getAttribute("loggedType")%>"!="petsOwner"){
				alert("提交订单时，必须以用户身份在线");
				return false;
			}
					
			$.ajax({
				url:"ReserveServiceServlet",
				type:"post",
				data:{
					shopName: encodeURI(decodeURI(getQuery("shopName"))),
					serBeginTime: encodeURI(decodeURI(getQuery("serBeginTime"))),
					serEndTime: encodeURI(decodeURI(getQuery("serEndTime"))),
					petsType: encodeURI(decodeURI(getQuery("petsType"))),
					serviceType: encodeURI(decodeURI(getQuery("serviceType"))),
					petsOwnerTel:encodeURI(decodeURI(getQuery("petsOwnerTel"))),
					userId:encodeURI("<%=session.getAttribute("loggedId")%>"),
					comment: encodeURI($("textarea.reserve").val()),
					returnPath:encodeURI("ownerMainPage.jsp")
				},
				cache:false,
				dataType:"json",
				success:function() {
					alert("您的订单已成功提交");
					window.location.href = "ownerMainPage.jsp";
				},
				error:function(){
					alert("您的订单已成功提交");
					window.location.href = "ownerMainPage.jsp";
				}
			});
		});
	</script>
	<!-- pass the data ->
	
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