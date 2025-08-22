<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.logo {
    width: 150px;
    height: auto;
}
#container {
	max-width: 1200px; /* 최대 폭 지정 (원하는 크기로 조절 가능) */
	width: 90%; /* 화면 크기에 따라 유동적으로 조절 */
	margin: 0 auto;
	border: 0px solid #bcbcbc;
	padding: 15px;
}

#header {
	padding: 15px;
	margin-bottom: 5px;
	border: 0px solid #bcbcbc;
	width: 100%; /* 컨테이너 폭에 맞춤 */
	box-sizing: border-box; /* 패딩 포함해서 너비 계산 */
	height: 150px;
}
/*       #sidebar-left {
        width: 15%;
        height:700px;
        padding: 5px;
        margin-right: 5px;
        margin-bottom: 5px;a
        float: left;
         background-color: yellow;
        border: 0px solid #bcbcbc;
        font-size:10px;
      } */
#content {
	width: 1000px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-areas: "box1 box3" "box1 box4" "box2 box5";
	gap: 20px;
	padding: 10px;
	margin-top: 10px;
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

#footer {
	clear: both;
	padding: 5px;
	border: 0px solid #bcbcbc;
}

button {
	background-color: #f0f0f0;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.subtitle {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
}

.logo {
	width: 150px;
	height: auto;
}

a {
	text-decoration: none;
	color: #666;
}
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<%--       <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div> --%>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>