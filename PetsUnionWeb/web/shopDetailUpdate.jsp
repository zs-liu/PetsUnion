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
		<title>shop</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
				function hideURLbar(){ window.scrollTo(0,1); } </script>
		<style type="text/css">
			input.form-control {
				margin: 5px;
			}
		</style>

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
		
		<%-- <!-- web-fonts -->
		<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'> --%>
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
		</head>

		<% 
		String userID = (String)session.getAttribute("loggedId");
		String shopname = (String)session.getAttribute("shopName");
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

		
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.html"><span>PETS</span>union </a></h1>
					<h2>Your stores. Your friends.</h2> 
				</div>	
				<div class="header-search">
					<form method="#">
						<input type="search" id="search" placeholder="请输入您要搜索的关键词..." required="">
						<button type="button" id="submit" class="btn btn-default" aria-label="Left Align" >
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		


	<div class="shop-page">
		<div class="container">
			<h2>shopDetail</h2>
			<div class="detail_images">
				<div id="shopImg" src=""></div>
			</div>
			<div class="row-fluid">
				<form action="" id="shopDetailForm">
					<input type="text" class="form-control" name="instruction" id="instruction" placeholder="instruction">
					<input type="text" class="form-control" name="address" id="address" placeholder="address">
					<input type="text" class="form-control" name="shopHours"  id="shopHours" placeholder="shopHours">
					<input type="text" class="form-control" name="shopTel"  id="shopTel" placeholder="shopTel">
				</form>
				<a class="btn btn-primary" id="confirm1">确认修改</a>
			</div>
		</div>

<%-- get shop detail --%>

<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:"ShopDetailServlet",
			type:"post",
			data:{
				flag:1,
				shopName:<%=shopname%>
			},
			cache:false,
			dataType:"json",
			success:function(data){
				console.log(data)
				$("#instruction").val(data.instruction);
				$("#address").val(data.address);
				$("#shopHours").val(data.shopHours);
				$("#shopTel").val(data.shopTel);
				alert("shopdetail got");
			}
		})
	})
</script>

<%-- post shop detail --%>

<script type="text/javascript">
	$(document).ready(function(){
		$("#confirm1").click(function(){
			x=$("#shopDetailForm").serializeArray();
			console.log(x);
			$.ajax({
			url:"ShopDetailUpdateServlet",
			type:"post",
			data:{
				flag:2,
				shopName:<%=shopname%>,
				instruction:$("#instruction").val(),
				address:$("#address").val(),
				shopHours:$("#shopHours").val(),
				shopTel:$("#shopTel").val(),
			},
			cache:false,
			success:function(){
				alert("shopdetail posted");
			}
		})
		})
	})
</script>
	
		<div class="container">
			<h2>Service</h2>
			<div class="box-content">
				<table class="table table-striped table-bordered datatable">
				  <thead>
					  <tr>
						  <th>serviceIntro</th>
						  <th>serviceType</th>
						  <th>petsType</th>
						  <th>price</th>
					  </tr>
				  </thead>
				  <tbody>
            
					<tr class="tr0">
						<td class="center">intro1</td>
						<td class="center">type1</td>
						<td class="center">petstype1</td>
						<td class="center">price</td>
					</tr>
				
					<!-- <tr class="tr1">

					<form id="form1">
						<td class="center">
							<input type="text" class="form-control" name="serviceIntro" value="name">
						</td>
						<td class="center">
							<input type="text" class="form-control" name="serviceType" value="name">
						</td>
						<td class="center">
							<input type="text" class="form-control" name="petsType" value="name">
						</td>
						<td class="center">
							<input type="text" class="form-control" name="price" value="name">
						</td>
					</form>
					</tr> -->
				
				  </tbody>
			  </table>    
			  <div class="col">
					<a class="btn btn-primary" id="new1">新建</a>
					<a class="btn btn-primary" id="confirm2">确认</a>
			  </div>
			  
			</div>
		</div>
	</div>

<%-- get existed items --%>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:"ShopDetailServlet",
			type:"post",
			data:{
				flag:1,
				shopName:<%=shopname%>
			},
			cache:false,
			dataType:"json",
			success:function(data){
			console.log(data);
			var i=0;
			while(i<data.service.length){
				var item = '<tr class="tr0">';
				item+=('<td class="center">'+data.service[i].serviceIntro+'</td>');
				item+=('<td class="center">'+data.service[i].serviceType+'</td>');
				item+=('<td class="center">'+data.service[i].petsType+'</td>');
				item+=('<td class="center">'+data.service[i].price+'</td>');
				$('tbody').append(item);
				i+=1;
			}
			alert("table got");
			}
		})
	})
</script>

<%-- new an item --%>

	<script type="text/javascript">
	$(document).ready(function(){
		$("#new1").click(function(){
			var newItem='<tr class="tr1"><form id="form1">';
			newItem+='<td class="center"><input type="text" class="form-control" name="serviceIntro" id="serviceIntro" value="name"></td>';
			newItem+='<td class="center"><input type="text" class="form-control" name="serviceType" id="serviceType" value="name"></td>';
			newItem+='<td class="center"><input type="text" class="form-control" name="petsType"  id="petsType" value="name"></td>';
			newItem+='<td class="center"><input type="text" class="form-control" name="price" id="price" value="name"></td></form></tr>';
			$("tbody").append(newItem);
			$("#confirm2").show();
			$("#new1").hide();
		})
	})
	</script>

<%-- post new item --%>

	<script type="text/javascript">
		$("#confirm2").click(function(){
			var x=[];
			var data={
				serviceIntro:$("#serviceIntro").val(),
				serviceType:$("#serviceType").val(),
				petsType:$("#petsType").val(),
				price:$("#price").val()
			}
			x.push(data);
			x=JSON.stringify(x);
			console.log(x);
			$.ajax({
			url:"ShopDetailUpdateServlet",
			type:"post",
			data:{
				flag:0,
				shopName:<%=shopname%>,
				serviceTable:encodeURI(x)
			},
			cache:false,
			success:function(){
				alert("table posted");
			}
		})
		$("tr").filter(".tr1").remove();
		$("#confirm2").hide();
		$("#new1").show();
		})
	</script>

	<!-- return to searchShop -->
	<script type="text/javascript">
	$("button#submit").click(function (){
		var $value=document.getElementById("search").value;
		window.location.href = "searchShop.jsp?search="+$value;
	});
	</script>
	<!-- return to searchShop -->
		
	<!-- //cart-js -->  
	
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	
    <script src="js/bootstrap.js"></script>
</body>
</html>