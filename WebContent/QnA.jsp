<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.util.*" import="gameflix.web.service.*" import="gameflix.web.entity.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<style>
body {
	background-image: url(img/01.jpg);
}
/*
// 페이지 규격 
.wrapper {
	width: 1024px;
	height: 700px;
	background-color: white;
	margin: 0 auto;
}

h3 {
	position: absolute;
	top: 110px;
	left: 50%;
	margin-left: -50px;
	color: #963D2A;
}
// Q&A 테이블
#QnA {
	position: absolute;
	top: 170px;
	left: 50%;
	border-collapse: collapse;
	width: 700px;
	height: 400px;
	margin-left: -350px;
	text-align: center;
	font-size: 12px;
}

#QnA th {
	background-color: #963D2A;
	color: #fff;
	height: 30px;
}

#QnA #title {
	text-align: left;
	padding-left: 10px;
}

// 페이지버튼 
#btn_group {
	position: absolute;
	top: 600px;
	left: 50%;
	width: 150px;
	height: 30px;
	margin-left: -75px;
}

#btn {
	display: inline-block;
	width: 25px;
	padding: 5px;
	color: darkgray;
	border-radius: 50%;
	border: none;
	font-size: 16px;
}

#btn:hover {
	background-color: #963D2A;
	color: #fff;
} */
/* 페이지 규격 */
.wrapper {
	width: 1024px;
	background-color: white;
	margin: 0 auto;
	padding:20px 150px;
}

h2 {
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
	ArrayList<Article> alist = as.getArticlePage("qna",pageNum);
	int pCnt = as.getPageCnt("qna") / 10+1;
%>
<body>

	<div class="page">

		<!-- 헤더 -->
		<%@ include file="header.jsp"%>

		<div class="wrapper">
			<h2>자주묻는질문</h2>
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
							<a href="QnA_detail.jsp?no=<%=a.getNo()%>">
							<%=a.getTitle() %>
							</a>
						</td>
						<td><%=a.getCredte() %></td>
					</tr>
				<%	} %>
				</table>

			<!-- 페이지 버튼 -->
			<div class="btn_group">
				<%	for(int i=1; i<=pCnt; i++) { %>
				<button class="btn" type="button" onclick="location.href='QnA.jsp?p=<%=i%>'"><%=i %></button>
				<%} %>
				<input type="button" class="button" value="글작성" onclick="location.href='articleform.jsp?cate=QnA'"/>
			</div>

		</div>
	<!-- 하단사이트정보 -->
	<%@ include file="footer.jsp"%>
	</div>
</body>
</html>