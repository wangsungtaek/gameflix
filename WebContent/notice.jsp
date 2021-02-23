<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="gameflix.web.service.*" import="gameflix.web.entity.*" %>
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
	background-color: white;
	margin: 0 auto;
	padding:20px 150px;
}

.wrapper h2 {
	text-align:center;
	color: #963D2A;
	padding: 25px 0;
}

/* 공지 테이블 */
#notice {
	border-collapse: collapse;
	text-align: center;
	font-size: 15px;
	width:100%;
	padding-bottom:10px;
	border-bottom:2px solid darkgray;
}

#notice #title {
	text-align: left;
	padding-left: 10px;
}

#notice th {
	background-color: #963D2A;
	color: #fff;
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
.btn_group {
	height: 50px;
	text-align:center;
	position:relative;
	padding-top:15px;
}

.btn {
	width:25px;
	padding:5px;
	color: darkgray;
	border-radius:50%;
	border:none;
	font-size: 16px;
}
.btn:hover {
	background-color: #963D2A;
	color: #fff;
}
/* 추가 css */
.button {
	width:80px; height:25px; background:#963D2A; border-radius:3px;
	color:white; border:none; /*padding:3px 8px;*/ font-size:14px; font-weight:bold;
	cursor:pointer; position:absolute; right:0px;
}
.button:hover { text-decoration:underline; background:#AC3D2A; }
#notice tr { height:45px; }
#no-title { padding-left:15px; text-align:left; }


</style>
</head>
<%
	int pageNum = 1;
	String pageNumS = request.getParameter("p");
	if(pageNumS!=null) pageNum = Integer.parseInt(pageNumS);
	ArticleService as = new ArticleService();
	ArrayList<Article> alist = as.getArticlePage("notice",pageNum);
	int pCnt = as.getPageCnt("notice") / 10+1;

/*	int pageBC = 0;
	int pageBS = 0;
	if(pCnt%5==0){
		pageBC = 5;
	} else {
		pageBC = pCnt%5;
	}
	if(pageNum%5==0){
		pageBS = pageNum-5;
	}else{
		pageBS = (pageNum/5)*5;
	}
	log("pageBS:"+pageBS);
	log("pageBC:"+pageBC); */
%>
<body>
<!-- <div class="page"> -->	
		<!-- 헤더 -->
		<%@ include file="header.jsp"%>
		<div class="wrapper">
			<h2>공지사항</h2>
				<table id="notice">
					<col width="85%">
					<col width="15%">
					<tr>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				<%	for(Article a:alist) { %>
					<tr>
						<td id="no-title">
							<a href="notice_detail.jsp?no=<%=a.getNo()%>">
							<%=a.getTitle() %>
							</a>
						</td>
						<td><%=a.getCredte() %></td>
					</tr>
				<%	} %>
<%--				<tr>
						<td id="no-title"><a href="notice_detail.html">GAMEFLIX
								서비스가 새롭게 개편되었습니다.</a></td>
						<td>2021-02-08</td>
					</tr>
 					<tr>
						<td id="no-title"><a href="notice_detail.html">캠페인참여 개편 안내</a></td>
						<td>2021-02-07</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">결제 서비스 장애에 대하여
								사과드립니다.</a></td>
						<td>2021-02-05</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">GAMEFLIX 새로운 모습으로
								찾아갑니다.</a></td>
						<td>2021-02-03</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">포인트 만료일자 안내</a></td>
						<td>2021-02-02</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">2월 1일(월) GAMEFLIX
								정기점검 안내</a></td>
						<td>2021-01-30</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">2020 GAMEFLIX 소득공제
								안내</a></td>
						<td>2021-01-25</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">1월 이벤트 당첨자 발표</a></td>
						<td>2021-01-24</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">GAMEFLIX 세부운영 공지</a></td>
						<td>2021-01-22</td>
					</tr>
					<tr>
						<td id="no-title"><a href="notice_detail.html">GAMEFLIX 홈페이지 오픈 공지</a></td>
						<td>2021-01-21</td>
					</tr> --%>
				</table>

			<!-- 페이지 버튼 -->
			<div class="btn_group">
				
				
				<%	for(int i=1; i<=pCnt; i++) { %>
				<button class="btn" type="button" onclick="location.href='notice.jsp?p=<%=i%>'"><%=i %></button>
				<%} %>
<%--			
				<button class="btn" id="lbtn" type="button">〈</button>
				<%for(int i=1; i<=pageBC; i++) {%>
				<button class="btn" type="button" onclick="location.href='notice.jsp?p=<%=pageBS+i %>'"><%=pageBS+i %></button>
				<%} %>
				<button class="btn" id="rbtn" type="button">〉</button>
	 --%>
<%-- 			<button id="btn">1</button>
				<button id="btn">2</button>
				<button id="btn">3</button>
				<button id="btn">4</button>
				<button id="btn">5</button>--%>
				
				<input type="button" class="button" value="글작성" onclick="location.href='articleform.jsp?cate=notice'"/>
			</div>

		</div>

		<!-- 하단사이트정보 -->
		<%@ include file="footer.jsp"%>
<!-- 	  </div> -->
	<script>
		const lbtn = document.querySelector("#lbtn");
		const rbtn = document.querySelector("#rbtn");
		var pcnt = <%=pCnt %>;
		var pNum = <%=pageNum%>;
		console.log(1+5*(Math.floor(pNum/5)+1));
		lbtn.addEventListener('click', function(){
			if(pcnt<6 || pNum==pcnt) return;
			//pNum = 1+5*(Number(pNum/5)+1);
		});
		rbtn.addEventListener('click', ()=>{
			if(pcnt<6 || pNum==pcnt) return;
			pNum = 1+5*(Math.floor(pNum/5)+1);
			location.href="notice.jsp?p="+pNum;
		});
		
	</script>
</body>
</html>