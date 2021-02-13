<%@page import="gameflix.web.entity.Game"%>
<%@page import="gameflix.web.service.GameService"%>
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
<title>Gameflix</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>

<%	
	String gamePage_ = request.getParameter("p");
	int gamePage = 1;
	if(gamePage_ != null && !gamePage_.equals("")) gamePage = Integer.parseInt(gamePage_);
	
	GameService service = new GameService();
	ArrayList<Game> hotGame = service.getHotGameList();
	ArrayList<Game> newGame = service.getNewGameList();
	ArrayList<Game> allGame = service.getGameList(gamePage, 3);
	
	int dbCnt = service.getCount();
	int pageNum = (dbCnt%3 == 0) ?  (dbCnt/3) : (dbCnt/3)+1;
	
%>
<style>
body{background-image: url(img/01.jpg);}  
#container{ width: 1024px; margin: 0 auto; }
#container > #gameInsert-link { float: right; }
#container > #gameInsert-link a { text-decoration: underline; color: lightgray; font-size: 15px; }

#container > #main-content > .gameList { height: 350px; margin-top: 30px; }
#container > #main-content > .gameList h3 { color: white; font-size: 25px; font-weight: bold; margin-bottom: 10px; }
#container > #main-content > .gameList .item { display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; }
#container > #main-content > .gameList .item > li { position: relative; margin-bottom: 20px; }
#container > #main-content > .gameList .gameInfo:before { content:"❯"; }
#container > #main-content > .gameList .gameInfo { font-size: 1.2em; padding-left: 10px; font-weight: bold; }
#container > #main-content > .gameList .gameInfo > span { float: right; font-size: 14px; line-height: 1.7; color: lightgray;}
#container > #main-content > .gameList .gameInfo:after { content: ""; clear: both; display: block; }
#container > #main-content > .gameList img {
	width: 300px; height: 220px; border-radius: 10px; border: 0.2px solid lightgray; 
	transition: 0.5s; margin-bottom: 10px; }
#container > #main-content > .gameList img:hover { width: 320px; height: 240px;}

#container > #main-content > .page-btn { text-align: center; margin-bottom: 30px;}
#container > #main-content > .page-btn li { margin: 10px; display: inline; }
#container > #main-content > .page-btn a { 
	background: white; color: black; width: 20px; height: 20px; line-height: 1.5; 
	border-radius: 50%; font-weight: bold; }

#container > #side-banner { background: purple; position: relative; width: 1000px; }
#container > #side-banner > #ranking-box { 
	 width: 200px; top: -1620px; right: -240px; position: absolute;
	border-radius: 5px; color: lightgray;
}
#container > #side-banner > #ranking-box h2 { margin: 0 0 10px 10px; font-size: 15px; font-weight: bold; float: left;}
#container > #side-banner > #ranking-box a { float: right; font-size: 12px; color: #B97687; margin: 5px 8px 0 0}
#container > #side-banner > #ranking-box a:hover { color: #E5BFBC; text-decoration: underline;}
#container > #side-banner > #ranking-box img { width: 20px;}
#container > #side-banner > #ranking-box table { text-align: center; margin: 0 auto; width: 90%; margin-bottom: 10px;}
#container > #side-banner > #ranking-box td,th { border: 1px solid; padding: 5px; font-size: 13px;}
#container > #side-banner > #ranking-box td { font-size: 10px; }
</style>
<script type="text/javascript">
	window.onload = function() {
		var floatPosition = parseInt($("#ranking-box").css('top'))
		console.log(floatPosition);
		
		$(window).scroll(function(){
			
			var currentTop = $(window).scrollTop();
			var bannerTop = currentTop + floatPosition + "px";
			
			$("#ranking-box").stop().animate({
				"top" : bannerTop
			},500);
		}).scroll();
		
		// 페이지색상 지정
		var pageObj = document.querySelector("#p<%=gamePage %>");
		pageObj.style.backgroundColor="#FDAFAB";
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div id="container">
	
		<div id="gameInsert-link">
			<a href="gameManager.jsp">게임관리</a>
		</div>

		<!-- ------------------- <HOT GAME LIST> --------------------------------------- -->
			
		<section id="main-content">		
			<h2 class="hidden">인기 게임 리스트</h2>
			<div id="hotGameList" class="gameList">
				<h3>인기게임</h3>
				<ul class="item">
					<%for (Game g : hotGame) { %>
					<li>
						<a href="<%=g.getG_link()%>"> <img src="<%=g.getG_imgPath()%>" onerror="this.src='img/default.png'">
							<div class="gameInfo">
								<%=g.getG_name()%><span>플레이횟수 : <%=g.getG_cnt()%></span>
							</div>
						</a>
					</li>
					<%} %>
				</ul>
			</div>


		<!-- ------------------- <NEW GAME LIST> --------------------------------------- -->
			<h2 class="hidden">최신 등록 게임 리스트</h2>
			<div id="newGameList" class="gameList">
				<h3>최신게임</h3>
				<ul class="item">
					<%for(Game g : newGame) { %>
					<li>
						<a href="<%=g.getG_link() %>">
							<img src="<%=g.getG_imgPath() %>" onerror="this.src='img/default.png'">
							<div class="gameInfo">
								<%=g.getG_name() %><span>등록일 : <%=g.getG_date() %></span>
							</div>
						</a>
					</li>
					<%} %>
				</ul>
			</div>
			
		<!-- ------------------- <ALL GAME LIST> --------------------------------------- -->
			
			<h2 class="hidden">전체 게임 리스트</h2>
			<div id="totalGameList" class="gameList">
				<h3>전체게임(<%=dbCnt %>)</h3>
				<ul class="item">
					<%for(Game g : allGame) { %>
					<li>
						<a href="<%=g.getG_link() %>">
							<img src="<%=g.getG_imgPath() %>" onerror="this.src='img/default.png'">
							<div class="gameInfo">
								<%=g.getG_name() %><span>등록일 : <%=g.getG_date() %></span>
							</div>
						</a>
					</li>
					<%} %>
				</ul>
			</div>
			
			<ul class="page-btn">
			<%for(int i=0; i<pageNum; i++) {%>
				<li><a id="p<%=1+i %>" href="?p=<%=1+i %>#totalGameList">
						<%=1+i %>
					</a>
				</li>
			<%} %>
			</ul>
			
		</section>
		
		<!-- ------------------- <User Ranking> --------------------------------------- -->
		
		<aside id="side-banner">
			<div id="ranking-box">
				<h2>유저랭킹 TOP5</h2>
				<a href="#">랭킹게시판</a>
				<table>
					<colgroup>
						<col style="width: 15%"/>
						<col style="width: 45%"/>
						<col style="width: 40%"/>
					</colgroup>
					<tr><th></th><th>아이디</th><th>점수</th></tr>
					<tr><td><img src="img/badge/grade-1.png"></td><td>gun111</td><td>5000</td></tr>
					<tr><td><img src="img/badge/grade-2.png"></td><td>gun222</td><td>4000</td></tr>
					<tr><td><img src="img/badge/grade-3.png"></td><td>gun333</td><td>3000</td></tr>
					<tr><td><img src="img/badge/grade-4.png"></td><td>gun444</td><td>2000</td></tr>
					<tr><td><img src="img/badge/grade-5.png"></td><td>gun555</td><td>1000</td></tr>
				</table>
			</div>
		</aside>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>