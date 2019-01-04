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
		<title>shopDetailUpdate</title>
		
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
								<li><a href= <%=mainPage%> >个人主页 </a></li> 
								<li><a href="exit.jsp">退出登录</a></li>  
								<li><a href="index.jsp">主页 </a></li>  
							</ul> 
							<%}%>
						</li> 
					</ul>
				</div>
				<div class="clearfix"> </div> 
			</div>
		</div>

	<div class="shop-page">
		<div class="container">
			<h2>商店信息</h2>
			<div class="detail_images">
				<div id="shopImg" src=""></div>
			</div>
			<div class="row-fluid">
				<form action="" id="shopDetailForm">
					<input type="text" class="form-control" name="instruction" id="instruction" placeholder="介绍/instruction">
					<input type="text" class="form-control" name="address" id="address" placeholder="地址/address">
					<input type="text" class="form-control" name="shopHours"  id="shopHours" placeholder="营业时间/shopHours">
					<input type="text" class="form-control" name="shopTel"  id="shopTel" placeholder="电话/shopTel">
				</form>
				<a class="btn btn-primary" id="confirm1">确认修改</a>
				<p id="message1"></p>
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
				shopName:encodeURI("<%=shopname%>"),
			},
			cache:false,
			dataType:"json",
			success:function(data){
				$("#instruction").val(data.instruction);
				$("#address").val(data.address);
				$("#shopHours").val(data.shopHours);
				$("#shopTel").val(data.shopTel);
			}
		})
	})
</script>

<%-- post shop detail --%>

<script type="text/javascript">
	$(document).ready(function(){
		$("#confirm1").click(function(){
			$.ajax({
			url:"ShopDetailUpdateServlet",
			type:"post",
			data:{
				flag:2,
				shopName:encodeURI("<%=shopname%>"),
				instruction:encodeURI($("#instruction").val()),
				address:encodeURI($("#address").val()),
				shopHours:encodeURI($("#shopHours").val()),
				shopTel:encodeURI($("#shopTel").val()),
			},
			cache:false,
			dataType:"json",
			success:function(data){
                if(data.returnPath=="/404.jsp" || data.errorMessage=="Success"){
                    window.location.replace(data.returnPath);
                }
                else{
                    $("#message1").text(data.errorMessage);
                }
			}
		})
		})
	})
</script>
	
		<div class="container">
			<h2>服务</h2>
			<div class="box-content">
				<table class="table table-striped table-bordered datatable">
				  <thead>
					  <tr>
						  <th>服务说明</th>
						  <th>服务种类</th>
						  <th>宠物种类</th>
						  <th>价格</th>
						  <th>操作</th>
					  </tr>
				  </thead>
				  <tbody>
            
					<%-- <tr class="tr0">
						<td class="center">intro1</td>
						<td class="center">type1</td>
						<td class="center">petstype1</td>
						<td class="center">price</td>
					</tr> --%>
				
				  </tbody>
			  </table>    
			  <div class="col">
					<a class="btn btn-primary" id="new1">新建</a>
					<a class="btn btn-primary" id="confirm2">确认</a>
			  </div>
			  <p id="message2"></p>
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
				shopName:encodeURI("<%=shopname%>"),
			},
			cache:false,
			dataType:"json",
			success:function(data){
			var i=0;
			while(i<data.service.length){
				var item = '<tr class="tr0">';
				item+=('<td class="center serviceIntro">'+data.service[i].serviceIntro+'</td>');
				item+=('<td class="center serviceType">'+data.service[i].serviceType+'</td>');
				item+=('<td class="center petsType">'+data.service[i].petsType+'</td>');
				item+=('<td class="center price">'+data.service[i].price+'</td>');
				item+=('<td class="center"><button class="btn delete">删除</button></td></tr>');
				$('tbody').append(item);
				i+=1;
			}
			$(".delete").click(function(){
			var x=[];
			var data={
				serviceIntro:$(this).parent().prevAll(".serviceIntro").text(),
				serviceType:$(this).parent().prevAll(".serviceType").text(),
				petsType:$(this).parent().prevAll(".petsType").text(),
				price:$(this).parent().prevAll(".price").text()
			};
			x.push(data);
			x=JSON.stringify(x);
			console.log(x);
			$.ajax({
			url:"ShopDetailUpdateServlet",
			type:"post",
			data:{
				flag:1,
				shopName:encodeURI("<%=shopname%>"),
				serviceTable:encodeURI(x)
			},
			cache:false,
			dataType:"json",
			success:function(data){
                if(data.returnPath=="/404.jsp" || data.errorMessage=="Success"){
                    window.location.replace(data.returnPath);
                }
                else{
                    $("#message2").text(data.errorMessage);
                }
			}
			});
			});
			}
		});
		$("#confirm2").hide();
	})
</script>

<%-- new an item --%>

	<script type="text/javascript">
	$(document).ready(function(){
		$("#new1").click(function(){
			var newItem='<tr class="tr1"><form id="form1">';
			newItem+='<td class="center"><input type="text" class="form-control" name="serviceIntro" id="serviceIntro"></td>';
			newItem+='<td class="center"><select id="serviceType"><option value="宠物护理">宠物护理</option><option value="宠物寄养">宠物寄养</option><option value="宠物美容">宠物美容</option></select></td>';
			newItem+='<td class="center"><select id="petsType"><option value="狗狗">狗狗</option><option value="猫猫">猫猫</option><option value="仓鼠">仓鼠</option><option value="蜘蛛">蜘蛛</option></select></td>';
			newItem+='<td class="center"><input type="text" class="form-control" name="price" id="price"></td>';
			newItem+='<td class="center"></td></form></tr>';
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
			};
			x.push(data);
			x=JSON.stringify(x);
			console.log(x);
			$.ajax({
			url:"ShopDetailUpdateServlet",
			type:"post",
			data:{
				flag:0,
				shopName:encodeURI("<%=shopname%>"),
				serviceTable:encodeURI(x)
			},
			cache:false,
			dataType:"json",
			success:function(data){
                if(data.returnPath=="/404.jsp" || data.errorMessage=="Success"){
                    window.location.replace(data.returnPath);
                }
                else{
                    $("#message2").text(data.errorMessage);
                }
			}
		});
		$("tr").filter(".tr1").remove();
		$("#confirm2").hide();
		$("#new1").show();
		})
	</script>
		
	<!-- //cart-js -->  
	
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	
    <script src="js/bootstrap.js"></script>
</body>
</html>