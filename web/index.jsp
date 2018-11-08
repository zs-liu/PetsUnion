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

</head>

<body data-spy="scroll" data-offset="100">
	
<!-- START HOME -->
<section data-stellar-background-ratio="0.8" id="home" class="home_bg" style="background-image: url(assets/img/bg/petsit.jpg);  background-size: cover; background-position: center center;">
	<div class="container">
		<div class="row">
		  <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12 text-center">
			<div class="hero-text">
				<h2><font color="black">Pets Union</font></h2>
				 <p><font face="MingLiU">专注为宠物提供定制化服务</font></p>
				<div class="home_btn">
					<a href="shoplogin.html" class="app-btn wow bounceIn home_btn_color_one" data-wow-delay=".6s" ><font face="Microsoft YaHei" size="+1">宠物店</font></a>
					<a href="ownerlogin.html" class="app-btn wow bounceIn home_btn_color_two" data-wow-delay=".8s"><font face="Microsoft YaHei" size="+1">宠物主</font></a>
				</div>
				<form action="searchShop.jsp" method ="get">
					<div class="form-group col-lg-4 col-lg-offset-4">
						<input type="text" placeholder="search" class="form-control">
					</div>
				</form>
			</div> 
		  </div><!--- END COL -->				  
		</div><!--- END ROW -->
	</div><!--- END CONTAINER -->
</section>
<!-- END  HOME -->	


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
</body>
</html>