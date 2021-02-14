
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
<%@ include file="header.jsp"%>
<script>
   var h4Obj;
   function cal(data){
	   
	   h4Obj = document.querySelector("h4");
	   h4Obj.innerHTML +=data;
	   alert("정답입니다. + 를 클릭해주세요.");
	    }
   
   function calR(){
	   alert("총 점수입니다.");
	   var result=eval(h4Obj.innerHTML);
	   var h5Obj=document.querySelector("h3")
	   h5Obj.innerHTML=h4Obj.innerHTML+" = "+result;
   }
</script>

<style>
body {
	background-image: url(img/01.jpg);
}

.box {
	width: 1024px;
	height: 800px;
	text-align: center;
	margin: 100 auto;
	background-color: black;
	border-radius: 50px;
}

.text-box {
	width: 1024px;
	height: 800px;
	text-align: center;
	background-color: white;
	border-radius: 100px;
	border: 2px;
	float: center;
}

.btn {
	text-decoration: none;
	color: white;
	padding: 10px 20px 10px 20px;
	margin: 20px;
	display: inling-block;
	border-radius: 10px;
}

.btn.blue {
	background-color: #1f75d9;
	float: center;
	block;
}

.btn.red {
	background-color: red;
	float: center;
}

.btn.pink {
	background-color: orange;
	float: center;
}
</style>
</head>
<body>

	<div class="box">
		<div class="content">
			<div class="text-box">

				<h1>
					<strong> - 복습 페이지 - </strong>
				</h1>
				<br> 복습 페이지에서 점수를 얻을 수 있습니다. 다시 한번 풀어보세요. 답을 클릭해주세요.<br>
				1. 개념 모델 작성 시 오류가 적고 의사소통이 용이한 언어는? <br>
				<h5>구축 언어</h5> <h5 onclick="cal(100)">가시화 언어</h5><h5>명세화 언어</h5> 
			    <h5 onclick="cal('+')"> + </h5>
				2. 결정을 해야할 때, 가장 좋다고 생각되는 것을 해답으로 선택하는 방식의 알고리즘 기법은?
				<h5 onclick="cal(100)">탐욕법</h5><h5>분할과 정복</h5><h5>백트래킹</h5>
				<h5 onclick="cal('+')"> + </h5>
			
				3. DML의 유형 중 해당 테이블에 있는 튜플 중에서 특정 튜플의 내용을 변경할 때 사용하는 명령문은?<br>
				<h5>INSERT</h5><h5>SELECT</h5><h5 onclick="cal(100)">UPDATE</h5>
				
				
			    획득한 점수 : <h4></h4>    <h5></h5>
			     <h3 onclick="calR()">=</h3>
			    <a href="a.quiz_main.jsp">메인화면으로 이동</a>
			</div>
			
		</div>
	</div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>
