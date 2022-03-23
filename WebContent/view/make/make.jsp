<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

h5{ 
    font-family: "kita";
}

ul, li {
	list-style: none;
}

li {
	font-weight: 700;
	color: #777;
}

li:hover {
	font-weight: 700;
	color: #f55555;
}

a:hover {
	color: black;
	text-decoration: none;
}

.aside-content {
	display: block;
	width: 200px;
	/*height와 line-height를 같은 값으로 주면 세로로 중앙 정렬이 된다.*/
	height: 40px;
	line-height: 40px;
	text-align: left;
	padding-left: 10px;
}



.make {
 	font-size: 15px;
 	font-style: italic;
 
}

.make-img {
	float: inherit;	
	top: 10%;
	right: 5%;
	text-align: right;
	width: 600px;
	height: auto;
}

.make2{
	font-size: 15px;
}


</style>
<body>


	<div class="container-fluid famous-saying-box">
		<div class="container p-3">
			<div class="mt-3">
				<h2 style="color: white">반가워요!</h2>
				<p style="color: white">스터디홈즈입니다</p>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="row pt-5">
			<aside class="col-sm-3">
				<div class="col aside">
					<h4>
						<strong>스터디홈즈</strong>
					</h4>
					<div class="aside-content">
						<a href="<%=request.getContextPath()%>/view/make/make.jsp"><li>
							소개
							</li>
						</a> 
						<a href="<%=request.getContextPath()%>/view/make/whoMade.jsp"><li>만든 이
							</li>
						</a>

					</div>
				</div>
			</aside>



			<div class="main col-sm-9">
				<h5>스터디홈즈를 소개합니다</h5>
				<hr align="left" width="250px" style="background-color: #c47100; height:1px;" />
				<div class="main col-sm-9">
					<h6><strong>스터디 홈즈는 이렇게 만들어졌어요</strong></h6>
						<div class = "row">
						<div class = "main col-sm-5">
						<img class ="make-img" src = "<%=request.getContextPath()%>/img/make.jpg" alt ="make" style="width: 600px; height: auto;"/>
						</div>
						
					<div class = "make col-sm-12">	
						 <p>스터디모임에 들어가고 싶은데 정보찾기가 너무 어려워요
						 	<!-- 이모티콘 -->
						<svg id="emoji" weight="30" height="30" viewBox="0 0 72 72"
							xmlns="http://www.w3.org/2000/svg">
  							<g id="line-supplement">
    							<path fill="none" stroke="#000" stroke-linecap="round"
									stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"
									d="m52 52.38c0.8775-1.631 1-5.38 1-7.38 0-4-4-11-4-11" />
    							<path fill="none" stroke="#000" stroke-linecap="round"
									stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"
									d="m44 36s3 6.728 3 10c0 3.065-1 8-1 10" />
    							<path fill="none" stroke="#000" stroke-linecap="round"
									stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"
									d="m20 52.4c-0.8775-1.631-1-5.4-1-7.4 0-4 4-11 4-11" />
    							<path fill="none" stroke="#000" stroke-linecap="round"
									stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"
									d="m28 36s-3 6.728-3 10c0 3.065 1 8 1 10" />
 							</g>
  							<g id="color">
   								<path fill="#FCEA2B"
									d="m36.2 13.32c-12.57 0-22.8 10.23-22.8 22.8 0 12.57 10.23 22.8 22.8 22.8 12.57 0 22.8-10.23 22.8-22.8 0-12.57-10.23-22.8-22.8-22.8z" />
    							<path fill-rule="evenodd" stroke-linecap="round"
									stroke-linejoin="round" stroke-miterlimit="10"
									stroke-width="0.1"
									d="m35.93 51.58c-2.461 0-4.742-2.368-4.742-4.987 0-2.619 2.444-4.66 4.905-4.66s4.701 2.205 4.701 4.823c-1e-6 2.619-2.403 4.823-4.864 4.823z" />
    							<path fill="#fff" stroke-linejoin="round" stroke-width="2"
									d="m31.37 45.29c2.025 1.288 7.318 1.288 9.26 0l-4.63-4.005z" />
    							<path fill="#92d3f5"
									d="m29.7 32.02c-5.762 9.541-3.86 14.27-3.696 23.98 0 1.803-5.146-2.412-6-4-2.17-5.92-0.3989-13.81 2.5-19.18 2.887-1.622 6.992-2.084 7.196-0.8031z" />
    							<path fill="#92d3f5"
									d="m42.3 32.4c5.762 9.541 3.86 14.27 3.696 23.98 0 1.803 5.146-2.412 6-4 2.17-5.92 0.3989-13.81-2.5-19.18-2.887-1.622-6.992-2.084-7.196-0.8031z" />
 							</g>
    							<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="m40.5 32.82c0.4132-0.344 2.246-1.792 4.909-1.636 2.161 0.1259 3.61 1.233 4.091 1.636"/>
    							<path fill="none" stroke="#000" stroke-linecap="round"
									stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"
									d="m22.5 32.82c0.4132-0.344 2.246-1.792 4.909-1.636 2.161 0.1259 3.61 1.233 4.091 1.636" />
    							<circle cx="36" cy="36" r="23" fill="none" stroke="#000"
									stroke-miterlimit="10" stroke-width="2" />
    							<circle cx="36" cy="46.6" r="4.759" fill="none" fill-rule="evenodd"
									stroke="#000" stroke-linecap="round" stroke-linejoin="round"
									stroke-miterlimit="10" stroke-width="2" />
  							</g>
					</svg><!-- 이모티콘 끝 출처:openmoji.org -->				 
					</p>
								
					<p> 다른 스터디모임은 어떻게 진행하는지 궁금해요!</p>
					<p>스터디를 꾸준히 하고 싶어요 
						<!-- 이모티콘 시작 -->
								<svg id="emoji" weight="30" height="30" viewBox="0 0 72 72" version="1.1" xmlns="http://www.w3.org/2000/svg"> 								
    									<path transform="matrix(1.187 0 0 1.188 -8.324 -10.3)" fill="#fcea2b" stroke="#fcea2b" stroke-linecap="round" stroke-width="1.532" d="m33.59 59.58c1.617 1.699 4.094-3.063 4.809-4.103 2.298 1.695 8.481 3.023 7.537-1.592 1.225 0.448 5.037 0.6612 3.849-3.45 3.047 1.486 5.646-0.8396 5.245-3.457 2.698 0.4885 4.347-1.715 3.588-4.344 4.063-5.1 3.828-11.69 3.595-14.66-0.7777-9.896-14.08-6.154-20.2-10.02l-12.99 0.05163c-2.202 3.942-3.569 1.824-7.728 2.337-6.072 0.8894-11.08 16.24-9.519 16.94l7.732 8.23c0.1394 1.526-3.91 4.042-0.3566 5.882 6.126 2.159 10.32 5.064 14.45 8.183z"/>								
  									<g id="line">
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m15.05 43.95s-7.133-5.822-8.537-8.259c-4.392-7.595 0.9489-19.79 10.44-21.82"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m38.71 42.99 12.89 7.021"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m33.87 47.79 13 6.498"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m58.18 45.72-5.1-4.358-8.279-4.335"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m37.49 56.29c8.574 5.466 10.79-0.2955 9.387-1.994 2.734 1.625 6.209-0.517 4.731-4.283 3.844 1.847 7.022-1.034 6.579-4.283 3.326 0.591 5.395-2.142 4.435-5.392 6.721-4.585 5.041-19.03-0.09878-25.36-9.287-1.459-11-2.362-20.98-3.943l-13.53-0.6185c-2.005-0.529-4.081 0.5703-4.779 2.533-0.7519 2.816-1.677 4.971-3.599 8.378-0.7286 1.786 0.1048 3.829 1.872 4.588 1.908 0.4767 2.78-0.386 4.46-1.686 2.195-2.102 2.628-2.996 3.805-4.575l13.64 6.204 12.72 7.164c2.514 1.698 5.012 5.844 6.51 7.321"/>
   	 									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m31.51 54.15c1.109-1.477 2.666-1.713 4.144-0.9003 1.405 0.8125 2.439 2.362 1.478 4.063l-1.774 3.101c-1.109 1.477-3.178 1.698-4.582 0.6647-1.234-0.9245-1.592-2.518-1.076-3.836 1.81-3.094 0 0 1.81-3.094z"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m25.84 50.98c1.109-1.477 2.666-1.713 4.144-0.9003 1.405 0.8125 2.439 2.362 1.478 4.063l-1.774 3.101c-1.109 1.477-3.178 1.698-4.582 0.6647-1.234-0.9245-1.592-2.518-1.076-3.836 1.81-3.094 0 0 1.81-3.094z"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m20.18 47.82c1.109-1.477 2.666-1.713 4.144-0.9003 1.405 0.8125 2.439 2.362 1.478 4.063l-1.774 3.101c-1.109 1.477-3.178 1.698-4.582 0.6647-1.234-0.9245-1.592-2.518-1.076-3.836 1.81-3.094 0 0 1.81-3.094z"/>
    									<path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m14.53 44.65c1.109-1.477 2.666-1.713 4.144-0.9003 1.405 0.8125 2.439 2.362 1.478 4.063l-1.774 3.101c-1.109 1.477-3.178 1.698-4.582 0.6647-1.234-0.9245-1.592-2.518-1.076-3.836 1.81-3.094 0 0 1.81-3.094z"/>
  										</g>
								</svg>
						<!-- 이모티콘 끝 출처:openmoji.org-->					
						
					</p> 
						</div>
					</div>
					
					<br><br><br><br>
					<div class = make2 col-sm-9>
					<h5><strong>스터디 홈즈로 모임을 시작해보세요!</strong></h5>
						<div class = "row">
							<div class = "main col-sm-5">
								<img class = "make-img" src = "<%=request.getContextPath()%>/img/make2.jpg" alt ="make2"/>
								<br><br>
							</div>
					

							<div class = "main col-sm-12">
								<p> <span style="font-style: italic; font-weight: bold; color: #f55555;">분야별로</span> 모임을 찾고, </p>
								<p style="text-align: center;">스터디 모임에 대한 <span style="font-style: italic; font-weight: bold; color: #f55555;">사전정보</span>를 얻어 </p>
								<p style="text-align: right;"><span style ="font-style: italic; font-weight: bold; color: #f55555;">쉽고 간편하게   </span> 모임에 가입해보세요</p>
								<br><br><br>
								<p>모임이 끝나면 매너평가로 스터디 구성원들에게 격려와 응원을 보내주세요</p>
								<p>자신의 매너페이스를 유지하도록 노력하면 좋은 스터디 모임이 만들어질거에요</p>
								<p>그럼 열심히 공부하는 일만 남았네요!</p>
					
								<br><br><br><br>
							</div>
						</div>					
					</div>
					
					
				</div>		
			</div>
		</div>
	</div>
</body>
</html>