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

/*댓글 작성자 날짜*/
#replyInfo { 
	font-size: 15px;
	font-weight: 600;
	color : gray;

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

                      <c:if test="${s.menuid == 2 }">
                          <img src="<%=request.getContextPath()%>/img/studymenu/programming.jpg" alt="" width=260>
                      </c:if>
                      <c:if test="${s.menuid == 3 }">
                         <img src="<%=request.getContextPath()%>/img/studymenu/security.jpg" alt="" width=260>
                     </c:if>
                      <c:if test="${s.menuid == 4 }">
                         <img src="<%=request.getContextPath()%>/img/studymenu/creative.jpg" alt="" width=260>
                      </c:if>
                      <c:if test="${s.menuid == 5 }">
                        <img src="<%=request.getContextPath()%>/img/studymenu/marketing.jpg" alt=""width=260>
                     </c:if>
                     <c:if test="${s.menuid == 6 }">
                        <img src="<%=request.getContextPath()%>/img/studymenu/language.jpg" alt="" width=260>
                    </c:if>
                    <c:if test="${s.menuid == 7 }">
                       <img src="<%=request.getContextPath()%>/img/studymenu/etc.jpg" alt="" width=260>
                    </c:if>

			</div>

			<div>
				<br>
				<h6>
					<small><span class="best">BEST</span> <c:if
							test="${s.menuid =='1'}"> 전체스터디</c:if> <c:if
							test="${s.menuid =='2'}"> 개발/프로그래밍</c:if> <c:if
							test="${s.menuid =='3'}"> 보안/네트워크</c:if> <c:if
							test="${s.menuid =='4'}"> 크리에이티브</c:if> <c:if
							test="${s.menuid =='5'}"> 직무/마케팅</c:if> <c:if
							test="${s.menuid =='6'}"> 학문/외국어</c:if> <c:if
							test="${s.menuid =='7'}"> 교양</c:if> </small>
				</h6>
				<br>
				<h3>${s.title}</h3>
				<h6>
					<small> &#11088;&#11088;&#11088;&#11088;&#11088; 85점 11명의
						평가 · 20번의 스터디 경험 </small>
				</h6>
				<br>
				<h6>
					<small>&nbsp; 작성자: <span>${s.nickname}</span>
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
			<%@include file="/common/offstudy_menu.jsp"%>
<!-- --------------------------------------------------------------게시글------------------------------------------------------------ -->

			<div class="col-sm-9">
				<h1>상세보기</h1>
				<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
				<br>
                
				<h2>${s.title}</h2> 
				<div class="container p-0 my-2 bg-white text-white">
                    <hr>
				</div>
                   <h5>상세내용</h5>
				<br> ${s.content } <br> <br> <i class="fa-solid fa-user-group"></i>인원: ${s.pernum} <br>

				<br>


<!-- --------------------------------------------------------------지도------------------------------------------------------------ -->

                <h3>스터디 장소</h3>
                주소: ${s.region}
                <br>
				<div class="container ">
					<div class="c-border" id="map" style="width: 70%; height: 300px;"></div>	 
				</div>


				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  			    mapOption = { 
	        		center: new kakao.maps.LatLng(${s.latitude}, ${s.longitude}), // 지도의 중심좌표
	        		level: 5 // 지도의 확대 레벨
	   			    };
	
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					// 지도를 클릭한 위치에 표출할 마커입니다
					var marker = new kakao.maps.Marker({ 
					    // 지도 중심좌표에 마커를 생성합니다 
					    position: map.getCenter() 
					}); 
					// 지도에 마커를 표시합니다
					marker.setMap(map);
					</script>


                <br>
                <br> 전체 스터디 인원: ${s.pernum} 명 <br>
                <form action="<%=request.getContextPath()%>/studymenu/studyIn" method="post">
                    <input type="hidden" name="board_name" value="offStudyMenuList">
	                <input type="hidden" name="board_num" value="${s.board_num}">
	                <input type="hidden" name="t_nickname" value="${s.nickname}">
	                <input type="hidden" name="f_nickname" value="${loginNick}">
					<input type="submit" class=" btn fadeIn fourth my-1" value="참가신청"
					style="background-color: #c47100; color: white; border-color: white;">
                </form>

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


					<button type="button" class="btn btn-dark mt-3"
						onclick="location.href ='comBoardList'">목록으로</button>
					<button type="button" class="btn btn-dark mt-3">신고</button>

					<c:if test="${loginNick eq com.nickname}">
						<button type="button" data-toggle="modal"
							data-target="#deleteModal" class="btn btn-danger mt-3">삭제</button>
					</c:if>

				</div>
<!-- --------------------------------- 댓글 끝-------------------------------------------------------------------- -->



			</div>

		</div>
	</div>
	<br>
	
	
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