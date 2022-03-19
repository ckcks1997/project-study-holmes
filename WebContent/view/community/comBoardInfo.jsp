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

.selected{
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
                                <li class = "<c:if test="${boardid eq 2 }">selected</c:if>"><a
                            href="<%=request.getContextPath()%>/community/comBoardList?boardid=2">자유</a></li>
                        <li class ="<c:if test="${boardid eq 3 }">selected</c:if>"> <a
                            href="<%=request.getContextPath()%>/community/comBoardList?boardid=3">정보공유</a></li>
                        <br>
                        <h4>공지사항</h4>
                         <li class= "<c:if test="${boardid eq 4 }">selected</c:if>"><a
                            href="<%=request.getContextPath()%>/community/comBoardList?boardid=4">
                            공지사항
                        </a></li>
                        <li class = "<c:if test="${boardid eq 5 }">selected</c:if>"> <a
                            href="<%=request.getContextPath()%>/community/comBoardList?boardid=5">
                            블로그
                        </a></li>
                        
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
				<input type = "hidden" id = "board_num" name = "board_num" value = "${com.board_num}">
				<input type = "hidden" name= "nickname" value = '${com.nickname}'>
				<c:if test="${com.boardid =='1'}">
					<h5 style="font-weight: bold">Q: ${com.title}</h5>
				</c:if>
				<c:if test="${com.boardid != '1'}">
					<h5 style="font-weight: bold">${com.title}</h5>
				</c:if>

				<div class="row">
					<div class="col-sm-10">
				
						<p>
						${com.nickname} · ${com.regdate} 
						
							
							<c:if test = "${loginNick eq com.nickname}">
							<span class="txt_bar">|</span>
							<a href="<%=request.getContextPath()%>/community/comBoardUpdateForm?board_num=${com.board_num}"
								style="color: gray;"> 수정</a> </c:if>
						</p>

					</div>

				</div>


			
				<br />
				<p>${com.content}</p>
				<br /> <br /> <br />
				
				
<!-- ------------------댓글 ------------------------------------------------------------------------ -->				
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
					<button type="button" class="btn btn-dark mt-3" onclick ="location.href ='comBoardList'">목록으로</button>
					<button type="button" class="btn btn-dark mt-3">신고</button>
					
					<c:if test = "${loginNick eq com.nickname}">
					<button type="button" data-toggle= "modal" data-target = "#deleteModal" class = "btn btn-danger mt-3">삭제</button>
					</c:if>
					
<!-------------- 게시글 삭제 모달창 --------------------------------------------------------------------------------------------------------------------------------->
					
						<div class="modal fade" id="deleteModal" aria-hidden="true"
							tabindex="-1" aria-labelledby="deleteBoardLabel">
							<div class="modal-dialog">
								<div class="modal-content">
								
								<form action = "<%=request.getContextPath() %>/community/comBoardDelete" method = "post">
									<div class = "form-group">
										<input type = "hidden" id = "board_num" name = "board_num" value = "${com.board_num}">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteBoardLabel">게시글 삭제</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>

										<div class="modal-body">이 글을 삭제합니다. 계속하시겠습니까?</div>
									
									
										<div class="modal-footer">
										    <input type="submit"  class="btn btn-primary"   value="확인">
											<button class="btn btn-outline-primary" data-dismiss="modal">취소</button>
										</div>
									</div>	
								</form>
								
								</div>
							</div>
						</div>
						


				</div>
			</div>
		</div>
	</div>

<br><br>


</body>

</html>