<%@page import="model.StudyMenu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
body {
	color: #454545;
	font-size: 1rem;
	font-weight: 500;
	line-height: 1.5;
}

a {
	color: #454545;
}


/* button */
.btn-round {
	border-radius: 24px;
}

.a-no-deco {
	color: white;
	text-decoration: none;
}

.a-no-deco:visited {
	color: white;
	text-decoration: none;
}

.a-no-deco:hover {
	color: white;
	text-decoration: none;
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


/* 아래서부터는 페이지 종속css, 다른페이지에 복붙할 필요 x */
.search {
	display: inline-block;
}

.tagbox {
    color: white;
    font-weight: 700;
	display: inline-block;
	width: 60px;
	height: 40px;
	line-height: 30px;
	text-align: center;
	padding: 5px;
	margin-right:5px;
	background-color: #f55555;
	border: none;
	border-radius: 15%;
}

.tagbox-etc {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	background-color: #f55555;
	border-radius: 15%;
}

.tagbox>a {
	color: white;
	font-size: 0.8 rem;
}

/* 스터디글 상자 */
.study-box {
	width: 230px;
	height: 300px;
	background: rgb(255, 255, 255);
	margin: 10px;
	margin-bottom: 40px;
}

.img {
	
}

.img>img {
	width: 100%;
	height: 100%;
}

.b-h5 {
	font-weight: bold;
	margin: 0;
}

.b-p {
	margin-bottom: 0;
}

.b-people {
	margin: 0;
}

.b-rep {
	font-size: 12px;
}

.b-price {
	margin-bottom: 0;
	font-size: 1.2rem;
	font-weight: bold;
	color: #175cbe;
}

.page-item > a{
    color:#f55555; 
}
.page-item > a:hover{
    color:#f55555; 
}
.active2 > a{
    background-color:#f55555 !important; 
    border: 1px solid #f55555 !important; 
} 
.text-css{
    width: 200px;
}
 
</style>
</head>
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
			<%--aside부분 --%>
                <%@include file="/common/onstudy_menu.jsp" %>
			
<!-- --------------------------------------------------------------메인------------------------------------------------------------ -->		
			
			<div class="col-sm-9">
				<h2 style = "font-weight: bold;">온라인 스터디</h2>
				<hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
				<br>
				<h4>${menuName}</h4>
				 
					
<!-- --------------------------------------------------------------검색------------------------------------------------------------ -->							
																																	
					<c:if test="${menuid eq 8 }">
						<div>
							<div class="input-group rounded">
							<form action = "onAllSearch" method="post">
							<input type = "hidden" name = "menuid" value = "${menuid}"/>
							<div class="d-flex flex-row align-items-center">
								 
									<select class="custom-select" name="part">
									    <option value="title">제목</option>
									    <option value="content">내용</option>
									    <option value="nickname">작성자</option>						
									</select>
								 
								    <div class="d-flex flex-row">
									<input type="text" class="form-control rounded text-css"
										placeholder="Search" aria-label="Search"
										aria-describedby="search-addon" name="searchData" required="required"/> 
								    <input type="submit" class="input-group-text border-0" value="검색"> 
								    </div>
							</div>
							</form>
							</div>
						</div>
						</c:if>
						
						<c:if test="${menuid != 8}">															
						<div>
							<div class="input-group rounded">
							<form action = "onSearch" method="post">
							<input type = "hidden" name = "menuid" value = "${menuid}"/>
							<div class="d-flex flex-row align-items-center">
								 
									<select class="custom-select" name="part">
									    <option value="title">제목</option>
									    <option value="content">내용</option>
									    <option value="nickname">작성자</option>						
									</select>
								 
								    <div class="d-flex flex-row">
									<input type="text" class="form-control rounded text-css"
										placeholder="Search" aria-label="Search"
										aria-describedby="search-addon" name="searchData" required="required"/> 
								    <input type="submit" class="input-group-text border-0" value="검색"> 
								    </div>
							</div>
							</form>
							</div>
						</div>
						</c:if>
						
						
								 

				
<!-- --------------------------------------------------------------게시판------------------------------------------------------------ -->						
				<c:if test="${menuid != 8}">
				<button class="btn btn-info d-block ml-auto">
					<a href="<%=request.getContextPath()%>/studymenu/onStudyWriteForm" style="color: white;">글쓰기 </a>
				</button>
				</c:if>
				<div class="container d-flex align-content-between flex-wrap">
				
				<c:if test = "${empty searchList }"> <!-- list.size() 가 0이면 -->
				<p>작성된 글이 없습니다.</p>				
				</c:if>	
												
				<c:if test="${searchList !=null }">				
				<c:forEach var="s" items="${searchList}">
					<div class="study-box ">
						<a href="<%=request.getContextPath()%>/studymenu/onStudyMenuInfo?board_num=${s.board_num}">											
							<div class="img">
							 <c:if test="${s.menuid == 9 }">
                                <img src="<%=request.getContextPath()%>/img/studymenu/programming.jpg" alt="">
                             </c:if>
                              <c:if test="${s.menuid == 10 }">
                                <img src="<%=request.getContextPath()%>/img/studymenu/security.jpg" alt="">
                             </c:if>
                              <c:if test="${s.menuid == 11 }">
                                <img src="<%=request.getContextPath()%>/img/studymenu/creative.jpg" alt="">
                             </c:if>
                              <c:if test="${s.menuid == 12 }">
                                <img src="<%=request.getContextPath()%>/img/studymenu/marketing.jpg" alt="">
                             </c:if>
                              <c:if test="${s.menuid == 13 }">
                                <img src="<%=request.getContextPath()%>/img/studymenu/language.jpg" alt="">
                             </c:if>
                              <c:if test="${s.menuid == 14 }">
                                <img src="<%=request.getContextPath()%>/img/studymenu/etc.jpg" alt="">
                             </c:if>
							</div>
							
							<div class="px-2 pt-3">
								<h5 class="b-h5">${s.title}</h5>
								<c:if test="${s.price =='0'}">
								<p class="b-price">무료</p>
								</c:if>
								<c:if test="${s.price !='0'}">
								<p class="b-price"> ${s.price } 원</p>
								</c:if>
								<p class="b-people">
									<i class="fa-solid fa-user-group"></i> ${s.pernum}
								</p>
							
								<div>
								    작성자: ${s.nickname } 
								</div>
							</div>
						  </a>
					   </div>
					</c:forEach>	
					</c:if>
				
				</div>
<!-- --------------------------------------------------------------페이지 번호------------------------------------------------------------ -->
				<br> <br>
					
			
				<c:if test="${menuid eq 8 }">
				<nav class="container">
					<ul class="pagination justify-content-center">				
					<li 
						class='page-item <c:if test="${startPage <= bottomLine}"> disabled </c:if>'>
						<a class="page-link " href="<%=request.getContextPath()%>/studymenu/onAllSearchList?pageNum=${startPage - bottomLine}">이전</a></li>
						
					<c:forEach var="i" begin="${ startPage }" end="${endPage}">
						<li class='page-item <c:if test = "${i == pageInt}" >  active active2</c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/onAllSearchList?pageNum=${i}&searchData=${searchData}&part=${part}">${i}</a></li>
					
					</c:forEach>
						<li class='page-item <c:if test = "${a_endPage >= a_maxPage}"> disabled </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/onAllSearchList?pageNum=${startPage + bottomLine}">다음</a></li>
					</ul>
				</nav>
				</c:if>
				
				<!-- 나머지페이징 -->
				<c:if test="${menuid != 8}">
				<nav class="container">
					<ul class="pagination justify-content-center">
										
					<li 
						class='page-item <c:if test="${startPage <= bottomLine}"> disabled </c:if>'>
						<a class="page-link " href="<%=request.getContextPath()%>/studymenu/onSearchList?pageNum=${startPage - bottomLine}">이전</a></li>
						
					<c:forEach var="i" begin="${ startPage }" end="${endPage}">
						<li class='page-item <c:if test = "${i == pageInt}" > active active2 </c:if>' >
						<a class="page-link " href="<%=request.getContextPath()%>/studymenu/onSearchList?pageNum=${i}&searchData=${searchData}&part=${part}">${i}</a></li>
					
					</c:forEach>
						<li class='page-item <c:if test = "${endPage >= maxPage}"> disabled </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/onSearchList?pageNum=${startPage + bottomLine}">다음</a></li>
					</ul>
				</nav>
				</c:if>
				
				
			</div>
		</div>
	</div>
</body>
</html>