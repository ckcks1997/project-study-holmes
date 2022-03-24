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
a:hover {
	color:black;
	text-decoration:none
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
            h2,h3,h5{
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
				<h2>스터디 게시글</h2>
				<hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
				<br>						 																																	
<!-- --------------------------------------------------------------게시판------------------------------------------------------------ -->						
				
				<div class="container d-flex align-content-between flex-wrap">
				
				<c:if test = "${empty list }">
				<p>작성된 글이 없습니다.</p>			
				</c:if>			
				
				<c:if test="${list !=null }">				
				<c:forEach var="s" items="${list}">
					<div class="study-box ">
						<a href=
						<c:if test="${s.menuid >= 2 && s.menuid <= 7}"> 
			       		  "<%=request.getContextPath()%>/studymenu/offStudyMenuInfo?board_num=${s.board_num}"
			    		</c:if>
			    		<c:if test="${s.menuid >= 9 && s.menuid <= 14}"> 
                   		  "<%=request.getContextPath()%>/studymenu/onStudyMenuInfo?board_num=${s.board_num}"
               			 </c:if>
                		<c:if test="${s.menuid >= 16 && s.menuid <= 21}"> 
                     	"<%=request.getContextPath()%>/studymenu/onoffStudyMenuInfo?board_num=${s.board_num}"
                		</c:if>		
                		>											
							<div class="img">
							 <c:if test="${s.menuid == 2 ||s.menuid == 9||s.menuid == 16}">
                                <img src="<%=request.getContextPath()%>/img/studymenu/programming.jpg" width="100%" height="200px">
                             </c:if>
                              <c:if test="${s.menuid == 3 ||s.menuid == 10||s.menuid == 17}">
                                <img src="<%=request.getContextPath()%>/img/studymenu/security.jpg" width="100%" height="200px">
                             </c:if>
                              <c:if test="${s.menuid == 4 ||s.menuid == 11||s.menuid == 18}">
                                <img src="<%=request.getContextPath()%>/img/studymenu/creative.jpg" width="100%" height="200px">
                             </c:if>
                              <c:if test="${s.menuid == 5 ||s.menuid == 12||s.menuid == 19}">
                                <img src="<%=request.getContextPath()%>/img/studymenu/marketing.jpg" width="100%" height="200px">
                             </c:if>
                              <c:if test="${s.menuid == 6 ||s.menuid == 13||s.menuid == 20}">
                                <img src="<%=request.getContextPath()%>/img/studymenu/language.jpg" width="100%" height="200px">
                             </c:if>
                              <c:if test="${s.menuid == 7 ||s.menuid == 14||s.menuid == 21}">
                                <img src="<%=request.getContextPath()%>/img/studymenu/etc.jpg"  width="100%" height="200px">
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
								<p class="b-p">지역: ${s.region }</p>
								
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
						<a class="page-link " href="<%=request.getContextPath()%>/studymenu/mylist2?pageNum=${startPage - bottomLine}">이전</a></li>
						
					<c:forEach var="i" begin="${ startPage }" end="${endPage}">
						<li class='page-item <c:if test = "${i == pageInt}" >  active active2 </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/mylist2?pageNum=${i}">${i}</a></li>
					
					</c:forEach>
						<li class='page-item <c:if test = "${endPage >= maxPage}"> disabled </c:if>'>
						<a class="page-link" href="<%=request.getContextPath()%>/studymenu/mylist2?pageNum=${startPage + bottomLine}">다음</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
</body>
</html>