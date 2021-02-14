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
<title>Gameflex | 2048</title>
<link rel="stylesheet" href="default.css">
<style>

body{
	background-color : #000;
}


td{
	border-radius : 12px;
	text-align : center;
	font-size : 20px;
	font-weight : bold;
	color : #fff;
	width : 85px;
	height : 85px;
	background-color : #dff7ed;
	border : 3px solid #002200;
	margin : 5px;
}

#head{
	width : 300px;
	height : 20px;
	margin-left : 600px;
	margin-top : 100px;	
}

#titleZone{
	width : 150px;
	height : 20px;
	background-color : #000;
	margin : 0px;
}

#title{
	color : #fff;
	font-size : 50px;
	font-weight : bold;
	padding: 0px;
    margin: 0px;
}

#scoreZone{
	width : 150px;
	height : 20px;
	background-color : #056350;
	margin-left : 30px;
	padding : 0px;
}

#scoreTitle{
	margin : 0px;
	font-size : 20px;
	color : #fff;
}

#score{
	color : #fff;
	margin : 0px;
	font-size : 30px;
}

#board{
	position : absolute;
	border : 2px solid #002200;
	width : 350px;
	margin-left : 580px;
	margin-top : 20px;
}


</style>
<script>
	window.onload = function(){

	};
</script>
</head>
<body>
<%@ include file="header.jsp" %>

		<table id="head">
			<tr>
				<td id= "titleZone"> 
					<p id="title">2048</p>
				</td>
				<td id= "scoreZone">
					<p id="scoreTitle">Score</p>
					<p id="score"></p>
				</td>
			</tr>
		</table>
		
	
		<table id="board" border>
			<tr><td id="00"></td><td id="01"></td><td id="02"></td><td id="03"></td></tr>
			<tr><td id="10"></td><td id="11"></td><td id="12"></td><td id="13"></td></tr>
			<tr><td id="20"></td><td id="21"></td><td id="22"></td><td id="23"></td></tr>
			<tr><td id="30"></td><td id="31"></td><td id="32"></td><td id="33"></td></tr>
		</table>
	
</body>
<script>
	
	var board = Array(Array(0,0,0,0),Array(0,0,0,0),
		 			  Array(0,0,0,0),Array(0,0,0,0));
	var tableID = Array(Array("00","01","02","03"),Array("10","11","12","13"),
						Array("20","21","22","23"),Array("30","31","32","33"));		
	var score;
	
	// 방향키 입력
	document.onkeydown = keyDownEventHandler;
	function keyDownEventHandler(e){
		switch(e.keyCode){
			case 38 : rotateDir(0); break; // up
			case 40 : rotateDir(1); break; // down
			case 37 : rotateDir(2); break; // left
			case 39 : rotateDir(3); break; // right
		}
	}
	
	// 초기숫자 생성
	init();
	function init(){
		score = 0;
		for(var i=0; i<4; i++){
			for(var j=0; j<4; j++){
				board[i][j] = 0;
			}
		}
		for(var i=0; i<2; i++){
			var spot = parseInt(Math.random()*16);
			var y = parseInt(spot/4);
			var x = spot % 4;
			if(board[y][x] == 0){
				board[y][x] = getNewNum();
			} else{
				i--;
			}
		}
		update();
	}
	// 게임화면 구현
	function update(){
	    for(var i=0;i<4;i++){
	        for(var j=0;j<4;j++){
	            var cell = document.getElementById(tableID[i][j]);
	            cell.innerHTML = board[i][j]==0?"":board[i][j];
	            coloring(cell);
	        }
	    }
	   	 document.getElementById("score").innerHTML=score;
	}
	
	// 숫자생성
	function generate(){
		var zero = 0;
		for(var i=0; i<4;i++){
			for(var j=0; j<4; j++){
				if(board[i][j] == 0){
					zero++;
				}
			}
		}
		while(true){
			for(var i=0; i<4;i++){
				for(var j=0; j<4; j++){
					if(board[i][j] == 0){
						var spot = parseInt(Math.random()*zero);
						if(spot==0){
							board[i][j] = getNewNum();
							return;
						}
					}		
				}
			}
		}
	}
	// 숫자생성 확률
	function getNewNum(){
		var spot = parseInt(Math.random()*10);
		if(spot == 0) return 4;
		return 2;
		
	}
	
	// 번호별 색칠
	function coloring(cell){
		var cellNum = parseInt(cell.innerHTML);
		switch(cellNum){
			case 0: 
			case 2 : 
				cell.style.color = "#002200";
				cell.style.background = "#dff7ed";
				break;
			case 4 : 
				cell.style.color = "#002200";
				cell.style.background = "#a9f5d5";
				break;
			case 8 : 
				cell.style.color = "#002200";
				cell.style.background = "#5cf2b2";
				break;
			case 16 : 
				cell.style.color = "#002200";
				cell.style.background = "#13cf7e";
				break;
			case 32 : 
				cell.style.color = "#002200";
				cell.style.background = "#0fd4c7";
				break;
			case 64 : 
				cell.style.color = "#fff";
				cell.style.background = "#08b8cc";
				break;
			case 128 : 
				cell.style.color = "#fff";
				cell.style.background = "#058896";
				break;
			case 256 : 
				cell.style.color = "#fff";
				cell.style.background = "#087dd1";
				break;
			case 512 : 
				cell.style.color = "#fff";
				cell.style.background = "#04558f";
				break;
			case 1024 : 
				cell.style.color = "#fff";
				cell.style.background = "#04558f";
				break;
			case 2048 : 
				cell.style.color = "#fff";
				cell.style.background = "#081c5e";
				break;
			default:
				if(cellNum > 2048){
					cell.style.color = "#fff";
					cell.style.background = "#081c5e";
				} else {
					cell.style.color = "#002200";
					cell.style.background = "#dff7ed";
				}
			break;
		}
	}
	// 숫자 이동
	function move(){
		var isMoved = false;
		var isAdded = Array(Array(0,0,0,0),Array(0,0,0,0),
				  	  Array(0,0,0,0),Array(0,0,0,0));
		for(var i=1; i<4; i++){
			for(var j=0; j<4; j++){
				if(board[i][j]==0) continue;
				var upperY = i-1;
				while(upperY>0 && board[upperY][j]==0 ) upperY--;
				// 윗칸이 0일 때
				if(board[upperY][j]==0){
					board[upperY][j] = board[i][j];
					board[i][j]=0;
					isMoved = true;
				// 윗칸에 현재칸과 다른 숫자가 있을 때
				} else if(board[upperY][j] != board[i][j]){
					if(upperY+1 == i) continue;
					board[upperY+1][j] = board[i][j];
					board[i][j]=0;
					isMoved = true;
				// 윗칸에 같은 숫자가 있을 때
				} else{
					// 윗칸이 비어있을 때
					if(isAdded[upperY][j]==0){
						board[upperY][j]*=2;
						score += board[upperY][j];
						board[i][j]=0;
						isAdded[upperY][j] = 1;
						isMoved=true;
					// 윗칸이 채워져있을 때	
					} else{
						board[upperY+1][j]=board[i][j];
						board[i][j]=0;
						isMoved=true;
					}
				}
			}
		}
		if(isMoved) {
			generate();
		} else {
			checkGameOver();
		}
	}
	
	// 방향별 보드회전
	function rotateDir(opt){
		switch(opt){
			case 0 : move(); break;
			case 1 : rotate(2); move(); rotate(2); break;
			case 2 : rotate(1); move(); rotate(3); break;
			case 3 : rotate(3); move(); rotate(1); break;
		}
		update();
	}
	
	// 보드 회전
	function rotate(n){
		while(n--){
			var tmpBoard = Array(Array(0,0,0,0),Array(0,0,0,0),
				  	 	   Array(0,0,0,0),Array(0,0,0,0));
			for(var i=0; i<4; i++){
				for(var j=0; j<4; j++){
					tmpBoard[i][j] = board[i][j];
				}
			}
			for(var i=0; i<4; i++){
				for(var j=0; j<4; j++){
					board[j][3-i] = tmpBoard[i][j];
				}
			}
		}
	}		
	
	// 게임 종료체크
	function checkGameover(){
		for(var i=0; i<4; i++){
			var colcheck = board[i][0];
			if(colcheck == 0) return;
			for(var j=1; j<4; j++){
				if(board[i][j] == colcheck 
							|| board[i][j] == 0) return;
				else colcheck = board[i][j];
			}
		}
		for(var i=0; i<4; i++){
			var rowcheck = board[0][i];
			if(rowcheck == 0) return;
			for(var j=1; j<4; j++){
				if(board[j][i] == rowcheck 
							|| board[j][i] == 0) return;
				else rowcheck = board[j][i];
			}
		}
		gameover();
	}
	
	// 게임 종료
	function gameover(){
		alert("GAME OVER\nSCORE : "+score);
		init();
	}
	
	
</script>
</html>














