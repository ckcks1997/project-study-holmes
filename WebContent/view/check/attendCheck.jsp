<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>
<style>


*{
 margin: 0;
 padding: 0;
 font-family: sans-serif;
 box-sizing: border-box;
}




.calendar{
width: 800px;
margin: 80px;
}

.header{
display: flex;
justify-content: space-between;
align-items: center;
}


.year-month { 
font-size: 35px;
}


.nav{
display: flex;
border: 1px solid #333333;
border-radius: 5px;
}

.nav-btn{
width: 28px;
height: 30px;
border: none;
font-size: 16px;
line-height: 34px;
background-color: transparent;
cursor: ponter;
}

.go-today{
width: 75px;
border-left: 1px solid #333333;
border-right: 1px solid #333333;
background-color: #c47100;
}

.days{
	
	display: flex;
	margin: 25px 0 10px;
}

.day{
	width: calc(100% / 7);
	text-align: center;
}

.dates{
	display: flex;
	flex-flow: row wrap;
	height: 500px;
	border-top: 1px solid #333333;
	border-right: 1px solid #333333;
	
}
.date{
	width: calc(100% / 7);
	padding:15px;
	text-align: right;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #333333;	
}

.day:nth-child(7n + 1),
.date:nth-child(7n + 1){
	color: #D13E3E;
}


.day:nth-child(7n),
.date:nth-child(7n){
	color: #396EE2;
}


.other{
	opacity: 0.3;
}

.today{
	position: relative;
	color: #333333;
	
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

			

			/* 아래서부터는 페이지 종속css, 다른페이지에 복붙할 필요 x */
		</style>

		<title>Document</title>
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
			<div class="row pt-5">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<h1>출석체크</h1>
					<hr align="left" width="200px" style="border: 0.5px solid #c47100" />
					<br />

					<div class="calendar">
						<div class="header ">
							<div class="year-month "></div>
							<div class="nav">
								<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
								<button class="nav-btn go-today" onclick="goToday()">Check</button>
								<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
							</div>
						</div>
					</div>
					<div class="main">
						<div class="days">
							<div class="day">일</div>
							<div class="day">월</div>
							<div class="day">화</div>
							<div class="day">수</div>
							<div class="day">목</div>
							<div class="day">금</div>
							<div class="day">토</div>
						</div>
						<div class="dates"></div>
					</div>
				</div>
			</div>
		</div>
   <script>
   
   let json = ${result}; 
   console.log(json);
   let dayList = [];
   for ( let i=0; i<json.length; i++) {
      dayList.push(json[i].day);
   }
   console.log(dayList)
   console.log(dayList.includes('2022-03-19') )

 let date = new Date();

 const renderCalender = ()=>
  {
 const viewYear = date.getFullYear();
 const viewMonth = date.getMonth();

 document.querySelector('.year-month').textContent = `\${viewYear}년 \${viewMonth + 1}월`;

 const prevLast = new Date(viewYear, viewMonth, 0);
 const thisLast = new Date(viewYear, viewMonth + 1, 0 );

 const PLDate = prevLast.getDate();
 const PLDay = prevLast.getDay();

 const TLDate = thisLast.getDate();
 const TLDay = thisLast.getDay();

 const prevDates = [];
 const thisDates = [...Array(TLDate + 1).keys()].slice(1);
 const nextDates = [];

 if(PLDay !==6) {
     for(let i = 0; i<PLDay + 1; i++){
     prevDates.unshift(PLDate - i);
 }
 }

 for(let i =1; i < 7 - TLDay; i++){
     nextDates.push(i);
 }

 const dates = prevDates.concat(thisDates, nextDates);
 const firstDateIndex = dates.indexOf(1);
 const LastDateIndex = dates.lastIndexOf(TLDate);
  
  
 dates.forEach((date, i )=>{
	    let condition = i >= firstDateIndex && i< LastDateIndex+1
	                    ? 'this'
	                    : 'other';
	    condition += dayList.includes(viewYear+'-'+(viewMonth + 1)+'-'+date) ? ' checked ' : ' ';
	    console.log(dayList.includes(`\${viewYear}-\${viewMonth + 1}-\${date}` ))
	    
	    dates[i] = `<div class="date"><span class= \${condition} > \${date} </span></div>`;
	    
	});


 document.querySelector('.dates').innerHTML = dates.join('');

 const today =  new Date();
 if(viewMonth === today.getMonth() && viewYear === today.getFullYear()){
     for(let date of document.querySelectorAll('.this')){
         if(+date.innerText === today.getDate()){
             date.classList.add('today');
             break;
         }
     }
 }

 };

 renderCalender();


 const prevMonth = () =>{
     date.setMonth(date.getMonth() - 1);
     renderCalender();
 };

 const nextMonth = () =>{
     date.setMonth(date.getMonth() + 1);
     renderCalender();
 };

 const goToday = () =>{
      alert("출석체크 완료!!")
     date = new Date();
     renderCalender();
     check();
 }
 </script> 
 <script>
 

 
 function check() {
 let con = document.querySelector(".today");
 
 alert(con.innerHTML+"일 출석완료되었습니다.");
 
	location.href = "<%=request.getContextPath()%>/attend/check_pro";
 
 con.innerHTML='<img src="<%=request.getContextPath()%>/img/check.jpeg" />'
 }
 
 </script>
</body>
</html>