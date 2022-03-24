<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
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


/* 아래서부터는 페이지 종속css, 다른페이지에 복붙할 필요 x */ 
            .pic_box{ 
                width: 150px;
                height: 150px; 
                border-radius: 70%;
                overflow: hidden;
            }
            .pic_box_pic{
                width: 100%;
                height:100%;
                object-fit: cover;
            }
            .face_img{
                width: 100%;
                height: 100%;
            }
            .face_img > img{
                width: 50px;
                height: 50px;
            }
            .font-sm{
                font-size: 0.8rem;
            }
            h2,h3,h5{
                font-weight: bold;
            }
            .container-css{
                background: #f8f8f8;
                border-radius: 20px;
            }
            .icon-red{
                color:white;
                background: red;
                padding: 2px;
                border-radius:10px;
            }
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
                
                <%--aside부분 --%>
                <%@include file="/common/myinfo_menu.jsp" %>
                
                <br>
                <br>
                <div class="col-lg-9">
                    <h2>마이 페이지</h2>
                    <hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
                    <br> 
                     
                     <div class="container shadow-sm container-css p-5">
                         <div class="d-flex justify-content-center">
                             <div class="container col-md-3 text-center">
                                 <div class=" ">
                                 <c:if test="${memberInfo.picture == null }">
                                     <img class="pic_box_pic"src="<%=request.getContextPath() %>/img/profile_empty.jpg">
                                 </c:if>
                                 <c:if test="${memberInfo.picture != null }">
                                    <img class="pic_box_pic"src="<%=request.getContextPath()%>/upload/${memberInfo.picture}">
                                 </c:if>
                                 </div>
                                 <br>
                                 <div class="d-flex justify-content-center">
                                     <button class="btn btn-primary">사진 변경</button>
                                 </div>
                             </div>
                              <div class="constainer col-md-9">
                                  <div class="container m-1">
                                      ${memberInfo.nickname} 님
                                </div>
                                
                                <div class="container m-1">
                                    
                                    포인트:${memberInfo.point}  
                                  </div>

                                  <div class="container m-1">
                                     
                                    가입일: <fmt:formatDate value="${memberInfo.regdate}" pattern="yyyy년 M월 d일"/>
                                  </div>
                              </div>
                         </div>
                     </div>
                     <br>
                     <div class="container shadow-sm container-css p-5">
                         
                         <div class="d-md-flex justify-content-center">
                             <div class="container col-md-6 px-0"> 
                                 <h5>나의 매너표정</h5>
                                 <div class="d-md-flex justify-content-between  align-items-center ">
                                     <div class="d-flex col-md-3 face_img  ">
                                        <c:choose>
                                         <c:when test="${memberInfo.point >= 50}">
                                            <img class=" my-auto " src="<%=request.getContextPath() %>/img/good.png" alt="good">
                                         </c:when>
                                        <c:when test="${memberInfo.point > 30}">
                                            <img class=" my-auto " src="<%=request.getContextPath() %>/img/soso.png" alt="soso">
                                         </c:when>
                                         <c:otherwise>
                                            <img class=" my-auto " src="<%=request.getContextPath() %>/img/bad.png" alt="bad">
                                         </c:otherwise>
                                        </c:choose>
                                        </div>
                                        <div class="col-md-9">
                                            <c:choose>
                                            <c:when test="${memberInfo.point >= 50}">
                                                <p class="my-1">매너 상태가 좋습니다. </p>  
                                             </c:when>
                                             <c:when test="${memberInfo.point > 30}">
                                                <p class="my-1">매너 상태가 보통입니다. </p>  
                                             </c:when>
                                             <c:otherwise>
                                                <p class="my-1">매너 상태가 좋지 않습니다. </p>  
                                             </c:otherwise>
                                          </c:choose>
                                        </div>
                                    </div>
                                </div>
                            <br>
                            <div class="d-md-flex justify-content-center align-items-center col-md-6 px-0">
                                <div class="container ">
                                    <h5>최근 받은 매너평가 </h5> 
                                    <c:if test="${repList != null}">
                                        <c:forEach items="${repList}" var="i" >
                                            <p class="my-1">${i.info}</p>
                                        </c:forEach> 
                                    </c:if>
                                    <c:if test="${empty repList}">
                                       아직 매너 정보가 없습니다.
                                    </c:if>
                                </div>
                            </div>
                         </div>
                     </div>
                     <br>


<%-- 
                     <div class="d-md-flex shadow-sm container-css p-5">
                         <div class="container">
                             <h5>현재 스터디</h5>
                            <table class="font-sm" width="100%">
                                <tr>
                                    <td width="70%">리액트 스터디 <span class="icon-red">오프</span></td>
                                    <td class="text-right"> 2022.03.09</td>
                                </tr>
                                <tr>
                                    <td width="70%">리액트 스터디</td>
                                    <td class="text-right"> 2022.03.09</td>
                                </tr>
                                <tr>
                                    <td width="70%">리액트 스터디</td>
                                    <td class="text-right"> 2022.03.09</td>
                                </tr>
 
                            </table>
                         </div>
                         <br>
                         <div class="container">
                            <h5>이전 스터디</h5>
                           <table class="font-sm" width="100%">
                               <tr>
                                   <td width="70%">리액트 스터디</td>
                                   <td class="text-right"> 2022.03.09</td>
                               </tr>
                               <tr>
                                   <td width="70%">리액트 스터디</td>
                                   <td class="text-right"> 2022.03.09</td>
                               </tr>
                               <tr>
                                   <td width="70%">리액트 스터디</td>
                                   <td class="text-right"> 2022.03.09</td>
                               </tr>

                           </table>
                        </div>
                     </div>
--%>
                    <br>
                    <br>

 
                </div>
                
            </div>
        </div>


</body>
</html>
