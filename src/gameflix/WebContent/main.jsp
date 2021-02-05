<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="default.css">
<%
	// 최신등록 순
	String[] newGameLink = {"#","#","#","#","#","#"};
	String[] newGamePath = {"img/01.jpg","img/01.jpg","img/01.jpg","img/01.jpg","img/01.jpg","img/01.jpg"};
	String[] newGameTitle = {"게임1","게임2","게임3","게임4","게임5","게임6"};
	String newGameList = "";
	for(int i=0; i < newGameLink.length; i++){
		newGameList += "<li><a href=\""+newGameLink[i]+"\"><img src=\""+newGamePath[i]+"\">";
		newGameList += "<div class=\"titl\">"+newGameTitle[i]+"</div>";
		newGameList += "</a></li>";
	}
	log(newGameList);
%>
<style>
body{background-image: url(img/01.jpg);}  
#container{ width: 1024px; margin: auto; }
#container > #main-content > #top3 { margin: 10px 0 30px 0;}
#container > #main-content > #top3  a { display: block;}
#container > #main-content > #top3 img { width: 100%; height: 500px;  border-radius: 5px; }

#container > #main-content > .gameList { margin-bottom: 30px; }
#container > #main-content > .gameList h3 { color: white; font-size: 25px; font-weight: bold; }
#container > #main-content > .gameList ul { display: flex; flex-wrap: wrap; justify-content: space-between; }
#container > #main-content > .gameList li { position: relative; margin-bottom: 20px;}
#container > #main-content > .gameList .titl { position: absolute; top: 50px; left: 135px; font-size: 15px; font-weight: bold; }
#container > #main-content > .gameList img{ width: 300px; border-radius: 10px; border: 0.2px solid lightgray; }
</style>
<script type="text/javascript">
	var imgArray = new Array();
	imgArray[0] = "img/01-introImg.jpg";
	imgArray[1] = "img/02-introImg.jpg";
	imgArray[2] = "img/03-introImg.jpg";
	imgArray[3] = "img/04-introImg.jpg";
	function showImage(){
		console.log(imgArray);
		var showNum = Math.round(Math.random()*3);
		var objImg = document.getElementById("introImg");
		objImg.src = imgArray[showNum];
		setTimeout("showImage()", 3000);
	}
</script>
</head>
<body onload="showImage()">
	<%@ include file="header.jsp" %>
	
	<div id="container">
		<section id="main-content">
			<h2 class="hidden">인기 Top3 게임 리스트</h2>
			<div id="top3">
				<a href="#"><img id="introImg" border="0"></a>
			</div>
			<h2 class="hidden">최신 등록 게임 리스트</h2>
			<div id="newGameList" class="gameList">
				<h3>최신게임</h3>
				<ul><%=newGameList %></ul>
			</div>
			<h2 class="hidden">전체 게임 리스트</h2>
			<div id="totalGameList" class="gameList">
				<h3>전체게임</h3>
				<ul><%=newGameList %></ul>
			</div>
		</section>
		
		<aside id="side-banner">
			<div class="ranking-box">
				<h2>전체 랭킹</h2>
				<a>랭킹게시판</a>
				<table>
					<tr><td>아이디</td><td>점수</td></tr>
					<tr><td>gun111</td><td>100</td></tr>
				</table>
			</div>
		</aside>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>