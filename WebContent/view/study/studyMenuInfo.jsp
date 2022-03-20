<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
	<div class="container-fluid p-0 my-0 bg-dark text-white">
		<div class="container">
			<input type="hidden" id="board_num" name="board_num" value="${s.board_num}"> 

<!-- --------------------------------------------------------------정보배너------------------------------------------------------------ -->
			<div style="float: left; margin: 20px">
				<img src="<%=request.getContextPath()%>/img/study-img.jpg"
					width="260">
			</div>

			<div>
				<br>
				<h6>
					<small><span class="best">BEST</span>
					<c:if test="${s.menuid =='1'}"> 전체스터디</c:if>
					<c:if test="${s.menuid =='2'}"> 개발/프로그맹</c:if>
					<c:if test="${s.menuid =='3'}"> 보안/네트워크</c:if>
					<c:if test="${s.menuid =='4'}"> 크리에이티브</c:if>
					<c:if test="${s.menuid =='5'}"> 직무/마케팅</c:if>
					<c:if test="${s.menuid =='6'}"> 학문/외국어</c:if>
					<c:if test="${s.menuid =='7'}"> 교양</c:if>
				    </small>
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
			<aside class="col-sm-3">
				<div class="col aside">
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=1">
								전체 스터디 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=2">
								개발/프로그래밍 </a></li>

					</div>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=3">
								보안/네트워크 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=4">
								크리에이티브 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=5">
								직무/마케팅 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=6">
								학문/외국어 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/studymenu/studyMenuList?menuid=7">
								교양 </a></li>
					</div>
			</aside>
<!-- --------------------------------------------------------------게시글------------------------------------------------------------ -->

			<div class="col-sm-9">
				<h1>상세보기</h1>
				<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
				<br>

				<h2>자바 스터디</h2>
				<div class="container p-0 my-2 bg-white text-white">
					<div class="s-round px-2">
						<span>무료</span>
					</div>
					<div class="s-round px-2">
						<span>서울</span>

					</div>
					<div class="s-round px-2">
						<span>오프</span>
					</div>
				</div>
				<br> 
				${s.content }
				<br>
				<br> (이미지)?/${s.pernum} <br>
				<br>

				<h2>지도 보기</h2>
				<br> <img src="<%=request.getContextPath()%>/img/kic.png"
					class="img-thumbnail" width="500" height="200"> <br> <br>

				<input type="submit" class=" btn fadeIn fourth my-1" value="참가신청"
					style="background-color: #c47100; color: white; border-color: white;">

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
</body>
</html>