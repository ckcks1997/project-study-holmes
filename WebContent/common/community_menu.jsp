<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<style>
/* aside */
ul, li {
    list-style: none;
}

li {
	font-weight:700;
    color: #777;
}
li:hover {
    font-weight:700;
    color:#f55555;
    
}
a:hover {
    color: black;
    text-decoration: none;
}

.aside-content {
    display: block;
    width: 200px;
    line-height: 40px;
    text-align: left;
    padding-left: 10px;
}
 

.selected, .selected:hover {
    padding-left:10px;
    color:white;
    background: #f55555; 
    border-radius:10px;
}
</style>
</head>
<body>
	<aside class="col-lg-3 mb-5">
		<div class="col aside ">
			<h4><strong>함께 공부해요</strong></h4>
			<div class="aside-content">
				<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=1"><li class=" <c:if test="${boardid eq 1 }">selected</c:if> ">질문 & 답변</li></a>
				<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=2"><li class="<c:if test="${boardid eq 2 }">selected</c:if>">자유</li></a>
				<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=3"><li class="<c:if test="${boardid eq 3 }">selected</c:if>">정보를 나눠요</li></a> <br>
				<h4><strong>With</strong></h4>
				<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=4"><li class="<c:if test="${boardid eq 4 }">selected</c:if>"> 공지 </li></a>
				<a href="<%=request.getContextPath()%>/community/comBoardList?boardid=5"><li class="<c:if test="${boardid eq 5 }">selected</c:if>"> 문의사항 </li></a>

			</div>
		</div>
	</aside> 
</body>