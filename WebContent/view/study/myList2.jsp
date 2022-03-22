<%@page import="model.StudyMenu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
List<StudyMenu> list = (List<StudyMenu>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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


/* 아래서부터는 페이지 종속css, 다른페이지에 복붙할 필요 x */ 
            .pic_box{ 
                width: 150px;
                height: 150px; 
                border-radius: 70%;
                overflow: hidden;
            }
            .pic_box_pic{
                width: 100%;
                height:100%;
                object-fit: cover;
            }
            .face_img{
                width: 100%;
                height: 100%;
            }
            .face_img > img{
                width: 50px;
                height: 50px;
            }
            .font-sm{
                font-size: 0.8rem;
            }
            h1,h3,h5{
                font-weight: bold;
            }
            .container-css{
                background: #f8f8f8;
                border-radius: 20px;
            }
            .icon-red{
                color:white;
                background: red;
                padding: 2px;
                border-radius:10px;
            }
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
                <%@include file="/common/myinfo_menu.jsp" %>
			
<!-- --------------------------------------------------------------메인------------------------------------------------------------ -->		
			
			<div class="col-sm-9">
				<h1>스터디 게시글</h1>
				<hr align="left" width="350px" style="border: 0.5px solid #c47100" />
				<br>
				
				 
					
<!-- --------------------------------------------------------------검색------------------------------------------------------------ -->							
						<div>
							<div class="input-group rounded" method="post">
							<form action = "studySearch" method="post">
							<div class="d-flex flex-row align-items-center">
								 
									<select class="custom-select" name="part">
									    <option value="title">제목</option>						
									</select>
								 
								    <div class="d-flex flex-row">
									<input type="text" class="form-control rounded"
										placeholder="Search" aria-label="Search"
										aria-describedby="search-addon" name="searchData" required="required"/> 
								    <input type="submit" class="input-group-text border-0" value="검색"> 
								    </div>
							</div>
							</form>
							</div>
						</div>
				 
<!-- --------------------------------------------------------------지역태그------------------------------------------------------------ -->						
					<div>
						<div class="d-flex align-items-end rounded mt-2" method="post">
						
						<form action = "<%=request.getContextPath()%>/studymenu/studySearch" method="post">															
						<input type="hidden" aria-label="Search" name="part" value="region">
						<input type="hidden" aria-label="Search" name="searchData" value="서울">
					    <input type="submit" class="tagbox" value="#서울"> 
						</form>
						
						<form action = "<%=request.getContextPath()%>/studymenu/studySearch" method="post">															
						<input type="hidden" aria-label="Search" name="part" value="region">
						<input type="hidden" aria-label="Search" name="searchData" value="경기">
					    <input type="submit" class="tagbox" value="#경기"> 
						</form>
						
						<form action = "<%=request.getContextPath()%>/studymenu/studySearch" method="post">															
						<input type="hidden" aria-label="Search" name="part" value="region">
						<input type="hidden" aria-label="Search" name="searchData" value="부산">
					    <input type="submit" class="tagbox" value="#부산"> 
						</form>
												
						<div class="tagbox tagbox-etc">
							<a href="#">...</a>
						</div>
				
						
						</div>
					</div>									
													
					

				
				
<!-- --------------------------------------------------------------게시판------------------------------------------------------------ -->						
				
				<div class="container d-flex align-content-between flex-wrap">
				
				<c:if test = "${empty list }"> <!-- list.size() 가 0이면 -->
				
				<p>작성된 글이 없습니다.</p>
				
				</c:if>			
				
				<c:if test="${list !=null }">				
				<c:forEach var="s" items="${list}">
					<div class="study-box ">
						<a href="<%=request.getContextPath()%>/studymenu/studyMenuInfo?board_num=${s.board_num}">											
							<div class="img">
								<img src="<%=request.getContextPath()%>/img/study-img.jpg" alt="">
							</div>
							
							<div class="px-2 pt-3">
								<h5 class="b-h5">${s.title}</h5>
								<p class="b-price">${s.price=="0" ? "무료":s.price  }</p>
								<p class="b-people">
									<i class="fa-solid fa-user-group"></i> ${s.pernum}
								</p>
								<p class="b-p">${s.region }</p>
								<div>
									<p class="b-p d-inline-block">
										&#11088;&#11088;&#11088;&#11088;&#11088;</p>
									<p class="b-p b-rep d-inline-block ">평가:100%</p>
								</div>
							</div>
						  </a>
					   </div>
					</c:forEach>	
					</c:if>
				
				</div>
<!-- --------------------------------------------------------------페이지 번호------------------------------------------------------------ -->
				<br> <br>
				<nav class="container">
					<ul class="pagination justify-content-center">
					
					
					<li 
						class='page-item <c:if test="${startPage <= bottomLine}"> disabled </c:if>'>
						<a class="page-link " href="<%=request.getContextPath()%>/studymenu/studyMenuList?pageNum=${startPage - bottomLine}">Previous</a></li>
						
					<c:forEach var="i" begin="${ startPage }" end="${endPage}">
						<li class='page-item <c:if test = "${i == pageInt}" >  active </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/studyMenuList?pageNum=${i}">${i}</a></li>
					
					</c:forEach>
						<li class='page-item <c:if test = "${endPage >= maxPage}"> disabled </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/studyMenuList?pageNum=${startPage + bottomLine}">Next</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
</body>
</html>