<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<style>
body {
	font-size: 1.2rem;
	padding-top: 20px;
	padding-bottom: 20px;
} /* 본문의 글씨 크기를 1.2rem으로 설정하고, 상하 패딩을 추가 */
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">
			Welcome Board Project!
		</h1>

<%-- 		<P class="text-center"> 
			What time is it now? ${serverTime}.
		</P> --%>

		<div class="text-center">
			<a href="/board/list" class="btn btn-primary">게시물 목록</a>
			<a href="/board/write" class="btn btn-success">게시물 작성</a>
		</div>
	</div>
</body>
</html>
