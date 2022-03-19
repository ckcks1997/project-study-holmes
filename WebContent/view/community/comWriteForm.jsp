<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

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
<!------- 왼쪽 사이드 메뉴------------------------------------------------------------------------------------------ -->
			<aside class="col-sm-3">
				<div class="col aside">
					<h4>함께 공부해요</h4>
					<div class="aside-content">
						<li class=""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=1">질문
								답변</a></li> 
								<li class = ""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=2">자유</a></li>
						<li class =""> <a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=3">정보공유</a></li>
						<br>
						<h4>공지사항</h4>
						 <li class= ""><a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=4">
							공지사항
						</a></li>
						<li class = ""> <a
							href="<%=request.getContextPath()%>/community/comBoardList?boardid=5">
							블로그
						</a></li>
						
					</div>
				</div>
			</aside>
<!-- -----------메인-------------------------------------------------------------------------------------------- -->
			<div class="main col-sm-9">
				<h1>글쓰기</h1>
		
				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />


				<form name="cf"
					action="<%=request.getContextPath()%>/community/comWritePro"
					enctype="multipart/form-data" method="post">
					<br /> <br />
					<!-- 닉네임 -->
					<input type = "hidden" name= "nickname" value = '${com.nickname}'>
					<div class="form-group">
						<label>제목</label> <input type="text" class="form-control"
							name="title" placeholder="제목을 입력해주세요" />
					</div>


					<div class="form-group">
						<label>내용 :</label>
						<textarea class="summernote" name="content"
							placeholder="Leave a comment here" id="content"></textarea>

					</div>


					
					<div class="d-grid gap-2 " style="float: right;">
						<button class="btn btn-dark" type="button">취소</button>
						<button class="btn btn-dark" type="submit">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
		$('.summernote').summernote({
			height : 150,
			lang : "ko-KR"
		});
	</script>
	

</body>
</html>