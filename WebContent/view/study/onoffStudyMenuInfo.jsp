<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%--지도 api --%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5372162b2eb56a4c9831bbd9732f6a3"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.s-round {
	display: inline-block;
	border-radius: 20px;
	background-color: #F55555;
}

.best {
	padding: 5px;
	margin: 2px;
	background-color: #F55555;
	border-radius: 10px;
	font-weight: bold;
	font-size: 0.5rem;
}

.c-border{
    border:2px solid #F55555;
    border-radius: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid p-0 my-0 bg-dark text-white">
		<div class="container">
			<input type="hidden" id="board_num" name="board_num"
				value="${s.board_num}">

<!-- --------------------------------------------------------------정보배너------------------------------------------------------------ -->
			<div style="float: left; margin: 20px">
				<img src="<%=request.getContextPath()%>/img/study-img.jpg"
					width="260">
			</div>

			<div>
				<br>
				<h6>
					<small><span class="best">BEST</span> <c:if
							test="${s.menuid =='15'}"> 전체스터디</c:if> <c:if
							test="${s.menuid =='16'}"> 개발/프로그래밍</c:if> <c:if
							test="${s.menuid =='17'}"> 보안/네트워크</c:if> <c:if
							test="${s.menuid =='18'}"> 크리에이티브</c:if> <c:if
							test="${s.menuid =='19'}"> 직무/마케팅</c:if> <c:if
							test="${s.menuid =='20'}"> 학문/외국어</c:if> <c:if
							test="${s.menuid =='21'}"> 교양</c:if> </small>
				</h6>
				<br>
				<h3>${s.title}</h3>
				<h6>
					<small> &#11088;&#11088;&#11088;&#11088;&#11088; 85점 11명의
						평가 · 20번의 스터디 경험 </small>
				</h6>
				<br>
				<h6>
					<small>&nbsp; (이미지) <span>${s.nickname}</span> # 태그 태그
					</small>
				</h6>
				<br>
			</div>
		</div>
	</div>

	<br>


	<div class="container">
		<div class="row pt-5">
<!-- --------------------------------------------------------------사이드------------------------------------------------------------ -->
			<%--aside부분 --%>
			<%@include file="/common/onoffstudy_menu.jsp"%>
<!-- --------------------------------------------------------------게시글------------------------------------------------------------ -->

			<div class="col-sm-9">
				<h1>상세보기</h1>
				<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
				<br>

				<h2>${s.title}</h2>
				<div class="container p-0 my-2 bg-white text-white">
                    <hr>
				</div>
				<div class="postInfo">
					<p>
						${s.nickname} · ${s.regdate}


						<c:if test="${loginNick eq s.nickname}">
							<span class="txt_bar">|</span>
							<a
								href="<%=request.getContextPath()%>/studymenu/onoffStudyUpdateForm?board_num=${s.board_num}"
								style="color: gray;"> 수정</a>
						</c:if>
					</p>
				</div>

				<br> ${s.content } <br> <br> <i class="fa-solid fa-user-group"></i>${s.pernum} <br>

				<br>
                <br>
                <br> 전체 스터디 인원: ${s.pernum} 명 <br>
                <form action="<%=request.getContextPath()%>/studymenu/studyIn" method="post">
	                <input type="hidden" name="board_num" value="${s.board_num}">
	                <input type="hidden" name="t_nickname" value="${s.nickname}">
	                <input type="hidden" name="f_nickname" value="${loginNick}">
					<input type="submit" class=" btn fadeIn fourth my-1" value="참가신청"
					style="background-color: #c47100; color: white; border-color: white;">
                </form>

				<br> <br>

<!-- --------------------------------------------------------------댓글------------------------------------------------------------ -->
				<div>
					<h5 style="font-weight: bold">댓글 2</h5>
					<hr style="border: 0.5px thick 333b3d" />
					<p>도사미 · 4일 전</p>
					<p>간식 주나요?</p>

					<hr style="border: 0.5px thick 333b3d" />
					<p>작성자 · 일주일 전</p>
					<p>아니요..</p>
					<hr style="border: 0.5px solid 333b3d" />

					<textarea class="form-control" id="comment" rows="3"></textarea>
					<button type="button" class="btn btn-danger mt-3">작성</button>
					<button type="button" class="btn btn-dark mt-3">목록으로</button>
					<button type="button" class="btn btn-dark mt-3">신고</button>
					<button type="button" class="btn btn-dark mt-3">삭제</button>
				</div>




			</div>

		</div>
	</div>
	<br>
</body>
</html>