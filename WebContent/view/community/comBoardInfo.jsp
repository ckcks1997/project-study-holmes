<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	text-align: left;
	padding-left: 10px;
}

.selected {
	background: rgb(233, 233, 233);
	border: 1px solid rgb(223, 223, 223);
}

.txt_bar {
	margin: 0 9px 0 5px;
	color: gray;
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
			<!----------------왼쪽 사이드 메뉴 ------------------------------------------------------------------------>
			<aside class="col-sm-3">
				<div class="col aside">
					<h4>함께 공부해요</h4>
					<div class="aside-content">
						<li class=" <c:if test="${boardid eq 1 }">selected</c:if> "><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=1">질문
								답변</a></li>
						<li class="<c:if test="${boardid eq 2 }">selected</c:if>"><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=2">자유</a></li>
						<li class="<c:if test="${boardid eq 3 }">selected</c:if>"><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=3">정보공유</a></li>
						<br>
						<h4>공지사항</h4>
						<li class="<c:if test="${boardid eq 4 }">selected</c:if>"><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=4">
								공지사항 </a></li>
						<li class="<c:if test="${boardid eq 5 }">selected</c:if>"><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=5">
								블로그 </a></li>

					</div>
				</div>
			</aside>


			<!---------------------    메인      ------------------------------------------------------------------ -->
			<div class="main col-sm-9">

				<h2 style="font-weight: bold">
					<c:if test="${com.boardid =='1'}"> 질문 & 답변</c:if>
					<c:if test="${com.boardid =='2'}"> 자유</c:if>
					<c:if test="${com.boardid =='3'}"> 정보공유</c:if>
					<c:if test="${com.boardid =='4'}"> 공지사항</c:if>
					<c:if test="${com.boardid =='5'}"> 블로그</c:if>
				</h2>




				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />
				<input type="hidden" id="board_num" name="board_num"
					value="${com.board_num}"> <input type="hidden"
					name="nickname" value='${com.nickname}'>
				<div class="row">
					<div class="col-sm-10">
						<div class="title">
							<c:if test="${com.boardid =='1'}">
								<h5 style="font-weight: bold">Q: ${com.title}</h5>
							</c:if>
							<c:if test="${com.boardid != '1'}">
								<h5 style="font-weight: bold">${com.title}</h5>
							</c:if>
						</div>
						<div class="postInfo">
							<p>
								${com.nickname} · ${com.regdate}


								<c:if test="${loginNick eq com.nickname}">
									<span class="txt_bar">|</span>
									<a
										href="<%=request.getContextPath()%>/community/comBoardUpdateForm?board_num=${com.board_num}"
										style="color: gray;"> 수정</a>
								</c:if>
							</p>
						</div>

					</div>


					<div class="col-sm-2">
						<div class="likes">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="16"
									height="16" fill="#de2a2a" class="bi bi-suit-heart"
									viewBox="0 0 16 16">
  													<path
										d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
													</svg>
							</span> 좋아요수
						</div>
						<div class="readcnt">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="16"
									height="16" fill="currentColor" class="bi bi-eye"
									viewBox="0 0 16 16">
  													<path
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
  													<path
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
													</svg>
							</span>${com.readcnt}</div>
						<div class="comment">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="16"
									height="16" fill="currentColor" class="bi bi-chat-square-text"
									viewBox="0 0 16 16">
  													<path
										d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
													<path
										d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
													</svg>
							</span> 댓글수
						</div>



					</div>
				</div>



				<br />
				<p>${com.content}</p>
				<br /> <br /> <br />


<!-- ------------------댓글 ------------------------------------------------------------------------ -->
				<div>
					<h5 style="font-weight: bold">댓글 2</h5>
					<hr style="border: 0.5px thick 333b3d" />
					<div id = "replyList">
					<c:if test ="${replyList != null }">
						<c:forEach var="reply" items="${replyList}">
							<p>${reply.nickname} · ${reply.regdate}</p>
							<p>${reply.content}</p>
							<hr style="border: 0.5px solid 333b3d" />
						</c:forEach>
					</c:if>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-11 col-md-10">
							<form name = "rf" enctype="multipart/form-data" action = "<%=request.getContextPath()%>/reply/writeReply" method="post">
								
								<input type="hidden" id = "board_num" name="board_num" value="${com.board_num}">
								<input type="hidden" name="reply_nickname" value="${sessionScope.memberNickname}">
								
								<textarea rows="5" cols="80" name="reply_content"
									placeholder="댓글을 달아주세요" id="reply_content"></textarea>
							</form>
						</div>
						<div class="col-xs-12 col-sm-1 col-md-2">
							<input type="submit" class="btn btn-danger" value = "등록"/>
						</div>
					</div>
					

					<button type="button" class="btn btn-dark mt-3"
						onclick="location.href ='comBoardList'">목록으로</button>
					<button type="button" class="btn btn-dark mt-3">신고</button>

					<c:if test="${loginNick eq com.nickname}">
						<button type="button" data-toggle="modal"
							data-target="#deleteModal" class="btn btn-danger mt-3">삭제</button>
					</c:if>
				
			</div>
		</div>
	</div>
</div>

	<br>
	<br>
	
					<!-------------- 게시글 삭제 모달창 --------------------------------------------------------------------------------------------------------------------------------->

					<div class="modal fade" id="deleteModal" aria-hidden="true"
						tabindex="-1" aria-labelledby="deleteBoardLabel">
						<div class="modal-dialog">
							<div class="modal-content">

								<form
									action="<%=request.getContextPath()%>/community/comBoardDelete"
									method="post">
									<div class="form-group">
										<input type="hidden" id="board_num" name="board_num"
											value="${com.board_num}">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteBoardLabel">게시글 삭제</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<div class="modal-body">이 글을 삭제합니다. 계속하시겠습니까?</div>


										<div class="modal-footer">
											<input type="submit" class="btn btn-primary" value="확인">
											<button class="btn btn-outline-primary" data-dismiss="modal">취소</button>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>



			


</body>

</html>