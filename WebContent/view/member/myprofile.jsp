<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<title>마이페이지</title>
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
				<h2>프로필 정보</h2>
				<hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
				<br>
				<div class="container container-css  p-5">
					<h5>닉네임</h5>
					<input class="form-control input-border-round" type="text" name="nickname" value="${memberInfo.nickname}" disabled> <br>
					<h5>이메일</h5>
					<input class="form-control input-border-round" type="text" name="nickname" value="${memberInfo.email}" disabled> <br>
					<div class="container row ">
						<h5>휴대폰 번호</h5>
						&nbsp;<span class="h5-subinfo"> </span>
					</div>
					<form action=" ">
						<div class="d-flex  justify-content-between ">
							<input class="col-10 form-control input-border-round text-left" type="text" value="${memberInfo.tel}">
							<div class="d-inline-block col text-center  ">
								<button class="btn btn-color ">변경</button>
							</div>
						</div>
					</form>
					<br>
					<form action="<%=request.getContextPath()%>/studymember/myprofileEdit1">
						<div class="d-flex row pl-3">
							<h5>자기소개</h5>
							<span>&nbsp;(2000자 이내로 작성하세요)</span>
						</div>
						<textarea id="summernote" name="profile_intro">${memberInfo.profile_intro}</textarea>
						<br>
						<div class="col text-center">
							<button class="btn   btn-color">수정</button>
						</div>
					</form>
				</div>
				<br>

				<div class="container container-css  p-5">
					<h5>관심태그</h5>
					<form action="<%=request.getContextPath()%>/studymember/myprofileEdit2">
						<div class="row px-5">
							<input class="col-10 form-control input-border-round" type="text" name="tag" maxlength="10" required>
							<div class="col text-center">
								<button class="btn btn-color">추가</button>
							</div>
						</div>
					</form>
					<!-- 태그 출력 -->
					<div class="container p-2">
						<c:forEach var="i" items="${tagInfo}">
							<span class="interest-tag">#${i.tag}</span>
						</c:forEach>
					</div>
				</div>
				<br>
				<div class="container container-css p-5">
					<div class="container d-flex justify-content-between  ">
						<div class="row">
							<h5>비밀번호</h5>
							&nbsp;<span class="h5-subinfo"> (6개월마다 변경을 권장합니다)</span>
						</div>
						<button class="btn btn-color" onclick="location.href='<%=request.getContextPath()%>/studymember/passwordChange'">변경하러 가기</button>
					</div>
				</div>
				<br> <br>
			</div>
		</div>
		<br> <br> <br> 
		<div class="container text-right">
			<button class="btn btn-sm btn-secondary" onclick="location.href='<%=request.getContextPath()%>/studymember/goodbye' ">회원탈퇴</button>
		</div>
		<br>
	</div>

	<script>
       $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 1,
        height: 200,
        lang: "ko-KR",
        callbacks:{
            onChange: function(){
            	if($(".note-editable").text().length>1999){
                $(".note-status-output").html('<div class="alert alert-danger">2000자를 초과할 수 없습니다</div>');
              }else{
                $(".note-status-output").html("");
              }
            }
        }
      });
    </script>

</body>