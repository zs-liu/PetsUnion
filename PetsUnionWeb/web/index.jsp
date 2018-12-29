<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="">
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>

<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- SITE TITLE -->
<title>Home</title>			
<!-- Latest Bootstrap min CSS -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">		
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
		
<!-- Style CSS -->
<link rel="stylesheet" href="assets/css/style.css">		
	
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

<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
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
</head>

<% 
	String userID = (String)session.getAttribute("loggedId");
	String type = (String)session.getAttribute("loggedType");
	String mainPage = "#";
	if(type=="petsOwner"){
		mainPage = "ownerMainPage.jsp";
	}
	else if(type=="shopOwner"){
		mainPage="shopMainPage.jsp";
	}
%>

<body data-spy="scroll" data-offset="100">
		<!-- header -->
		<div class="header">
			<div class="uniform-header"><!--header-one--> 
				<div class="uniform-header-right">
					<ul>
						<li class="dropdown head-dpdn">
							<%
							if(userID==null){
							%>
							<a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown" id="user"><i class="fa fa-user" aria-hidden="true"></i>请登录<span class="caret"></span></a>
							<%
							}
							else{
							%>
							<a class="dropdown-toggle" data-toggle="dropdown" id="user"><i class="fa fa-user" aria-hidden="true"></i><%=userID%><span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href= <%=mainPage%> >主页 </a></li> 
								<li><a href="index.jsp">切换账号</a></li>  
							</ul> 
							<%}%>
						</li> 
					</ul>
				</div>
				<div class="clearfix"> </div> 
			</div>
		</div>

<!-- START HOME -->
<section data-stellar-background-ratio="0.8" id="home" class="home_bg" style="background-image: url(assets/img/bg/petsit.jpg);  background-size: cover; background-position: center center;">
	<div class="container">
		<div class="row">
		  <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12 text-center">
			<div class="hero-text">
				<h2><font color="black">Pets Union</font></h2>
				 <p><font face="MingLiU">专注为宠物提供定制化服务</font></p>
				<div class="home_btn">
					<a href="shopLogin.jsp" class="app-btn wow bounceIn home_btn_color_one" data-wow-delay=".6s" ><font face="Microsoft YaHei" size="+1">宠物店</font></a>
					<a href="ownerLogin.jsp" class="app-btn wow bounceIn home_btn_color_two" data-wow-delay=".8s"><font face="Microsoft YaHei" size="+1">宠物主</font></a>
				</div>
				<form>
				<div class="form-group col-lg-4 col-lg-offset-4">
					<input type="text" placeholder="用户名/username" class="form-control" name="ownerName">
					<button class="btn home_btn">搜索</button>
				</div>
			</form>
			</div> 
		  </div><!--- END COL -->				  
		</div><!--- END ROW -->
	</div><!--- END CONTAINER -->
</section>
<!-- END  HOME -->	

<script type="text/javascript">
	$("button#submit").click(function (){
		var $value=document.getElementById("search").value;
		alert("您的搜索请求："+$value);
		if($value==""){
			alert("您的输入不能为空");
			return false;
		}
			
		window.location.href = "searchShop.jsp?search="+encodeURI(encodeURI($value));
		
		alert("跳转页面完成");
	});
</script>


<!-- scrolltopcontrol js -->
	<script src="assets/js/scrolltopcontrol.js"></script>									
<!-- form-contact js -->
	<script src="assets/js/form-contact.js"></script>	
<!-- WOW - Reveal Animations When You Scroll -->
	<script src="assets/js/wow.min.js"></script>
<!-- map js -->
	<!---<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwIQh7LGryQdDDi-A603lR8NqiF3R_ycA"></script>--->
<!-- scripts js -->
	<script src="assets/js/scripts.js"></script>
<!-- menu js aim -->
<script src="js/jquery.menu-aim.js"> </script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
<!-- //menu js aim --> 

<script src="js/bootstrap.js"></script>
</body>
</html>