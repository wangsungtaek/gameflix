
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
	<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<%@ include file="header.jsp"%>



<style>
body {
	background-image: url(img/01.jpg);
}

.quiz_content {
	margin: 0 auto;
	background: white;
	width: 1024px;
	height: 1200px;
	
}

.box {
	width: 1024px;
	height: 800px;
	text-align: center;
	margin: -20 auto;
	background-color: black;
	border-radius: 50px;
}

.text-box {
	width: 1024px;
	height: 600px;
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
<script>
	function time() {

		var cnt = 10;
		var cntdown = document.querySelector("#cntdown");
		var set = setInterval(function() {
			cntdown.innerHTML = cnt;
			cnt--;
			if (cnt < 0) {
				alert("정답을 선택해주세요.");
				clearInterval(set);
			}
		}, 1000);
	}

	function click01() {

		alert("축하합니다! ")
	}
	function click02() {
		alert("땡 틀렸습니다. 답은 원자성입니다.")
	}
</script>
</head>
<%
    String scoreS=request.getParameter("score"); 
    if(scoreS==null) scoreS="0";
	int score =Integer.parseInt(scoreS);
   
    
%>

<body>
  <div class="quiz_content">
	<div class="box">
		<div class="content">
			<div class="text-box">

				<h1>
					<strong> - Q8 - </strong>
				</h1>
				아래 시계를 클릭해주세요.
				<h1 onclick="time()">
					<strong><img src="img/time.PNG" width="50" height="50"></strong>
				</h1>
				<h3 id="cntdown"></h3>
				<h3>
					3. 데이터베이스 구축 <br> <br>
				</h3>
				<h1>
					하나라도 실패할 경우 전체가 취소되어야 하는 트랜잭션의 특징은?<br> <br>
				</h1>
			</div>
			<br> <a class="btn blue" href="09quiz.jsp?score=<%=score %>" onclick="click02()">
				일관성 </a> <a class="btn red" href="09quiz.jsp?score=<%=score %>" onclick="click02()">
				격리성 </a> <a class="btn pink" href="09quiz.jsp?score=<%=score+600%>"
				
				onclick="click01()">원자성 </a>


		</div>
	</div>
  </div>
	<h2></h2>
</body>
<%@ include file="footer.jsp"%>