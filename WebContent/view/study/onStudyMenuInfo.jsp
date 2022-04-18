<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%--지도 api --%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5372162b2eb56a4c9831bbd9732f6a3"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.s-round {
	display: inline-block;
	border-radius: 20px;
	background-color: #F55555;
}

.best {
	padding: 5px;
	margin: 2px;
	background-color: #F55555;
	border-radius: 10px;
	font-weight: bold;
	font-size: 0.5rem;
}

.c-border{
    border:2px solid #F55555;
    border-radius: 10px;
}

/* 게시글 , 댓글 작성자 날짜*/
.postInfo, #replyInfo { 
	font-size: 15px;
	font-weight: 600;
	color : gray;

}


/*댓글 textarea 출력시 css*/
.replyTxt {
	 word-wrap : break-word; /*영역 넘어가면 줄바꿈하기*/
	 word-break: break-word; /* 영문의 경우 단어단위로 줄바꿈하기 */
	
}




a{
    color:black;
}
a:hover{
    color:black;
}
.white, .white:hover{
    color:white;
}

</style>
</head>
<body>
	<div class="container-fluid p-0 my-0 bg-dark text-white">
		<div class="container">
			<input type="hidden" id="board_num" name="board_num"
				value="${s.board_num}">

<!-- --------------------------------------------------------------정보배너------------------------------------------------------------ -->
			<div style="float: left; margin: 20px">
                      <c:if test="${s.menuid == 9 }">
                          <img src="<%=request.getContextPath()%>/img/studymenu/programming.jpg" alt="" width=260>
                      </c:if>
                      <c:if test="${s.menuid == 10 }">
                         <img src="<%=request.getContextPath()%>/img/studymenu/security.jpg" alt="" width=260>
                     </c:if>
                      <c:if test="${s.menuid == 11 }">
                         <img src="<%=request.getContextPath()%>/img/studymenu/creative.jpg" alt="" width=260>
                      </c:if>
                      <c:if test="${s.menuid == 12 }">
                        <img src="<%=request.getContextPath()%>/img/studymenu/marketing.jpg" alt=""width=260>
                     </c:if>
                     <c:if test="${s.menuid == 13 }">
                        <img src="<%=request.getContextPath()%>/img/studymenu/language.jpg" alt="" width=260>
                    </c:if>
                    <c:if test="${s.menuid == 14 }">
                       <img src="<%=request.getContextPath()%>/img/studymenu/etc.jpg" alt="" width=260>
                    </c:if>
			</div>

			<div>
				<br>
				<h6>
					<small><span class="best">BEST</span> <c:if
							test="${s.menuid =='8'}"> 전체스터디</c:if> <c:if
							test="${s.menuid =='9'}"> 개발/프로그래밍</c:if> <c:if
							test="${s.menuid =='10'}"> 보안/네트워크</c:if> <c:if
							test="${s.menuid =='11'}"> 크리에이티브</c:if> <c:if
							test="${s.menuid =='12'}"> 직무/마케팅</c:if> <c:if
							test="${s.menuid =='13'}"> 학문/외국어</c:if> <c:if
							test="${s.menuid =='14'}"> 교양</c:if> </small>
				</h6>
				<br>
				<h3>${s.title}</h3>
				<h6>
                     <c:choose>
                    <c:when test="${repVal.point > 50  }">
                        <small> &#11088;&#11088;&#11088;&#11088;&#11088;   ${repVal.point}점 </small>
                     </c:when>
                     <c:when test="${repVal.point > 40  }">
                        <small> &#11088;&#11088;&#11088;&#11088;  ${repVal.point}점  </small>
                     </c:when>
                     <c:when test="${repVal.point > 30  }">
                        <small> &#11088;&#11088;&#11088;  ${repVal.point}점  </small>
                     </c:when>
                     <c:when test="${repVal.point > 20  }">
                        <small> &#11088;&#11088;  ${repVal.point}점  </small>
                     </c:when>
                     <c:when test="${repVal.point > 10  }">
                        <small> &#11088; ${repVal.point}점  </small>
                     </c:when>
                      <c:otherwise>
                      점수가 없습니다.
                     </c:otherwise>
                </c:choose>
				</h6>
				<br>
				<h6>

					<small>&nbsp; 작성자: <a class="white" href="<%=request.getContextPath()%>/studymember/userinfo?usernick=${s.nickname}"><span>${s.nickname}</span></a> 

					</small>
				</h6>
				<br>
			</div>
		</div>
	</div>

	<br>


	<div class="container">
		<div class="row pt-5">
<!-- --------------------------------------------------------------사이드------------------------------------------------------------ -->
			<%--aside부분 --%>
			<%@include file="/common/onstudy_menu.jsp"%>
<!-- --------------------------------------------------------------게시글------------------------------------------------------------ -->

			<div class="col-sm-9">
				<h2 style = "font-weight: bold;">상세보기</h2>
				<hr align="left" width="150px" style="background-color: #c47100; height:1px;" />
				
				<br>

				<h4>${s.title}</h4>
				<div class="container p-0 my-2 bg-white text-white">
                    <hr>
				</div>
				<div class="postInfo">
					<p>
						<a href="<%=request.getContextPath()%>/studymember/userinfo?usernick=${s.nickname}">${s.nickname}</a> · ${s.regdate}


						<c:if test="${loginNick eq s.nickname}">
							<span class="txt_bar">|</span>
							<a
								href="<%=request.getContextPath()%>/studymenu/onStudyUpdateForm?board_num=${s.board_num}"
							style = "color: gray">수정</a>
						</c:if>
					</p>
				</div>

				<br> ${s.content } <br> 

				<br>
                <br>
                <br> 전체 스터디 인원: ${s.pernum} 명 <br>
                <c:if test="${loginNick != null && loginNick ne s.nickname}">
                <form action="<%=request.getContextPath()%>/studymenu/studyIn" method="post">
                    <input type="hidden" name="board_name" value="onStudyMenuList">
	                <input type="hidden" name="board_num" value="${s.board_num}">
	                <input type="hidden" name="t_nickname" value="${s.nickname}">
	                <input type="hidden" name="f_nickname" value="${loginNick}">
					<input type="submit" class=" btn fadeIn fourth my-1" value="참가신청"
					style="background-color: #c47100; color: white; border-color: white;">
                </form>
                </c:if>

				<br> <br>

<!-- --------------------------------------------------------------댓글------------------------------------------------------------ -->
				<div class = "col-md-10">
					<h5 style="font-weight: bold">댓글 ${reply_count}</h5>
					<hr align="left" style="background-color: #c47100; height:0.7px;" />
					<div id="replyList">
						<c:forEach var="reply" items="${reply_list}">						
								<div class = "reply"  id="r${reply.reply_num}">
									<div class="row">
										<div class="col-md-10" id = "replyInfo">
											<input type="hidden" id="reply_num" name="reply_num"
												value="${reply.reply_num}">
											<p>${reply.nickname} · ${reply.regdate2}</p>
										</div>

										<c:if test="${loginNick eq reply.nickname}">
											<div class="col-md-2">
												<input type="button" class="btn btn-light"
													onclick="deleteReply('${reply.reply_num}')" value="삭제" />
											</div>
										</c:if>
										
									</div>
									<div class = "col-md-12 replyTxt">
									<p>${reply.content}</p>
									</div>
									<hr align="left" style="background-color: 333b3d; height:0.7px;" />

								</div>
							
						</c:forEach>

					</div>
					
					
					
					<!-- 로그인이 되어있으면 댓글 이용 가능 -->
					<c:if test ="${sessionScope.memberNickname != null}">	
									
					<div class="row">
						<div class="col-md-10">
							<input type="hidden" id="board_num" name="board_num"
								value="${s.board_num}"> <input type="hidden"
								name="reply_nickname" id="reply_nickname"
								value="${sessionScope.memberNickname}">

							<textarea class = "col-md-12" rows="5" cols="80" name="reply_content"
								placeholder="댓글을 달아주세요" id="reply_content"></textarea>
						</div>
						<div class="col-md-2">
							<input type="button" id="writeReply" class="btn btn-danger"
								value="등록" />
						</div>
					</div>

					</c:if>
					
					
					<!-- 로그인이 안되어있으면 댓글 이용불가 -->
					<c:if test = "${sessionScope.memberNickname == null}">
						<div class = "row">
							<div class = "col-md-10">
								<p style ="font-weight: bold;">로그인 후 댓글 이용이 가능합니다</p>
							</div>
						</div>
					</c:if>



					<button type="button" class="btn btn-dark mt-3"
						onclick="location.href ='onStudyMenuList'">목록으로</button>
					<button type="button" class="btn btn-dark mt-3">신고</button>

					<c:if test="${loginNick eq s.nickname}">
						<button type="button" data-toggle="modal"
							data-target="#deleteModal" class="btn btn-danger mt-3">삭제</button>
					</c:if>

				</div>
<!-- --------------------------------- 댓글 끝-------------------------------------------------------------------- -->
			</div>

		</div>
	</div>
	<br>
	
	
	<div class="modal fade" id="deleteModal" aria-hidden="true"
		tabindex="-1" aria-labelledby="deleteBoardLabel">
		<div class="modal-dialog">
			<div class="modal-content">

				<form
					action="<%=request.getContextPath()%>/studymenu/onStudyDelete"
					method="post">
					<div class="form-group">
						<input type="hidden" id="board_num" name="board_num"
							value="${s.board_num}">
						<div class="modal-header">
							<h5 class="modal-title" id="deleteBoardLabel">게시글 삭제</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">이 글을 삭제합니다. 계속하시겠습니까?</div>


						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="확인">
							<button class="btn btn-outline-primary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	
	
<!-- -------------------------------댓글 자바스크립트----------------------------------------------------------------------------- -->
	
	<script>
//댓글입력
$("#writeReply").on("click", function(){
	var reply_content = document.querySelector("#reply_content")
	
  //alert(reply_content.value)
	var reply = {
			"board_num" : "${s.board_num}",
			"reply_content" : reply_content.value			
	}



	$.ajax({ 
		type: "post",
		url: "<%=request.getContextPath()%>/reply/writeReply",
		data: reply,
		dataType: 'text',
		success : function(result){
			result = result.trim()
			result.replace(" ","")
			
			//alert("["+result+"]");
			//alert(result);
		
			var newReply = document.querySelector('#replyList')
			var reply_num = result
			var nickname = document.querySelector('#reply_nickname').value
			var content = document.querySelector('#reply_content').value
			var today = new Date();
			var year =today.getFullYear();
			var month = today.getMonth()+1; 
			var date = today.getDate();
			var regdate = year + '-' + month + '-' + date;
			
			let temp = 'id="r'+reply_num+'"'
			
			
			let line =  '<div class = "reply"       '+temp+' >'
						+ '<div class = "row">'
						+ '<div class = "col-md-10" id = "replyInfo">'
						+ '<input type = "hidden" id = "reply_num" name = "reply_num" value= '+reply_num+'>'
						+ '<p>'+nickname+' · '+ regdate +'</p>'
			          	+ '</div>'
			          	+ '<div class = "col-md-2">'
			          	+ '<input type = "button" class = "btn btn-light"       onclick="deleteReply(\''+reply_num +'\')" value = "삭제"/>'
			          	+ '</div>'
			      		+ '</div>'
			      		+ '<div class = "col-md-12 replyTxt">'
						+ '<p>'+content+'</p>'
						+ '</div>' 
			            +  '<hr align="left" style="background-color: 333b3d; height:0.7px;" />'
			        	+ '</div>' ;
			
			
			            
			 newReply.innerHTML +=line
							
				
			
			
			

		},
		error: function (result){
			console.log(result);
			alert("error");
		}	
	}); //end ajax

	
})





//댓글삭제
function deleteReply(num){

	//alert(num)
	var deleteReply = {
					"reply_num" :num
	}

	
	$.ajax({
		type: 'post',
		url : "<%=request.getContextPath()%>/reply/deleteReply",
				data : deleteReply,
				dataType : 'text',
				success : function(result) {
					alert("댓글이 삭제됩니다");
					//alert(result)
					var deleteReply = document.querySelector('#r' + num)
					//alert(deleteReply.innerHTML) //삭제할 내용 확인
					deleteReply.innerHTML = ""

				},
				error : function(result) {
					console.log(result);
					alert("error");
				}

			})

		}
		$('#deleteReply').on("click", function() {
			var reply_num = document.querySelector("#reply_num")

		})
	</script>


</body>
</html>