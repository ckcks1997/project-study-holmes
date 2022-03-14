<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/studymember/picturePro" method="post" enctype="multipart/form-data">
		<input type="file" name="picture"> 
		<input type="submit" value="사진등록">
	</form>
</body>
</html>