<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body>
	<table border=0 width="100%">
		<tr>
			<td><a href="${contextPath}/main.do"> <img class="logo" src="${contextPath}/resources/image/logo.png" />
			</a></td>

			<td>
				<div
					style="display:flex;align-items: center; gap: 15px; height: 100%; justify-content: flex-end; margin-right: 50px;">
					<c:choose>
						<c:when test="${isLogOn == true  && member!= null}">
							<h3>${member.name}님</h3>
							<a href="${contextPath}/member/logout.do"><h3>로그아웃</h3></a>
						</c:when>
						<c:otherwise>
							<a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
							<a href="${contextPath}/member/memberForm.do"><h3>회원가입</h3></a>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
	</table>


</body>
</html>