<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>


*{
 margin: 0;
 padding: 0;
 font-family: sans-serif;
 box-sizing: border-box;
}




.calendar{
width: 800px;
margin: 80px;
}

.header{
display: flex;
justify-content: space-between;
align-items: center;
}


.year-month { 
font-size: 35px;
}


.nav{
display: flex;
border: 1px solid #333333;
border-radius: 5px;
}

.nav-btn{
width: 28px;
height: 30px;
border: none;
font-size: 16px;
line-height: 34px;
background-color: transparent;
cursor: ponter;
}

.go-today{
width: 75px;
border-left: 1px solid #333333;
border-right: 1px solid #333333;
background-color: #c47100;
}

.days{
	
	display: flex;
	margin: 25px 0 10px;
}

.day{
	width: calc(100% / 7);
	text-align: center;
}

.dates{
	display: flex;
	flex-flow: row wrap;
	height: 500px;
	border-top: 1px solid #333333;
	border-right: 1px solid #333333;
	
}
.date{
	width: calc(100% / 7);
	padding:15px;
	text-align: right;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #333333;	
}

.day:nth-child(7n + 1),
.date:nth-child(7n + 1){
	color: #D13E3E;
}


.day:nth-child(7n),
.date:nth-child(7n){
	color: #396EE2;
}


.other{
	opacity: 0.3;
}

.today{
	position: relative;
	color: #333333;
	
}

			body,
			button,
			input,
			select,
			textarea {
				font-family: Roboto, Noto Sans KR, -apple-system, "system-ui", BlinkMacSystemFont,
					Apple SD Gothic Neo, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif, Oxygen, Ubuntu,
					Cantarell, Fira Sans, Droid Sans, Helvetica;
			}
			body {
				color: #454545;
				font-size: 1rem;
				font-weight: 500;
				line-height: 1.5;
			}
			a {
				color: #454545;
			}
			@font-face {
				font-family: "kita";
				src: url("../fonts/KITA.ttf") format("truetype");
				font-weight: normal;
				font-style: normal;
			}
			/* button */
			.btn-round {
				border-radius: 24px;
			}
			.a-no-deco {
				color: white;
				text-decoration: none;
			}
			.a-no-deco:visited {
				color: white;
				text-decoration: none;
			}
			.a-no-deco:hover {
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
			.b-img > img {
				display: none;
				text-align: right;
				max-width: 500px;
			}
			@media only screen and (min-width: 992px) {
				.b-img > img {
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
				display: block;
				height: 200px;
				background: #777;
				text-align: center;
			}
			/* 명언 */
			.famous-saying-box {
				height: 150px;
				background-color: #333b3d;
			}
			.color-white {
				color: white;
			}
			.footer-content {
				padding-top: 50px;
			}

			/* aside */
			ul,
			li {
				list-style: none;
			}

			li > a {
				color: rgb(10, 10, 10);
			}
			a:hover {
				text-decoration: none;
			}

			.aside-content {
				display: block;
				width: 200px;
				/*height와 line-height를 같은 값으로 주면 세로로 중앙 정렬이 된다.*/
				height: 40px;
				line-height: 40px;
				background: rgb(233, 233, 233);
				text-align: left;
				padding-left: 10px;
				border: 1px solid rgb(223, 223, 223);
			}

			/* 아래서부터는 페이지 종속css, 다른페이지에 복붙할 필요 x */
		</style>

		<title>Document</title>
	</head>
	<body>
		

		<div class="container-fluid famous-saying-box">
			<div class="container p-3">
				<div class="mt-3">
					<h3 class="color-white">오늘의 명언</h3>
					<div class="color-white">
						생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지 않으면 오류나 독단에 빠질
						위험이 있다. -공자
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row pt-5">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<h1>출석체크</h1>
					<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
					<br />

					<div class="calendar">
						<div class="header ">
							<div class="year-month "></div>
							<div class="nav">
								<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
								<button class="nav-btn go-today" onclick="goToday()">Check</button>
								<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
							</div>
						</div>
					</div>
					<div class="main">
						<div class="days">
							<div class="day">일</div>
							<div class="day">월</div>
							<div class="day">화</div>
							<div class="day">수</div>
							<div class="day">목</div>
							<div class="day">금</div>
							<div class="day">토</div>
						</div>
						<div class="dates"></div>
					</div>
				</div>
			</div>
		</div>
		
		




 <script src="<%=request.getContextPath()%>/js/check.js"></script> 
 <script>
 
 function check() {
 let con = document.querySelector(".today");
 
 alert(con.innerHTML+"일 출석완료되었습니다.");
 con.innerHTML='<img src="http://localhost:7498/study-homles-mvc2/img/check.jpeg" />'
 }
 
 </script>
</body>
</html>