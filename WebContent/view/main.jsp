<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<title>메인화면</title>

<style>
/* banner */
.banner {
	position: relative;
	height: 400px;
	background-color: #f55555;
}

.b-container1 {
	position: relative;
	margin: auto;
	height: 100%;
}

.b-img {
	position: absolute;
	top: 10%;
	right: 5%;
	text-align: right;
}

.b-img>img {
	display: none;
	text-align: right;
	max-width: 500px;
}

@media only screen and (min-width: 992px) {
	.b-img>img {
		display: block;
		text-align: right;
		max-width: 500px;
	}
}

.b-text {
	color: #fff0f0;
	position: absolute;
	top: 20%;
	left: 10px;
	max-width: 400px;
	font-size: 1.2rem;
}

.footer {
	height: 200px;
	background: #777;
	text-align: center;
}

.footer-content {
	padding-top: 50px;
}

.search-div {
	position: relative;
}

.custom-btn {
	font-size: 1.2rem;
	position: absolute;
	background: none;
	border: none;
	top: 17px;
	right: 20px;
}
.boardtable{ 
    padding: 10px; 
    border-radius:10px;
}

#bar {
	border: 3px solid #c47100;
	border-radius: 50px;
	padding: 30px;
}
</style>
</head>
<body>

	<div class="banner">
		<div class="container b-container1">
			<div class="">
				<div class="b-img">
					<img src="<%=request.getContextPath()%>/img/10088.png" alt="img" />
					<!-- 이미지 출처: https://www.freepik.com/free-vector/happy-women-learning-language-online-isolated-flat-vector-illustration-cartoon-female-characters-taking-individual-lessons-through-messenger-education-digital-technology-concept_10613101.htm#query=illustrations&position=3&from_view=keyword -->
				</div>
				<div class="b-text">
					<h1>스터디 홈즈</h1>
					<br>
					<p>
						스터디 할 사람 모두 모여라~ <br> 스터디 홈즈로 스터디를 구하고,<br> 스터디 상황 체크와 채팅 기능까지!<br> <br> 나와 맞는 사람과 공부하세요
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container py-5">
			<form class="row-vh mx-auto text-center position-relative" style="width: 50vw">
				<div class=" d-flex flex-row search-div">
					<input id="bar" class="form-control" type="search" placeholder="스터디 검색.." aria-label="Search" style="width: 50vw" />
					<button class="custom-btn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>

				</div>
			</form>
		</div>
		<div class="container">
			<h2>지금 뜨는 컨텐츠</h2>
			<hr align="left" width="350px" style="border: 0.5px solid #c47100" />
			<div class="d-flex justify-content-between " >
				<div class="container">
					<img src="<%=request.getContextPath()%>/img/study-img.jpg" alt="" width="100%" height="200px" />
					<h4 class="py-3">리엑트 스터디</h4>
					<p class="my-0">경기도 부천시</p>
					<div class=" ">&#11088;&#11088;&#11088;&#11088;&#11088;</div>
				</div>
				<div class="container">
					<img src="<%=request.getContextPath()%>/img/study-img.jpg" alt="" width="100%" height="200px" />
					<h4 class="py-3">리엑트 스터디</h4>
					<p class="my-0">경기도 부천시</p>
					<div class=" ">&#11088;&#11088;&#11088;&#11088;&#11088;</div>
				</div>
				<div class="container">
					<img src="<%=request.getContextPath()%>/img/study-img.jpg" alt="" width="100%" height="200px" />
					<h4 class="py-3">리엑트 스터디</h4>
					<p class="my-0">경기도 부천시</p>
					<div class=" ">&#11088;&#11088;&#11088;&#11088;&#11088;</div>
				</div>
			</div>
			<br> <br>
			<div class="container pt-5">
				<div class="d-flex justify-content-between">
					<div class="col-sm" width="20%">
						<h3 style='cursor:pointer;' onclick="location.href='<%=request.getContextPath()%>/community/comBoardList?boardid=4'">공지사항</h3>
						<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
						<table class="table table-sm table-borderless shadow-sm rounded boardtable">
				    		<tr class="border-bottom">
							   <th width="70%">제목</td>
	                           <th width="30%">날짜</td>
							</tr>
							<c:forEach var="i" items="${list1}">
								<tr style='cursor:pointer;' onclick="location.href='<%=request.getContextPath()%>/community/comBoardInfo?board_num=${i.board_num}'">
									<td>${i.title }</td>
									<td> <fmt:formatDate value="${i.regdate }" pattern="MM/dd"/> </td>
								</tr>
							</c:forEach>

						</table>
						<div></div>
					</div>
					<div class="col-sm" width="20%">
						<h3 style='cursor:pointer;' onclick="location.href='<%=request.getContextPath()%>/community/comBoardList?boardid=1'">질문 & 답글</h3>
						<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
						<table class="table table-sm table-borderless  shadow-sm rounded boardtable">
						    <tr class="border-bottom">
                               <th width="80%">제목</td>
                               <th width="20%">날짜</td>
                            </tr>
                            <c:forEach var="i" items="${list2}">
                                <tr style='cursor:pointer;' onclick="location.href='<%=request.getContextPath()%>/community/comBoardInfo?board_num=${i.board_num}'">
                                    <td>${i.title }</td>
                                    <td> <fmt:formatDate value="${i.regdate }" pattern="MM/dd"/> </td>
                                </tr>
                            </c:forEach>
						</table>
						<div></div>
					</div>
					<div class="col-sm" width="20%">
						<h3 style='cursor:pointer;' onclick="location.href='<%=request.getContextPath()%>/community/comBoardList?boardid=2'" >자유주제</h3>
						<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
						<table class="table table-sm table-borderless  shadow-sm boardtable">
						    <tr class="border-bottom">
                               <th width="80%">제목</td>
                               <th width="20%">날짜</td>
                            </tr>
                            <c:forEach var="i" items="${list3}">
                                <tr style='cursor:pointer;' onclick="location.href='<%=request.getContextPath()%>/community/comBoardInfo?board_num=${i.board_num}'">
                                    <td>${i.title }</td>
                                    <td> <fmt:formatDate value="${i.regdate }" pattern="MM/dd"/> </td>
                                </tr>
                            </c:forEach>
						</table>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br></br>
	<br></br>
	<br></br>

</body>
</html>
