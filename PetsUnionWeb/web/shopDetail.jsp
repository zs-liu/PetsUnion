<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>shop</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
	  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">

		
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
		<style type="text/css">
			table.hovertable {
				font-family: verdana,arial,sans-serif;
				color:#333333;
				border-width: 1px;
				border-color: #999999;
				border-collapse: collapse;
				width: 1100px;
			}
			table.hovertable th {
				background-color:#c3dde0;
				border-width: 1px;
				font-size:15px;
				padding: 8px;
				border-style: solid;
				border-color: #a9c6c9;
				text-align:center;
			}
			table.hovertable tr {
				background-color:#d4e3e5;
				font-size:12px;
			}
			table.hovertable td {
				border-width: 1px;
				padding: 8px;
				border-style: solid;
				border-color: #a9c6c9;
			}
		</style>

		<!-- for dialog-form: style & js -->
		<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
		<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="jqueryui/style.css">
		<style>
			#dialog-form{ font-size: 80%; }
			label, input { display:block; }
			#dialog-form input.text { margin-bottom:12px; width:95%; padding: .4em; }
			fieldset { padding:0; border:0; margin-top:25px; }
			#dialogform h1 { font-size: 1.4em; margin: .3em 0; }
			div#users-contain { width: 350px; margin: 20px 0; }
			div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
			div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
			.ui-dialog .ui-state-error { padding: .3em; }
			.validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
		<script>
		<!--  dialog -->
		$(function() {
			$( "#dialog-form" ).dialog({
			  autoOpen: false,
			  height: 400,
			  width: 450,
			  modal: true,
			  buttons: {
				"创建申请": function() {
					var $petsType=encodeURI(encodeURI($("input#petsType").val()));
					var $serviceType=encodeURI(encodeURI($("input#serviceType").val()));
					var $serBeginTime=encodeURI(encodeURI($("input#serBeginTime").val()));
					var $serEndTime=encodeURI(encodeURI($("input#serEndTime").val()));
					var $petsOwnerTel=encodeURI(encodeURI($("input#petsOwnerTel").val()));
					var $userId=encodeURI(encodeURI($("input#userId").val()));
					var $shopName=encodeURI(encodeURI($("input#shopName").val()));						
				    
					window.open("reserveService.jsp?shopName="+$shopName+"&serviceType="+$serviceType+"&serBeginTime="+$serBeginTime
						+"&serEndTime="+$serEndTime+"&userId="+$userId+"&petsType="+$petsType+"&petsOwnerTel="+$petsOwnerTel);
					
				    //allFields.removeClass( "ui-state-error" );
					$( this ).dialog( "close" );
				},
				"取消": function() {
				    $( this ).dialog( "close" );
				}
			  },
			  close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			  }
			});
		});
		<!-- for dialog-form: style & js -->
		</script>
		
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
					<form method="#">
						<input type="search" id="search" placeholder="请输入宠物类型或服务类型..." required="">
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
		
		<!-- @@ return to searchShop -->
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
		<!-- return to searchShop -->
		
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
	
	<!-- shop --> 
	<div class="shop-page">
		<div class="container">
			<div class="col-md-6 single-top-left">	
				<div class="flexslider">
					<ul class="slides">
						<li data-thumb="images/s1.jpg" id="firstthumb">
							<div class="thumb-image detail_images"> <img id="firstimg" data-imagezoom="true" class="img-responsive" alt=""> </div>
						</li>
						<li data-thumb="images/s2.jpg" id="secondthumb">
							 <div class="thumb-image"> <img id="secondimg" data-imagezoom="true" class="img-responsive" alt=""> </div>
						</li>
						<li data-thumb="images/s3.jpg" id="thirdthumb">
						   <div class="thumb-image"> <img id="thirdimg" data-imagezoom="true" class="img-responsive" alt=""> </div>
						</li> 
					</ul>
				</div>
			</div>
			<div class="col-md-6 single-top-right">
			    <br><br>
				<h3 class="item_name">THU宠物护理</h3>
				<div class="single-rating">
					<ul>
						<li><a href="#" id="user-review">添加您的评论</a></li>
					</ul> 
				</div>
				<p style="color:black;font-size:110%;" id="credit"></p>
				<p style="color:black;font-size:110%;" id="shopHours"></p>
				<p style="color:black;font-size:110%;" id="address"></p>
				<p style="color:black;font-size:110%;" id="phone-number"></p>
				<form action="#" method="post">
					<input type="hidden" name="cmd" value="_cart" />
					<input type="hidden" name="add" value="1" /> 
					<input type="hidden" name="w3ls_item" value="Snow Blower" /> 
					<input type="hidden" name="amount" value="540.00" /> 
					<br>
					<button type="button" style="font-size:110%;" class="w3ls-cart" id="reserve" >
						<i class="fa fa-cart-plus" aria-hidden="true"></i> 预约</button>
				</form>
			</div>
			<div class="clearfix"> </div> 
						
			<div id="dialog-form" title="预约申请">
				<p class="validateTips">所有的表单字段都是必填的。</p>
		 
				<form action="" method="post"><fieldset><!--因为要进行中文转码，手动进行URL传参-->
					<label for="petsType">宠物类型</label>
					<input type="text" name="petsType" id="petsType" value="" class="text ui-widget-content ui-corner-all">
					<label for="serviceType">服务类型</label>
					<input type="text" name="serviceType" id="serviceType" value="" class="text ui-widget-content ui-corner-all">
					<label for="serBeginTime">起始时间</label>
					<input type="text" name="serBeginTime" id="serBeginTime" value="" class="text ui-widget-content ui-corner-all">
					<label for="serEndTime">截止时间</label>
					<input type="text" name="serEndTime" id="serEndTime" value="" class="text ui-widget-content ui-corner-all">
					<label for="petsOwnerTel">您的常用手机号</label>
					<input type="text" name="petsOwnerTel" id="petsOwnerTel" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" name="userId" id="userId" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" name="shopName" id="shopName" value="" class="text ui-widget-content ui-corner-all">
				</fieldset></form>	
			</div>

			<script type="text/javascript">
			<!--  open_dialog -->
			$("button#reserve").click(function(){
				$( "#dialog-form" ).dialog( "open" );
			});
			<!-- open dialog -->
			</script>
			
			<!-- collapse-tabs -->
			<div class="collpse tabs">
				<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<i class="fa fa-info-circle fa-icon" aria-hidden="true"></i> 业务介绍 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a> 
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<table class="hovertable" width=800px>
								<tr>
									<th>宠物类型</th><th>服务类型</th><th>花费</th><th>服务简介</th>
								</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i> 用户评论<span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								<p></p>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									<i class="fa fa-question-circle fa-icon" aria-hidden="true"></i> 权责说明 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">
								<p></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- collapse-tabs -->
	</div> 
	<!-- //shop --> 
	
	<!-- @@ get the shop information -->
	<script>
	function getQuery(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
	</script>
	<!-- get the shop information -->

	<!-- @**@ load the shop information when first enter-->
	<script type="text/javascript">
	$(document).ready(function(){
		alert("开始加载商店界面！");
		
		var $search=decodeURI(getQuery("search"));
        var $shopName=decodeURI(getQuery("shopName"));
		alert("上一个页面请求的宠物店是："+$shopName);
	    var $credit=decodeURI(getQuery("credit"));
		var $address=decodeURI(getQuery("address"));
		var $shopImgUrl=getQuery("img");
		var $shopTel=getQuery("shopTel");
		
		$(".item_name").text($shopName);
		$("#credit").text("评分："+$credit);
		$("#address").text("地址："+$address);
		$("#phone-number").text("电话："+$shopTel);
		
		$("#collapseOne p").text("这里是 本店宗旨");
		$("#collapseTwo p").text("这里是 业务介绍");
		$("#collapseThree p").text("这里是 用户评论");
		$("#collapseFour p").text("这里是 权责说明");
		$("#headingThree a").append("("+0+")");
		
		$("#firstimg").attr("src", "images/s1.jpg");
		$("#secondimg").attr("src", "images/s2.jpg");
		$("#thirdimg").attr("src", "images/s3.jpg");
		$("#firstthumb").attr("data-thumb", "images/s1.jpg");
		$("#secondthumb").attr("data-thumb", "images/s2.jpg");
		$("#thirdthumb").attr("data-thumb", "images/s3.jpg");
			
	    $("input#shopName").attr("value",$shopName);
		$("input#useId").attr("value","1");
		<!-- @@从session获取用户ID -->
		//$("input#useId").attr("value",<///////////////////%=Session["userId"]%>);

		<!-- 从session获取用户ID -->
		
		$.ajax({
			url:"ShopDetailServlet",
			type:"post",
			data:{
				flag:1,
				shopName:$shopName
			},
			cache:false,
			dataType:"json",
			success:function(resp) {
				console.log(resp);
				$("#shopHours").text("营业时间："+resp.shopHours);
				$("#credit").text("评分："+resp.grades);
				
				var iter=0;
				while(iter<=resp.service.length-1){
					var $tr = $("<tr></tr>");
					$tr.attr("onmouseover","this.style.backgroundColor='#ffff66';").attr("onmouseout","this.style.backgroundColor='#d4e3e5';");
					$tr.append("<td>"+ resp.service[iter].petsType +"</td>");
					$tr.append("<td>"+ resp.service[iter].serviceType +"</td>");
					$tr.append("<td>"+ resp.service[iter].price +"</td>");
					$tr.append("<td>"+ resp.service[iter].serviceIntro +"</td>");

					$tr.appendTo($(".hovertable"));
					
					iter=iter+1;
				}
			}
		});
		
		$(".shop-page").find("*").not("p").not("button").attr("style","border:0px;");
		alert("商店界面加载完成！");
	});
	</script>
	<!-- //load the shop information when first enter-->
	
	<!-- @$$@ just for test -->
	<script type="text/javascript">
	/*$(document).ready(function(){
		alert("开始加载商店界面！");
		
        var $shopName=decodeURI(getQuery("shopName"));
		alert("上一个页面请求的宠物店是："+$shopName);
	    var $credit=decodeURI(getQuery("credit"));
		var $address=decodeURI(getQuery("address"));
		var $shopImgUrl=getQuery("img");
		var $shopTel=getQuery("shopTel");
		
		$(".item_name").text($shopName);
		$("#credit").text("评分："+$credit);
		$("#shopHours").text("营业时间：");
		$("#address").text("地址："+$address);
		$("#phone-number").text("电话："+$shopTel);
		$("#service").text("所查服务：");
		
		$("#collapseTwo p").text("这里是 业务介绍");
		$("#collapseThree p").text("这里是 用户评论");
		$("#collapseFour p").text("这里是 权责说明");
		$("#headingThree a").append("("+0+")");
		
		$("#firstimg").attr("src", "images/s1.jpg");
		$("#secondimg").attr("src", "images/s2.jpg");
		$("#thirdimg").attr("src", "images/s3.jpg");
		$("#firstthumb").attr("data-thumb", "images/s1.jpg");
		$("#secondthumb").attr("data-thumb", "images/s2.jpg");
		$("#thirdthumb").attr("data-thumb", "images/s3.jpg");
			
	    $("input#shopName").attr("value",$shopName);
		$("input#useId").attr("value","1");
		
		var iter=0;
		while(iter<=5){
			iter=iter+1;
		    var $tr = $("<tr></tr>");
			$tr.attr("onmouseover","this.style.backgroundColor='#ffff66';").attr("onmouseout","this.style.backgroundColor='#d4e3e5';");
			$tr.append("<td>"+ "item1" +"</td>");
			$tr.append("<td>"+ "item2" +"</td>");
			$tr.append("<td>"+ "item3" +"</td>");
			$tr.append("<td>"+ "item4" +"</td>");

			$tr.appendTo($(".hovertable"));
		}
		
		$(".shop-page").find("*").not("p").not("button").attr("style","border:0px;");
		
		alert("商店界面加载完成！");
	});*/
	</script>
	<!-- //just for test -->
	
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