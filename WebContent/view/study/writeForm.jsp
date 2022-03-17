<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body, button, input, select, textarea {
	font-family: Roboto, Noto Sans KR, -apple-system, "system-ui",
		BlinkMacSystemFont, Apple SD Gothic Neo, Segoe UI, Roboto,
		Helvetica Neue, Arial, sans-serif, Oxygen, Ubuntu, Cantarell,
		Fira Sans, Droid Sans, Helvetica;
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
	src: url("fonts/KITA.ttf") format("truetype");
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
/*스터디정보 헤드 */
.famous-saying-box {
	height: 150px;
	background-color: #333b3d;
}

.c-img {
	
}

.c-img>img {
	width: 100%;
	height: 100%;
}

.color-white {
	color: white;
}

.footer-content {
	padding-top: 50px;
}

/* aside */
ul, li {
	list-style: none;
}

li>a {
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
</head>
<body>
	<div class="container-fluid famous-saying-box">
		<div class="container p-3">
			<div class="mt-3">
				<h3 class="color-white">오늘의 명언</h3>
				<div class="color-white">생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지
					않으면 오류나 독단에 빠질 위험이 있다. -공자</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pt-5">
			<aside class="col-sm-3">
				<div class="col aside">
					<div class="aside-content">
						<li class=""><a href=""> 전체 스터디 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href=""> 개발/프로그래밍 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href=""> 보안/네트워크 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href=""> 크리에이티브 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href=""> 직무/마케팅 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href=""> 학문/외국어 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href=""> 교양 </a></li>
					</div>
				</div>
			</aside>
			<div class="col-sm-9">
				<h1>글쓰기</h1>
				<form action="<%=request.getContextPath() %>/studymenu/writePro">
					<hr align="left" width="150px" style="border: 0.5px solid #c47100" />
					<div class="form-group">
						<label>제목:</label> 
						<input type="text" class="form-control" name="subject" />
					</div>
					
					<label for="free"></label> <label class="radio-inline"> </label><input type="radio"
							name="free" value="1">무료 <label class="radio-inline">
						</label><input type="radio" name="free" value="2">유료
						
					<div class="form-group">
						<label>인원수:</label> 
						<input type="text" class="form-control" name="pernum" />
					</div>
					
					<div class="form-group">
						<label>지역:</label> 
						<input type="text" class="form-control" name="region" />
					</div>				
					

					<div id="center" style="padding: 3px">
						<button type="submit" class="btn btn-dark">입 력</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>