<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
    #content {
        display: block !important;
        width: 100% !important;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }
    .article-header,
    .article-card {
        background: #fff;
        border-radius: 8px;
        padding: 15px 20px;
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .article-header {
        font-weight: bold;
        background-color: #e9ecef;
        color: #495057;
        border-bottom: 2px solid #ced4da;
        margin-bottom: 10px;
    }
    .article-number {
        width: 40px;
        text-align: center;
    }
    .article-author {
        width: 100px;
        text-align: center;
    }
    .article-title {
        flex-grow: 1;
    }
    .article-title a {
        text-decoration: none;

    }
    .article-title a:hover {
        text-decoration: underline;
    }
    .article-date {
        width: 130px;
        text-align: right;
		color: #666;
    }
    .reply-label {
        color: #888;
        margin-right: 8px;
    }
    .write-btn-container {
        text-align: right;
        margin-top: 30px;
    }
    .btn-write {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 6px;
        cursor: pointer;
    }
    .btn-write:hover {
        background-color: #0056b3;
    }
    .indent {
        display: inline-block;
        width: 20px;
    }
    .article-card {
        margin-bottom: 10px;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
    }
</style>
<script>
    function fn_articleForm(isLogOn, articleForm, loginForm) {
        if (isLogOn != '' && isLogOn != 'false') {
            location.href = articleForm;
        } else {
            alert("로그인 후 글쓰기가 가능합니다.");
            location.href = loginForm + '?action=/board/articleForm.do';
        }
    }
</script>
</head>
<body>
    <div class="container">
        <h1>게시판</h1>

        <!-- 필드명 헤더 -->
        <div class="article-header">
            <div class="article-number">번호</div>
            <div class="article-author">작성자</div>
            <div class="article-title">제목</div>
            <div class="article-date">작성일</div>
        </div>

        <!-- 게시글 목록 -->
        <c:choose>
            <c:when test="${empty articlesList}">
                <p style="text-align:center; color:#777; font-size:1.1em;">
                    등록된 글이 없습니다.
                </p>
            </c:when>
            <c:otherwise>
                <c:forEach var="article" items="${articlesList}" varStatus="articleNum">
                    <div class="article-card">
                        <div class="article-number">${articleNum.count}</div>
                        <div class="article-author">${article.id}</div>
                        <div class="article-title">
                            <c:choose>
                                <c:when test="${article.level > 1}">
                                    <span class="indent" style="width:${article.level * 20}px;"></span>
                                    <span class="reply-label">[답변]</span>
                                </c:when>
                            </c:choose>
                            <a href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">
                                ${article.title}
                            </a>
                        </div>
                        <div class="article-date">
                            <fmt:formatDate value="${article.writeDate}" pattern="yyyy-MM-dd" />
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <!-- 글쓰기 버튼 -->
        <div class="write-btn-container">
            <button class="btn-write"
                onclick="fn_articleForm('${isLogOn}', '${contextPath}/board/articleForm.do', '${contextPath}/member/loginForm.do')">
                글쓰기
            </button>
        </div>
    </div>
</body>
</html>
