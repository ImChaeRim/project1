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
<title>글쓰기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#content {
	display: block !important;
	width: 100% !important;
}

.write-wrapper {
	width: 600px;
	margin: 50px auto;
	background-color: white;
	padding: 40px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.write-wrapper h2 {
	text-align: center;
	margin-bottom: 30px;
}

.write-wrapper input[type="text"],
.write-wrapper textarea,
.write-wrapper input[type="file"] {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 1em;
}

.write-wrapper textarea {
	resize: vertical;
}

.write-wrapper .buttons {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
}

.write-wrapper input[type="submit"],
.write-wrapper input[type="button"] {
	width: 48%;
	padding: 12px;
	font-size: 1em;
	background-color: black;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
}

.write-wrapper input[type="submit"]:hover,
.write-wrapper input[type="button"]:hover {
	background-color: #444;
}

.additional-files {
	margin-top: 15px;
}

.add-file-btn {
	font-size: 0.9em;
	background-color: #ddd;
	color: #333;
	border: none;
	padding: 8px 12px;
	border-radius: 8px;
	cursor: pointer;
	height: 45px;
}

.add-file-btn:hover {
	background-color: #bbb;
}

.file-upload-row {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-top: 10px;
}

.file-upload-row input[type="file"] {
	flex: 1;
	height: 50px;
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
</script>
</head>
<body>

	<div class="write-wrapper">
		<h2>글쓰기</h2>
		<form name="articleForm" method="post"
			action="${contextPath}/board/addNewArticle.do"
			enctype="multipart/form-data">

			<label>작성자</label>
			<input type="text" name="writer" value="${member.name}" readonly />

			<label>제목</label>
			<input type="text" name="title" maxlength="500" required />

			<label>내용</label>
			<textarea name="content" rows="10" maxlength="4000" required></textarea>

			<label>파일 첨부</label>
			<div class="file-upload-row">
				<input type="file" name="imageFileName" />
				<button type="button" class="add-file-btn" onclick="fn_addFile()">파일 추가</button>
			</div>

			<div class="additional-files" id="d_file"></div>

			<div class="buttons">
				<input type="submit" value="저장" />
				<input type="button" value="목록" onclick="backToList(this.form)" />
			</div>
		</form>
	</div>

</body>
</html>
