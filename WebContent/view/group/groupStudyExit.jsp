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
				<h2>스터디 평가</h2>
				<hr align="left" width="200px" style="background-color: #c47100; height:1px;" />
				<br>
				<div class="container container-css  p-5">
				<h3> 그룹원 평가 </h3>
				<br>
			        <div class="row">
	                    <div class="col">
	                      <h5>그룹원</h5> 
	                    </div>
	                    <div class="col">
                          <h5>점수</h5> 
                        </div>
                        <div class="col">
                          <h5>평가내용</h5> 
                        </div>
                        <div class="col">
                          <h5>평가 </h5> 
                        </div>
	                </div>
	                    
				    <c:forEach items="${groupMemberList}" var="i">
				        <c:if test="${i.nickname != memberNickname}">					    
					         <input type="hidden" value="${i.nickname}" name="nickname_to">
				             <div class="row items m-3">
							        <div class="col">
							           <span class="i-title"> ${i.nickname }</span> 
			                        </div>
			                        <div class="col">
			                           <select id="score_${i.nickname}" class="custom-select" name="score">
		                                        <option value="-10">1</option>        
		                                        <option value="-5">2</option>    
		                                        <option value="-1" selected>3</option>    
		                                        <option value="2">4</option>    
		                                        <option value="3">5</option>                   
		                               </select>
			                        </div>
			                        <div class="col">
                                        <input id="info_${i.nickname}" class="form-control" type="text" name="info">
                                    </div>
			                        <div class="col">
			                             <button class="btn btn-danger" id="btn_${i.nickname}" onclick="score_submit('${i.nickname}')">평가</button>
			                        </div>
				              </div>
		                 </c:if>
				    </c:forEach>
					<br>
					<div class="text-center">
                        <button class="btn btn-danger"onclick="location.href='<%=request.getContextPath() %>/group/groupexitpro?boardnum=${groupMemberList[0].boardnum}'" >스터디 종료</button>
					</div>
				</div>
				<br>
             </div>
         </div>
     </div>
				 
 <script>
 function score_submit(nickname){
	 let score_value = document.querySelector('#score_'+nickname).value;
	 let info_value = document.querySelector('#info_'+nickname).value;
	 let str = {
			 "nickname" : nickname,
			 "score_value" : score_value,
			 "info_value" : info_value
	 }
	 $.ajax({ 
	        type: "post",
	        url: "<%=request.getContextPath()%>/group/score",
	        data: str,
	        dataType: 'text',
	        success : function(result){
	            alert("평가되었습니다");
	            document.querySelector('#btn_'+nickname).disabled=true;
	            document.querySelector('#btn_'+nickname).innerHTML="평가완료";
	        },
	        error: function (result){
	            console.log(result)
	            alert("error");
	        }   
	    }); //end ajax
	 
 }
 </script>

</body>