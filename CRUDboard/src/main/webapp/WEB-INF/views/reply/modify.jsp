<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

<style>
.btn-custom {
	border-color: #007bff;
	color: #007bff;
} /* 버튼의 테두리와 글씨 색상을 Bootstrap의 기본 파란색으로 변경 */
.btn-custom:hover {
	background-color: #007bff;
	color: white;
} /* 버튼을 호버했을 때의 배경과 글씨 색상을 설정 */

</style>
</head>
<body>  

<div>

	<form method="post" action="/reply/modify"> <!-- 새로고침처럼 자기페이지로 값을 보내며 댓글작성 -->
	
		<p>
			<label>댓글 작성자</label> <input type="text" name="writer" readonly="readonly" value="${reply.writer}">
		</p>
		<p>
			<textarea rows="5" cols="50" name="content">${reply.content}</textarea>
		</p>
		<p>
			<input type="hidden" name="bno" value="${reply.bno}">
			<input type="hidden" name="rno" value="${reply.rno}">
			
			<button type="submit">댓글 작성</button>
		</p>
	</form>
	
</div>

<!-- 댓글 끝	 -->

</body>
</html>
