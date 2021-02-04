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
<style>
.hidden { overflow: hidden; position: absolute; top: -9999px; left: -9999px; width: 1px; height: 0;}
#main-head { background-image: url(img/01.jpg);
			 padding: 20px 0 0 20px; position: relative; height: 80px;}
#main-head > .util { background: transparent; position: absolute; top:0px; right:0px;}
#main-head > .util > .util-list { display: flex;}
#main-head > .util > .util-list a {padding: 20px;}
#main-head > .util > .util-search { position: absolute; left:-250px; top: 17px;}
#main-head > h1 img { width:150px;}

#main-head > #lnb { position: relative; left: 180px; bottom: 90px;}
#main-head > #lnb ul { display: flex; margin-top: 50px; width: 500px; }
#main-head > #lnb li { background: transparent; width: 16.666%; transition: 0.5s;
					   border-radius: 20px; flex-shrink: 0; }
#main-head > #lnb li:hover { width:18%; background-color: rgba(220, 20, 60, 0.478); }
#main-head > #lnb a { padding: 10px; font-size: 14px; color: white;
					  display: block; text-align: center;}
#main-head > #lnb a:hover { color: rgb(220, 220, 220);}

/* .menu .menu-item .menu-link {
    padding:1em;
    font-size:1.2rem;
    font-weight:bold;
    color:#555;
    display:block;
    text-decoration:none;
    text-align:center;
}
.menu .menu-item .menu-link:hover {
    color:white;
} */

</style>
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
	<!-- header -->
	<header id="main-head">
		<h1><a href="#"><img src="img/logo.png" alt="gameflix"></a></h1>
		<h2 class="hidden">유틸메뉴</h2>
		<div class="util">
			<ul class="util-list">
				<li><a href="#">LOGOUT</a></li>
				<li><a href="#">MYPAGE</a></li>
				<li><a href="#"><i class="fas fa-search"></i></a>
			</ul>
			<div class="util-search">
				<div class="util-search-box">
					<label for="search_total" class="hidden">검색어</label>
					<input type="text" id="search_total" title="검색어 입력">
					<button id="search_total_button">
						<i class="fas fa-search"></i>
					</button>
					<button class="util-close">
						<i class="fas fa-times"></i>
					</button>
				</div>
			</div>
		</div>
		<h2 class="hidden">대메뉴</h2>
		<nav id="lnb">
			<ul>
				<li><a href="#">게임1</a></li>
				<li><a href="#">게임2</a></li>					
				<li><a href="#">게임3</a></li>					
				<li><a href="#">게임4</a></li>
				<li><a href="#">게임5</a></li>
				<li><a href="#">게임6</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>