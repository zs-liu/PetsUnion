<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="">
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html lang="">

<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
<!-- SITE TITLE -->
<title>shopRegister</title>			
<!-- Latest Bootstrap min CSS -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">				
<!-- Style CSS -->
<link rel="stylesheet" href="assets/css/style.css">	
<script src="js/jquery-2.2.3.min.js"></script> 							
</head>

<body data-spy="scroll" data-offset="100">
	
<!-- START HOME -->
<section data-stellar-background-ratio="0.8" id="OwnerLogin" class="home_bg" style="background-image: url(assets/img/bg/petsit.jpg);  background-size: cover; background-position: center center;">
	<div class="container">
		<div class="row">
		  <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12 text-center">
			<div class="hero-text">
				<h2><font color="black" face="Microsoft YaHei" size="+3">宠物主注册</font></h2>
				<form>
						<div class="form-group col-lg-4 col-lg-offset-4">
								<input type="text" placeholder="ID/userId" class="form-control" id="userId">
						</div>
					<div class="form-group col-lg-4 col-lg-offset-4">
						<input type="text" placeholder="用户名/username" class="form-control" id="userName">
					</div>
					<div class="form-group col-lg-4 col-lg-offset-4">
						<input type="password" placeholder="密码/password" class="form-control" id="userPw">
					</div>
					<div class="form-group col-lg-4 col-lg-offset-4">
						<input type="text" placeholder="电话/Tel" class="form-control" id="userTel">
					</div>
                    <div class="form-group col-lg-4 col-lg-offset-4">
                        <p id="message"></p>
                    </div>

					<div class="form-group col-lg-4 col-lg-offset-4">
						<div class="home_btn">
							<button class="btn home_btn_color_two"  id = "confirm"><font face="Microsoft YaHei" size="3px">注册</font></button>
						</div>
                    </div>
				</form>

<script type="text/javascript">
	$(document).ready(function(){
		$("#confirm").click(function(){
			$.ajax({
			url:"OwnerRegisterServlet",
			type:"post",
			data:{
				userId:encodeURI($("#userId").val()),
				userName:encodeURI($("#userName").val()),
				userPw:encodeURI($("#userPw").val()),
				userTel:encodeURI($("#userTel").val())
			},
			cache:false,
			dataType:"json",
			success:function(data){
				alert("register success");
                if(data.returnPath=="/404.jsp" || data.errorMessage=="Success"){
                    window.location.href=data.returnPath;
                }
                else{
                    $("#message").text(data.errorMessage);
                }
			}
		})
		})
	})
</script>
			</div> 
		  </div><!--- END COL -->				  
		</div><!--- END ROW -->
	</div><!--- END CONTAINER -->
</section>
<!-- END  HOME -->	

	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	
    <script src="js/bootstrap.js"></script>

</body>
</html>