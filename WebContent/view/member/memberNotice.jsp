<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<title>알림 목록</title>
<style>

 .n_info{
    color:black;
 }
 
.container-css{
    background-color: #ddd;
    border-radius:20px;
}

.box-css{
    background-color: #eee;
    border-radius:10px;
}
</style>
</head>
<body>

 <div class="container">
            <div class="row pt-5">
                <div class="col-lg-3">
 
 
                </div>
                <br>
                <br>
                <div class="col-lg-9">
                    <h1>알림 목록</h1>
                    <hr align="left" width="250px" style="border: 0.5px solid #c47100" />
                    <br> 
                     
                     <div class="container shadow-sm container-css p-5 ">
                         <div class="d-flex flex-column justify-content-center">
                         
                         <c:forEach  items="${noticeList}" var="i">
                            <a href="">
                                <div class="border row box-css"> 
                                    <div class="col n_info">
	                                    <div class="row">
	                                        <div class="col">
	                                          from: ${i.nickname_from} 
	                                        </div> 
	                                        <div class="col text-right">
	                                        date: <fmt:formatDate value="${i.regdate }" pattern="MM/d hh시 mm분"/>
	                                        </div>
	                                    </div>
	                                    <div class="">
	                                        내용: ${i.info}
	                                    </div>
                                    </div>
                                    
                                </div>  
                            </a>
                            <hr>
                         </c:forEach>
                         </div>
                     </div>
                      
                </div>
            </div>
        </div>
 
 <br><br><br>

</body>
</html>
