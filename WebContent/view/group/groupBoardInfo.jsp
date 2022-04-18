<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
body {
	height: 100vh;
}

/* 명언 */
.famous-saying-box {
	height: 150px;
	background-color: #333b3d;
}

.txt_bar {
	margin: 0 9px 0 5px;
	color: gray;
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

 a {
 color:gray;
 }
 
 a:hover {
 color: black;
 }
 
 


</style>
<body>


	<div class="container-fluid famous-saying-box">
		<div class="container p-3">
			<div class="mt-3">
				<h2 style="color: white">이야기를 나눠요</h2>
				<p style="color: white">어려운 내용은 함께 토론해봐요</p>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row pt-5">
			<!----------------왼쪽 사이드 메뉴 ------------------------------------------------------------------------>
			<%--aside부분 --%>
			 <%@include file="/common/groupboard_menu.jsp" %>


			<!---------------------    메인      ------------------------------------------------------------------ -->
			<div class="main col-lg-9">

				<h2 style="font-weight: bold">
					<c:if test="${groupBoard.boardid =='1'}"> 질문 & 답변</c:if>
					<c:if test="${groupBoard.boardid =='2'}"> 자유</c:if>
				</h2>
				
				<hr align="left" width="150px" style="background-color: #c47100; height:1px;" />
				<input type="hidden" id="board_num" name="board_num"
					value="${groupBoard.board_num}"> <input type="hidden"
					name="nickname" value='${groupBoard.nickname}'>
				<div class="row">
					<div class="col-sm-10">
						<div class="title">
							<c:if test="${groupBoard.boardid =='1'}">
								<h5 style="font-weight: bold">Q: ${groupBoard.title}</h5>
							</c:if>
							<c:if test="${groupBoard.boardid != '1'}">
								<h5 style="font-weight: bold">${groupBoard.title}</h5>
							</c:if>
						</div>
						<div class="postInfo">
						
							<p>
								${groupBoard.nickname} · ${groupBoard.regdate}


								<c:if test="${memberNickname eq groupBoard.nickname}">
									<span class="txt_bar">|</span>
									<a
										href="<%=request.getContextPath()%>/group/groupBoardUpdateForm?board_num=${groupBoard.board_num}">수정</a>
								</c:if>
							</p>
						</div>

					</div>


					<div class="col-sm-2">

						<div class="readcnt">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="16"
									height="16" fill="currentColor" class="bi bi-eye"
									viewBox="0 0 16 16">
  													<path
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
  													<path
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
													</svg>
							</span>${groupBoard.readcnt}</div>
						<div class="comment">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="16"
									height="16" fill="currentColor" class="bi bi-chat-square-text"
									viewBox="0 0 16 16">
  													<path
										d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
													<path
										d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
													</svg>
							</span>${reply_count }
						</div>



					</div>
				</div>



				<br />
				<div class = "col-md-10">
				<p>${groupBoard.content}</p>
				</div>
				<br /> <br /> <br />


			<!-- ------------------댓글 ------------------------------------------------------------------------ -->
				<div class = "col-md-10">
					<h5 style="font-weight: bold">댓글 ${reply_count}</h5>
					<hr align="left" style="background-color: #c47100; height:0.7px;" />
					<div id="replyList">
						<c:forEach var="reply" items="${reply_list}">						
								<div class = "reply"  id="r${reply.reply_num}">
									
									<div class="row">
										<div class="col-md-10"  id = "replyInfo">
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
								value="${groupBoard.board_num}"> <input type="hidden"
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
						onclick="location.href ='groupBoardList'">목록으로</button>
					<button type="button" class="btn btn-dark mt-3"data-toggle="modal"
							data-target="#reportModal" class="btn btn-danger mt-3" >신고</button>

					<c:if test="${loginNick eq groupBoard.nickname}">
						<button type="button" data-toggle="modal"
							data-target="#deleteModal" class="btn btn-danger mt-3">삭제</button>
					</c:if>

				</div>
			</div>
		</div>
	</div>

	<br>
	<br>

	<!-------------- 게시글 삭제 모달창 --------------------------------------------------------------------------------------------------------------------------------->

	<div class="modal fade" id="deleteModal" aria-hidden="true"
		tabindex="-1" aria-labelledby="deleteBoardLabel">
		<div class="modal-dialog">
			<div class="modal-content">

				<form
					action="<%=request.getContextPath()%>/community/comBoardDelete"
					method="post">
					<div class="form-group">
						<input type="hidden" id="board_num" name="board_num"
							value="${groupBoard.board_num}">
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


<!-- --------------------신고 모달창------------------------------------------------------------------------------------- -->


<div class="modal" id = "reportModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">신고사유를 선택해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
 
        
        	 <div class="form-check">
  				<input class="form-check-input" type="radio" name="reportReason" id="reportReason1" value="1" checked>
 				 <label class="form-check-label" for="reportReason1">
   				 영리목적/스팸홍보성
 				 </label>
			</div>
			<div class="form-check">
			 	<input class="form-check-input" type="radio" name="reportReason" id="reportReason2" value="2">
  				<label class="form-check-label" for="reportReason2">
    			음란성/선정성
  				</label>
			</div>
        	<div class="form-check">
  				<input class="form-check-input" type="radio" name="reportReason" id="reportReason3" value="3">
  				<label class="form-check-label" for="reportReason3">
    			욕설/비방/혐오/인신공격
  				</label>
			</div>
			<div class="form-check">
  				<input class="form-check-input" type="radio" name="reportReason" id="reportReason4" value="4">
  				<label class="form-check-label" for="reportReason4">
    			개인정보 노출
  				</label>
			</div>
			<div class="form-check">
  				<input class="form-check-input" type="radio" name="reportReason" id="reportReason5" value="5">
  				<label class="form-check-label" for="reportReason5">
    			도배성(같은 내용의 반복 게시)
  				</label>
			</div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" id = "sendReport" class="btn btn-primary" data-dismiss="modal">신고하기</button>
       <!-- <button type="submit" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#confirmReport">신고하기</button> -->
      </div>
    </div>
  </div>
</div>

<!-- -------------------------------신고확인 모달창------------------------------------------ -->

<div class="modal fade" id = "confirmReport" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<p>신고되었습니다</p>
 		<p>신고된 게시물은 누적신고수에 따라 게시글이 삭제됩니다.</p>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>









<!-- -----------------------------댓글 자바스크립트-------------------------------------------- -->
	<script>
//댓글입력
$("#writeReply").on("click", function(){
	var reply_content = document.querySelector("#reply_content")
	
  //alert(reply_content.value)
	var reply = {
			"board_num" : "${groupBoard.board_num}",
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
						+  '<p>'+content+'</p>'
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





//댓글삭제---------------------------------------------------------------------------------------------
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
		
		
//신고 전달 --------------------------------------------------------------------------
//자바스크립트 질문 ㅠㅠ 
function reasonOption(){
			let reasonOption = document.getElementByName("reportReason");
			for (var i = 0; i < reasonOption.length; i++) {
				if(reasonOption[i].checked)
					return reasonOption[i].value;
			}
		}
//----------------------------------------------
$("#sendReport").on("click",function(){
	let report_reason = $('input[name=reportReason]:checked').val();
	
	
	let report = {
			"report_reason": report_reason,
			"board_num": "${groupBoard.board_num}"
	}
	
	$.ajax({
		type: "post",
		url: "<%=request.getContextPath()%>/report/sendReport",
		data: report,
		dataType: 'text',
		success : function(result) {
			alert("신고되었습니다");
		//	alert(report_reason); option값 잘 들어오는지 확인
		},
		error : function(result) {
			console.log(result);
			alert("error");
		}
	})
})
	</script>


	<br>
	<br>

 

 

 



</body>

</html>