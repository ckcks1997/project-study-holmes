<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="img/star.svg" type="image/svg+xml" />
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
/*폰트 용량이 너무 큼*/
@font-face {
	font-family: "kita";
	src: url("<%=request.getContextPath() %>/common/fonts/KITA.ttf") format("truetype");
	font-weight: normal;
	font-style: normal;
}

/* button */
.btn-round {
	border-radius: 20px;
}

a {
	color: white;
	text-decoration: none;
}

a:hover {
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

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light shadow-sm">
		<div class="container px-4">
			<a class="navbar-brand" href="#"><span
				class="navbar-brand">스터디 홈즈</span> <img class="star"
				src="<%=request.getContextPath() %>/img/star.svg" /> </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> 스터디 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">온라인</a> <a
								class="dropdown-item" href="studymenu.html">오프라인</a> <a
								class="dropdown-item" href="#">온오프라인</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> 커뮤니티 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">질문&답글</a> <a
								class="dropdown-item" href="community.html">자유게시판</a> <a
								class="dropdown-item" href="#">정보공유</a> <a class="dropdown-item"
								href="#">공지사항</a> <a class="dropdown-item"
								href="board/studycheck.html">출석체크</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">스터디룸</a></li>
					<li class="nav-item"><a class="nav-link" href="#">만든이</a></li>
				</ul>

				<form class="form-inline my-2 my-lg-0">
					<input class="form-control" type="search" placeholder="Search" />
					<button class="search-domain btn btn-primary" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
				<div>
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0 ml-3">
						<li class="nav-item active"><a class="nav-link" href="#"><img
								src="<%=request.getContextPath() %>/img/alarm.png" width="50px" /> </a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <img
								src="<%=request.getContextPath() %>/img/chat.jpg" width="50px" />
						</a></li>
						<div class="d-flex align-items-center">
							<button class="btn btn-sm btn-dark">
								<a class="a-no-deco" href="login.html">로그인</a>
							</button>
							&nbsp;
							<button class="btn btn-sm btn-danger">
								<a class="a-no-deco" href="join.html">회원가입</a>
							</button>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>