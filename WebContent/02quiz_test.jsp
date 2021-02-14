
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
<%@ include file="header.jsp"%>
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
		alert("축하합니다! 정답입니다. ")
	}
	function click02() {
		alert("땡 틀렸습니다. 답은 탐욕법입니다.")
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
</head>
<body>

	<div class="box">
		<div class="content">
			<div class="text-box">

				<h1>
					<strong> - Q2 - </strong>
				</h1>
				아래 시계를 클릭해주세요.
				<h1 onclick="time()">
					<strong><img src="img/time.PNG" width="50" height="50"></strong>
				</h1>
				<h3 id="cntdown"></h3>
				<h3>
					2. 소프트웨어 개발 <br>
					<br>
				</h3>
				<h1>
					결정을 해야할 때, 가장 좋다고 생각되는 것을 해답으로 선택하는 방식의 알고리즘 기법은?<br>
					<br>
				</h1>
			</div>
			<br> <a class="btn blue" href="03quiz.jsp"
				onclick="click02()"> 분할과 정복 </a> <a class="btn red"
				href="03quiz.jsp" onclick="click02()"> 백트래킹 </a> <a
				class="btn pink" href="03quiz.jsp" onclick="click01()"> 탐욕법</a>


		</div>
	</div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>