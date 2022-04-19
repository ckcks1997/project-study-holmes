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

.reaction {
	display: flex;
	justify-content: center;
	align-items: center;
}

.circle {
	position: absolute;
	top: 0;
	left: 0;
	width: 80%;
	height: 100%;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.page-item>a {
	color: #f55555;
}

.page-item>a:hover {
	color: #f55555;
}

.active2>a {
	background-color: #f55555 !important;
	border: 1px solid #f55555 !important;
}

.reactions {
	font-size: 13px;
}

.divide {
	font-weight: 700;
	color: #777;
}

a {
	color: black;
}

a:hover {
	color: #f55555;
	text-decoration: none;
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
			<!------------------------- 왼쪽 사이드메뉴 -----------------					---------------------------------------------------->
			<%--aside부분 --%>
			<%@include file="/common/community_menu.jsp"%>


			<!-- ---------------------------메인검색-------------------------------------------------------- -->
			<div class="main col-lg-9">
				<h2 style="font-weight: bold">${boardName}</h2>

				<hr align="left" width="170px"
					style="background-color: #c47100; height: 1px;" />


				<form action="<%=request.getContextPath()%>/community/comSearch"
					method=post>
					<input type="hidden" name="boardid" value="${boardid}" />

					<div class="row">
						<div class="col-xs-12 col-sm-11 col-md-10">
							<div class="d-flex flex-row align-items-center">
								<div class="col-md-2">
									<select class="custom-select" name="part">
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>


								</div>
								<input type="text" class="form-control rounded"
									name="searchData" placeholder="내용을 검색해보세요!" required="required" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-1 col-md-2 btn-search">
							<input class="btn btn-dark" type="submit" name="search"
								value="검색" />
						</div>
					</div>

				</form>
				<br />
				<!-- ------------------------------------------------------------------------------------ -->

				<div class="row col-sm-9 divide" style="float: left">
					<a href="<%=request.getContextPath()%>/community/comBoardList">최신순</a>
					&nbsp;&nbsp;<strong> · </strong>&nbsp;&nbsp;

					<c:choose>
						<c:when test="${boardid == 5}">
							<%--문의게시판은 내 글 보기 활성화 --%>
							<a href="<%=request.getContextPath()%>/community/comBoardMyAsk">나의
								문의글 보기</a>
						</c:when>
						<c:when test="${boardid == 4 }">
							<%--공지게시판은 조회수순 활성화 --%>
							<a href="<%=request.getContextPath()%>/community/comBoardRead">조회수순</a>
						</c:when>
						<c:otherwise>
							<%--그 외 게시판은 댓글순, 조회수순 활성화 --%>
							<a href="<%=request.getContextPath()%>/community/comBoardReply">댓글순</a>
					&nbsp;&nbsp;<strong> · </strong>&nbsp;&nbsp; <a
								href="<%=request.getContextPath()%>/community/comBoardRead">조회수순</a>
						</c:otherwise>
					</c:choose>
				</div>


				<c:choose>
					<c:when test="${memberNickname != '관리자' }">
						<%--만약 1)일반유저이고 --%>
						<c:if test="${boardid != 4 }">
							<%--공지게시판이 아니면 --%>
							<%--글쓰기 버튼을 띄운다 --%>
							<div class="mb-2" style="float: right">
								<button type="button" class="btn btn-dark"
									onclick="location.href='<%=request.getContextPath()%>/community/comWriteForm'">글쓰기
								</button>
							</div>
						</c:if>
					</c:when>

					<c:otherwise>
						<%--아니면 유저가 관리자이고 --%>
						<c:if test="${boardid == 4 }">
							<%--공지게시판이면 --%>
							<%--글쓰기 버튼을 띄운다 --%>
							<div class="mb-2" style="float: right">
								<button type="button" class="btn btn-dark"
									onclick="location.href='<%=request.getContextPath()%>/community/comWriteForm'">글쓰기
								</button>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
				<br />


				<!-------------메인 커뮤니티 게시판 --------------------------------------------------------------------------------------------------------- -->
				<div class="container">
					<table class="table">
						<c:if test="${empty list }">
							<!-- list.size() 가 0이면 -->
							<hr align="left" />
							<p>작성된 글이 없습니다.</p>

						</c:if>

						<c:forEach var="com" items="${list}">
							<tr>
								<td>
									<div class="row">

										<div class="col-sm-9">
											<input type="hidden" name="board_num"
												value="${com.board_num}">
												
											<c:choose>
											<c:when test="${boardid =='5' }"><%--문의 게시판 comBoardMyAsk에서 boardid =5 가 넘어왔으면--%>
											<a
												href="<%=request.getContextPath() %>/community/comBoardInfo?boardid=${boardid }&board_num=${com.board_num}"
												style="color: black">
												<p style="font-size: 17px; font-weight: bold;">
													${com.title}</p>
												<p style="font-size: 17px; font-weight: bold;">
													${preContent}</p> <br />
												<h6 style="color: gray;">
													<small>${com.nickname} · ${com.regdate} </small>
												</h6>
											</a>
											
											</c:when>
											<c:otherwise><%--문의게시판 외의 게시판들 --%>
											<a
												href="<%=request.getContextPath() %>/community/comBoardInfo?board_num=${com.board_num}"
												style="color: black">
												<p style="font-size: 17px; font-weight: bold;">
													${com.title}</p>
												<p style="font-size: 17px; font-weight: bold;">
													${preContent}</p> <br />
												<h6 style="color: gray;">
													<small>${com.nickname} · ${com.regdate} </small>
												</h6>
											</a>
											</c:otherwise>
											</c:choose>
										</div>
										<div class="col-sm-3 reaction">
											<div class="circle">
												<div class="reactions">

													<c:if test="${boardid != 5 && boardid != 4}">
														<%--공지와 문의 외의 게시판에 좋아요 출력 | 공지, 문의 게시판 좋아요 X--%>
														<div class="likes">
															<span> <svg xmlns="http://www.w3.org/2000/svg"
																	width="16" height="16" fill="#de2a2a"
																	class="bi bi-suit-heart" viewBox="0 0 16 16">
  													<path
																		d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
													</svg>
															</span> 좋아요
														</div>
													</c:if>

													<c:if test="${boardid != 5}">
													<%--문의 외의 게시판에 조회수 출력 | 문의 게시판 조회수 X --%>
													<div class="readcnt">
														<span> <svg xmlns="http://www.w3.org/2000/svg"
																width="16" height="16" fill="currentColor"
																class="bi bi-eye" viewBox="0 0 16 16">
  													<path
																	d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
  													<path
																	d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
													</svg>
														</span>${com.readcnt }읽음
													</div>
													</c:if>

													<div class="comment">
														<span> <svg xmlns="http://www.w3.org/2000/svg"
																width="16" height="16" fill="currentColor"
																class="bi bi-chat-square-text" viewBox="0 0 16 16">
  													<path
																	d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
													<path
																	d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
													</svg>
														</span>${com.replycnt}개의 댓글
													</div>
												</div>
											</div>

										</div>

									</div>
								</td>
							</tr>
						</c:forEach>

					</table>
				</div>
				<!------------- 아래 페이징네이션 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
				<ul class="pagination justify-content-center">
					<li
						class='page-item <c:if test ="${startPage <= bottomLine }"> disabled </c:if> '><a
						class="page-link"
						href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${startPage-bottomLine}">이전</a></li>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li
							class='page-item <c:if test = "${i==pageInt}" > active active2</c:if> '>
							<a class="page-link"
							href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${i}">${i}</a>
						</li>
					</c:forEach>
					<li
						class='page-item <c:if test ="${endPage >= maxPage}"> disabled </c:if>  '>
						<a class="page-link"
						href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${startPage+bottomLine}">다음</a>
					</li>
				</ul>
			</div>
		</div>
	</div>


	<br>
	<br>
</body>
</html>