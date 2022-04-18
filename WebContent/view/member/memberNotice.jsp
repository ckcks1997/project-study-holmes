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
 .n_info:hover{
    background-color: #ddd; 
}
.container-css{
    background-color: #fff;
}

.box-css{
    background-color: #fff; 
    border-bottom: 1px solid #ddd; 
}

</style>
</head>
<body>

 <div class="container">
            <div class="row pt-5">
 
                <br>
                <br>
                <div class="col-9 mx-auto">

                    <h2><strong>알림 목록</strong></h2>
                    <hr align="left" width="200px" style="background-color: #c47100; height:1px;" />

                    <br> 
                     
                     <div class="container shadow-sm container-css p-5 ">
                         <div class="d-flex flex-column justify-content-center">
                         <div class="row">
                            <h4 class="col">제목</h4>
                            <h4 class="col text-right">날짜</h4>
                         </div>
                         <c:forEach  items="${noticeList}" var="i">
                            <a href="<%=request.getContextPath()%>/studymember/noticeInfo?noticeNum=${i.notice_num}">
                                <div class="row box-css"> 
                                    <div class="col n_info ">
	                                    <div class="row">
	                                        <div class="col">
	                                          from: ${i.nickname_from} 
	                                        </div> 
	                                        <div class="col text-right">
	                                        date: <fmt:formatDate value="${i.regdate }" pattern="MM/d hh시 mm분"/>
	                                        </div>
	                                    </div>
	                                    <div class="">
	                                    <c:if test="${i.info != null}">
	                                        내용: ${i.info}
	                                    </c:if>
	                                    <c:if test="${i.info == null}">
	                                        내용: 스터디 초대요청 
	                                    </c:if>
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
