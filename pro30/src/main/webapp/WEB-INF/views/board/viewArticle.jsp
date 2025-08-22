<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.content-wrapper table {
    width: 100%;
    table-layout: fixed; /* 테이블 레이아웃 고정 */
}

.content-wrapper .td-writer {
    width: 20%;
}

.content-wrapper .td-input {
    width: 80%;
}

#content {
	display: block !important;
	width: 100% !important;
}

.content-wrapper {
	width: 70%;
	margin: 50px auto;
	padding: 40px;
	background-color: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.content-wrapper h2 {
	text-align: center;
	margin-bottom: 30px;
}

.content-wrapper table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.content-wrapper input[type="text"], .content-wrapper textarea {
	width: 100%;
	padding: 10px;
	font-size: 1em;
	border: 1px solid #ccc;
	border-radius: 8px;
	background-color: #f9f9f9;
}

.content-wrapper input[type="file"] {
	padding: 10px;
	font-size: 1em;
}

.content-wrapper .buttons {
	display: flex;
	justify-content: space-between;
}

.content-wrapper input[type="button"], .content-wrapper input[type="submit"] {
	padding: 12px;
	font-size: 1em;
	background-color: #333;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
}

.content-wrapper input[type="button"]:hover, .content-wrapper input[type="submit"]:hover {
	background-color: #444;
}

.btn-container {
	display: flex;
	justify-content: flex-end !important;
	gap: 5px;
}
</style>
<script type="text/javascript">
  function backToList(obj) {
    obj.action = "${contextPath}/board/listArticles.do";
    obj.submit();
  }

  var cnt = 1;
  function fn_addFile() {
    $("#d_file").append("<input type='file' name='file" + cnt + "' /><br>");
    cnt++;
  }

  function fn_enable(obj) {
    // 제목, 내용, 첨부파일 입력란을 활성화
    document.getElementById("i_title").disabled = false;
    document.getElementById("i_content").disabled = false;
    document.getElementById("i_imageFileName").disabled = false;

    // 수정 버튼을 눌렀을 때 수정/삭제/목록 버튼 숨기기
    document.getElementById("tr_btn").style.display = "none";

    // 수정 후 버튼을 표시
    document.getElementById("tr_btn_modify").style.display = "block";
    document.getElementById("tr_file_upload").style.display = "block";
  }

  function fn_modify_article(obj) {
    obj.action = "${contextPath}/board/modArticle.do";
    obj.submit();
  }

  function fn_remove_article(url, articleNO) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", url);
    var articleNOInput = document.createElement("input");
    articleNOInput.setAttribute("type", "hidden");
    articleNOInput.setAttribute("name", "articleNO");
    articleNOInput.setAttribute("value", articleNO);
    form.appendChild(articleNOInput);
    document.body.appendChild(form);
    form.submit();
  }

  function fn_reply_form(url, parentNO) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", url);
    var parentNOInput = document.createElement("input");
    parentNOInput.setAttribute("type", "hidden");
    parentNOInput.setAttribute("name", "parentNO");
    parentNOInput.setAttribute("value", parentNO);
    form.appendChild(parentNOInput);
    document.body.appendChild(form);
    form.submit();
  }

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
</head>
<body>
	<div class="content-wrapper">
		<form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">
			<table>
				<tr>
					<td class="td-writer">작성자 </td>
					<td class="td-input">
						<input type="text" value="${article.id }" name="writer" disabled />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" value="${article.title }" name="title" id="i_title" disabled />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="20" cols="60" name="content" id="i_content" disabled>${article.content }</textarea>
					</td>
				</tr>
				<c:choose>
					<c:when test="${not empty article.imageFileName && article.imageFileName != 'null'}">
						<tr>
							<td>첨부파일</td>
							<td>
								<input type="hidden" name="originalFileName" value="${article.imageFileName}" /> 
								<img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview" /><br>
							</td>
						</tr>
						<tr>
							<td>
								<input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr id="tr_file_upload">
							<td>첨부파일</td>
							<td>
								<input type="hidden" name="originalFileName" value="${article.imageFileName}" />
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<img id="preview" /><br> <input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td>등록일자</td>
					<td>
						<input type="text" value="<fmt:formatDate value="${article.writeDate}" />" disabled />
					</td>
				</tr>
				<!-- 수정/삭제/목록 버튼 영역 -->
				<tr id="tr_btn_modify" style="display: none;">
					<td colspan="2" class="btn-right">
						<div class="btn-container">
							<input type="button" value="저장" onClick="fn_modify_article(frmArticle)"> 
							<input type="button" value="취소" onClick="backToList(frmArticle)">
						</div>
					</td>
				</tr>
				<tr id="tr_btn">
					<td colspan="2" align="center" class="btn-right">
						<div class="btn-container">
							<c:if test="${member.id == article.id }">
								<input type="button" value="수정" onClick="fn_enable(this.form)">
								<input type="button" value="삭제" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
							</c:if>
							<input type="button" value="목록" onClick="backToList(this.form)">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
