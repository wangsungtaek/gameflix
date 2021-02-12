<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="gameflix.web.entity.Game"%>
<%@page import="gameflix.web.service.GameService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임등록</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">

<%	
	GameService service = new GameService();
	ArrayList<Game> gameList = service.getGameList();
	
	String[] checkArry = request.getParameterValues("check");

	if(checkArry != null) {
		for(String s : checkArry){
			service.deleteGame(s);
		}
		pageContext.forward("/insertGame.jsp");
	}
	
%>
<style>
body {background-image: url(img/01.jpg);}  
#container { width: 1024px; height: 800px; margin: 0 auto; background: whitesmoke; padding: 10px; }
#container #list { width: 100%; text-align: center; }
#container #list th { background: lightgray; }
#container #list th, td { border: 1px solid black; padding: 5px; }
</style>
<script type="text/javascript">
	window.onload = function() {
		
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>

	<!-- ------------------- <GAME LIST> --------------------------------------- -->
	
	<div id="container">
		<form method="get">
		<table id="list">
			<colgroup>
				<col width="3%">
				<col width="17%">
				<col width="30%">
				<col width="30%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="all_check"></th><th>게임명</th><th>이미지경로</th><th>게임링크</th><th>플레이횟수</th><th>등록일</th>
				</tr>
			</thead>
			
			<tbody>
				<label for="check"></label>
				<%for(Game g : gameList) { %>
				<tr>
					<td><input type="checkbox" name="check" value="<%=g.getG_name() %>"></td>
					<td><%=g.getG_name() %></td>
					<td><%=g.getG_imgPath() %></td>
					<td><%=g.getG_link() %></td>
					<td><%=g.getG_cnt() %></td>
					<td><%=g.getG_date() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		
		<!-- button -->
		
		<div id="list-control">
			<input class="button" type="submit" value="삭제"/>
		</div>
		
		</form>
			
		<!-- ------------------- <HOT GAME LIST> --------------------------------------- -->
			
			
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>