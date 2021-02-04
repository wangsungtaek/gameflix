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
		newGameList += "<li><a href=\""+newGameLink[i]+"\"><img src=\""+newGamePath[i]+"\"></a></li>";
	}
	log(newGameList);
/* 	<li><a href="11.jsp"><img src="img/01.jpg"></a></li> */	
%>
<style>
/* body {background-image: url(img/01.jpg);} */
#main-container > #newGameList { margin: 100px; color: white;}
#main-container > #newGameList ul { display: flex; }
#main-container > #newGameList li { padding: 10px; }
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
	<%-- <jsp:include page="header.jsp"/> --%>
	<div id="main-container">
		<div id="top3">
			<img id="introImg" border="0">
		</div>
		<div id="newGameList">
			<h2>최신게임</h2>
			<ul><%=newGameList %></ul>
		</div>
	</div>
	<button onclick="showImage()" value="">aaaaaaaa</button>
</body>
</html>