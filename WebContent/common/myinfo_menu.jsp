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




.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 10px 10px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}




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
				<div class="dropdown">
  <div class="dropbtn"> 작성한 게시글</div>
  <div class="dropdown-content">
     <a href="<%=request.getContextPath()%>/community/comBoardmyList1"><div class="aside-content">커뮤니티 게시글</div></a>
   
   
    <a href="<%=request.getContextPath()%>/studymenu/mylist2"><div class="aside-content">스터디 게시글</div></a>
  </div>
</div>

			</div>

	</aside>
</body>