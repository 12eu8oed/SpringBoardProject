<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록(페이징 안됨)</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<style>
.even-row {
    background-color: #f2f2f2;
} /* 연한 회색 배경 색상을 가진 클래스를 추가 */
</style>
</head>
<body>

<div id="nav" class="navbar navbar-light" style="background-color: #4c4c4c;">
	<%@ include file="../include/nav.jsp" %>  
</div>

<div class="container mt-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">작성자</th>
<!-- 				<th scope="col">조회수</th> -->
			</tr>
		</thead>
	
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="status">
				<tr class="${status.index % 2 == 0 ? 'even-row' : ''}">
					<td>${list.bno}</td>
					<td>
						<a href="/board/view?bno=${list.bno}">${list.title}</a>
					</td>
					<td>
						<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /> <!-- 연도 날짜 시 분 초 -->
					</td>
					<td>${list.writer}</td>
<%-- 					<td>${list.viewCnt}</td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>