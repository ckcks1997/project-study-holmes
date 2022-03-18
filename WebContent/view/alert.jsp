<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
</head>
<body>

<script>

<%-- msg내용이 없으면 alert를 하지 않음 --%>
if("${msg}" != ""){
    alert("${msg}");
}
<%-- 회원탈퇴 기능을 만들고 있는데 컨트롤러에서 메세지와 함께 main으로 보내는 방법을 못 찾아서..
    컨트롤러에서 url 값을 "main"이라고 담아서 보낼 경우 메인 화면으로 리턴되게 해놨습니다.
 --%>
let hrefVal = "${url}";
if(hrefVal == "main"){ 
	hrefVal = "<%=request.getContextPath()%>/board/main";
}

location.href = hrefVal;
</script>

</body>
</html>