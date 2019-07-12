<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); //for http 1.1 
response.addHeader("Pragma", "no-cache"); //for older http versions--http 1.0
response.addDateHeader ("Expires", 0); // for proxies

%>	
  
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700i"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Engagement'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=East Sea Dokdo'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Cinzel Decorative'
	rel='stylesheet'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />

<link rel = "stylesheet" 
	href="${pageContext.request.contextPath }/resources/css/index_style.css" />


<title>Shop Incredibly!</title>
<style>
#areaCsl {
	position: relative;
}
/* #a-image{
background:url('resources/images/6827768-shopping-wallpaper.jpg') center fixed;
background-size:cover;
backgroun-clip:content-box;
}
 */
.bg {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

html {
	font-family: 'Roboto Condensed', sans-serif;
	overflow-x:hidden;
}

#mainnav {
	position: absolute;
	font-family: 'Roboto Condensed', sans-serif;
	z-index: 1;
}

#mainnav li {
	margin: 55px 0;
	left: -550px;
	position: relative;
	display: none;
	font-size: 1vw;
}

#mainnav a {
	color: white;
	text-decoration: none;
	font-size: 1.4em;
}

ul li {
	list-style: none;
	margin-top: -50px;
}

.hamb {
	position: fixed;
	top: 20px;
	left: 20px;
	font-size: 2.5em;
	z-index: 1;
}

.hamb a {
	color: #fff;
	text-decoration: none;
}

#bubble {
	width: 100%;
	height: 100%;
	opacity: 0.9;
	position: fixed;
	display: none;
	z-index: 1;
	background: rgba(0, 0, 0, .5);
}

.gap {
	color: white;
	margin-top: 100px;
	width: 17vw;
}

.container-fluid {
	padding-top: 150px;
	padding-bottom: 150px;
	margin: 0px;
}

.well {
	font-size: 35px;
	font-weight: bold;
	font-family: 'Cinzel Decorative';
}

.thumbnail {
	border: 1px solid black;
	height: 350px;
}

.sectionThree {
	padding-top: 60px;
	padding-bottom: 60px;
	background-color: #1d1b1b/* #2d2d30 */;
}

.navbar-header {
	font-size: 4vw;
	padding-left: 80px;
	padding-top: 20px;
	/* "Comic Sans MS", cursive, sans-serif;     Akronim,Amita,Cinzel Decorative,East Sea Dokdo */
	font-family: 'Engagement';
	font-weight: 200;
	filter: drop-shadow(.1em .1em black);
	mix-blend-mode: difference;
}

.navbar-header span {
	color: #e15600;
}

.carousel-caption {
	color: #e15600;
}

.item.active {
	position: relative;
}

.hover-slide {
	position:fixed;
	top:3%;
	left: 85%;
	font-size: 0.5vw;
	padding: 12px 24px;	
}

.hover-slide .btn {
	width: 10vw;
	height: 5vh;
	border-radius:12px;
}

.hover-slide .btn:hover {
	background-color: black;
	color: white;
	border-radius: 12px;
	transition-duration: .3s;
	box-shadow: 8px 5px 6px 0px black;
}

.hover-slide-cart {
	position: absolute;
	top: 50%;
	left: 26%;
	font-size: 16px;
	padding: 12px 24px;
}

.hover-slide-cart .btn {
	width: 10vw;
	height: 5vh;
}

.hover-slide-cart .btn:hover {
	background-color: black;
	color: white;
	border-radius: 7px;
	transition-duration: .5s;
	box-shadow: 10px 5px 8px 0px black;
}

.sectionTwo {
	background: url('resources/images/shopping_logo.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	height: 50vh;
}

.contact {
	font-size: 1.2vw;
	padding-left: 40px;
}

.map {
	padding-right: 30px;
	padding-bottom: 20px;
	height: 60vh;
	width: 55vw;
}

.slideanim {
	visibility: hidden;
}

.slide {
	/* The name of the animation */
	animation-name: slide;
	-webkit-animation-name: slide;
	/* The duration of the animation */
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	/* Make the element visible */
	visibility: visible;
}

/* Go from 0% to 100% opacity (see-through) and specify the percentage from when to slide in the element along the Y-axis */
@keyframes slide { 
0%{
	opacity: 0;
	transform: translateY(70%);
}

100%
{
opacity:1;
transform:translateY(0%);
}
}
@-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}
100%
{
opacity:1;
-webkit-transform:translateY(0%);
}
}
</style>

</head>
<body>
	
	<nav role='navigation' id="mainnav">
		<div class="navbar-header">
			<a class="navbar-brand" href="tosessionIndex"><span>A</span>afnai <span>S</span>uper<span>M</span>arket</a>		
		</div>
		
		<div class="">
			<ul class="gap">
				<li><a href="logout">LOGOUT</a></li>
				<li><a href="#?">PRODUCTS AND SERVICES</a></li>
				<li><a href="#?">ABOUT US</a></li>
				<li><a href="#?">CONTACT</a></li>
			</ul>
		</div>
	</nav>
	
	
	<div class="hamb">
		<a href="#"><i class="fa fa-bars"></i></a>
	</div>

	<canvas id="bubble"></canvas>

	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.js"></script>


	<!-- ---------------Carousel---------------- -->
	<div id="areaCsl">
		<div class="carousel slide" data-ride="carousel" id="myCarousel">
			<ol class="carousel-indicators">
				<li class="active" data-target="#myCarousel" data-slide-to="0" />
				<li data-target="#myCarousel" data-slide-to="1" />
				<li data-target="#myCarousel" data-slide-to="2" />
				<li data-target="#myCarousel" data-slide-to="3" />
			</ol>

			<div class="carousel-inner" role="listbox"
				style="width: 100%; height: 105vh !important;">
				<div class="item active">
					<img class="d-block w-100" src="resources/images/cart.png"
						alt="Cart" style="width: 100%; height: 105vh" />

					<!-- caption -->
					<div class="carousel-caption">
						<h3 class="h3-responsive">Buckle up! It's shopping time.</h3>
					</div>
				</div>
				<div class="item">
					<img class="d-block w-100" src="resources/images/people.jpg"
						alt="zone" style="width: 100%; height: 105vh;" />
					<div class="carousel-caption">
						<h3>Shopping is fun.</h3>
					</div>
				</div>

				<div class="item">
					<img class="d-block w-100" src="resources/images/bowling.jpg"
						alt="Pool" style="width: 100%; height: 105vh;" />
					<div class="carousel-caption">
						<h3>Entertainment at its best!</h3>
					</div>
				</div>
				<div class="item">
					<img class="d-block w-100" src="resources/images/tequila.jpg"
						alt="shots" style="width: 100%; height: 105vh" />
					<div class="carousel-caption">
						<h3>Drink Responsibly.</h3>
					</div>
				</div>
			</div>
		</div>

		<!-- -------------Left and Right controls------------- -->
		<a href="#myCarousel" class="left carousel-control" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a href="#myCarousel" class="right carousel-control" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	

		<div class="hover-slide">
			<button class="btn">
				<span class="glyphicon glyphicon-user"></span> ${fname }
			</button>
		</div>
		
		<div class="hover-slide-cart">
			<button class="btn btn-primary">
				<span class="glyphicon glyphicon-gift"></span> Accessories
			</button>
			<p style="font-family: East Sea Dokdo; font-size: 2vw;">Add to
				your cart.</p>
		</div>
		


	<!-- --------------Carousel End------------- -->


	<!-- -----------Section Two---------- -->

	<div class="well text-center slideanim">Find your assets!</div>
	<div class="sectionTwo">
		<div class="search-box">
			<input type="text" class="search-txt" placeholder="Type to Search" />
			<a class="search-btn" href="#">
				<i class="fas fa-search"></i>
			</a>
		</div>		
	</div>


	<!-- --------------------Thumbnails---------------- -->
	<div>
		<div class="well">
			<p class="text-center slideanim">All under same roof!</p>
		</div>
		<div class="sectionThree">
			<div class="container">
				<div class="row slideanim">
					<div class="col-xs-4">
						<div class="thumbnail">
							<img style="height: 280px;" src="resources/images/gadgets.jpg"
								alt="gadgets" />
							<div class="caption">
								<p align="center">
									<b>Buy all kinds of gadgets at a single place.</b>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="thumbnail">
							<img style="height: 280px;" src="resources/images/theater.jpg"
								class="img-thumbnail" alt="16d" />
							<div class="caption">
								<p align="center">
									<b>Experience 16 dimensional thrill.</b>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="thumbnail">
							<img style="height: 280px;" src="resources/images/snooker.jpg"
								class="img-thumbnail" alt="snooker" />
							<div class="caption">
								<p align="center">
									<b>Enjoy indoor games.</b>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="sectionFive">
		<div class="container">
			<h2 class="well text-center slideanim">Contact</h2>
		</div>
		<div class="row">
			<div class="col-xs-3 contact">
				<span class="glyphicon glyphicon-phone"></span> For Queries::
				+9774266998<br /> <span class="glyphicon glyphicon-envelope"></span>
				Mail us at:: asM@gmail.com<br /> <span
					class="glyphicon glyphicon-map-marker"></span> NewRoad,Ktm,Nepal<br />
				<br />
				<p>
					Tollfree Number:: +133500098000<br> Find us on:<br /> <a
						href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
					Facebook and <i class="fa fa-thumbs-up"></i> our page.<br> <a
						href="#"><i class="fab fa-twitter-square"></i></a> Twitter and
					follow our page.<br /> <a href="#"><i class="fab fa-instagram"></i></a>
					Instagram and follow our posts.
				</p>

			</div>
			<div class="col-xs-9">
				<img src="resources/images/map.jpg" alt="map"
					class="img-responsive map">
			</div>
		</div>
	</div>

	<footer style="text-align:center;font-size:1vw;">&copy;
	Copyright 2018 ASM | All rights reserved.</footer>

	<script>
		var w = window.innerWidth, h = window.innerHeight, canvas = document
				.getElementById('bubble'), ctx = canvas.getContext('2d'), rate = 60, arc = 100, time, count, size = 7, speed = 20, lights = new Array, colors = [
				'#d59254', '#ffffff', '#1f2839', '#cf7693' ];

		canvas.setAttribute('width', w);
		canvas.setAttribute('height', h);

		function init() {
			time = 0;
			count = 0;

			for (var i = 0; i < arc; i++) {
				lights[i] = {
					x : Math.ceil(Math.random() * w),
					y : Math.ceil(Math.random() * h),
					toX : Math.random() * 5 + 1,
					toY : Math.random() * 5 + 1,
					c : colors[Math.floor(Math.random() * colors.length)],
					size : Math.random() * size
				}
			}
		}

		function bubble() {
			ctx.clearRect(0, 0, w, h);

			for (var i = 0; i < arc; i++) {
				var li = lights[i];

				ctx.beginPath();
				ctx.arc(li.x, li.y, li.size, 0, Math.PI * 2, false);
				ctx.fillStyle = li.c;
				ctx.fill();

				li.x = li.x + li.toX * (time * 0.05);
				li.y = li.y + li.toY * (time * 0.05);

				if (li.x > w) {
					li.x = 0;
				}
				if (li.y > h) {
					li.y = 0;
				}
				if (li.x < 0) {
					li.x = w;
				}
				if (li.y < 0) {
					li.y = h;
				}
			}
			if (time < speed) {
				time++;
			}
			timerID = setTimeout(bubble, 1000 / rate);
		}
		init();
		bubble();

		//navigation (this is my code)
		var animation = 'easeOutCubic';
		delay = 60;

		$(document).on('click', '.fa-bars', function() {
			var i = 0;
			$('nav').before($('#bubble'));
			$('#bubble').fadeIn();
			$('#mainnav').find('li').each(function() {
				var that = $(this);
				i++;
				(function(i, that) {
					setTimeout(function() {
						that.animate({
							'left' : '20px'
						}, {
							duration : 350,
							easing : animation
						}).fadeIn({
							queue : false
						});
					}, delay * i)
				}(i, that))
			});
			$('.fa-bars').fadeOut(100, function() {
				$(this).removeClass('fa-bars').addClass('fa-times').fadeIn();
			});
		}).on(
				'click',
				'#bubble, .fa-times',
				function() {
					$('#bubble').fadeOut();
					$('#mainnav').find('li').animate({
						'left' : '-550px'
					}, {
						duration : 250
					}).fadeOut({
						queue : false
					});

					$('.hamb').fadeOut(
							100,
							function() {
								$(this).find($('i')).removeClass('fa-times')
										.addClass('fa-bars').end().fadeIn();
							});
				})

		$(window).scroll(function() {
			$(".slideanim").each(function() {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});
	</script>
</body>
</html>