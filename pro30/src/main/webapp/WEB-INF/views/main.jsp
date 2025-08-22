<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<style>
html, body {
	height: 100%;
	margin: 0;;
	background-color: #f2f2f2;
}

header {
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
}

#header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.left {
	font-size: 2em;
	font-weight: bold;
}

.right a {
	margin-left: 1em;
	text-decoration: none;
	color: #333;
}

main {
	max-width: 1200px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-areas: "box1 box3" "box1 box4" "box2 box5";
	gap: 20px;
	padding: 10px;
	margin-top: 50px;
}

#box1 {
	grid-area: box1;
	width: 100%;
	border-radius: 10px;
	object-fit: cover;
	height: 100%;
	max-height: 500px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

#box2 {
	grid-area: box2;
}

#box3 {
	grid-area: box3;
}

#box4 {
	grid-area: box4;
}

#box5 {
	grid-area: box5;
}

/* 왼쪽 컬럼 */
.left-column {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.left-column img {
	width: 100%;
	border-radius: 10px;
	object-fit: cover;
	height: 385px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 오른쪽 컬럼 */
.right-column {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.box {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 15px;
	min-height: 150px;
	transition: transform 0.3s ease;
}

.box:hover {
	transform: translateY(-5px);
}

.subtitle {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
}

.subtitle .twin {
	display: flex;
	align-items: center;
	gap: 8px;
}

button {
	background-color: #f0f0f0;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

footer {
	position: fixed;
	bottom: 0;
	margin-right: 20px;
	right: 0;
}

.login-register {
	display: block;
}

</style>
<body>
	<img id="box1" src="./images/animal.png" alt="왼쪽 이미지" />

	<section id="box3" class="box">
		<div class="subtitle">
			<div class="twin">
				
				<h3>공지사항</h3>
			</div>
<!-- 			<button>
				<a href="">더보기</a>
			</button> -->
		</div>
		<ul>
			<li>[관리자 페이지] 아이디 : admin1 비밀번호 : 1111 </li>
			<li>[일반 사용자 페이지] 아이디 :user1 비밀번호: 1111  </li>
		</ul>
	</section>

	<section id="box4" class="box">
		<div class="subtitle">
			<div class="twin">
				
				<h3>사진</h3>
			</div>
<!-- 			<button>
				<a href="">더보기</a>
			</button> -->
		</div>

	</section>

	<section id="box2" class="box">
		<div class="subtitle">
			<div class="twin">
				
				<h3>최근 게시글</h3>
			</div>
			<button>
				<a href="${pageContext.request.contextPath}/board/listArticles.do">더보기</a>
			</button>
		</div>
		<ul>

		</ul>
	</section>

	<section id="box5" class="box">
		<div class="subtitle">
			<div class="twin">
			
				<h3>오늘의 식단</h3>
			</div>
		</div>
		<p>점심: 짜장밥, 짬뽕국, 탕수육, 단무지</p>
		<p>후식: 메론, 츄러스</p>
	</section>
</body>
</html>