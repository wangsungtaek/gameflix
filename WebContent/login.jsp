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
<style type="text/css">
	
	body{
		margin:0px;
		background:black;
	}

	#logo {
		position:absolute;
		top:240px;
		left:38%;
		width:400px;
		height:100px;
	}
	
	form{
		position:absolute;
		top:380px;
		left:38%;
		width:400px;
		height:300px;
		z-index:0;
	}
	
	#login_tab {
		margin:0px;
		width:400px;
		height:300px;
	}

	#login_tab tr{
		height:50px;
	}

	#login_tab th{
		font-size:50px;
		color:white;
		font-weight:200px;;
	}
	
	#login_tab input[type=text]{
		width:95%;
		height:50px;
		border-color:white;
		font-size:15px;
		border-radius:10px;
		padding-left:10px;
	}
	#login_tab input[type=password]{
		width:95%;
		height:50px;
		border-color:white;
		font-size:15px;
		border-radius:10px;
		padding-left:10px;
	}
	
	#login_button{
		background-color:red;
		border:1px solid red;
		font-size:20px;
		font-weight:bold;
		color:white;
		width:100%;
		height:50px;
		border-radius:10px;
		padding:0px;
	}	

	.bottom_button{
		background-color:#f2f2f2;
		border-color:#f2f2f2;
		font-size:15px;
		font-weight:bold;
		color:black;
		width:100%;
		height:50px;
		border-radius:10px;
		padding:0px;
	}



</style>
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
	<!-- 로고 이미지 -->
	<img src="img/logo.png" id="logo">
	<!-- 로그인 폼 -->
	<form> 
		<table id="login_tab">
			<col width="33%"><col width="33%"><col width="33%">
			<tr><th colspan="3">LOGIN</th></tr>
			<tr><td colspan="3"><input type="text" name="id" placeholder="ID를 입력하세요"></td></tr>
			<tr><td colspan="3"><input type="password" name="pass" placeholder="PASSWORD를 입력하세요"></td></tr>
			<tr><td colspan="3"><a href="main.jsp"><input type="button" value="LOGIN" id="login_button"></a></td></tr>
			<tr><td><a href="join.jsp"><input type="button" value="회원가입" class="bottom_button"></a></td>
				<td><a href="idfind.jsp"><input type="button" value="아이디 찾기" class="bottom_button"></a></td>
				<td><a href="passfind.jsp"><input type="button" value="비밀번호 찾기" class="bottom_button"></a></td></tr>
		</table>
	</form>
</body>
</html>