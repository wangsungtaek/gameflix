<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspExp.z01_vo.*"%>
<% request.setCharacterEncoding("UTF-8"); 
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta meta http-equiv="Content-Type" charset="UTF-8">
<title>Gameflex</title>
<link rel="stylesheet" href="default.css">
<style>
	
	body{
	background : black;
	margin : 0px;
	padding : 0px;
	height : 900px;
	}
	
   .contents-wrap {
   min-height:100%;
   position:relative;
   }
	
	#title{
	color : #F23005;
	position : absolute;
	font-size : 35px;
	font-weight : bold;	
	margin-left : 680px;
	margin-top : 70px;
	
	}
	
	#gameBtn{
	   position : absolute;
	   top : 150px;
	   left : 50%;
	   margin-left : -350px;
	
	}
	
	#gameBtn input{
	   background-color: #000;
	   border: none;
 	   color: #fff;
 	   opacity : 0.7;
 	   padding: 10px 24px;
 	   cursor: pointer;
	}

	#gameBtn input:hover{
	   background-color: #F23005;
  	   color: #fff;
  	   opacity : 1.0;
  	   font-weight : bold;
	}		

   #game1_rank{
   	  display:block;    
   	  position :absolute; 
	  top : 220px; 
	  left : 50%; 
	  border-collapse :collapse;	  	  
	  margin-left :-330px; 
	  text-align :center;
	  font-size :12px; 
	  color :#fff;  
   }
   
   #game2_rank, #game3_rank, #game4_rank, #game5_rank, #game6_rank{
   	  display:none;    
   	  position :absolute; 
	  top : 220px; 
	  left : 50%; 
	  border-collapse :collapse;	  	  
	  margin-left :-330px; 
	  text-align :center;
	  font-size :12px; 
	  color :#fff;  
   }
    th {
   	  background-color : #F23005;
   	  width : 220px;
   	  height : 30px;
   	}
   	td{
   	  height :40px; 
   	  border-bottom : 0.5px solid #fff;
   	}
   	/* 페이지버튼 */
   #btn_group{
  	  position : absolute;
      top : 700px;
	  left : 50%;
	  width : 150px;
	  height : 30px;
      margin-left: -75px;
      padding-bottom : 200px;
   }     
   #btn{  	     	  
   	  display : inline-block;
   	  width : 25px;  	  
   	  padding : 5px;
      color : darkgray;
      border-radius : 50%;
      border : none;
      font-size : 16px;
   }  
   #btn:hover{
   	  background-color : #F23005;
   	  color : #fff;
   }
</style>
<script>
	window.onload = function(){
	};
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class = "contents-wrap">

	    <div id="title">RANKING</div>      
	     
		<div>
	      <form id="gameBtn">
	         <!-- 클릭 시 게임별 랭킹 테이블 보이기 -->
	         <input type="button" value="카드게임" onclick="game1()">
	         <input type="button" value="퀴즈게임" onclick="game2()">
	         <input type="button" value="2048게임" onclick="game3()">
	         <input type="button" value="테트리스게임" onclick="game4()">
	         <input type="button" value="음료통합게임" onclick="game5()">
	         <input type="button" value="길찾기게임" onclick="game6()">         
	      </form>
	   </div>
	       
	   <div id="game_rank">
	     	 <table id="game1_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<tr><td>1</td> <td>game1_user1</td> <td>123</td></tr>
	     		<tr><td>2</td> <td>game1_user2</td> <td>123</td></tr>
	     		<tr><td>3</td> <td>game1_user3</td> <td>123</td></tr>
	     		<tr><td>4</td> <td>game1_user4</td> <td>123</td></tr>
	     		<tr><td>5</td> <td>game1_user5</td> <td>123</td></tr>
	     		<tr><td>6</td> <td>game1_user6</td> <td>123</td></tr>
	     		<tr><td>7</td> <td>game1_user7</td> <td>123</td></tr>
	     		<tr><td>8</td> <td>game1_user8</td> <td>123</td></tr>
	     		<tr><td>9</td> <td>game1_user9</td> <td>123</td></tr>
	     		<tr><td>10</td> <td>game1_user10</td> <td>123</td></tr>  		
	     	 </table> 
	    	 
	     	 <table id="game2_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<tr><td>1</td> <td>game2_user1</td> <td></td></tr>
	     		<tr><td>2</td> <td>game2_user2</td> <td></td></tr>
	     		<tr><td>3</td> <td>game2_user3</td> <td></td></tr>
	     		<tr><td>4</td> <td>game2_user4</td> <td></td></tr>
	     		<tr><td>5</td> <td>game2_user5</td> <td></td></tr>
	     		<tr><td>6</td> <td>game2_user6</td> <td></td></tr>
	     		<tr><td>7</td> <td>game2_user7</td> <td></td></tr>
	     		<tr><td>8</td> <td>game2_user8</td> <td></td></tr>
	     		<tr><td>9</td> <td>game2_user9</td> <td></td></tr>
	     		<tr><td>10</td> <td>game2_user10</td> <td></td></tr>  		
	     	 </table> 
	     	 
	     	 <table id="game3_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<tr><td>1</td> <td>game3_user1</td> <td></td></tr>
	     		<tr><td>2</td> <td>game3_user2</td> <td></td></tr>
	     		<tr><td>3</td> <td>game3_user3</td> <td></td></tr>
	     		<tr><td>4</td> <td>game3_user4</td> <td></td></tr>
	     		<tr><td>5</td> <td>game3_user5</td> <td></td></tr>
	     		<tr><td>6</td> <td>game3_user6</td> <td></td></tr>
	     		<tr><td>7</td> <td>game3_user7</td> <td></td></tr>
	     		<tr><td>8</td> <td>game3_user8</td> <td></td></tr>
	     		<tr><td>9</td> <td>game3_user9</td> <td></td></tr>
	     		<tr><td>10</td> <td>game3_user10</td> <td></td></tr>  		
	     	 </table> 
	     	 
	     	 <table id="game4_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<tr><td>1</td> <td>game4_user1</td> <td></td></tr>
	     		<tr><td>2</td> <td>game4_user2</td> <td></td></tr>
	     		<tr><td>3</td> <td>game4_user3</td> <td></td></tr>
	     		<tr><td>4</td> <td>game4_user4</td> <td></td></tr>
	     		<tr><td>5</td> <td>game4_user5</td> <td></td></tr>
	     		<tr><td>6</td> <td>game4_user6</td> <td></td></tr>
	     		<tr><td>7</td> <td>game4_user7</td> <td></td></tr>
	     		<tr><td>8</td> <td>game4_user8</td> <td></td></tr>
	     		<tr><td>9</td> <td>game4_user9</td> <td></td></tr>
	     		<tr><td>10</td> <td>game4_user10</td> <td></td></tr>  		
	     	 </table> 
	     	 
	     	 <table id="game5_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<tr><td>1</td> <td>game5_user1</td> <td></td></tr>
	     		<tr><td>2</td> <td>game5_user2</td> <td></td></tr>
	     		<tr><td>3</td> <td>game5_user3</td> <td></td></tr>
	     		<tr><td>4</td> <td>game5_user4</td> <td></td></tr>
	     		<tr><td>5</td> <td>game5_user5</td> <td></td></tr>
	     		<tr><td>6</td> <td>game5_user6</td> <td></td></tr>
	     		<tr><td>7</td> <td>game5_user7</td> <td></td></tr>
	     		<tr><td>8</td> <td>game5_user8</td> <td></td></tr>
	     		<tr><td>9</td> <td>game5_user9</td> <td></td></tr>
	     		<tr><td>10</td> <td>game5_user10</td> <td></td></tr>  		
	     	 </table> 
	     	 
	     	 
	     	 <table id="game6_rank" border>
	     	 	<col width="33%"><col width="33%"><col width="34%">
	     		<tr><th>순위</th><th>닉네임</th><th>점수</th></tr>
	     		<tr><td>1</td> <td>game6_user1</td> <td></td></tr>
	     		<tr><td>2</td> <td>game6_user2</td> <td></td></tr>
	     		<tr><td>3</td> <td>game6_user3</td> <td></td></tr>
	     		<tr><td>4</td> <td>game6_user4</td> <td></td></tr>
	     		<tr><td>5</td> <td>game6_user5</td> <td></td></tr>
	     		<tr><td>6</td> <td>game6_user6</td> <td></td></tr>
	     		<tr><td>7</td> <td>game6_user7</td> <td></td></tr>
	     		<tr><td>8</td> <td>game6_user8</td> <td></td></tr>
	     		<tr><td>9</td> <td>game6_user9</td> <td></td></tr>
	     		<tr><td>10</td> <td>game6_user10</td> <td></td></tr>  		
	     	 </table> 
	     </div> 
	     <!-- 페이지 버튼 -->
	     <div id="btn_group">
		    <button id="btn">1</button>  
		    <button id="btn">2</button>  
		    <button id="btn">3</button>  
		    <button id="btn">4</button>  
		    <button id="btn">5</button>  
	     </div>  
     </div>    
	
	<%@ include file="footer.jsp" %> 
</body>
<script type="text/javascript">

	function game1() {
		var show = document.getElementById("game1_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}	
	function game2() {
		var show = document.getElementById("game2_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game3() {
		var show = document.getElementById("game3_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game4() {
		var show = document.getElementById("game4_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game5() {
		var show = document.getElementById("game5_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}
	function game6() {
		var show = document.getElementById("game6_rank");
			if(show.style.display == 'none'){
				show.style.display = 'block';				
			} else{
				show.style.display = 'none';
			}
	}	
</script>
</html>