<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script   src="<%=request.getContextPath()%>/js/ajax.js"></script>
<style>


table.type08 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
}

table.type08 thead th {
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid;
  background: #333b3d;
  
}
table.type08 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
table.type08 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}


* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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








.rouletter {
  position: relative;
  width: 400px;
  height: 400px;
}
.rouletter-bg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 350px;
  height: 350px;
  border-radius: 350px;
  overflow: hidden;
}
.rouletter-wacu {
  width: 100%;
  height: 100%;
  background: #f5f5f2
    url("https://m.lifeplanet.co.kr:444/commons/slink/administrator/openInnovation/img/MO)%20360%ED%94%8C%EB%9E%98%EB%8B%9B_%EB%A3%B0%EB%A0%9B%ED%8C%90_476x476_201026.png")
    no-repeat;
  background-size: 100%;
  transform-origin: center;
  transition-timing-function: ease-in-out;
  transition: 2s;
}
.rouletter-arrow {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 1px;
  height: 1px;
  border-right: 10px solid transparent;
  border-left: 10px solid transparent;
  border-top: 40px solid red;
  border-bottom: 0px solid transparent;
}
.rouletter-btn {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 80px;
  height: 80px;
  border-radius: 80px;
  background: #fff;
  border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
  border: 2px solid;
}

.hidden-input {
  display: none;
}

</style>
</head>
<body>
<div class="container-fluid famous-saying-box">
		<div class="container p-3">
			<div class="mt-3">
				<h3 class="color-white">오늘의 명언</h3>
				<div class="color-white">생각 없이 배우기만 하면 얻는 것이 없고, 생각만 하고 배우지 않으면 오류나 독단에 빠질 위험이 있다. -공자</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pt-5">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2><strong>출석 이벤트</strong></h2>
				<hr align="left" width="170px" style="background-color: #c47100; height:1px;" />
				<br />



<div class="rouletter" >
    <div class="rouletter-bg"><div class="rouletter-wacu"></div></div>
    <div class="rouletter-arrow"></div>
    <button class="rouletter-btn" >start</button>
</div>

<table class="type08">
  <thead>
  <tr>
    <th scope="cols" style="color:white">닉네임</th>
    <th scope="cols" style="color:white">당첨 내역</th>
  </tr>
  </thead>
  <tr>
    <th >${at.id}</th>
    <td>${at.gift}</td>
  </tr>
  </tbody>
</table>
	</div>
		</div>
		
	</div>
	


<script>
var rolLength = 6;
var setNum;
var hiddenInput = document.createElement("input");
hiddenInput.className = "hidden-input";

const rRandom = () => {
  var min = Math.ceil(0);
  var max = Math.floor(rolLength - 1);
  return Math.floor(Math.random() * (max - min)) + min;
};

const rRotate = () => {
  var panel = document.querySelector(".rouletter-wacu");
  var btn = document.querySelector(".rouletter-btn");
  var deg = [];
  for (var i = 1, len = rolLength; i <= len; i++) {
    deg.push((360 / len) * i);
  }

  var num = 0;
  document.body.append(hiddenInput);
  setNum = hiddenInput.value = rRandom();

  var ani = setInterval(() => {
    num++;
    panel.style.transform = "rotate(" + 360 * num + "deg)";
    btn.disabled = true; //button,input
    btn.style.pointerEvents = "none"; //a 태그

    if (num === 50) {
      clearInterval(ani);
      panel.style.transform = "rotate(" + deg[setNum] + "deg)";
    }
  }, 50);
};

const rLayerPopup = (num) => {
  switch (num) {
    case 1:
      alert("당첨!! 스타벅스 아메리카노");
      break;
    case 3:
      alert("당첨!! 햄버거 세트 교환권");
      break;
    case 5:
      alert("당첨!! CU 3,000원 상품권");
      break;
    default:
      alert("꽝!! 아쉽게도 이벤트 당첨되지 않았습니다");
  }
    
  console.log(num);
  fetch("<%=request.getContextPath()%>/attend/sendGift?gift="+ num, {
	    method: "get"
	}).then(resp => {
	    const respJson = resp.json()
	    console.log("resp", resp, respJson)
	    return respJson // [[PromiseValue]]를 꺼내 다음 then으로 전송
	}).then(data => {
	    console.log(data) //성공시, 데이터 출력
	}).catch(excResp => {
	    console.log(excResp)
	})
  
  
};

const rReset = (ele) => {
  setTimeout(() => {
    ele.disabled = false;
    ele.style.pointerEvents = "auto";
    rLayerPopup(setNum);
    hiddenInput.remove();
  }, 5500);
};

document.addEventListener("click", function (e) {
  var target = e.target;
  if (target.tagName === "BUTTON") {
    rRotate();
    rReset(target);
  }
});



</script>
</body>
</html>