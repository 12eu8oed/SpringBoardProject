<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 (페이징화)</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div id="nav" class="navbar navbar-light " style="background-color: #4c4c4c;">
	<%@ include file="../include/nav.jsp" %>  
</div>

<div class="container mt-4">
	<table class="table table-striped">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
<!-- 				<th>조회수</th> -->
			</tr>
		</thead>
		
		<tbody>
	
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.bno}</td>
						<td>
							<a href="/board/view?bno=${list.bno}">${list.title}</a>
						</td>
						<td>
							<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /> <!-- 연도 날짜 시 분 초 -->
						</td>
						<td>${list.writer}</td>
<%-- 						<td>${list.viewCnt}</td> --%>
					</tr>
				</c:forEach>
	
			</tbody>
		
	</table>
	
		<div class="d-flex justify-content-center">
			<c:if test="${page.prev}">
				<a href="/board/listPage?num=${page.startPageNum - 1}" class="btn btn-outline-secondary mx-1">이전</a>
			</c:if>
	
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				<c:if test="${select != num}">
					<a href="/board/listPage?num=${num}" class="btn btn-outline-primary mx-1">${num}</a>
				</c:if> 
				
				<c:if test="${select == num}">
					<a href="#" class="btn btn-primary mx-1">${num}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${page.next}">
				<a href="/board/listPage?num=${page.endPageNum + 1}" class="btn btn-outline-secondary mx-1">다음</a>
			</c:if>
		</div>
</div>

</body>
</html>