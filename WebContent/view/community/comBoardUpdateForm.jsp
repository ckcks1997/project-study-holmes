<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!----------- 왼쪽 사이드 메뉴 ------------------------------------------------------------------------------------->
			<%--aside부분 --%>
                <%@include file="/common/community_menu.jsp" %>
<!-- -------------------메인 ------------------------------------------------------------------------------------------ -->
			<div class="main col-lg-9">
				<h1>글쓰기</h1>
		
				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />


				<form name="cf"
					action="<%=request.getContextPath()%>/community/comBoardUpdatePro"
					enctype="multipart/form-data" method="post">
					<input type = "hidden" name = "board_num" value = "${com.board_num}">
					<br /> <br />
					
					
					<div class="form-group">
						<label>제목</label> <input type="text" class="form-control"
							name="title" placeholder="제목을 입력해주세요" value = "${com.title}"/>
					</div>

					
					<div class="form-group">
						<label>내용 :</label>
						<textarea class="summernote" name="content"
							placeholder="Leave a comment here" id="content">${com.content}</textarea>
						
					</div>



					<div class="d-grid gap-2 " style="float: right;">
						<button class="btn btn-dark" type="button">취소</button>
						<button class="btn btn-dark" type="submit">수정</button>
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