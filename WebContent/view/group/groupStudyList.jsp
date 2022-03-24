<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
 
<title>스터디 진행현황</title>
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

.a-color{
    color:black;
}
.a-color:hover{
    color:black;
}
.items{
    
}
.i-title{
    font-size:1.2rem;
    font-weight: 700;
}
.leader{
    padding:3px;
    color:white;
    font-weight:700;
    font-size:0.8rem;
    background-color:#f55555;
    border-radius:5px;
}
.jowon{
    padding:3px;
    color:white;
    font-weight:700;
    font-size:0.8rem;
    background-color:#555555;
    border-radius:5px;
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
		 
            
			<br> <br>
			<div class="col-lg-9 mx-auto">
				<h2>스터디 진행현황</h2>
				<hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
				<br>
				<div class="container container-css  p-5">
				<h2> 스터디 목록 </h2>
				<br>
			        <div class="row">
	                    <div class="col">
	                      <h5>진행중인 스터디</h5> 
	                    </div>
	                </div>
	                    
				    <c:forEach items="${list}" var="i">
                      <a class="a-color" href="<%=request.getContextPath()%>/group/studyinfo?boardnum=${i.boardnum}">
				        <div class="row items m-3">
					        <div class="col">
					           <span class="i-title"> ${i.title }</span>
					           <c:if test="${i.represent eq 1}"> <span class="leader"> 리더 </span> </c:if>
                               <c:if test="${i.represent eq 0}"> <span class="jowon"> 조원 </span> </c:if>
	                        </div>
	                        <div class="col">
	                           
	                        </div> 
				        </div>
				      </a>
				      <hr>
				    </c:forEach>
					

				</div>
				<br>
             </div>
         </div>
     </div>
				 
 

</body>