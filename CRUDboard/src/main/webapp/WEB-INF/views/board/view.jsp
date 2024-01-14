<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

<style>
/* 기본 댓글 스타일 개선 */
.comment-container {
	border: 1px solid #dee2e6;
	margin-bottom: 10px;
	padding: 10px;
	border-radius: 5px;
	background-color: #f8f9fa;
}

.comment-header, .comment-body {
	margin-bottom: 10px;
}

.comment-footer {
	display: flex;
	justify-content: flex-end; /* 수정/삭제 버튼을 오른쪽에 배치 */
}

.comment-btn {
	margin-left: 5px; /* 버튼 사이 간격 조정 */
}

/* 댓글 작성 폼 스타일 개선 */
.reply-form {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.reply-form .form-control {
	margin-bottom: 10px;
}

.reply-form button[type="submit"] {
	width: 100%;
}
</style>
</head>
<body>

	<div id="nav" class="navbar navbar-light "
		style="background-color: #4c4c4c;">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<div class="container my-4">
		<div class="card">
			<div class="card-header">
				<h3>${view.title}</h3>
			</div>

			<div class="card-body">
				<p class="card-text">
					<strong>작성자:</strong> ${view.writer}
				</p>
				<p class="card-text">${view.content}</p>
			</div>

			<div class="card-footer text-right">
				<a href="/board/modify?bno=${view.bno}" class="btn btn-info">게시물 수정</a>
				<a href="/board/delete?bno=${view.bno}" class="btn btn-danger">게시물 삭제</a>
			</div>
		</div>

		<!-- 댓글 리스트 -->
		<div class="mt-4">
			<c:forEach items="${reply}" var="reply">
				<div class="comment-container">
					<div class="comment-header">
						<p class="mb-1">
							<strong>작성자:</strong> ${reply.writer} | <strong>작성 날짜:</strong>
							<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />
						</p>
					</div>
					<div class="comment-body">
						<p>${reply.content}</p>
					</div>
					<div class="comment-footer">
						<a href="/reply/modify?bno=${view.bno}&rno=${reply.rno}" 
							class="btn btn-outline-secondary btn-sm" 
								style="background-color: #a4f081; color: black;">수정</a>

						<a href="/reply/delete?bno=${reply.bno}&rno=${reply.rno}" 
							class="btn btn-outline-secondary btn-sm" 
								style="background-color: #e85693; color: black;">삭제</a>
							
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 댓글 작성 폼 -->
		<div class="reply-form mt-4">
			<h5>댓글 작성</h5>
			<form method="post" action="/reply/write">
				<div class="form-group">
					<label for="replyWriter">작성자</label> <input type="text"
						class="form-control" id="replyWriter" name="writer"
						placeholder="이름을 입력하세요">
				</div>
				<div class="form-group">
					<label for="replyContent">댓글 내용</label>
					<textarea class="form-control" id="replyContent" name="content"
						rows="3" placeholder="댓글을 입력하세요"></textarea>
				</div>
				<input type="hidden" name="bno" value="${view.bno}">
				<button type="submit" class="btn btn-primary">댓글 작성</button>
			</form>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>