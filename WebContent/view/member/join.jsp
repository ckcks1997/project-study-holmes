<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>회원가입</title>
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
	margin-top:30px;
	padding: 30px;
	width: 90%;
	max-width: 600px;
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

input[type=text]:focus, input[type=password]:focus{
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
.nameholder{
    text-align: left;
	padding:0;
	margin:0;
	padding-left:50px;
	margin-top:5px;
}
.btn-brown{
    background:#c47100;
    color:white;
}
.btn-brown:hover{
    background:#c47100;
    color:white;
}
.sns-bg{
    padding: 10px;
    font-weight:bold;
    background: #f55555;
    border-radius:15px;
}

</style>
<script>
function win_upload(){
    const op = "width=500, height=150, left=150, top=150";
    open('<%=request.getContextPath()%>/studymember/pictureForm', "",op);
}

</script>
</head>
<body>

	<div class="wrapper ">
		<div id="formContent">

			<div class=" first px-4 py-4 text-left">
				<h1>회원가입</h1>
				<p>스터디 홈즈에서 가치를 높이세요</p>
				<hr align="left" width="300px" style="border: 0.5px solid #c47100" />
			</div>

			<!-- Login Form -->
			<form action="<%=request.getContextPath()%>/studymember/joinPro" name="f">
			    <input type="hidden" name="picture">
                <input type="hidden" name="chk"> <br>
                <p class="nameholder">email</p>
				<input type="text" id="email" class="m-2 " name="email" placeholder="example@studyhomles.com"> 
				<p class="nameholder">email 확인</p>
				<input type="text" id="emailvalid" class="m-2 " name="emailvalid"
					placeholder="이메일을 확인해주세요"> 
				<p class="nameholder">비밀번호</p>
				<input type="password" id="password" class="m-2" name="password" placeholder="비밀번호를 입력해주세요"> 
				<p class="nameholder">비밀번호 확인</p>
				<input type="password" id="password_valid"
					class="m-2 " name="password_valid" placeholder="비밀번호를 확인해주세요"> 
					<p class="nameholder">이름</p>
				<input type="text" placeholder="이름" name="name" class="m-2"> 
				<p class="nameholder">닉네임</p>
				<input type="text" placeholder="닉네임" name="nickname" class="m-2"> 
				<p class="nameholder">전화번호</p>
				<input type="text" 	placeholder="전화번호" name="tel" class="m-2">
					<p class="nameholder">프로필 사진</p>
				<div class="col-4 mx-auto my-2 bg-none">
					<img src="" width="100" height="100" id="pic" onerror="this.src='<%=request.getContextPath()%>/img/profile_empty.jpg'"> <br>
					<button type="button" class="btn btn-sm m-2 btn-brown" onclick="win_upload()">프로필 사진등록</button>
				</div>

				<br> <input type="submit" class=" btn-brown" value="회원가입"> <br> <br>
			</form>

			<div id="formFooter">
				<h5>간편 회원가입</h5>
				<p>SNS 계정으로 간편하게 로그인하세요</p>
				<div class="container d-inline-flex justify-content-center sns-bg">
				    <a class="underlineHover login-font" href="#" >구글 로그인</a> &nbsp;|&nbsp;
				    <a class="underlineHover login-font" href="#" >네이버 로그인</a>
				</div>
			</div>

		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
 
</body>
</html>
