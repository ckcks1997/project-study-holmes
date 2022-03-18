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

.color-white {
	color: white;
}

.footer-content {
	padding-top: 50px;
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
<!-- --------------------------------------------------------------명언------------------------------------------------------------ -->	
	<div class="container-fluid famous-saying-box">
		<div class="container p-3 ">
			<div class=" mt-3">
				<h3 class="color-white ">오늘의 명언</h3>
				<div class="color-white">생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지
					않으면 오류나 독단에 빠질 위험이 있다. -공자</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="row pt-5">
<!-- --------------------------------------------------------------사이드------------------------------------------------------------ -->	

			<aside class="col-sm-3">
				<div class="col aside">
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=1"> 전체 스터디 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=2"> 개발/프로그래밍 </a></li>

					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=3"> 보안/네트워크 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=4"> 크리에이티브 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=5"> 직무/마케팅 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=6"> 학문/외국어 </a></li>
					</div>
					<div class="aside-content">
						<li class=""><a href="<%=request.getContextPath() %>/studymenu/menuForm?menuid=7"> 교양 </a></li>
					</div>
			</aside>

<!-- --------------------------------------------------------------게시글------------------------------------------------------------ -->				
			<div class="main col-sm-9">
				<h1>스터디 모집</h1>
		
				<hr align="left" width="150px" style="border: 0.5px solid #c47100" />


				<form name="cf"
					action="<%=request.getContextPath()%>/studymenu/writePro"
					enctype="multipart/form-data" method="post">
					<br /> <br />
					<!-- 닉네임 가져오기 -->
					<!--<input type = "hidden" name= "nickname" value = '${c.nickname}'>-->
					
					<div class="form-group">
					
						<select name="free">
						<option value="1">무료</option>
						<option value="2">유료</option>
						</select>
						
						<select name="langue">
						<option value="1">Java</option>
						<option value="2">C</option>
						<option value="3">Python</option>
						</select>
					</div>
					
					
					
					<div class="form-group">
						<label>제목</label> <input type="text" class="form-control"
							name="subject" placeholder="제목을 입력해주세요" />
					</div>
					
					 <div class="row">
    			<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                       <label>지역</label>
                       <input type="text" name="region" class="form-control" placeholder="ex) 경기 수원">
                       
					</div>
				</div>
                <div class="col-xs-12 col-sm-6 col-md-6">
    				<div class="form-group">
    				<label>인원수</label>
                        <input type="number" name="pernum" class="form-control" placeholder="예상인원수">
					</div>
				</div>
				
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