<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>회원목록창</title>
</head>
<style>
#content {
	display: block !important;
	width: 100% !important;
}
.search{
    text-align: right;  
    margin: 10px 0;    
}
</style>
<body>
	<form name="frm" action="">
		<div class="search">
			<input type="text" name="name" value="${name}" /> 
			<input type="submit" value="검색">
		</div>
	</form>
	<table border="1" align="center" width="100%">
		<tr align=center bgcolor="lightgrey">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>생년월일</b></td>
			<td><b>삭제</b></td>
		</tr>
		<c:forEach var="member" items="${membersList}">

			<tr align="center">
				<td>${member.id}</td>
				<td>${member.pwd}</td>

				<c:url var="url2" value="/member/memberUpdateForm.do">
					<c:param name="id" value="${member.id}" />
					<c:param name="pwd" value="${member.pwd}" />
					<c:param name="name" value="${member.name}" />
					<c:param name="birthDate" value="${member.birthDate}" />
				</c:url>
				<td><a href="${url2}">${member.name}</a></td>

				<td>${member.birthDate}</td>
				<c:url var="url1" value="/member/delete.do">
					<c:param name="id" value="${member.id}" />
				</c:url>
				<td><a href="${url1}">삭제</a></td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>
