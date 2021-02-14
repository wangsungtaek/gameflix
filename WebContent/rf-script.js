const gameObj = document.querySelector(".game");
const gametObj = document.querySelector(".gameTable");
const roottObj = document.querySelector(".rootTable");
const btnscore = document.querySelector(".showscore");
const btnstart = document.querySelector(".gamestart");
const btninfo = document.querySelector(".gameinfo");
const foximg = document.querySelector("#fox");



var gtC=9;
var gtR=9;
/*
var roots = [['rt63','rt64','rt65','rt56','rt47','rt38','rt29','rt30','rt31','rt32','rt41','rt50','rt51','rt60','rt69','rt70','rt71'],
['rt9','rt10','rt11','rt12','rt21','rt30','rt29','rt38','rt47','rt48','rt49','rt58','rt67','rt68','rt69','rt70','rt71'],
['rt9','rt10','rt11','rt12','rt13','rt22','rt31','rt40','rt39','rt38','rt47','rt56','rt65','rt66','rt67','rt68','rt59','rt60','rt61','rt52','rt53'],
['rt36','rt37','rt28','rt19','rt20','rt21','rt30','rt39','rt48','rt57','rt58','rt59','rt50','rt41','rt42','rt43','rt44']];
function ranRoot(){
	var ran = Math.floor(Math.random()*roots.length);
	var output=[];
	for(var i in roots[ran]){
		output[i]=roots[ran][i];
	}
	return output;
}
*/


var root=[];

var isPlaying = false;
var isHint = false;
var isInfo = false;
var score;
var anss=[];
var anss2=[];

// 게임 초기화
function gameReset(){
	for(var i in anss){	
			document.getElementById(anss[i]).style.backgroundColor="transparent";
	}
	anss=[];
	anss2=[];
	root=[];
	foximg.classList.remove("endingfox");
	score=1000;
	btnscore.innerText=score;
}

// 게임 테이블 만들기
function makegameTable(){
	gameReset();
	var gameTableCode="<tr>";
	for(var i=0; i<gtC*gtR; i++){
		if(i>0&&i%gtC==0){
			gameTableCode+="</tr><tr>";
		}
		gameTableCode+="<td id='rt"+i+"' ></td>";
	}
	gameTableCode+="</tr>";
	gametObj.innerHTML=gameTableCode;
}
window.onload = makegameTable();

// 정답만들기
function makeARoot(){
    var output= [];
    var comoutput=[];
    var r = Math.floor(Math.random()*gtC)*gtC;
    output.push('rt'+r); // 첫번째 답
    output.push('rt'+(++r)); // 두번째 답
    do {
        var ran = Math.floor(Math.random()*2-1); // -1(-9), 0(+1), 1(+9)]
        var tmp = r;
        var cA = 0; 
        var cB = 0;
        if(ran==0) {
            tmp++;
            if(tmp-10>0) cB = tmp-10;
            if(tmp+8<81) cA = tmp+8;
        } else { // 1 or -1
            if(tmp<gtC) { // 무조건 +9 만 가능 
                tmp += gtC;
                ran = 1;
            } else if(tmp>gtC*(gtR-1)){ // 무조건 -9만 가능
                tmp -= gtC;
                ran = -1;
            } else { // -1(-9), 1(+9)
                tmp += ran*gtC;
            }
        }
        cA = tmp-8*ran;
        cB = tmp-10*ran;
       // console.log('rt'+(r-1));
        if(comoutput.includes('rt'+tmp)) continue;
        r=tmp;
        output.push('rt'+r);
        comoutput.push('rt'+r);
        comoutput.push('rt'+cA);
        comoutput.push('rt'+cB);
    } while(r%gtC!=(gtC-1));
    return output;  
}

// 정답테이블만들기
function makeRootTable() {
	var rootTableCode = "<tr>";
	for (var i = 0; i < gtC * gtR; i++) {
		if (i > 0 && i % gtC == 0) {
			rootTableCode += "</tr><tr>";
		}
		rootTableCode += "<td id='rt" + i + "'></td>";
	}
	rootTableCode += "</tr>";
	roottObj.innerHTML = rootTableCode;
	root = makeARoot();
	console.log(root);
}

// 게임시작
function gameStart(){
		gameReset();
		isPlaying = true;
		makeRootTable();
		btnstart.innerText="다시시작";
}

// 게임안내
btninfo.addEventListener('click', function(){
	//if(isPlaying) return;
	if(!isInfo){
		isInfo = !isInfo;
		btninfo.innerText='닫기';
		var gameInfo = document.createElement('img');
		gameInfo.classList.add('gameInfoImg');
		gameInfo.src = 'img/rf-gameinfo.png';
		gameObj.appendChild(gameInfo);
	}else {
		isInfo=!isInfo;
		btninfo.innerText='게임안내';
		gameObj.removeChild(document.querySelector('.gameInfoImg'));
		
	}
});

// 힌트보기
function showRoot(){
	if(!isPlaying) return;
	isHint=true;
	for(var i in root){
		document.getElementById(root[i]).style.backgroundColor="#AB8212";
	}
	var rtObj = document.querySelector(".rootTable");
	rtObj.style.zIndex="0";
	scoreChange(-300);
	var timer=setTimeout(function (){
		rtObj.style.zIndex="-1";
		isHint=false;
		for(var i in root){
			document.getElementById(root[i]).style.backgroundColor="transparent";
		}
		clearTimeout(timer);
	},500);
}

// 점수 변경
function scoreChange(state){
	score+=state;
	btnscore.innerText=score;
}

gametObj.addEventListener('click', gameplay);
// 게임 플레이
var isAnswer=false;
function gameplay(e){
	if(!isPlaying) return;
	if(isHint) return;
	console.log(e.target.id);

	if(root.includes(e.target.id)){ // 정답 클릭 시
		if(anss.includes(e.target.id)) return; // 클릭 된 정답인지 확인
		e.target.style.backgroundColor="#AB8212";
		//e.target.classList.add("clicktd");
		anss.push(e.target.id);
		if(!anss2.includes(e.target.id)) { // 이미 맞췄던 정답인지 확인
			anss2.push(e.target.id);
			scoreChange(100);
		}
	} else { //오답 클릭 시
		for(var i in anss){	
			document.getElementById(anss[i]).style.backgroundColor="transparent";
			//e.target.classList.remove("clicktd");
		}
		anss=[]; // 그동안 맞춘 정답 초기화
		scoreChange(-200);
	}
	if(anss.length==root.length){ // 모든 정답 맞췄는지 확인
			foximg.classList.add("endingfox");
			var timer = setTimeout(function (){
				alert('게임종료! 총'+score+'점 수고하셨습니다!');
				isPlaying = false;
				btnstart.innerText='게임시작';
				clearTimeout(timer);
			}, 6000);
			
	}
}