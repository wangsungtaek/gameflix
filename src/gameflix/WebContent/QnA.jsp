<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
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

/* 페이지버튼 */
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
}
</style>
</head>
<body>

	<div class="page">

		<!-- 헤더 -->
		<%@ include file="header.jsp"%>

		<div class="wrapper">
			<h3>자주묻는 질문</h3>

			<table id="QnA" border>
				<col width="10%">
				<col width="75%">
				<col width="15%">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td>10</td>
					<td id="title"><details>
							<summary> 현재 품절된 상품은 언제 입고 되나요? </summary>
							<p>
								품절된 상품의 입고 일정은 상품별로 상이합니다.<br> 번거로우시겠지만 구매 희망하시는 상품의 이름과 수량
								확인 후, 하단의 고객센터로 문의 남겨주시면 최대한 빠르게 입고 일정을 확인 도와드리겠습니다. <br> <br>
								※ 상품에 따라 입고 일정 확인이 어려운 경우가 발생할 수 있습니다.
							</p>
						</details></td>
					<td>2021-02-08</td>
				</tr>
				<tr>
					<td>9</td>
					<td id="title"><details>
							<summary> 제품을 받지 못했는데 배송완료로 되어있어요 </summary>
							<p>
								수령인 부재 시, 택배사가 경비실 또는 이웃 등에게 임의 배송 후 ‘배송 완료’로 표시하거나, <br>
								배송 물량 폭주로 인하여 택배사에서 배송 전 배송 시스템에 ’배송 완료’로 선 등록 후 <br> 당일
								중으로 배송하는 경우가 간혹 발생하고 있습니다. <br> 송장 조회를 통해 확인되는 담당 배송 사원
								연락처로 문의하시면 정확한 안내가 가능합니다. <br>
							</p>
						</details></td>
					<td>2021-02-07</td>
				</tr>
				<tr>
					<td>8</td>
					<td id="title"><details>
							<summary> 배송조회를 했는데, 운송장번호 확인이 되지 않아요 </summary>
							<p>
								물건이 출고된 이후, 택배사에 도착했으나 분류작업을 하지 않은 상황이라면 <br> 정상적으로 운송장 번호
								조회가 되지 않을 수 있습니다. <br> 출고 다음 날 다시 한번 확인을 부탁드리며, <br>
								출고일 이후 2일 이상 지속적으로 확인이 되지 않을 경우 에코빈 고객센터로 문의 부탁드립니다.
							</p>
						</details></td>
					<td>2021-02-05</td>
				</tr>
				<tr>
					<td>7</td>
					<td id="title"><details>
							<summary> 해외도 배송이 되나요? </summary>
							<p>
								아쉽게도 배송은 국내에 한해 진행이 가능합니다.<br> 보다 빠른 시일 내에 해외 배송까지 진행 가능하도록
								노력하는 에코빈이 되겠습니다.<br>
							</p>
						</details></td>
					<td>2021-02-03</td>
				</tr>
				<tr>
					<
					<td>6</td>
					<td id="title"><details>
							<summary> 상품을 교환하고 싶어요 </summary>
							<p>
								교환 신청은 배송 완료 후 7일 이내에 가능합니다. (주문 제작 상품 제외)<br> 고객센터를 통해 문의
								남겨주시면 확인 도와드리겠습니다. <br>
							</p>
						</details></td>
					<td>2021-02-02</td>
				</tr>
				<tr>
					<td>5</td>
					<td id="title"><details>
							<summary> 결제수단을 변경하고 싶어요 </summary>
							<p>
								에코빈에서는 주문 이후 결제수단 변경이 불가합니다.<br> 결제수단 변경을 위해서는 기존 결제건 취소 후
								재 결제를 진행해 주셔야 하며, <br> 이 과정에서 상품이 이중 출고되지 않도록 확인이 필요합니다. <br>
							</p>
						</details></td>
					<td>2021-01-30</td>
				</tr>
				<tr>
					<td>4</td>
					<td id="title"><details>
							<summary> 상품을 주문했는데 왜 품절이 되나요? </summary>
							<p>
								하비인더박스 내 주문이 동시다발적으로 이루어지다 보니, 정상적으로 주문은 되었으나 <br> 공급업체의
								사정에 의해 해당 상품이 갑자기 품절되는 경우가 간혹 발생합니다. <br> 최대한 주문 후 품절이 발생하지
								않도록 노력하고 있으나 위와 같이 예외적인 품절이 발생하는 경우,<br> 연락을 통해 정확한 상황 안내를
								제공해드리겠습니다.<br>
							</p>
						</details></td>
					<td>2021-01-25</td>
				</tr>
				<tr>
					<td>3</td>
					<td id="title"><details>
							<summary> 무통장입금 시 입금자명을 다르게 기재했어요 </summary>
							<p>
								주문하실 때 기재하신 입금자명으로 입금해 주셔야 자동 입금 확인이 됩니다. <br> 다른 성함으로
								입금하셨을 경우, 고객센터를 통해 주문번호 및 입금 정보를 알려주시면 <br> 직접 확인 및 주문 완료
								처리까지 도와드리겠습니다.<br>
							</p>
						</details></td>
					<td>2021-01-24</td>
				</tr>
				<tr>
					<td>2</td>
					<td id="title"><details>
							<summary> 적립금을 사용해 결제 후 취소하는 경우, 어떻게 처리되나요? </summary>
							<p>
								적립금으로만 구매를 하셨을 경우에는 회원님의 아이디에 적립금으로 환불이 됩니다.<br> 적립금과 다른 결제
								수단을 동시에 이용했다면, 적립금은 회원님의 아이디로 환불되며 <br> 나머지 결제금액은 결제방식에 따라
								결제 취소 또는 무통장 환불 처리가 됩니다.<br>
							</p>
						</details></td>
					<td>2021-01-22</td>
				</tr>
				<tr>
					<td>1</td>
					<td id="title"><details>
							<summary> 입점 신청하고 싶어요 </summary>
							<p>
								에코빈은 다양한 상품의 입점을 언제나 환영하고 있습니다.<br> 간단한 상품 소개와 사진을 포함하여 입점
								신청 메일을 보내주시면 빠르게 확인 후 답변드리겠습니다. <br> <br> <b>입점 신청
									메일 : ecobean@naver.com</b><br>
							</p>
						</details></td>
					<td>2021-01-21</td>
				</tr>
			</table>

			<!-- 페이지 버튼 -->
			<div id="btn_group">
				<button id="btn">1</button>
				<button id="btn">2</button>
				<button id="btn">3</button>
				<button id="btn">4</button>
				<button id="btn">5</button>
			</div>

		</div>
	</div>
	<!-- 하단사이트정보 -->
	<%@ include file="footer.jsp"%>
</body>
</html>