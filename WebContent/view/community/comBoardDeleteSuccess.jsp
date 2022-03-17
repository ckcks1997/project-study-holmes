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

/* aside */
ul, li {
	list-style: none;
}

li>a {
	color: rgb(10, 10, 10);
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
	background: rgb(233, 233, 233);
	text-align: left;
	padding-left: 10px;
	border: 1px solid rgb(223, 223, 223);
}

.txt_bar {
	margin: 0 9px 0 5px;
	color: gray;
}

.delete {
	postion: relative;
	width: 500px;
	height: 500px;
	display: inline-block;
}

.deleteImg {
	position: absolute;
	align-content: center;
	text-align: center;
}
</style>
<body>


	<div class="container-fluid famous-saying-box">
		<div class="container p-3">
			<div class="mt-3">
				<h2 style="color: white">이야기를 나눠요</h2>
				<p style="color: white">어려운 내용은 함께 토론해봐요</p>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row pt-5">
			<!-- 왼쪽 사이드메뉴 -->
			<aside class="col-sm-3">
				<div class="col aside">
					<h4>함께 공부해요</h4>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=1">질문
								답변</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=2">자유</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=3">정보공유</a></li>
						<br>
						<h4>공지사항</h4>
						<li class=""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=4">
								공지사항 </a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=5">
								블로그 </a></li>

					</div>
				</div>
			</aside>
			<div class="main col-sm-9">

				<div class="row">
					<div class="col-sm-10 delete">

						<div class="deleteImg">
							<img src="<%=request.getContextPath()%>/img/delete.jpg" alt="img"
								style="width: 80%; height: 80%;" />
							<h5>
								삭제되었습니다<br> 계속해서 스터디 홈즈를 이용해주세요!
							</h5>
						</div>


					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>