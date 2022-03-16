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
			<!-- 왼쪽 사이드 메뉴 -->
			<aside class="col-sm-3">
				<div class="col aside">
					<div class="aside-content">
						함께 공부해요 <a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=1"><li>질문
								& 답변</li></a> <a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=2"><li>자유</li></a>
						<a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=3"><li>정보공유</li></a>


						공지사항 <a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=4">
							<li>공지사항</li>
						</a> <a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=5">
							<li>블로그</li>
						</a>

					</div>
				</div>
			</aside>

			<div class="main col-sm-9">

				<h2 style="font-weight: bold">
					<c:if test="${com.boardid =='1'}"> 질문 & 답변</c:if>
					<c:if test="${com.boardid =='2'}"> 자유</c:if>
					<c:if test="${com.boardid =='3'}"> 정보공유</c:if>
					<c:if test="${com.boardid =='4'}"> 공지사항</c:if>
					<c:if test="${com.boardid =='5'}"> 블로그</c:if>
				</h2>




				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />

				<c:if test="${com.boardid =='1'}">
					<h5 style="font-weight: bold">Q: ${com.subject}</h5>
				</c:if>
				<c:if test="${com.boardid != '1'}">
					<h5 style="font-weight: bold">${com.subject}</h5>
				</c:if>

				<div class="row">
					<div class="col-sm-10">
						<p style="color: grey">닉네임 · ${com.regdate}</p>
					</div>
					<div class="col-sm-2">
					<button type="button" class="btn btn-light" onclick = "location.href='<%=request.getContextPath() %>/community/comBoardUpdateForm'">수정</button>
					</div>
				</div>

				<br />
				<p>${com.content}</p>
				<br />
				<br />
				<br />

				<div>
					<h5 style="font-weight: bold">댓글 2</h5>
					<hr style="border: 0.5px thick 333b3d" />
					<p>수험생 · 4일 전</p>
					<p>혹시 어떻게 준비하고 계신가요?</p>

					<hr style="border: 0.5px thick 333b3d" />
					<p>동작구 · 일주일 전</p>
					<p>저도 면접 준비중인데 ... 같이 하실래요..?</p>
					<hr style="border: 0.5px solid 333b3d" />

					<form class="form-group" name="ccf" action="#">
						<div class="row">
							<div class="col-xs-12 col-sm-11 col-md-10">
								<textarea class="form-control" name="comment"
									placeholder="댓글을 달아주세요"></textarea>
							</div>
							<div class="col-xs-12 col-sm-1 col-md-2">
								<button type="submit" class="btn btn-danger">작성</button>
							</div>
						</div>

					</form>
					<button type="button" class="btn btn-dark mt-3">목록으로</button>
					<button type="button" class="btn btn-dark mt-3">신고</button>
					<button type="button" class="btn btn-dark mt-3">삭제</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>