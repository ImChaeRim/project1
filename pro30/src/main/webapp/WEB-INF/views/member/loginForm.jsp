<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>
<style>

.login-wrapper {
	width: 350px;
	height: 400px;
	padding: 40px;
	box-sizing: border-box;
}

.login-wrapper h2 {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

#login-form {
	display: flex;
	flex-direction: column;
}

#login-form input {
	margin-top: 10px;
	width: 100%;
	height: 3em;
	padding: 0 10px;
	box-sizing: border-box;
	background-color: #F8F8F8;
	border-radius: 10px;
	border: 2px solid lightgrey;
}

#login-form label[for="remember-check"] {
	font-size: 0.4em;
	color: #999999;
}

#login-form label input[type="checkbox"] {
	width: 10px;
	height: 10px;
	margin-right: 5px;
}

#login-form input[type="submit"] {
	width: 275px;
	height: 50px;
	padding: 0px;
	box-sizing: border-box;
	font-size: 0.5em;
	border-radius: 10px;
	margin-top: 20px;
	background-color: #000000;
	color: #fff;
	cursor: pointer;
}

hr {
	border: none;
	border-top: 2px solid #999;
	/* 위쪽에 2픽셀 회색 선 */
	margin: 20px 0;
}

#idpw {
	text-align: center;
	margin-top: 10px;
	font-size: 0.4em;
	color: #666;
}

a {
	text-decoration: none;
	color: #666;
}

#content {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 70vh; /* 높이도 확보해야 수직 중앙 가능 */
}
</style>
<script>
	function changeButtonColor(button) {
		button.style.backgroundColor = 'blue';
	}
</script>
<body>
<div class="login-wrapper">
        <h2>Login</h2>
        <form id="login-form" name="frmLogin" method="post" action="${contextPath}/member/login.do">
            <input type="hidden" name="url" value="사이트를 통한 직접 로그인">
            <input type="text" name="id" placeholder="id" autofocus></input>
            <input type="password" name="pwd" placeholder="password" autofocus></input>
            <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기</input>
            </label>
            <input type="submit" value="Login" onclick="changeButtonColor(this)" />
        </form>
        <hr>
        <p id="idpw">
            아이디 · 비밀번호를 잊어버리셨나요?
        </p>
        <p id="idpw">
            <a href="memberForm.do">회원가입</a>
        </p>
    </div>
</body>
</html>
