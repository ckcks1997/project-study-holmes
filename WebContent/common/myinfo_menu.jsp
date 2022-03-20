<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<style>
.aside-content {
	display: block;
	width: 150px;
	/*height와 line-height를 같은 값으로 주면 세로로 중앙 정렬이 된다.*/
	height: 40px;
	line-height: 40px;
	text-align: left;
	padding-left: 10px;  
	margin-bottom: 10px;
	cursor:pointer;
	color:black;
	font-weight:bold;
}

.aside-content:hover {
	display: block;
	width: 150px;
	/*height와 line-height를 같은 값으로 주면 세로로 중앙 정렬이 된다.*/
	height: 40px;
	line-height: 40px; 
	text-align: left;
	padding-left: 10px;  
	margin-bottom: 10px;
	color:#f55555;
	border-bottom:2px solid #f55555;
    font-weight:bold;
}
</style>
</head>
<body>
	<aside class="col-lg-3">
		<div class="col aside">
			<h3>내 정보</h3>
			<hr align="left" width="120px" style="border: 0.5px solid #c47100" />
			<div class="aside-content" onclick="location.href='<%=request.getContextPath()%>/studymember/mypage'">
				<li class="">마이페이지</li>
			</div>
			<div class="aside-content" onclick="location.href='<%=request.getContextPath()%>/studymember/myprofile'">
				<li class=""> 프로필 </li>

			</div>
			<div class="aside-content">
				<li class=""> 작성한 게시글</li>
			</div>
	</aside>
</body>