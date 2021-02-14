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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="css/default.css">
<%
%>
<style>
#section_size{
	width:1024px;
	margin-left:135px; 
	color:white;
}
#section_size2{
	height:855px;
}
#mypage_banner{
	background-color:black;
	height:20%;
	text-align:center;
}
body{
	background-image: url(img/01.jpg);
}
.badge{
	width:100%;
	height:70%;
	font-size:12pt;	
	padding-top:15px;
}
</style>
<script type="text/javascript">
function user_page(){
	location.href="UserInfo.jsp";
};
function Rank_page(){
	location.href="Mypage_Ranking.jsp";
};
</script>
</head>
<body onload="showImage()">
	<%@ include file="header.jsp" %>
	
	<%-- 마이페이지 메인 --%>
	<section class="container">
		<div class="row" id="section_size">
			<div class="col" id="section_size2">
				<!-- 마이페이지 흰색 줄 -->
				<div class="row">
					<div class="col" style="background-color:white;">　</div>
				</div>
				<!-- 마이페이지 배너 -->
				<div class="row" id="mypage_banner">
					<div class="col" style="margin-top:4%;">
						<h3>My Page</h3><br>
						<span>Home > My Page</span>
					</div>
				</div>
				<!-- 마이페이지 메뉴 -->
				<div class="row" style="background-color:black;">
					<div class="col-1"></div>
					<div class="col">
					<table class="table">
  						<tr>
  							<td style="width:20%"></td>
  							<td style="width:20%">
  								<button type="button" class="btn btn-outline-light" style="width:100%" onclick="user_page()">회원정보</button>
  							</td>
  							<td style="width:20%"></td>
  							<td style="width:20%">
  								<button type="button" class="btn btn-outline-light" style="width:100%" onclick="Rank_page()">랭킹</button>
  							</td>
  							<td style="width:20%"></td>
  						</tr>
					</table>
					<hr>
					</div>
					<div class="col-1"></div>
				</div>
				<!-- 내용컨테이너 -->
				<div class="row" style="background-color:black; height:68%;">
					<div class="col-1"></div>
					<div class="col"">
						<div class="row" style="height:12.5%; margin-top:25px; text-align:center;">
							<div class="col-3">
								<h4>회원정보 수정</h4>
							</div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">이름</span>
							</div>
							<div class="col">
								<input type="text" value="기존데이터" class="form-control">
							<hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">아이디</span>
							</div>
							<div class="col">
							<input type="text" value="기존데이터" class="form-control">
							<hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">비밀번호</span>
							</div>
							<div class="col">
							<input type="password" value="기존데이터" class="form-control">							
							<hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">이메일</span>
							</div>
							<div class="col">
							<input type="text" value="기존데이터" class="form-control">
							<hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col-3">
								<span class="badge bg-secondary">닉네임</span>
							</div>
							<div class="col">
							<input type="text" value="기존데이터" class="form-control">
							<hr></div>
						</div>
						<div class="row" style="height:12.5%;">
							<div class="col">
							</div>
							<div class="col"></div>							
							<div class="col" style="text-align:right;">
								<input class="btn btn-secondary" type="submit" value="수정완료">
							</div>
						</div>
						<div class="row" style="height:12.5%;"></div>
					</div>	
					<div class="col-1"></div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
</html>