<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<title>내가 쓴 글</title>
<style>
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

h2, h3, h5 {
	font-weight: bold;
}

.btn-color{
    color:white;
    background-color:#c47100;
    border: none;
}
.btn-color:hover, 
.btn-color:active, 
.btn-color:visited{
    color:white;
    background-color:#a35100;
    border: none;
}
.container-css {
	background: #f8f8f8;
	border-radius: 20px;
}

.input-border-round {
	border-radius: 20px;
}

.interest-tag {
	font-weight: bold;
	margin: 2px;
}

.h5-subinfo {
	font-size: 0.8rem;
	font-weight: bold;
	color: #C47100;
}
</style>
</head>
<body>

	<div class="container-fluid famous-saying-box">
		<div class="container p-3 ">
			<div class=" mt-3">
				<h3 class="color-white ">오늘의 명언</h3>
				<div class="color-white">생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지 않으면 오류나 독단에 빠질 위험이 있다. -공자</div>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pt-5">
		
            <%@include file="/common/myinfo_menu.jsp" %>
            
			<br> <br>
			<div class="col-lg-9">
				<h2>내가 쓴 글 - 스터디 게시판</h2>
				<hr align="left" width="370px" style="background-color: #c47100; height:1px;" />
				<br>
				<div class="container  p-5">
					 
					 <!-------------메인 커뮤니티 게시판 --------------------------------------------------------------------------------------------------------- -->
                <div class="container">
                    <table class="table">
                    <%-- 은지님 코드 그대로 복붙해 왔습니다. 여기서부터 구현 시작입니다 ㅠㅠ..
                        일단 studyMemberController 맨 아랫쪽에 코드가 있는데 별도로 컨트롤러를 만들어서 빼셔도 되고
                        그냥 그 코드 안에 구현하셔도 됩니다.
                     --%>
                        <%--<c:forEach var="com" items="${list}"> --%>
                            <tr>
                                <td>
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <a
                                                href="<%=request.getContextPath() %>/community/comBoardInfo?board_num=  "
                                                style="color: black">
                                                <h4>
                                                    <strong> 제목</strong>
                                                </h4>
                                                <h5>
                                                    <small>내용 </small>
                                                </h5> <br />
                                                <h6>
                                                    <small>닉네임 · 등록일 </small>
                                                </h6>
                                            </a>
                                        </div>
                                        <div class="col-sm-3 reaction">
                                            <div class="circle">
                                                <div class="reactions">
                                                    <div class="likes">
                                                        <span> <svg xmlns="http://www.w3.org/2000/svg"
                                                                width="16" height="16" fill="#de2a2a"
                                                                class="bi bi-suit-heart" viewBox="0 0 16 16">
                                                    <path
                                                                    d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                                    </svg>
                                                        </span> 좋아요수
                                                    </div>
                                                    <div class="readcnt">
                                                        <span> <svg xmlns="http://www.w3.org/2000/svg"
                                                                width="16" height="16" fill="currentColor"
                                                                class="bi bi-eye" viewBox="0 0 16 16">
                                                    <path
                                                                    d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
                                                    <path
                                                                    d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
                                                    </svg>
                                                        </span> 조회수 </div>
                                                    <div class="comment">
                                                        <span> <svg xmlns="http://www.w3.org/2000/svg"
                                                                width="16" height="16" fill="currentColor"
                                                                class="bi bi-chat-square-text" viewBox="0 0 16 16">
                                                    <path
                                                                    d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                    <path
                                                                    d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
                                                    </svg>
                                                        </span> 댓글수
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </td>
                            </tr>
                        <%--</c:forEach> --%>

                    </table>
                </div>
                <!------------- 아래 페이징네이션 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                
                <ul class="pagination justify-content-center">
                    <li
                        class='page-item <c:if test ="${startPage <= bottomLine }"> disabled </c:if> '><a
                        class="page-link"
                        href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${startPage-bottomLine}">Previous</a></li>
                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                        <li
                            class='page-item <c:if test = "${i==pageInt}" > active </c:if> '>
                            <a class="page-link"
                            href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li
                        class='page-item <c:if test ="${endPage >= maxPage}"> disabled </c:if>  '>
                        <a class="page-link"
                        href="<%=request.getContextPath()%>/community/comBoardList?pageNum=${startPage+bottomLine}">Next</a>
                    </li>
                </ul>
					 
					 
				</div>
				<br>

				 
				<br> <br>
			</div>
		</div>
		<br> <br> <br> 
 
		<br>
	</div>

 

</body>