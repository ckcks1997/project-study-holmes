<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
td, th {
	padding: 10px;
}

#messageWindow {
	width: 500px;
	height: 400px;
	overflow: auto;
	background-color: grey;
	border: solid 1px grey;
}

#you {
	display: inline-block;
	position: relative;
	background: yellow;
	border-radius: 5px;
	padding: 3px;
}

#me {
	display: inline-block;
	position: relative;
	background: white;
	border-radius: 5px;
	padding: 3px;
}

#you:after {
	border-top: 10px solid yellow;
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
	width: 300px;
	height: 200px;
	margin: 10px;
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
</style>

<title>Insert title here</title>
</head>

 

<body>
	<table>
		<tr>
			<th><p>
					Group:${boardnum}:${memberNickname}</p></th>
			<th><p>chat group</p></th>
			
		</tr>
		<tr>
			
			<td>
			<div id="messageWindow">
				<c:forEach var="webchat" items="${li }">
				    <c:if test="${webchat.userId.equals(userId) }">
				    <div class="right">
				        <div id="me">나:${webchat.message}</div>
				    </div>
				    
				    </c:if>
				<c:if test="${!webchat.userId.equals(userId) }">
                    
                      <div class="left">
                        <div id="you">${webchat.userId}:${webchat.message}</div>
                    </div>
                    </c:if>
				</c:forEach>
			
			
			</div>
				<div id="messageWindow"></div> <br> <input id="inputMessage" type="text" /> <input type="button" value="send" onClick="sendText()" />
				<div id="upload">
					<div class="updrop">파일을 드래그해서 올리세요</div>
					<div class="upstat"></div>
				</div>
			</td>
			<td valign="top">
				<a href="<%=request.getContextPath() %>/socket/chat?groupId=g1&userId=u1" target="_blank">g1:u1</a> <br>
            </td>
		</tr>

	</table>
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
	webSocket.send('${boardnum}:${memberNickname}:입장했습니다')
}

function onError(event) {

}

function onMessage(event) {
	
	let line = event.data
	let json = JSON.parse(line)
	
	
	if(event.data.includes('.')){
		 
		msgarea.innerHTML +="<div class='left'><div id='you'>" 
			+"<img src='<%=request.getContextPath()%>/upload/"+ json.message +"'width='200px' />"
				+" </div></div>"
	}
	else{  
	    msgarea.innerHTML += "<div class='left'><div id='you'>"+json.userId+':' + json.message+" </div></div>"	 ;
	}
	msgarea.scrollTop=msgarea.scrollHeight;
}

function sendText(){
	if(inputMessage.value!=''){
		msgarea.innerHTML += "<div class='right'><div id='me'>"+ inputMessage.value+" </div></div>" ;
		
		webSocket.send('${boardnum}:${memberNickname}:' + inputMessage.value);
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
    	formData.append("groupId",' ${boardnum}');
    	formData.append("userId", '${memberNickname}');
        
    	let httpreq = new XMLHttpRequest();
    	
    	httpreq.open("POST", "upload.jsp", true);
    	httpreq.send(formData);
    	httpreq.onload = function(e){
    		if(httpreq.status == 200){
    			<%--alert(httpreq.responseText)--%>
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
    	webSocket.send('${groupId}:${memberNickname}:' + filename);
        msgarea.scrollTop=msgarea.scrollHeight;
    }
    
}

    init()

	</script>
</body>
</html>