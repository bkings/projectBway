<%@page import="com.java.broadwayProject.daos.PointsDaoImpl"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.java.broadwayProject.daos.PointsDao"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.java.broadwayProject.models.Customer"%>
<%@page import="com.java.broadwayProject.models.Points"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); //for http 1.1 
   response.addHeader("Pragma", "no-cache"); //for older http versions--http 1.0
   response.addDateHeader ("Expires", 0); // for proxies
		  
	if(session.getAttribute("allCustomerInfo")==null){
		
%>
	<c:redirect url="/login" />
	
<% } %>

<%-- <%@ page session="false"%> --%>

<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href='https://fonts.googleapis.com/css?family=Amita'
	rel='stylesheet'>
	
	<!-- header for font awesome 5 -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	

<!-- <link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/home_style.css?version=51" />


<title>${customer }'s Dashboard</title>
<style>
*{
box-sizing: border-box;
margin: 0;
padding: 0;
}
body{
margin:0;
font-family:"Comic Sans MS", cursive, sans-serif;
overflow-x:hidden;
}

.content span{
color:white;
font-family:'Amita';
}

.div1{
/*margin-left:15px;  damages the grid formation i.e. increase in size of that portion
margin-top:5px;*/
padding-left:110px;
padding-top:35px;
color:black;
} 

.main{
height:100%;
/* background:url(resources/images/bokeh_lights.jpg) fixed; */
background:#584e4a;
background-size:cover;
margin:0px;
height:65vh;
color:white;
}

.img-circle{
  border:solid 4px transparent;
  margin-bottom:10px;
}
.img-circle:hover{
  border-color:black;
  transition-duration:0.7s;
}

.main2{
margin:17px 2px 10px 5px;
background:#f0f0f0;
}

.main2 img{
padding:15px;
}

.main2 p{
font-size:1.2vw;
margin-top:65px;
}

.well{
margin-top:10px;
}

.panel-group{
color:black;
}

.content{
transform-origin:top right;
transition:transform 0.5s;
background:url(resources/images/asmblur.png) fixed;
background-size:cover;
height:67vh;
}

.content_inner{
height:100%;
overflow-y:auto;
margin:0;		/* overflow hunna esle(window baira janna) */
}

.menu_toggle{
margin-right:0px;
position:absolute;
right:0%;
z-index:900;
display:block;
cursor:pointer;
width:50px;
height:38px;
background-color:#f37272;
border-bottom-left-radius:100%;
}

.menu_toggle:active i{
opacity:0.8;
}

.menu_toggle i{
color:#f0f0f0;
}

.menu_toggle .menu_open, .menu_toggle .menu_close {
position: absolute;
top: 50%;
left: 50%;
margin-top: -15px;
margin-left: -12px;
transition: transform 0.7s; /* cubic-bezier(1, 0.005, 0.24, 1) */
}

.menu_toggle .menu_open{
  transform-origin: -400px 300px;
}
.menu_toggle .menu_close{
  transform: rotate(50deg);				/* yo nabhaye openclose ekai thauma huncha */
  transform-origin: 400px -300px;
}

.menu_items{
position:fixed;
bottom:35vh;
left:40px;
list-style-type:none;
margin:0;
padding:0;
}

.gears{
width:10vw;
height:18vh;
margin-bottom:20px;
transform:translateX(-400px); 
transition:transform 0.7s 0s;
}

.panel{
font-size:0.7vw;
width:12vw;
margin-bottom:30px;
transform:translateX(-400px);
transition:transform 0.7s 0s;
}

.panel a{
text-decoration:none;
}

.panel2{
margin-left:50px;
}

.panel3{
margin-left:100px;
}

.shazam .content {
  transform: rotate(15deg);
}
.shazam .menu_open {
  transform: rotate(-20deg);
}
.shazam .menu_close {
  transform: rotate(0);
}

.shazam .panel{
transform:translate(-0);
transition:transform 0.35s 0.45s;
}

.shazam .gears{
transform:translate(-0);
transition:transform 0.35s 0.45s;
}

.content a span{
color: #e15600;
}

</style>
</head>
<body>

	<div class="main">		
		<span class="menu_toggle">
			<i class="menu_open fa fa-bars fa-lg"></i>
			<i class="menu_close fa fa-times fa-lg"></i>
		</span>
		<div class="menu_items">
			<!-- Panel for settings menu -->
			<div class="panel-group" id="accordion">
			<img src="resources/images/user_gear.png" class="img-responsive gears" alt="gear"/>
				<!-- First Panel(1st settings option) -->
				<div class="panel panel-success panel1">
					<div class="panel-heading">
						<p class="panel-title" style="font-size:0.9vw;text-decoration:strong;">
							<a data-toggle="collapse" data-parent="#accordion" href="#option1">Account Settings</a>
						</p>
					</div>
					<div id="option1" class="panel-collapse collapse">
						<ul class="list-group">
							<a href="${pageContext.request.contextPath }/${customerId }/edit"><li class="list-group-item">Edit Information</li></a>
							<a href="#"><li class="list-group-item">Manage Account</li></a>
							<a href="#"><li class="list-group-item">Identity Confirmation</li></a>
						</ul>
					</div>
				</div>
				
				<!-- Second Panel(2nd settings option) -->
				<div class="panel panel-primary panel2">
					<div class="panel-heading">
						<p class="panel-title" style="font-size:0.9vw;text-decoration:strong;">
							<a data-toggle="collapse" data-parent="#accordion" href="#option2">Privacy Settings</a>
						</p>
					</div>
					<div id="option2" class="panel-collapse collapse">
						<ul class="list-group">
							<a href="#"><li class="list-group-item">Your Activity</li></a>
							<a href="#"><li class="list-group-item">Your Transactions</li></a>
							<a href="#"><li class="list-group-item">Notifications</li></a>
						</ul>
					</div>
				</div>
				
				<!-- Third Panel(3rd settings option) -->
				<div class="panel panel-warning panel3">
					<div class="panel-heading">
						<p class="panel-title" style="font-size:0.9vw;text-decoration:strong;">
							<a data-toggle="collapse" data-parent="#accordion" href="#option3">Security Settings</a>
						</p>
					</div>
					<div id="option3" class="panel-collapse collapse">
						<ul class="list-group">
							<a href="#"><li class="list-group-item">Login Settings</li></a>
							<a href="#"><li class="list-group-item">Contact</li></a>
							<a href="#"><li class="list-group-item">Transaction Security</li></a>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<main class="content">
			<span style="font-size:2.3vw;color:black;">Welcome, </span><span style="font-size:2em;color:black;">${customer } !</span>
			<a href="tosessionIndex" style="font-size:2.5vw;color:white;position:absolute;font-family:'Amita';left:40vw;text-decoration:none;"><span>A</span>afnai <span>S</span>uper<span>M</span>arket</a>
			<span style="font-size:1.8vw;position:absolute;right:5%;top:1%;">ASM Profile View</span>
			
			<div class="row content_inner">
		 		<div class="col-xs-3 div1">
		 			<figure>
						<a href="#userDetail" data-toggle="collapse"><img class="img-responsive img-circle" src="resources/images/user.jpg" alt="user" style="width:100px;height:100px;"/></a>
						<figcaption style="font-size:1vw;">Click to view info</figcaption>
					</figure>
					<div id="userDetail" class="collapse">
						<h4 style="font-size:0.9vw;">${customer } ${customerLname }</h4>
						<h5 style="font-size:0.8vw;">Your current Accumulation of points : ${currentPoint }</h5><br/>
						<button class="btn btn-danger" onclick="logout()">Log Out</button>
					</div>
		 		</div>
		  		<div class="col-xs-6">
		  			<h1 align="center">It's been ${datetimeDifference } minutes since you received your ASM points!</h1>
		  		</div>
		 		<div class="col-xs-3 div3">
		 		</div>
		 	</div>
		 </main>
	</div>
	
	<h1 class="mid_heading">Shop Online !</h1>
	<div class="main-mid">
		<div class="navbar">
			<div class="row">
				<div class="col-xs-4">
					<div class="dropdown">
					<button class="dropbtn"><figure><img class="img-responsive img-circle" src="resources/images/men_logo.png" /><figcaption>Men</figcaption></figure></button>
					<div class="dropdown-content">
						<a href="#">Top Wear</a>
						<a href="#">Bottom Wear</a>
						<a href="#">Festives and Formals</a>
					</div>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="dropdown">
					<button class="dropbtn"><figure><img class="img-responsive img-circle" src="resources/images/women_logo.jpg" /><figcaption>Women</figcaption></figure></button>
					<div class="dropdown-content">
						<a href="#">Fusion Wear</a>
						<a href="#">Western Wear</a>
						<a href="#">Foot Wear</a>
						<a href="#">Scarfs, Belts and more</a>
						<a href="#">Formals</a>
					</div>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="dropdown">
					<button class="dropbtn"><figure><img class="img-responsive img-circle" src="resources/images/home_logo.jpg" /><figcaption>Home and Living</figcaption></figure></button>
					<div class="dropdown-content">
						<a href="#">Bed Lining and Furnishing</a>
						<a href="#">Flooring</a>
						<a href="#">Bath</a>
						<a href="#">Home Decor</a>
						<a href="#">Lamps and Lighting</a>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row main2">
		<div class="container-fluid col-xs-8">
			<div class="well text-center">Your Activities</div>
			<div class="row">
				<div class="col-xs-4">
					<img class="img-responsive" src="resources/images/allitems.png" alt="MyProducts"/>
				</div>
				<div class="col-xs-8">
					<p>See how good you are at shopping! Check out all the items you have purchased from this supermarket.</p><br/>
					<button class="btn btn-primary">Get In</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4">
					<img class="img-responsive" src="resources/images/games.jpg" alt="Gaming" style="border-radius:20px 40px;width:65vw;height:auto;"/>
				</div>
				<div class="col-xs-8">
					<p>Witness your entertainment activities. Analyse all your stats of the games you have played!</p><br/>
					<button class="btn btn-primary">See Stats</button>
				</div>
			</div>
		</div>
		<div class="container-fluid col-xs-4">
			<div class="well text-center">
				How others are shopping!
			</div>
			<div class="div3_rightPanel">
				<p><i class="fas fa-cart-arrow-down"></i> Raju just bought a pair of shoes.</p></br>
				<img class="img-responsive" src="resources/images/shoes.jpg" alt="Shoes" align="middle" style="width:20vw;height:23vh;border-radius:30px;"/>
				<p><i class="fas fa-shopping-basket"></i> Wigee got herself a shirt, jeans and Rayban sunglasses.</p><br/>
				<img class="img-responsive" src="resources/images/sunglass.jpg" alt="sunglass" align="middle" style="width:20vw;height:23vh;border-radius:30px;"/>
			</div>
		</div>
	</div>
	
	<div class="main3">
		<div class = "container">
			<h2 class="popular_searches">Popular searches</h2><br/>
			<p>| Makeup | Dresses For Girls | T-Shirts | Sandals | Headphones | Blazers For Men | Handbags | Ladies Watches |
			  | Bags | Sport Shoes | Reebok Shoes | Puma Shoes | Boxers | Wallets | Tops | Earrings | Fastrack | Watches | Kurtis | Nike | Smart Watches  
			   | Titan Watches | Gowns | Rings | Shoes For Men | Forever 21 | Eye Makeup | Photo Frames | Saree | Lehenga | Nike Shoes | Goggles | Suit | Shoes |
			   Adidas Shoes | Woodland Shoes | Jewellery | Designers Sarees |</p>
		</div>
	</div>
	
	<div class="final_section">
		<div class="container">
			<h3 class="final_info">Avail added online shopping benefits!</h3>
			<p>Make sure to use our card or cash on delivery option, easy 30-day returns policy, try and buy option (for select products)
			,and other customer-friendly features.<br/> A comprehensive sizing guide and detailed product descriptions coupled with high-resolution 
			product shots will give you all the information to make the right buying decision.<br/>	
			You just need to pay for the product, while we ensure free shipping on almost everything.<br/>
			You can also buy gifts for your loved ones and avail our special gift-wrap facility at a nominal cost on ASM.	
			Give your wardrobe an upgrade with stylish clothing-head to aafnaiSuperMarket.com for a great online fashion shopping experience now!</p>
		</div>
	</div>
	
	<p id="msg" align="center"></p>
	<p id="demo" align="center"></p>

	<!-- -------------MODAL------------- -->	
		
	<div  id="nepal" class="modal fade" role="dialog" style="color:black;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-lock"> Your Points</span></h4>
				</div>
				<div class="modal-body" align="center">
						<img src="resources/images/gift.jpg" style="display:block;margin-left:auto;margin-right:auto;max-width:100%;height:auto;"/><br/>
						<p>Thank you for visiting Aafnai SuperMarket! <br/> 50 points everyday.<br/>You just received your points by signing in!!</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger pull-left" data-dismiss="modal">Close<span class="glyphicon glyphicon-remove"></span></button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		
		function runClock() {
			btnDisable();
			var timeInMinutes = 10; //24*60=1440
			var currentTime = Date.parse(new Date());
			var deadline = new Date(currentTime + timeInMinutes * 60 * 1000);
	
			function updateClock() {
				var now = new Date().getTime();
				var t = deadline - now;
				var days = Math.floor(t / (1000 * 60 * 60 * 24));
				var hours = Math.floor((t % (1000 * 60 * 60 * 24))/ (1000 * 60 * 60));
				var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
				var seconds = Math.floor((t % (1000 * 60)) / 1000);
				document.getElementById("msg").innerHTML ="<b>Time Remaining for points Unlock : </b>";
				document.getElementById("demo").innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";
				if (t < 0) {
					clearInterval(x);
					document.getElementById("demo").innerHTML = "Time Limit Over";
					document.getElementById("pointClaim").disabled = false;
				}
			}
			updateClock();			//to overcome 1 second lag while starting countdown;
			var x = setInterval(updateClock, 1000);
		}

		//runClock();
		
		function logout() {
			window.location = "${pageContext.request.contextPath}/logout";
		}
		
		//show modal on page load
		<%	
			String dtdiff = session.getAttribute("dateTimeDifference").toString();
			int dtdiffToInt = Integer.parseInt(dtdiff);
			if(dtdiffToInt>=5){
				
		%>
		
 				$(window).on('load',function(){
 					$('#nepal').modal('show');
 				});		

		<% } %>
		
		//Transition
	    // elements
	    jQuery.noConflict();
		var $page = $('.main');

		$('.menu_toggle').on('click', function(){
		  $page.toggleClass('shazam');
		});
		$(window).on('scroll', function(){
		  $page.removeClass('shazam');
		});				

		
	</script>


</body>
</html>
