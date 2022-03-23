<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	height: 100vh;
}

/* 명언 */
.famous-saying-box {
	height: 150px;
	background-color: #333b3d;
}

ul, li {
	list-style: none;
}

li {
	font-weight: 700;
	color: #777;
}

li:hover {
	font-weight: 700;
	color: #f55555;
}

a:hover {
	color: black;
	text-decoration: none;
}

.aside-content {
	display: block;
	width: 200px;
	/*height와 line-height를 같은 값으로 주면 세로로 중앙 정렬이 된다.*/
	height: 40px;
	line-height: 40px;
	text-align: left;
	padding-left: 10px;
}

.container-css {
	background: #f8f8f8;
	border-radius: 20px;
}

.who-img {
	float: left;
	top: 10%;
	right: 5%;
	text-align: right;
	width: 150px;
	height: auto;
	border-radius: 10px;
}
</style>
<body>

	<div class="container-fluid famous-saying-box">
		<div class="container p-3">
			<div class="mt-3">
				<h2 style="color: white">반가워요!</h2>
				<p style="color: white">스터디홈즈입니다</p>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="row pt-5">
			<!-- ---------------------왼쪽 메뉴------------- ---------------------------------------------------->
			<aside class="col-sm-3">
				<div class="col aside">
					<h4>
						<strong>스터디홈즈</strong>
					</h4>
					<div class="aside-content">
						<a href="<%=request.getContextPath()%>/view/make/make.jsp"><li>
								소개</li> </a> <a
							href="<%=request.getContextPath()%>/view/make/whoMade.jsp"><li>만든
								이</li> </a>

					</div>
				</div>
			</aside>

			<!-- ----------------------------메인---------------------------------------------------- -->

			<div class="main col-sm-9">
				<h5>
					<strong>만든 이</strong>
				</h5>
				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />
				<div class="main col-sm-9">

					<div class="d-md-flex shadow-sm container-css p-5">
						<div class="container">
							<div class="col-sm-3">
								<img class="who-img"
									src="<%=request.getContextPath()%>/img/whoProfile.jpg"
									alt="who">
							</div>
							<div class="col-sm-9">
								<p>류찬혁</p>
							</div>
						</div>
					</div>
					<br>
					<br>


					<div class="d-md-flex shadow-sm container-css p-5">
						<div class="container">
							<div class="col-sm-3">
								<img class="who-img"
									src="<%=request.getContextPath()%>/img/whoProfile.jpg"
									alt="who">
							</div>
							<div class="col-sm-9">
								<p>이재성</p>
							</div>
						</div>
					</div>
					<br>
					<br>



					<div class="d-md-flex shadow-sm container-css p-5">
						<div class="container">
							<div class="col-sm-3">
								<img class="who-img"
									src="<%=request.getContextPath()%>/img/whoProfile.jpg"
									alt="who">
							</div>
							<div class="col-sm-9">

								<p>김은지</p>

							</div>
						</div>
					</div>
					<br>
					<br>


					<div class="d-md-flex shadow-sm container-css p-5">
						<div class="container">
							<div class="col-sm-3">
								<img class="who-img"
									src="<%=request.getContextPath()%>/img/whoProfile.jpg"
									alt="who">
							</div>
							<div class="col-sm-9">
								<p>최준현</p>
							</div>
						</div>
					</div>
					<br>
					<br>

				</div>
			</div>









		</div>
	</div>


</body>
</html>