<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="gameflix.web.qna.*"
	%>
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
body {
	background-image: url(img/01.jpg);
}
/* 페이지 규격 */
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
/* Q&A 테이블 */
#QnA {
	position: absolute;
	top: 170px;
	left: 50%;
	border-collapse: collapse;
	width: 700px;
	height: 400px;
	margin-left: -350px;
	text-align: center;
	font-size: 15px;
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

/* 페이지버튼 */
#btn_group {
	position: absolute;
	top: 600px;
	left: 50%;
	width: 230px;
	height: 30px;
	margin-left: -75px;
}

.btn {
	display: inline-block;
	width: 70px;
	padding: 5px;
	color: darkgray;
	border-radius: 50%;
	border: none;
	font-size: 15px;
}

#btn:hover {
	background-color: #963D2A;
	color: #fff;
}
</style>

</head>
<%

String noS = request.getParameter("no");
if (noS == null)
	noS = "1";
int no = Integer.parseInt(noS);

A01_Dao dao = new A01_Dao();
Board board = dao.getBoard(no);
String proc = request.getParameter("proc");
if(proc!=null){
	if(proc.equals("del")){
		log("삭제준비 : "+no);
		dao.deleteBoard(no);
	}
}
%>

<body>

	<div class="page">

		<!-- 헤더 -->
		<%@ include file="header.jsp"%>

		<div class="wrapper">
			<h3>공지사항</h3>
			<table id="QnA" border>
				<col width="10%">
				<col width="75%">
				<col width="15%">
				<tr>
					<th></th>
					<th><%=board.getTitle() %></th>
					<th></th>
				</tr>
				<tr>
				
					<td><%=board.getNo() %></td>
					<td id="title">
							 
								<%=board.getContent() %>
							</td>
					<td><%=board.getCredte()%></td>
				</tr>
				
			</table>

			<!-- 페이지 버튼 -->
			<div id="btn_group">
				<button class="btn" onclick="location.href='notice.jsp'">목록보기</button>
				<button class="btn" onclick="location.href='articleUpdateForm.jsp?cate=notice&no=<%=board.getNo()%>'">수정</button>
				<button class="btn" id="delbtn">삭제</button>
			</div>

		</div>
	</div>
	<!-- 하단사이트정보 -->
	<%@ include file="footer.jsp"%>
	<script>
		var delbtn = document.querySelector("#delbtn");
		var wrapper = document.querySelector(".wrapper");
		delbtn.onclick = function(){
			if(confirm("삭제하시겠습니까?")){
				var formCode = "<form method='post'><input type='hidden' name='proc' value='del'/></form>";
				wrapper.innerHTML+=formCode;
				document.querySelector("form").submit();
			}
		}
		var proc="<%=proc%>";
		if(proc=="del"){
		   alert("삭제 성공");
		   location.href='notice.jsp';
		}

	</script>
</body>
</html>