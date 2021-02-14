
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
		alert("축하합니다! 정답입니다.")
	}
	function click02() {
		alert("땡 틀렸습니다. 답은 UPDATE 입니다.")
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
				<br>
				<h1>
					<strong> - Q3 - </strong>
				</h1>
				아래 시계를 클릭해주세요.
				<h1 onclick="time()">
					<strong><img src="img/time.PNG" width="50" height="50"></strong>
				</h1>
				<h3 id="cntdown"></h3>
				<h3>
					<br>
					<br> 3. 데이터베이스 구축 <br>
					<br>
				</h3>
				<h1>
					DML의 유형 중 해당 테이블에 있는 튜플 중에서 특정 튜플의 내용을 변경할 때 사용하는 명령문은?<br>
					<br>
				</h1>
			</div>
			<br> <a class="btn blue" href="04quiz.jsp"
				onclick="click02()"> SELECT </a> <a class="btn red"
				href="04quiz.jsp" onclick="click01()"> UPDATE</a> <a
				class="btn pink" href="04quiz.jsp" onclick="click02()">
				INSERT</a>
		</div>
	</div>

	<h2></h2>
</body>
<%@ include file="footer.jsp"%>