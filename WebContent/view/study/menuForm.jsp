<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
.search {
	display: inline-block;
}

.tagbox {
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	background-color: #c47100;
	border-radius: 15%;
}

.tagbox-etc {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	background-color: #f55555;
	border-radius: 15%;
}

.tagbox>a {
	color: white;
	font-size: 0.8 rem;
}

/* 스터디글 상자 */
.study-box {
	width: 230px;
	height: 300px;
	background: rgb(255, 255, 255);
	margin: 10px;
	margin-bottom: 40px;
}

.img {
	
}

.img>img {
	width: 100%;
	height: 100%;
}

.b-h5 {
	font-weight: bold;
	margin: 0;
}

.b-p {
	margin-bottom: 0;
}

.b-people {
	margin: 0;
}

.b-rep {
	font-size: 12px;
}

.b-price {
	margin-bottom: 0;
	font-size: 1.2rem;
	font-weight: bold;
	color: #175cbe;
}
}
</style>
</head>
<body>
	<div class="container-fluid famous-saying-box">
		<div class="container p-3 ">
			<div class=" mt-3">
				<h3 class="color-white ">오늘의 명언</h3>
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
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=1"> 전체 스터디 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=2"> 개발/프로그래밍 </a></li>

					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=3"> 보안/네트워크 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=4"> 크리에이티브 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=5"> 직무/마케팅 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=6"> 학문/외국어 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=7"> 교양 </a></li>
					</div>
			</aside>
			
			
			
			<div class="col-sm-9">
				<h1>오프라인 스터디</h1>
				<hr align="left" width="350px" style="border: 0.5px solid #c47100" />
				<br>
				<h4>${menuName}</h4>
				<div class="flex ">
					<div>
						<div class="input-group rounded">
							<input type="search" class="form-control rounded"
								placeholder="Search" aria-label="Search"
								aria-describedby="search-addon" /> <span
								class="input-group-text border-0" id="search-addon"> <i
								class="fas fa-search"></i>
							</span>
						</div>

					</div>
					<div class="flex mt-3">
						<div class="tagbox">
							<a href="#">#서울</a>
						</div>
						<div class="tagbox">
							<a href="#">#부산</a>
						</div>
						<div class="tagbox">
							<a href="#">#대구</a>
						</div>
						<div class="tagbox tagbox-etc">
							<a href="#">...</a>
						</div>
					</div>

				</div>
				
				
				<button class="btn btn-info d-block ml-auto">
					<a href="<%=request.getContextPath()%>/studymenu/writeForm" style="color: white;">글쓰기 </a>
				</button>
				<div class="container d-flex justify-content-between flex-wrap">
					<div class="study-box ">
						<a href="studyDetailedScreen.html">

				<c:forEach var="s" items="${list}">
				
							<div class="img">
								 
								<img src="<%=request.getContextPath()%>/img/study-img.jpg" alt="">
								
							</div>
							<div class="px-2 pt-3">
								<h5 class="b-h5">${s.subject}</h5>
								<p class="b-price">${s.free==1 ? "무료":"유료"  }</p>
								<p class="b-people">
									<i class="fa-solid fa-user-group"></i> ${s.pernum}
								</p>
								<p class="b-p">${s.region }</p>
								<div>
									<p class="b-p d-inline-block">
										&#11088;&#11088;&#11088;&#11088;&#11088;</p>
									<p class="b-p b-rep d-inline-block ">평가:100%</p>
								</div>
							</div>
						
						</c:forEach>	
						</a>
					</div>
					 
							
				</div>

				<br> <br>
				<nav class="container">
					<ul class="pagination justify-content-center">
					
					
					<li 
						class='page-item <c:if test="${startPage <= bottomLine}"> disabled </c:if>'>
						<a class="page-link " href="<%=request.getContextPath()%>/studymenu/menuForm?pageNum=${startPage - bottomLine}">Previous</a></li>
						
					<c:forEach var="i" begin="${ startPage }" end="${endPage}">
						<li class='page-item <c:if test = "${i == pageInt}" >  active </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/menuForm?pageNum=${i}">${i}</a></li>
					
					</c:forEach>
						<li class='page-item <c:if test = "${endPage >= maxPage}"> disabled </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/menuForm?pageNum=${startPage + bottomLine}">Next</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
</body>
</html>