<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>회원탈퇴</title>
<style>

/* button */
.btn-round {
	border-radius: 24px;
}
.login-font{
    font-weight: bold;
    font-size: 1.2rem;
    color:#fff;
}
a {
	color: white;
	text-decoration: none;
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
	background-color: #ff5500;
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
	background-color: #ff9955;
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

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
    display: block;
    left: 0;
    bottom: -10px;
    width: 0;
    height: 2px;
    background-color: #F8F8F8;
    content: "";
    transition: width 0.2s;
}

.underlineHover:hover {
    /*color: #333B3D;*/
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

.sns-bg{
    padding: 10px;
    font-weight:bold;
    background: #f55555;
    border-radius:15px;
}

</style>
</head>
<body>

	<div class="wrapper ">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first px-4 py-4 text-left">
				<h2><strong>회원탈퇴</strong></h2>
				<hr align="left" width="150px" style="background-color: #c47100; height:1px;" />
			</div>

			<!-- Login Form -->
			<form action="<%=request.getContextPath()%>/studymember/goodbyePro">
			     아이디 <br>
				<input type="text" id="id" class=" " name="id" placeholder="email id" value="${memberID}" disabled> 
				<br>비밀번호 <br>
				<input type="password" id="password" class=" " name="password" placeholder="password"> 
				<input	type="submit" class="my-1" value="탈퇴하기"> <br>
				<br> <br>
			</form>

		</div>
	</div>

	<br />
	<br />
	<br />
	<br />

</body>
</html>
