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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        .register-wrapper {
            width: 350px;
            padding: 40px;
            box-sizing: border-box;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .register-wrapper h2 {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        #register-form {
            display: flex;
            flex-direction: column;
        }

        #register-form input {
            margin-top: 10px;
            width: 100%;
            height: 3em; /* 입력 필드 높이를 3em으로 설정 */
            padding: 0 10px;
            box-sizing: border-box;
            background-color: #F8F8F8;
            border-radius: 10px;
            border: 2px solid lightgrey;
        }

        #register-form input[type="submit"] {
            width: 100%;
            height: 3em; /* 버튼 높이를 3em으로 설정하여 입력 필드와 동일하게 */
            padding: 0px;
            box-sizing: border-box;
            font-size: 1em;
            border-radius: 10px;
            margin-top: 20px;
            background-color: #000000;
            color: #fff;
            cursor: pointer;
        }

        #register-form input[type="submit"]:hover {
            background-color: #333;
        }

        hr {
            border: none;
            border-top: 2px solid #ccc;
            margin: 20px 0;
        }

        #login-link {
            text-align: center;
            margin-top: 10px;
        }

        #login-link a {
            text-decoration: none;
            color: #666;
            font-size: 0.9em;
        }

        #login-link a:hover {
            color: #000;
        }

        #content {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 70vh; /* 수직 중앙을 위해 높이 설정 */
        }
    </style>
</head>
<body>

<div class="register-wrapper">
    <h2>회원가입</h2>
    <form id="register-form" name="frmRegister" method="post" action="${contextPath}/member/addMember.do">
        <input type="text" name="id" placeholder="아이디" required>
        <input type="password" name="pwd" placeholder="비밀번호" required>
        <input type="text" name="name" placeholder="이름" required>
        <input type="date" name="birthDate" placeholder="생년월일" required>
        <input type="submit" value="가입하기" onclick="changeButtonColor(this)" />
    </form>

    <hr>
    <div id="login-link">
        <a href="${contextPath}/member/loginForm.do">이미 계정이 있으신가요? 로그인</a>
    </div>
</div>

</body>
</html>