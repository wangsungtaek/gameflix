<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<% request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길찾기게임</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/rtpstyle.css">
<style>
body{background-image: url(img/01.jpg);}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="main">
		<div class="game-title">
			<h1 class="title">집에 가고 싶은 여우</h1>
		</div>
		<div class="game-container">
			<div class="game">
				<img src="img/rf-house.png" class="gameimg" id="house"/>
				<img src="img/rf-fox.png" class="gameimg" id="fox"/>
				<table class="gameTable"></table>
				<table class="rootTable"></table>
			</div>
			<div class="game-buttons">
				<button class="btns gamestart" type="button" onclick="gameStart()">게임시작</button>
				<button class="btns gameinfo" type="button">게임안내</button>
				<button class="btns gamehint" type="button" onclick="showRoot()">힌트</button>
				<button class="showscore" type="button" disabled>0</button>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript" src="rf-script.js"></script>
</html>