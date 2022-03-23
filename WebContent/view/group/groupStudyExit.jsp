<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
 
<title>스터디 나가기</title>
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

h1, h3, h5 {
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
				<h1>스터디 평가</h1>
				<hr align="left" width="300px" style="border: 0.5px solid #c47100" />
				<br>
				<div class="container container-css  p-5">
				<h3> 그룹원 평가 </h3>
				<br>
			        <div class="row">
	                    <div class="col">
	                      <h5>그룹원</h5> 
	                    </div>
	                </div>
	                    
				    <c:forEach items="${groupMemberList}" var="i">
					    <form action="<%=request.getContextPath()%>/group/score">
					         <input type="hidden" value="${i.nickname}" name="nickname_to">
				             <div class="row items m-3">
							        <div class="col">
							           <span class="i-title"> ${i.nickname }</span> 
			                        </div>
			                        <div class="col">
			                           <select class="custom-select" name="score">
		                                        <option value="-10">1</option>        
		                                        <option value="-5">2</option>    
		                                        <option value="-1" selected>3</option>    
		                                        <option value="2">4</option>    
		                                        <option value="3">5</option>                   
		                               </select>
			                        </div>
			                        <div class="col">
			                             <button class="btn btn-danger" onclick="">평가</button>
			                        </div>
				              </div>
		                </form> 
				    </c:forEach>
					<br>
                    <button class="btn btn-danger" onclick="">스터디 종료</button>
				</div>
				<br>
             </div>
         </div>
     </div>
				 
 

</body>