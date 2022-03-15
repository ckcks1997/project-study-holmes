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

.aside-content {
    display: block;
    width: 200px;
    /*height와 line-height를 같은 값으로 주면 세로로 중앙 정렬이 된다.*/
    height: 40px;
    line-height: 40px;
    background: rgb(233, 233, 233);
    text-align: left;
    padding-left: 10px;
    border: 1px solid rgb(223, 223, 223);
}


h1, h3, h5 {
	font-weight: bold;
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
                    <div class="color-white">
                        생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지 않으면 오류나 독단에 빠질 위험이 있다. -공자
                    </div>

                </div>
            </div>
        </div>
        <div class="container">
            <div class="row pt-5">
                <aside class="col-lg-3">
                    <div class="col aside">
                        <div class="aside-content">
                            <li class=""><a href="mypage"> 마이페이지 </a></li>
                        </div>
                        <div class="aside-content">
                            <li class=""><a href="">  프로필 </a></li>
                           
                        </div>
                        <div class="aside-content">
                            <li class=""><a href=""> 작성한 게시글 </a></li>
                        </div>
 
                </aside>
                <br>
                <br>
                <div class="col-lg-9">
                    <h1>프로필 정보</h1>
                    <hr align="left" width="300px" style="border: 0.5px solid #c47100" />
                     <br>
                     <div class="container container-css  p-5">
                         <form action="">
                             <h5>닉네임 </h5>
                             <input class="form-control input-border-round" type="text">
                             <br>
                             <h5>자기소개</h5>
                             <textarea id="summernote" name="editordata"></textarea>  
                             <br>
                             <div class="col text-center">
                                 <button class="btn btn-primary "> 수정 </button>
                             </div>
                         </form>
                     </div>
                     <br>

                     <div class="container container-css  p-5">
                          
                             <h5>관심태그 </h5>
                             <form action="">
                                 <div class="row px-5">
                                     <input class="col-10 form-control input-border-round" type="text">
                                     <button class="col btn btn-primary">추가</button>
                                    </div>
                                </form>
                                <!-- 태그 출력 -->
                                <div class="container p-2">
                                    <span class="interest-tag">#영어</span>
                                    <span class="interest-tag">#수원</span>
                                </div> 
                         
                     </div> 
                     <br>

                     <div class="container container-css  p-5">
                         <div class="container row ">

                             <h5>이메일</h5> &nbsp;<span class="h5-subinfo"> (변경이후 재인증이 필요합니다)</span> 
                            </div>
                        <form action="">
                            <div class="row  px-5">
                                <input class=" form-control input-border-round" type="text">
                            </div>
                            <div class="d-inline-block col text-center mt-3">
                                <button class="btn btn-primary">수정</button>
                            </div>
                        </form> 
                     </div>
                    <br>

                    <div class="container container-css p-5">
                        <div class="container d-flex justify-content-between  ">
                            <div class="row">
                                <h5>비밀번호</h5> &nbsp;<span class="h5-subinfo"> (6개월마다 변경을 권장합니다)</span> 
                            </div>
                            <button class="btn btn-primary">변경하러 가기</button>
                        </div> 
                    </div>
                   <br>
                   <div class="container container-css  p-5">
                    <div class="container row ">

                        <h5>휴대폰 번호</h5> &nbsp;<span class="h5-subinfo"> (-없이 숫자만 입력해 주세요)</span> 
                       </div>
                   <form action="">
                       <div class="row  px-5">
                           <input class=" form-control input-border-round" type="text">
                       </div>
                       <div class="d-inline-block col text-center mt-3">
                           <button class="btn btn-primary">인증요청</button>
                       </div>
                   </form> 
                </div>
               <br>
 
                </div>
            </div>
        </div>
        <br>
        <br> <br>
        <br> <br>
        <br> <br>
        <br> <br>
        <br>
 

        <script>
             $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 1,
        height: 200,
        lang: "ko-KR"
      });
        </script>

</body>