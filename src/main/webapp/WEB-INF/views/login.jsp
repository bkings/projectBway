<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'>
	
<link href='https://fonts.googleapis.com/css?family=Amita'
	rel='stylesheet'>

<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

<title>ASM-Login</title>
</head>

<style>

.sign-up::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #F5F5F5;
}

.sign-up::-webkit-scrollbar
{
	width: 8px;
	background-color: #F5F5F5;
}

.sign-up::-webkit-scrollbar-thumb
{
	background-color: #000000;
}

body{
background-image:url('resources/images/lamp.jpg');
background-size:cover;
}

.img:before{
background:url('resources/images/night_sky.jpg');
background-size:cover;
}

.sign-up{
padding-bottom:45px;
overflow-y:auto;
}

.asmHeader a{
	margin-left:120px;
}

.asmHeader a span{
	color:#e15600;
}

.slide {
	/* The name of the animation */
	animation-name: slide;
	-webkit-animation-name: slide;
	/* The duration of the animation */
	animation-duration: 1.5s;
	-webkit-animation-duration: 1.5s;
	/* Make the element visible */
	visibility: visible;
}


/* Go from 0% to 100% opacity (see-through) and specify the percentage from when to slide in the element along the Y-axis */
@keyframes slide { 
0%{
	opacity: 0;
	transform: translateY(90%);
}

100%
{
opacity:1;
transform:translateY(0%);
}
}
@-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(90%);
}
100%
{
opacity:1;
-webkit-transform:translateY(0%);
}
}


</style>

<body>
<div class="asmHeader slide">
	<a href="index.jsp" style="font-size:2.5vw;color:white;font-family:'Amita';text-decoration:none;">
		<span>A</span>afnai <span>S</span>uper<span>M</span>arket
	</a>
</div>
<div class="cont">
  <div class="form sign-in">
  <form action="custlogin" method="post">
    <h2 class="slide">Welcome back,</h2>    
    <label>
      <span class="glyphicon glyphicon-user"></span><span><strong> Email</strong></span>
      <input type="email" placeholder="YourEmail@email.com" name="email" required/>
    </label>
    <label>
      <span class="glyphicon glyphicon-lock"></span><span> Password</span>
      <input type="password" placeholder="Your password" name="password" required/>
    </label>
    <p class="forgot-pass">Forgot password?</p>
    <button type="submit" class="submit slide"><span class="glyphicon glyphicon-log-in slide"> Log In</span></button>
    <button type="button" class="fb-btn">Connect with <span><i class="fab fa-facebook"></i> facebook</span></button>
  </form>
  </div>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>New here?</h2>
        <p>Sign up and discover greater deals and offers!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already have an account, just sign in. We've missed you!</p>
      </div>
      <div class="img__btn slide">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Log In</span>
      </div>
    </div>
    <div class="form sign-up">
    <form action="custsignup" method="post">
      <h2>Time to feel like home,</h2>
      <label>
        <span>First Name</span>
        <input type="text" name="fname" required />
      </label>
      <label>
        <span>Last Name</span>
        <input type="text" name="lname" required />
      </label>
      <label>
        <span>DOB</span>
        <input type="date" value="YYYY-MM-DD" name="dob" required/>
      </label>
      <label>
        <span>Phone</span>
        <input type="tel" pattern="[8-9]{2}[0-9]{4}[0-9]{4}" placeholder="98XXXXXXXX" title="Phone Number: 98XXXXXXXX" name="phone" required/>
      </label>
      <label>
        <span>Address</span>
        <input type="text" name="address" required/>
      </label>
      <label>
        <span>Email</span>
        <input type="email" placeholder="xyz@email.com" name="email" required/>
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="password" required/>
      </label>
      <button type="submit" class="submit">Sign Up</button>
      <button type="button" class="fb-btn">Join with <span>facebook</span></button>
      </form>
 	</div>
  </div>
</div>

<script  src="resources/js/index.js">
</script>

</body>
</html>