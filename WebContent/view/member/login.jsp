<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Title</title>
<style>

/* button */
.btn-round {
	border-radius: 24px;
}

a {
	color: white;
	text-decoration: none;
}
/* navbar */
.form-control {
	height: 40px !important;
	background: #fff !important;
	color: #3a4348 !important;
	font-size: 16px;
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
}

.search-domain {
	background: #22d47b;
	border: 2px solid #22d47b;
	color: #fff;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	-ms-border-radius: 0;
	border-radius: 0;
}

.navbar-brand {
	position: relative;
	font-family: "kita";
}

.star {
	position: absolute;
	top: 10%;
	right: 5%;
	height: 10px;
}

/* banner */
.banner {
	position: relative;
	height: 400px;
	background-color: #f55555;
}

.b-container1 {
	position: relative;
	margin: auto;
	height: 100%;
}

.b-img {
	position: absolute;
	top: 10%;
	right: 5%;
	text-align: right;
}

.b-img>img {
	display: none;
	text-align: right;
	max-width: 500px;
}

@media only screen and (min-width: 992px) {
	.b-img>img {
		display: block;
		text-align: right;
		max-width: 500px;
	}
}

.b-text {
	color: #ffdfdf;
	position: absolute;
	top: 30%;
	left: 10px;
	max-width: 400px;
}

.footer {
	height: 200px;
	background: #777;
	text-align: center;
}

.footer-content {
	padding-top: 50px;
}

body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
}

/* STRUCTURE */
.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	min-height: 100%;
	padding: 20px;
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 30px;
	width: 90%;
	max-width: 450px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

#formFooter {
	background-color: #f6f6f6;
	border-top: 1px solid #dce8f1;
	padding: 25px;
	text-align: center;
	-webkit-border-radius: 0 0 10px 10px;
	border-radius: 0 0 10px 10px;
}

/* FORM TYPOGRAPHY*/
input[type=button], input[type=submit], input[type=reset] {
	background-color: #C47100;
	border: none;
	color: white;
	padding: 15px 80px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 20px 40px 20px;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #C47100;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active
	{
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

input[type=text], input[type=password] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 5px;
	width: 85%;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
	background-color: #fff;
	border-bottom: 2px solid #C47100;
}

input[type=text]:placeholder {
	color: #cccccc;
}

/* ANIMATIONS */

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
	display: block;
	left: 0;
	bottom: -10px;
	width: 0;
	height: 2px;
	background-color: #C47100;
	content: "";
	transition: width 0.2s;
}

.underlineHover:hover {
	color: #0d0d0d;
}

.underlineHover:hover:after {
	width: 100%;
}

/* OTHERS */
*:focus {
	outline: none;
}

#icon {
	width: 60%;
}
</style>
</head>
<body>

	<div class="wrapper ">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first px-4 py-4 text-left">
				<h1>로그인</h1>
				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />
			</div>

			<!-- Login Form -->
			<form action="<%=request.getContextPath()%>/studymember/loginPro">
				<input type="text" id="id" class="fadeIn second" name="id" placeholder="email id"> 
				<input type="password" id="password" class="fadeIn third" name="password" placeholder="password"> 
				<input	type="submit" class="fadeIn fourth my-1" value="로그인"> 
					<input type="submit" class="fadeIn fourth my-1" value="회원가입"> <input type="submit" class="fadeIn fourth my-1" value="비밀번호 찾기">
				<br> <br>
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<h5>SNS 로그인</h5>
				<a class="underlineHover" href="#" style="color: #0d0d0d;">구글 계정 로그인</a>
			</div>

		</div>
	</div>

	<br />
	<br />
	<br />
	<br />

</body>
</html>
