<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="gameflix.web.service.*" 
    import="gameflix.web.entity.*"
%>
<% request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길찾기게임</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/rtpstyle.css">
<style>
body{background-image: url(img/01.jpg);}
</style>
</head>
<%
	String scoreS = request.getParameter("inscore");
	String status = request.getParameter("status");
	if(status==null) status="";
	int score=0;
	if(scoreS!=null) score = Integer.parseInt(scoreS);
	int m_no = 1;
	
	if(status.equals("end")){
		log("로그준비완료 score:"+score+", status:"+status);
		PlayLogService pls = new PlayLogService();
		pls.insertPlayLog(new PlayLog(m_no, "길찾기게임", score));
	}
%>
<body>
	<%@ include file="header.jsp" %>
	<div class="main">
		<div class="game-title">
			<h1 class="gtitle">집에 가고 싶은 여우</h1>
		</div>
		<div class="game-container">
 			<form method="post">
				<input type="hidden" name="status" id="status">
				<input type="hidden" name="inscore" id="inscore"/>
			</form>	
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