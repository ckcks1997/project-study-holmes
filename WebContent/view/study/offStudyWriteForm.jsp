<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<%--지도 api --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5372162b2eb56a4c9831bbd9732f6a3"></script>

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

.color-white {
	color: white;
}

.footer-content {
	padding-top: 50px;
}
 .c-border{
    border: 2px solid #f55555;
    border-radius: 10px;
 }
 
  .btn-cancel{
    background-color:#777;
    border:1px solid #777;
    color:white;
 }
 
  .btn-cancel:hover{
    color:white;
 }
 
   .btn-cancel > a:hover{
    color:white;
 }
 
 .btn-save{
    background-color:#f55555;
    border:1px solid #f55555;
    color:white;
 }
 
  .btn-save:hover{
    color:white;
 }
</style>
<body>
<!-- --------------------------------------------------------------명언------------------------------------------------------------ -->	
	<div class="container-fluid famous-saying-box">
		<div class="container p-3 ">
			<div class=" mt-3">
				<h3 class="color-white ">오늘의 명언</h3>
				<div class="color-white">생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지
					않으면 오류나 독단에 빠질 위험이 있다. -공자</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="row pt-5">
<!-- --------------------------------------------------------------사이드------------------------------------------------------------ -->	

			<%--aside부분 --%>
                <%@include file="/common/offstudy_menu.jsp" %>

<!-- --------------------------------------------------------------게시글------------------------------------------------------------ -->				
			<div class="main col-sm-9">
				<h2><strong>스터디 모집</strong></h2>
		
				<hr align="left" width="200px" style="background-color: #c47100; height:1px;" />


				<form name="mf"
					action="<%=request.getContextPath()%>/studymenu/offWritePro"
					  method="post" onsubmit="return inputChk(this)">
					<br /> <br />
				
																						
					<div class="form-group">
						<label>제목</label>
						 <input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" />
					</div>	
					
					 <div class="row">
    			<div class="col-xs-12 col-sm-3 col-md-3">
					<div class="form-group">
                       <label>과목</label>
                        <input type="text" name="subject" class="form-control" placeholder="ex) 영어,과학,수학.....">
                       </div>
                    </div>	 			 
    			<div class="col-xs-12 col-sm-3 col-md-3">
					<div class="form-group">
                       <label>지역</label>
                       <input type="text" name="region" class="form-control" placeholder="ex) 경기 수원">                      
					</div>
				</div>
				<div class="col-xs-12 col-sm-3 col-md-3">
					<div class="form-group">
                       <label>가격</label>
                       <input type="number" name="price" class="form-control" placeholder="무료일 경우 0을 입력하세요">                      
					</div>
				</div>
                <div class="col-xs-12 col-sm-3 col-md-3">
    				<div class="form-group">
    				<label>인원수</label>
                        <input type="number" name="pernum" class="form-control" placeholder="예상인원수">
					</div>
				</div>
				
			</div>
					

					<div class="form-group">
						<label>내용 :</label>
						<textarea class="summernote" name="content"
							placeholder="Leave a comment here" id="content"></textarea>

					</div>
                    <br>
                    <%--지도 api --%>
                    <div>
	                    <p>모임할 장소를 지도에<em> 클릭</em> 해주세요</p> 
	                    <div class="c-border" id="map" style="width:100%;height:350px;"></div>
                        <div id="clickLatlng"></div>
	                    <input type="hidden" id="latitude" name="latitude">
                        <input type="hidden" id="longitude" name="longitude">
                        
                    </div>
                        <br>
					<div class="container text-center"  >
						<button class="btn btn-cancel">
						<a href="<%=request.getContextPath()%>/studymenu/offStudyMenuList">취소 </a>
						</button>
						<button class="btn btn-save" type="submit">저장</button>
					</div>
					<br>
				</form>
			</div>
		</div>
	</div>


	<script>
		$('.summernote').summernote({
			height : 150,
			lang : "ko-KR"
		});
		
		function inputChk(f) {

			let result = document.querySelector("#result")
			
			if (f.title.value=='') {
				alert("제목을 입력하세요")
				f.title.focus()
				return false;
			}
			if (f.subject.value=='') {
				alert("과목을 입력하세요")
				f.subject.focus()
				return false;
			}
			if (f.price.value=='') {
				alert("가격을 입력하세요")
				f.price.focus()
				return false;
			}
			if (f.pernum.value=='') {
				alert("인원수를 입력하세요")
				f.pernum.focus()
				return false;
			}
			if (f.content.value=='') {
				alert("내용을 입력하세요")
				f.content.focus()
				return false;
			}	
			if (f.latitude.value=='') {
				alert("지도를 클릭해주세요")
				f.latitude.focus()
				return false;
			}			
			return true;
		}
	</script>
	
	<%--지도 관련 스크립트 --%>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.553244943104694, 126.97265812139825), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	marker.setPosition(latlng);
	    
	var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다'; 
	   // 제거시 데이터 안들어감
	    
	var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
	    
 	var latitude = document.getElementById('latitude'); 
	var longitude = document.getElementById('longitude'); 
	    latitude.value = latlng.getLat();
	    longitude.value =  latlng.getLng();
	    
	});
</script>

</body>
</html>