<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


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
<title>스터디 홈즈</title>
</head>
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
					<div class =  "aside-content">
						함께 공부해요
						<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=1"><li>질문 & 답변</li></a>
						<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=2"><li>자유</li></a>
						<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=3"><li>정보공유</li></a>
					
					
						공지사항
						<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=4"> <li>공지사항</li></a>
						<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=5"> <li>블로그</li></a>
						
					</div>
				</div>
			</aside>
		
		<div class="main col-sm-9">
			<h2 style="font-weight: bold">${boardName}</h2>
			<hr align="left" width="150px" style="border: 0.5px solid #c47100" />
			<form class="form-group">
				<div class="row">
					<div class="col-xs-12 col-sm-11 col-md-10">
						<input type="text" name="serch" class="form-control"
							placeholder="대화내용을 검색해보세요!" />
					</div>
					<div class="col-xs-12 col-sm-1 col-md-2 btn-search">
						<button class="btn btn-dark" type="submit">검색</button>
					</div>
				</div>
			</form>

			<form class="form-group">
				<div class="row">
					<div class="col-xs-12 col-sm-11 col-md-10">
						<input type="text" name="tag" class="form-control"
							placeholder="태그로 검색해보세요!" />
					</div>
					<div class="col-xs-12 col-sm-1 col-md-2 btn-search">
						<button class="btn btn-dark" type="submit">검색</button>
					</div>
				</div>
			</form>
			<br />

			<div style="float: left">
				<strong>최신순</strong> &nbsp;<strong>·</strong> 댓글많은순 &nbsp;<strong>·</strong>
				좋아요순
			</div>
			<div class="mb-2" style="float: right">
				<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/community/comWriteForm'">글쓰기
				</button>
			</div>
		

			<br />


			<!-- 커뮤니티 게시판  -->
			<div class="container">
				<table class="table">
					<c:forEach var = "com" items ="${list}">
					<tr>
						<td>
							<div class="row">
								<div class="col-sm-9">
									<a href="<%=request.getContextPath() %>/community/comBoardInfo?num=${com.num}" style="color: black">
										<h4><strong>${com.subject}</strong></h4>
										<h5><small>${com.content} </small></h5> 
										<br />
										<h6><small>닉네임 · ${com.regdate} · ${com.tag} </small></h6>
									</a>
								</div>
								<div class="col-sm-3">
									<div class="text-box text-center m-auto">
										<div class="mt-4">
											<div class="mt-3 text-replycnt">댓글 2</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
					
				</table>
			</div>

			<ul class="pagination justify-content-center">
				<li class='page-item <c:if test ="${startPage <= bottomLine }"> disabled </c:if> '><a class="page-link" href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${startPage-bottomLine}">Previous</a></li>
				<c:forEach var ="i" begin ="${startPage}" end = "${endPage}"> 
				<li class='page-item <c:if test = "${i==pageInt}" > active </c:if> '> 
				<a class="page-link" href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<li class='page-item <c:if test ="${endPage >= maxPage}"> disabled </c:if>  '> <a class="page-link" href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${startPage+bottomLine}">Next</a></li>
			</ul>
		</div>
		</div>
	</div>
	

	
</body>
</html>