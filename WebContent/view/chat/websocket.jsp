<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
h2, h3, h5 {
    font-weight: bold;
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

td, th {
	padding: 10px;
}

#messageWindow {
	width: 500px;
	height: 600px;
	overflow: auto;
	background-color: #fdfdff;
	border: solid 1px #eee;
	border-radius: 10px;
}

#you {
	display: inline-block;
	position: relative;
	background: #eef;
	border-radius: 5px;
	padding: 3px;
}

#me {
	display: inline-block;
	position: relative;
	background: #efdfdf;
	border-radius: 5px;
	padding: 3px;
}

#you:after {
	border-top: 10px solid  #eef;
	border-left: 10px solid transparent;
	border-right: 0px solid transparent;
	border-bottom: 0px solid transparent;
	content: "";
	position: absolute;
	top: 5px;
	left: -10px;
}

#me:after {
	border-top: 10px solid white;
	border-left: 0px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 0px solid transparent;
	content: "";
	position: absolute;
	top: 5px;
	right: -10px;
}

.right {
	text-align: right;
	margin: 10px;
}

.left {
	text-align: left;
	margin: 10px;
}

#upload {
	position: relative;
	width: 100%;
	height: 200px; 
}

.updrop {
	color: #555;
	font-weight: 700;
	text-align: center;
	padding: 50px 0;
	border-radius: 10px;
	border: 2px dashed #c9c9c9;
}

.updrop.light {
	background: #ffff45;
	border: 2px dashed #ed2e2e;
}

.upstat {
	margin-top: 10px;
	background: #f5f5f5;
}
.btn-submit{
max-width:100px;
}


</style>

<title>Insert title here</title>
</head>

 

<body>
        <div class="container-fluid famous-saying-box">
            <div class="container p-3">
                <div class="mt-3">
                    <h3 class="color-white">오늘의 명언</h3>
                    <div class="color-white">
                        생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지 않으면 오류나 독단에 빠질
                        위험이 있다. -공자
                    </div>
                </div>
            </div>
        </div>

    <div class="container">
    <br>
    <div class="col-6 mx-auto">
        <h2>채팅방</h2>
        <hr align="left" width="130px" style="background-color: #c47100; height:1px;" />
 
    </div>
    
    <div class="  d-flex justify-content-center align-items-center">
	<table >
		<tr>
			<th><p>그룹 채팅방</p></th>
					
		</tr>
		<tr>
			
			<td>
			<div id="messageWindow">
				<c:forEach var="webchat" items="${li}">
				    <c:if test="${webchat.memberNickname.equals(memberNickname) }">
					    <c:if test='${webchat.file.equals("-") }'>
						    <div class="right">
						        <div id="me">나:${webchat.message}</div>
						    </div>
					    </c:if>
					    <c:if test='${webchat.message.equals("-") }'>
                            <div class="right">
                                <div id="me"><img src="<%=request.getContextPath()%>/upload/${webchat.file}" width='200px' > </div>
                            </div>
                        </c:if>
				    </c:if>
				    
				<c:if test="${!webchat.memberNickname.equals(memberNickname) }">
                    <c:if test='${webchat.file.equals("-") }'>
                        <div class="left">
                            <div id="you">${webchat.memberNickname}:${webchat.message}</div>
                        </div>
                    </c:if>
                     <c:if test='${webchat.message.equals("-") }'>
                         <div class="left">
                            <div id="you"><img src="<%=request.getContextPath()%>/upload/${webchat.file}" width='200px' > </div>
                         </div>
                     </c:if>
                    
                    </c:if>
				</c:forEach>
			
			
			</div>
				  <br> 
				  <div class="row text-center">
	       			  <input class="col form-control" id="inputMessage" type="text" /> 
    				  <input class="col btn btn-secondary btn-submit" type="button" value="전송" onClick="sendText()" />
				  </div>
				<div id="upload" class=" my-3">
					<div class="updrop">파일을 드래그해서 올리세요</div>
					<div class="upstat"></div>
				</div>
			</td>

		</tr>

	</table>
	</div>
	</div>
	<script>

const msgarea = document.getElementById("messageWindow");
const inputMessage = document.getElementById("inputMessage");

const webSocket = new WebSocket('ws://localhost:8080<%=request.getContextPath()%>/groupchat');




webSocket.onopen = function(event) { //창 들어갈때
    onOpen(event);
}
webSocket.onerror = function(event) {
    onError(event);
}
webSocket.onmessage = function(event) {
	onMessage(event);
}

function onOpen(event){
	msgarea.innerHTML += new Date() + "연결 성공";
	webSocket.send('${boardnum}:${memberNickname}:입장했습니다:-')
}

function onError(event) {

}

function onMessage(event) {
	
	let line = event.data
	let json = JSON.parse(line)
	
	console.log("event.data: "+event.data)
	console.log("vile: "+json.file)
	if(json.file != "-"){
		 
		msgarea.innerHTML +="<div class='left'><div id='you'>" 
			+"<img src='<%=request.getContextPath()%>/upload/"+ json.file +"'width='200px' />"
				+" </div></div>"
	}
	else{  
	    msgarea.innerHTML += "<div class='left'><div id='you'>"+json.memberNickname+':' + json.message+" </div></div>"	 ;
	}
	msgarea.scrollTop=msgarea.scrollHeight;
}

function sendText(){
	if(inputMessage.value!=''){
		msgarea.innerHTML += "<div class='right'><div id='me'>"+ inputMessage.value+" </div></div>" ;
		
		webSocket.send('${boardnum}:${memberNickname}:' + inputMessage.value+":-");
		msgarea.scrollTop=msgarea.scrollHeight;
		inputMessage.value="";
	}
}

function init(){
	
	let hzone = document.querySelector(".updrop");
	let hstat = document.querySelector(".upstat");
    
	hzone.ondragenter = (e) => {
		e.preventDefault();
		e.stopPropagation(); //상위객체로 이벤트전달 방지
		hzone.classList.add("light");
	};
	hzone.ondragleave = (e) => {
	    e.preventDefault();
	    e.stopPropagation(); 
	    hzone.classList.remove("light");
	};
	hzone.ondragover = (e) => {
	    e.preventDefault();
	    e.stopPropagation(); 
	    
	};
    hzone.ondrop = (e) => {
        e.preventDefault();
        e.stopPropagation(); 
        hzone.classList.remove("light");
        uploadPro(e.dataTransfer.files);
    };
    
    function uploadPro(files){
    	
    	let formData = new FormData(); //ajax는 같은주소로 두번 못보낸다. 랜덤함수가 필요..
    	
    	formData.append("file", files[0]);
    	formData.append("boardnum",' ${boardnum}');
    	formData.append("memberNickname", '${memberNickname}');
        
    	let httpreq = new XMLHttpRequest();
    	
    	httpreq.open("POST", "<%=request.getContextPath()%>/chat/upload", true);
    	httpreq.send(formData);
    	httpreq.onload = function(e){
    		if(httpreq.status == 200){ 
    			sendFile(httpreq.responseText);
    		}else{
    			alert("error: "+httpreq.responseText)
    		}
    	}
    }
    
    function sendFile(filename){ 
    	msgarea.innerHTML += "<div class='right'><div id='me'>"
    	+ "<img src='<%=request.getContextPath()%>/upload/"+ filename + "' width='200px' />"
    	+" </div></div>" ;
    	webSocket.send('${boardnum}:${memberNickname}:-:' + filename);
        msgarea.scrollTop=msgarea.scrollHeight;
    }
    
}

    init()

	</script>
</body>
</html>