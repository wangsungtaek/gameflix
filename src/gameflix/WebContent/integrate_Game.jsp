<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="gameflix.web.entity.*"
    %>
<% 
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
   
	boolean gameStart = false;

	// 병 7개
	ArrayList<Bottle> bottles = new ArrayList<Bottle>();
	
	// 병 안의 색상
	String[] colors = new String[20];
	String[] stand = { "blue", "green", "orange", "puple", "red" };
	int cnt = 0;
	for(int i=0; i<4; i++){
		for(int j=0; j<5; j++){
			colors[cnt]= stand[j];
			cnt++;
		}
	}	
 	// shuffle
 	String tmp = "";
	int[] test1 = new int[3];
	int[] test2 = new int[3];
	for(int i=0; i<3; i++){
		int ran1 = (int)(Math.random()*colors.length);
		int ran2 = (int)(Math.random()*colors.length);
		test1[i]=ran1;
		test2[i]=ran2;
		tmp = colors[ran1];
		colors[ran1] = colors[ran2];
		colors[ran2] = tmp;
	}
	
	int emptyBottle_1 = 0;
	int emptyBottle_2 = 0;
	
	do { // 빈병 2개 랜덤으로 설정
		emptyBottle_1 = (int)Math.round(Math.random()*6);
		emptyBottle_2 = (int)Math.round(Math.random()*6); 
	} while(emptyBottle_1 == emptyBottle_2);
	
	
	// 병에 색 채우기
	cnt = 0;
	for(int i=0; i<7; i++){
		if( i == emptyBottle_1 || i == emptyBottle_2 ){
			bottles.add(new Bottle("img/piece/white-1.png",
								   "img/piece/white-2.png",
								   "img/piece/white-3.png",
								   "img/piece/white-4.png"));
			bottles.get(i).setColors("white", "white", "white", "white");
		} else {
			bottles.add(new Bottle("img/piece/"+colors[cnt]+"-1.png",
								   "img/piece/"+colors[cnt+1]+"-2.png",
								   "img/piece/"+colors[cnt+2]+"-3.png",
								   "img/piece/"+colors[cnt+3]+"-4.png"));
			bottles.get(i).setColors(colors[cnt], colors[cnt+1], colors[cnt+2], colors[cnt+3]);
			cnt += 4;
		}
	}
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

<style>
body{background-image: url(img/01.jpg);}  
#game-container { height: 800px; width: 1024px; margin: 0 auto; background: whitesmoke;  text-align: center; position: relative;}
#game-container > label { margin-bottom: 50px; display: block; padding-top: 30px; vertical-align: top;}
progress { width: 300px; height: 20px; padding-top: 5px;}
#game-container > #game-area { width: 500px; padding-top: 100px; border: 0.5px solid lightgray; margin: 0 auto; border-radius: 5px;}
#game-container > #game-area > .top-area { display: flex; justify-content: center; }
#game-container > #game-area > .bottom-area { display: flex; justify-content: center; }

#game-container .bottle { padding: 20px; height: 200px;}
#game-container img { width: 40px; height: 23px; display: block; margin-bottom: -1px; }

#control { position: absolute; top: 100px; right: 30px;}
#control > .level { font-size: 50px; margin-bottom: 20px; }
#control > .score { font-size: 30px; color: red; margin-bottom: 250px; }
#control > #btn-start { background: gray; color: white; width: 200px; height: 50px; margin-top: 20px; }

</style>
<script type="text/javascript">
	window.onload = function() {
		var testObj = document.querySelectorAll("#no1 img");
	}
	var selectorMemory = "";
	var isSelector = false;
	
	function selector(no){
		
		var imgObj;
		switch(no) {
			case 1 : imgObj = document.querySelectorAll("#no1 img"); break;
			case 2 : imgObj = document.querySelectorAll("#no2 img"); break;
			case 3 : imgObj = document.querySelectorAll("#no3 img"); break;
			case 4 : imgObj = document.querySelectorAll("#no4 img"); break;
			case 5 : imgObj = document.querySelectorAll("#no5 img"); break;
			case 6 : imgObj = document.querySelectorAll("#no6 img"); break;
			case 7 : imgObj = document.querySelectorAll("#no7 img"); break;
		}

		// 첫번째 선택
		if(!isSelector) {
			var cnt = 5;
			for(var i=1; i<imgObj.length; i++){
				cnt--;
				if(imgObj[i].alt != "white") {
					selectorMemory = imgObj[i].alt;
					// 경로설정 추가예정
					/* http://localhost:7080/gameflix/img/piece/orange-4.png */
					imgObj[i].src = "http://localhost:7080/gameflix/img/piece/white-"+cnt+".png";
					imgObj[i].alt = "white";
					isSelector = true;
					break;
				}
			}
		}
		// 두번째 선택
		else {
			var cnt = 0;
			for(var i=imgObj.length-1; i>0; i--){
				cnt++;
				if(imgObj[i].alt == "white") {
					imgObj[i].alt = selectorMemory;
					imgObj[i].src = "http://localhost:7080/gameflix/img/piece/"+selectorMemory+"-"+cnt+".png";
					// 경로설정 추가예정
					selectorMemory = "";
					isSelector = false;
					break;
				}
			}
		}
		var imgAll = document.querySelectorAll(".piece");
		var result = false;
		for(var i=0; i<imgAll.length; i+=4){
			console.log(i);
			if(imgAll[i].alt == imgAll[i+1].alt && imgAll[i+1].alt == imgAll[i+2].alt && imgAll[i+2].alt == imgAll[i+3].alt) {
				result = true;
			} else {
				result = false;
				break;
			}
		}
		if(result == true){
			setTimeout(function() {
				alert(result);	
			}, 500);
		}
	}	
</script>
</head>
<!-- <body onload="showImage()"> -->
<body>
	<%@ include file="header.jsp" %>

	<div id="game-container">
		<label>Time Out <progress id="timeOut" max="10" value="3"></progress></label>
		<div id="game-area">
			<ul class="top-area">
				<li id="no1" class="bottle" onclick="selector(1)">
					<img src="<%=bottles.get(0).getLayer5()%>" alt="<%=bottles.get(0).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(0).getLayer4()%>" alt="<%=bottles.get(0).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(0).getLayer3()%>" alt="<%=bottles.get(0).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(0).getLayer2()%>" alt="<%=bottles.get(0).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(0).getLayer1()%>" alt="<%=bottles.get(0).getColor_Layer1() %>">
				</li>
				<li id="no2" class="bottle" onclick="selector(2)">
					<img src="<%=bottles.get(1).getLayer5()%>" alt="<%=bottles.get(1).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(1).getLayer4()%>" alt="<%=bottles.get(1).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(1).getLayer3()%>" alt="<%=bottles.get(1).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(1).getLayer2()%>" alt="<%=bottles.get(1).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(1).getLayer1()%>" alt="<%=bottles.get(1).getColor_Layer1() %>">
				</li>
				<li id="no3" class="bottle" onclick="selector(3)">
					<img src="<%=bottles.get(2).getLayer5()%>" alt="<%=bottles.get(2).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(2).getLayer4()%>" alt="<%=bottles.get(2).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(2).getLayer3()%>" alt="<%=bottles.get(2).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(2).getLayer2()%>" alt="<%=bottles.get(2).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(2).getLayer1()%>" alt="<%=bottles.get(2).getColor_Layer1() %>">
				</li>
			</ul>
			<ul class="bottom-area">
				<li id="no4" class="bottle" onclick="selector(4)">
					<img src="<%=bottles.get(3).getLayer5()%>" alt="<%=bottles.get(3).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(3).getLayer4()%>" alt="<%=bottles.get(3).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(3).getLayer3()%>" alt="<%=bottles.get(3).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(3).getLayer2()%>" alt="<%=bottles.get(3).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(3).getLayer1()%>" alt="<%=bottles.get(3).getColor_Layer1() %>">
				</li>
				<li id="no5" class="bottle" onclick="selector(5)">
					<img src="<%=bottles.get(4).getLayer5()%>" alt="<%=bottles.get(4).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(4).getLayer4()%>" alt="<%=bottles.get(4).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(4).getLayer3()%>" alt="<%=bottles.get(4).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(4).getLayer2()%>" alt="<%=bottles.get(4).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(4).getLayer1()%>" alt="<%=bottles.get(4).getColor_Layer1() %>">
				</li>
				<li id="no6" class="bottle" onclick="selector(6)">
					<img src="<%=bottles.get(5).getLayer5()%>" alt="<%=bottles.get(5).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(5).getLayer4()%>" alt="<%=bottles.get(5).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(5).getLayer3()%>" alt="<%=bottles.get(5).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(5).getLayer2()%>" alt="<%=bottles.get(5).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(5).getLayer1()%>" alt="<%=bottles.get(5).getColor_Layer1() %>">
				</li>
				<li id="no7" class="bottle"  onclick="selector(7)">
					<img src="<%=bottles.get(6).getLayer5()%>" alt="<%=bottles.get(6).getColor_Layer5() %>">
					<img class="piece" src="<%=bottles.get(6).getLayer4()%>" alt="<%=bottles.get(6).getColor_Layer4() %>">
					<img class="piece" src="<%=bottles.get(6).getLayer3()%>" alt="<%=bottles.get(6).getColor_Layer3() %>">
					<img class="piece" src="<%=bottles.get(6).getLayer2()%>" alt="<%=bottles.get(6).getColor_Layer2() %>">
					<img class="piece" src="<%=bottles.get(6).getLayer1()%>" alt="<%=bottles.get(6).getColor_Layer1() %>">
				</li>
			</ul>
		</div>
		<div id="control">
			<div class="level">Level.1</div>
			<div class="score">100점</div>
			<button id="btn-start" onclick="gameStart()">GAME START</button>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
</body>
</html>