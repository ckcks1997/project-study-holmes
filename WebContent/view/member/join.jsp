<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script   src="<%=request.getContextPath()%>/js/ajax.js"></script>
<title>회원가입</title>
<style>

/* button */
.btn-round {
	border-radius: 24px;
}

.login-font{
    font-weight: bold;
    font-size: 1.2rem;
    color:#fff;
}
a {
	color: white;
	text-decoration: none;
}

body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
}

/* STRUCTURE */
.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	min-height: 100%;
	padding: 20px;
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	margin-top:30px;
	padding: 30px;
	width: 90%;
	max-width: 600px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

#formFooter {
	background-color: #f6f6f6;
	border-top: 1px solid #dce8f1;
	padding: 25px;
	text-align: center;
	-webkit-border-radius: 0 0 10px 10px;
	border-radius: 0 0 10px 10px;
}

/* FORM TYPOGRAPHY*/
 

input[type=button], input[type=submit], input[type=reset] {
	background-color: #f55555;
	border: none;
	color: white;
	padding: 15px 80px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 20px 40px 20px;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #f22222;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active
	{
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

input[type=text], input[type=password] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 5px;
	width: 75%;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus, input[type=password]:focus{
	background-color: #fff;
	border-bottom: 2px solid #C47100;
}

input[type=text]:placeholder {
	color: #cccccc;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
	display: block;
	left: 0;
	bottom: -10px;
	width: 0;
	height: 2px;
	background-color: #F8F8F8;
	content: "";
	transition: width 0.2s;
}

.underlineHover:hover {
	/*color: #333B3D;*/
}

.underlineHover:hover:after {
	width: 100%;
}

/* OTHERS */
*:focus {
	outline: none;
}

#icon {
	width: 60%;
}
.nameholder{
    text-align: left;
	padding:0;
	margin:0;
	padding-left:70px;
	margin-top:5px;
}
.btn-color1{
    background:#f55555;
    color:white;
}
.btn-color1:hover{
    background:#f55555;
    color:white;
}
.span-info{
    color:#aaa;
    font-size:0.8rem;
}
.sns-bg{
    padding: 10px;
    font-weight:bold;
    background: #f55555;
    border-radius:15px;
}
#validation-view{
    display:none;
}
</style>
<script>
function win_upload(){
    const op = "width=500, height=150, left=150, top=150";
    open('<%=request.getContextPath()%>/studymember/pictureForm', "",op);
}

</script>
</head>
<body>

	<div class="wrapper ">
		<div id="formContent">

			<div class=" first px-4 pt-4 text-left">
				<h2><strong>회원가입</strong></h2>
				<p>스터디 홈즈에서 가치를 높이세요</p>
				<hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
			</div>
			 

			<!-- Login Form -->
			<form action="<%=request.getContextPath()%>/studymember/joinPro" name="f" onsubmit="return inputChk(this)" >
			    <input type="hidden" name="picture">
                <input type="hidden" id="idchk" name="idchk" value="<c:if test="${!empty kakaoemail }">'1'</c:if>"> 
                <input type="hidden" id="pwchk" name="pwchk">
                <input type="hidden" id="nickchk" name="nickchk">
                <br>
                
                <p class="nameholder">email</p>
				<div class="alert mx-5 py-0 mb-0 " id="validation-view" role="alert" display="none"></div>
                <div class="d-md-flex justify-content-center align-items-center mx-5">
					<input type="text" id="email" class=" "  name="email" placeholder="example@studyhomles.com" value="${kakaoemail}" required  > 
					<button class="btn btn-color1" id="emailChk" type="button" onclick="idChk()">확인</button>
                </div>
				<p class="nameholder">비밀번호</p>
				  <div class="alert mx-5 py-0 my-0" id="validation-view2" role="alert"  display="none"></div>
				<input type="password" id="password" class="m-2" name="password" placeholder="비밀번호를 입력해주세요" onkeyup="pwChk()" required > 
				<p class="nameholder">비밀번호 확인</p>
				<input type="password" id="password_valid"
					class="m-2 " name="password_valid" placeholder="비밀번호를 확인해주세요" onkeyup="pwChk()" required > 
					<p class="nameholder">이름</p>
				<input type="text" placeholder="이름" name="name" class="m-2" required > 
				
				<p class="nameholder">닉네임 <span class="span-info">(추후 변경이 불가합니다)</span></p>
				<div class="alert mx-5 py-0 my-0" id="validation-view3" role="alert"  display="none"></div>
				<div class="d-md-flex justify-content-center align-items-center mx-5">
				    <input type="text" placeholder="닉네임" id="nickname" name="nickname" class=" " required > 
				    <button class="btn btn-color1" id="emailChk" type="button" onclick="nicknameChk()">확인</button>
                </div>
				<p class="nameholder">전화번호</p>
				<input type="text" 	placeholder="전화번호" name="tel" class="m-2">
					<p class="nameholder">프로필 사진</p>
				<div class="col-4 mx-auto my-2 bg-none">
					<img src="" width="100" height="100" id="pic" onerror="this.src='<%=request.getContextPath()%>/img/profile_empty.jpg'"> <br>
					<button type="button" class="btn btn-sm m-2 btn-color1" onclick="win_upload()">프로필 사진등록</button>
				</div>

				<br> <input type="submit" class=" btn-color1" value="회원가입"> <br> <br>
			</form>
<%--
			<div id="formFooter">
				<h5>간편 회원가입</h5>
				<p>SNS 계정으로 간편하게 로그인하세요</p>
				<div class="container d-inline-flex justify-content-center sns-bg">
				    <a class="underlineHover login-font" href="#" >구글 로그인</a> &nbsp;|&nbsp;
				    <a class="underlineHover login-font" href="#" >네이버 로그인</a>
				</div>
			</div>
 --%>
		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
 
 <script>
	   
	    
			 const result = document.querySelector("#validation-view");
			 const result2 = document.querySelector("#validation-view2");
			 const result3 = document.querySelector("#validation-view3");
			 const idchk = document.querySelector("#idchk");
             const pwchk = document.querySelector("#pwchk");
             
		 function idChk() {
			 const id = document.querySelector("#email").value; 
			 const param = "id="+id; 
			    if(id.length<5){ 
			         result.style.display="block";
			         result.classList.remove("alert-primary");
			         result.classList.add("alert-danger");
			        result.innerHTML = '올바른 이메일을 입력하세요'; 
			        idchk.value=0;
			    }  
			    else{
			        ajax("<%=request.getContextPath()%>/studymember/idexist", param, callback_mail, 'get');
			    }
			}
		 
		 
		 
         function pwChk() {
        	  
             const pw = document.querySelector("#password").value;
             const pw2 = document.querySelector("#password_valid").value;
                if(pw.length<5){ 
                     result2.style.display="block";
                     result2.classList.remove("alert-primary");
                     result2.classList.add("alert-danger");
                    result2.innerHTML = '비밀번호를 5자 이상 입력하세요'; 
                    pwchk.value=0;
                } else if (pw != pw2){
                    result2.style.display="block";
                    result2.classList.remove("alert-primary");
                    result2.classList.add("alert-danger");
                   result2.innerHTML = '두 비밀번호가 서로 다릅니다'; 
                   pwchk.value=0;
                }
                else{ 
                     result2.style.display="none";
                     pwchk.value=1;
                }
                 
            }
         
         function nicknameChk() {
             const nickname = document.querySelector("#nickname").value; 
             const param = "nickname="+nickname; 
                if(nickname.length<2){ 
                     result3.style.display="block";
                     result3.classList.remove("alert-primary");
                     result3.classList.add("alert-danger");
                    result3.innerHTML = '올바른 닉네임을 입력하세요'; 
                    nickchk.value=0;
                }  
                else{
                    ajax("<%=request.getContextPath()%>/studymember/nicknameExist", param, callback_nickname, 'get');
                }
            }
         
		function callback_mail(){ 
		    if (this.readyState == 4 && this.status == 200) {
		         
		        let chk = this.responseText.trim();
		        console.log(chk);
		        if(chk=='0'){ 
		        	 result.style.display="block"; 
		             result.classList.remove("alert-danger");
		             result.classList.add("alert-primary");
                     result.innerHTML = '가입 가능한 메일입니다'; 
                     idchk.value=1;
		        }
		        else{ 
		        	  result.style.display="block";
		              result.classList.remove("alert-primary");
		              result.classList.add("alert-danger");
		             result.innerHTML = '이미 가입된 메일입니다'; 
		             idchk.value=0;
		        } 
		    }  
		}
		
        function callback_nickname(){ 
            if (this.readyState == 4 && this.status == 200) {
                 
                let chk = this.responseText.trim();
                console.log(chk);
                if(chk=='0'){ 
                     result3.style.display="block"; 
                     result3.classList.remove("alert-danger");
                     result3.classList.add("alert-primary");
                     result3.innerHTML = '사용 가능한 닉네임입니다'; 
                     nickchk.value=1;
                }
                else{ 
                      result3.style.display="block";
                      result3.classList.remove("alert-primary");
                      result3.classList.add("alert-danger");
                     result3.innerHTML = '이미 사용된 닉네임입니다'; 
                     nickchk.value=0;
                } 
            }  
        }
 
        function inputChk(f){
            
            let result1 = document.querySelector("#idchk").value;
            let result2 = document.querySelector("#pwchk").value;
            let result3 = document.querySelector("#nickchk").value;
            if(result1==0 ||  result2==0 || result3==0 ){
                alert("확인절차가 완료되지 않았습니다.")
                return false;
            }

            return true;
        }
        
 </script>
</body>
</html>
