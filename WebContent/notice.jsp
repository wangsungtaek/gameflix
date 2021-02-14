<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<style>
body {background-image: url(img/01.jpg);}

/* 페이지 규격 */
.wrapper {
	width: 1024px;
	height: 700px;
	background-color: white;
	margin: 0 auto;
}

h3 {
	position: absolute;
	top: 110px;
	left: 50%;
	margin-left: -50px;
	color: #963D2A;
}

/* 공지 테이블 */
#notice {
	position: absolute;
	top: 170px;
	left: 50%;
	border-collapse: collapse;
	width: 700px;
	height: 400px;
	margin-left: -350px;
	text-align: center;
	font-size: 12px;
}

#notice #title {
	text-align: left;
	padding-left: 10px;
}

#notice th {
	background-color: #963D2A;
	color: #fff;
	height: 30px;
}

#notice a:link {
	color: black;
	text-decoration: none;
}

#notice a:visited {
	color: black;
	text-decoration: none;
}

#notice a:hover {
	text-decoration: underline;
}

/* 페이지버튼 */
#btn_group {
	position: absolute;
	top: 600px;
	left: 50%;
	width: 150px;
	height: 30px;
	margin-left: -75px;
}

#btn {
	display: inline-block;
	width: 25px;
	padding: 5px;
	color: darkgray;
	border-radius: 50%;
	border: none;
	font-size: 16px;
}

#btn:hover {
	background-color: #963D2A;
	color: #fff;
}

</style>
</head>
<body>
	<div class="page">
	
		<!-- 헤더 -->
		<%@ include file="header.jsp"%>
		
		<div class="wrapper">

			<h3>공지사항</h3>

			<table id="notice" border>
				<col width="10%">
				<col width="75%">
				<col width="15%">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td>10</td>
					<td id="title"><a href="notice_detail.html">GAMEFLIX
							서비스가 새롭게 개편되었습니다.</a></td>
					<td>2021-02-08</td>
				</tr>
				<tr>
					<td>9</td>
					<td id="title"><a href="notice_detail.html">캠페인참여 개편 안내</a></td>
					<td>2021-02-07</td>
				</tr>
				<tr>
					<td>8</td>
					<td id="title"><a href="notice_detail.html">결제 서비스 장애에 대하여
							사과드립니다.</a></td>
					<td>2021-02-05</td>
				</tr>
				<tr>
					<td>7</td>
					<td id="title"><a href="notice_detail.html">GAMEFLIX 새로운 모습으로
							찾아갑니다.</a></td>
					<td>2021-02-03</td>
				</tr>
				<tr>
					<td>6</td>
					<td id="title"><a href="notice_detail.html">포인트 만료일자 안내</a></td>
					<td>2021-02-02</td>
				</tr>
				<tr>
					<td>5</td>
					<td id="title"><a href="notice_detail.html">2월 1일(월) GAMEFLIX
							정기점검 안내</a></td>
					<td>2021-01-30</td>
				</tr>
				<tr>
					<td>4</td>
					<td id="title"><a href="notice_detail.html">2020 GAMEFLIX 소득공제
							안내</a></td>
					<td>2021-01-25</td>
				</tr>
				<tr>
					<td>3</td>
					<td id="title"><a href="notice_detail.html">1월 이벤트 당첨자 발표</a></td>
					<td>2021-01-24</td>
				</tr>
				<tr>
					<td>2</td>
					<td id="title"><a href="notice_detail.html">GAMEFLIX 세부운영 공지</a></td>
					<td>2021-01-22</td>
				</tr>
				<tr>
					<td>1</td>
					<td id="title"><a href="notice_detail.html">GAMEFLIX 홈페이지 오픈 공지</a></td>
					<td>2021-01-21</td>
				</tr>
			</table>

			<!-- 페이지 버튼 -->
			<div id="btn_group">
				<button id="btn">1</button>
				<button id="btn">2</button>
				<button id="btn">3</button>
				<button id="btn">4</button>
				<button id="btn">5</button>
			</div>

		</div>

		<!-- 하단사이트정보 -->
		<%@ include file="footer.jsp"%>

	</div>
</body>
</html>