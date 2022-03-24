<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<title>알림 목록 상세</title>
<style>

 .n_info{
    color:black;
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
                    <h2><strong>알림 목록 상세</strong></h2>
                   <hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
                    <br> 
                     
                     <div class="container shadow-sm container-css p-5 ">
                         <div class="d-flex flex-column justify-content-center">
                            from:${notice.nickname_from } <br><br>
                            내용:
                            <c:if test="${notice.info != null }">
                            ${notice.info} <br>
                            </c:if>
                          <c:if test="${notice.info2 != null }">
                            "${notice.nickname_from }" 님이 "${title}" 스터디에 참가요청을 보냈습니다.<br>
                                <div class="container text-center mt-5">
                                   <button class="btn btn-primary" onclick="location.href=' <%=request.getContextPath()%>/studymember/groupAccept?notice_num=${notice.notice_num}'">참가 수락</button> 
                                   <button class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/studymember/notice'">알림 목록</button> 
                                </div>
                           </c:if>
                         </div>
                     </div>
                      
                </div>
            </div>
        </div>
 
 <br><br><br>

</body>
</html>
