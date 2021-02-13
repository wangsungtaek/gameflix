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
<title>게임관리</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">

<%	
	// request
	String[] checkArry = request.getParameterValues("check");
	String g_name = request.getParameter("g_name");
	String g_imgPath = request.getParameter("g_imgPath");
	String g_link = request.getParameter("g_link");	
	String gamePage_ = request.getParameter("p");
	
	
	int gamePage = 1;
	if(gamePage_ != null && !gamePage_.equals("")) gamePage = Integer.parseInt(gamePage_);
	
	// db
	GameService service = new GameService();
	ArrayList<Game> pageGame = service.getGameList(gamePage, 10);
	
	int dbCnt = service.getCount();
	int pageNum = (dbCnt%10 == 0) ?  (dbCnt/10) : (dbCnt/10)+1;
	
	
	// 삭제	
	if(checkArry != null) {
		for(String s : checkArry){
			service.deleteGame(s);
		}
		response.sendRedirect("gameManager.jsp");
	}
	
	// 삽입
	if(g_name != null && g_imgPath != null && g_link != null &&
	   !g_name.equals("") && !g_imgPath.equals("") && !g_link.equals("")) {
		service.insertGame(new Game(g_name, g_imgPath, g_link));
		response.sendRedirect("gameManager.jsp");
	}
%>
<style>
body {background-image: url(img/01.jpg);}  
#container { 
	width: 1024px; height: 800px; margin: 0 auto; background: white; font-family: 돋움, Arial, sans-serif;
	padding: 30px; color: #979797; font-size: 11px; }
h3:before { content: "● "; color: #963D2A; }
h3 { color: #646464; font-size: 21px; margin-bottom: 50px; }


/* game insert */
#insertForm { margin-bottom: 30px; border: 1px solid gray; padding: 10px 20px; position: relative; display: inline-block; }
#insertForm > div { margin: 10px 0; }
#insertForm label { width: 80px; display: inline-block; font-size: 13px; color: #646464; }
#insertForm > div > input { width: 250px; }
#insertForm > input { position: absolute; top: -1px; right: -45px; height: 125px; width: 40px; }

/* game list */
#container #PageList { margin-bottom: 20px; }
#container table { width: 100%; text-align: left; border-top: 2px solid #963D2A;}
#container table th { background: #f5f5f5; text-align: center; }
#container table th, td { border-bottom: 1px solid #e9e9e9; padding: 5px; box-sizing: border-box;}
#container .align-center { text-align: center; }

/* button */
#list-control { height: 30px; }
#list-control input { 
	width: 71px; height: 23px; float: right; background: #963D2A; border-radius: 3px;
	color: white; border: none; padding: 3px 8px; margin-left: 5px; font-size: 11px; font-weight: bold;}
#list-control input:hover { text-decoration: underline; background: #AC3D2A; }

/* pager button */
#container > .page-btn { text-align: center; }
#container > .page-btn li { display: inline; }
#container > .page-btn a { color: #979797; width: 20px; height: 20px; line-height: 1.5; border-radius: 50%; font-weight: bold; }
	
</style>
<script type="text/javascript">
	window.onload = function() {
		// 페이지색상 지정
		var pageObj = document.querySelector("#p<%=gamePage %>");
		pageObj.style.color="#963D2A";
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="container">
	
	<!-- ------------------- <게임등록> --------------------------------------- -->
		
<!-- 		<h3>게임등록</h3> -->
<!-- 		<form method="post"> -->
<!-- 		<div id="insertForm"> -->
<!-- 			<div> -->
<!-- 				<label for="g_name">게임명 :</label> -->
<!-- 				<input id="g_name" type="text" name="g_name" placeholder="게임명을 입력하세요."/> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<label for="g_imgPath">이미지경로 :</label> -->
<!-- 				<input id="g_imgPath" type="text" name="g_imgPath" value="img/game/"/> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<label for="g_link">게임링크 :</label> -->
<!-- 				<input id="g_link" type="text" name="g_link" placeholder="test.jsp"/> -->
<!-- 			</div> -->
<!-- 			<input type="submit" value="등록"/> -->
<!-- 		</div> -->
<!-- 		</form> -->
	
	<!-- ------------------- <GAME LIST> --------------------------------------- -->
	
		<h3>게임 리스트</h3>
		<form method="get">
		<div id="PageList">
		<table class="list">
			<colgroup>
				<col width="15%">
				<col width="25%">
				<col width="25%">
				<col width="11%">
				<col width="12%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr>
					<th>게임명</th>
					<th>이미지경로</th>
					<th>게임링크</th>
					<th>플레이횟수</th>
					<th>등록일</th>
					<th><input type="checkbox" name="all_check"></th>
				</tr>
			</thead>
			
			<tbody>
				<label for="check"></label>
				<%for(Game g : pageGame) { %>
				<tr>
					<td class="align-center"><%=g.getG_name() %></td>
					<td><%=g.getG_imgPath() %></td>
					<td><%=g.getG_link() %></td>
					<td class="align-center"><%=g.getG_cnt() %></td>
					<td class="align-center"><%=g.getG_date() %></td>
					<td class="align-center"><input type="checkbox" name="check" value="<%=g.getG_name() %>"></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		</div>
		<!-- button -->
		
		<div id="list-control">
			<input class="button" type="submit" value="게임삭제"/>
			<input class="button" type="button" value="게임등록" onclick="location.href='insertGame.jsp'"/>
		</div>
		
		</form>
		
		<!-- pager -->
		
		<ul class="page-btn">
		<%for(int i=0; i<pageNum; i++) {%>
			<li><a id="p<%=1+i %>" href="?p=<%=1+i %>">
					<%=1+i %>
				</a>
			</li>
		<%} %>
		</ul>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>