<%@page import="gameflix.web.service.GameService"%>
<%@page import="gameflix.web.entity.Game"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"%>
<%
	GameService Service2 = new GameService();
ArrayList<Game> menuList = Service2.getGameList();
%>
<style>
.hidden { overflow: hidden; position: absolute; top: -9999px; left: -9999px; width: 1px; height: 0;}
#main-head { background-color: rgba(0,0,0,0.7); width: 1024px; margin:0 auto;
			 padding: 20px 0 0 20px; position: relative; height: 80px; min-width:1000px;}
#main-head > .util { background: transparent; position: absolute; top:0px; right:0px;}
#main-head > .util > .util-list { display: flex; font-weight: 500;}
#main-head > .util > .util-list a {padding: 20px;}
#main-head > .util > .util-list a:hover { color: rgb(150, 150, 150); }
#main-head > .util > .util-list button { color: white; padding: 20px;}
#main-head > .util > .util-list button:hover { color: rgb(150, 150, 150); }

#main-head > .util > .util-search { position: absolute; left: 20px; bottom: -10px;}
#main-head > .util > .util-search #search_total_button { position: absolute; left:-30px; top:3px; padding-left: 10px;}
#main-head > .util > .util-search .fa-search {color: white;}
#main-head > .util > .util-search .fa-times {color:white; font-size: 15px;}
#main-head > h1 img { width:150px;}

#main-head > #lnb { position: relative; left: 200px; bottom: 90px; width: 500px}
#main-head > #lnb ul { display: flex; margin-top: 50px; }
#main-head > #lnb li { background: transparent; width: 20%; transition: 0.5s;
					   border-radius: 20px; flex-shrink: 0; }
#main-head > #lnb li:hover { width:18%; background-color: rgba(220, 20, 60, 0.478); }
#main-head > #lnb a { padding: 10px; font-size: 14px; color: white;
					  display: block; text-align: center;}
#main-head > #lnb a:hover { color: rgb(220, 220, 220); cursor: pointer; }
#main-head button {border: 0; outline: 0;}

.menu { position: absolute; top: 80px; left: 190px; background: rgba(0,0,0,0.7); z-index: 1; display: none; }
.menu a { display: block; width: 150px; height: 30px; text-align: center; line-height: 30px; }
.menu a:hover { background: rgba(220, 20, 60, 0.478); }

</style>
<script>
	function search(){
		var boxObj = document.querySelector(".util-search-box");
		/* boxObj.style.display = display; */
		console.log(boxObj);
		if(boxObj.style.display == 'none') boxObj.style.display = 'block';
		else boxObj.style.display = 'none';
	}
	var useMenu = false;
	function menuDisplay(state) {
		setTimeout(function(){
			var menuObj = document.querySelector(".menu");
			if(useMenu != true)
				menuObj.style.display = state;
		}, 200);
	}
	function menuDisplay2(state) {
		var menuObj = document.querySelector(".menu");
		menuObj.style.display = state;
		if(menuObj.style.display == 'block') useMenu = true;
		else useMenu = false;
	}
</script>
<!-- header -->
<header id="main-head">

	<h1><a href="main.jsp"><img src="img/logo.png" alt="gameflix"></a></h1>
	
	<!-- ------------------- <util> --------------------------------------- -->
	
	<h2 class="hidden">유틸메뉴</h2>
	<div class="util">
		<ul class="util-list">
			<li><a href="#">LOGOUT</a></li>
			<li><a href="#">MYPAGE</a></li>
			<li><button onclick="search()"><i class="fas fa-search"></i></button>
		</ul>
		<div class="util-search">
			<div class="util-search-box">
				<label for="search_total" class="hidden">검색어</label>
				<input type="text" id="search_total" title="검색어 입력">
				<button id="search_total_button">
					<i class="fas fa-search"></i>
				</button>
				<button class="util-close" onclick="search()">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
	</div>
	
	<!-- ------------------- <nav> --------------------------------------- -->
	
	<h2 class="hidden">대메뉴</h2>
	<nav id="lnb">
		<ul>
			<li>
				<a onmouseover="menuDisplay('block')" onmouseout="menuDisplay('none')">
					게임리스트
				</a>
			</li>
		</ul>
	</nav>
	
	<!-- ------------------- <popup - Menu> --------------------------------------- -->
	
	<div class="menu" onmouseover="menuDisplay2('block')" onmouseout="menuDisplay2('none')">
		<ul>
		<%for(Game g : menuList){ %>
			<li><a href="<%=g.getG_link()%>"><%=g.getG_name() %></a></li>
		<%} %>
		</ul>
	</div>
	
</header>
<script>
	var boxObj = document.querySelector(".util-search-box");
	boxObj.style.display = 'none';
</script>