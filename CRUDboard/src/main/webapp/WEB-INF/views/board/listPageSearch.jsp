<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 목록 (페이징화)</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
				<a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="btn btn-outline-secondary mx-1">이전</a>
			</c:if>
	
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				<c:if test="${select != num}">
					<a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}" class="btn btn-outline-primary mx-1">${num}</a>
				</c:if> 
				
				<c:if test="${select == num}">
					<a href="#" class="btn btn-primary mx-1">${num}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${page.next}">
				<a href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="btn btn-outline-secondary mx-1">다음</a>
			</c:if>
		</div>

		<div class="container mt-3">
	        <div class="row justify-content-center">
	            <div class="col-md-8 offset-md-3">
	                <form class="form-inline">
	                    <select name="searchType" class="form-control mb-2 mr-sm-2">
	                        <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
	                        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
	                        <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
	                        <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
	                    </select>
	                    <input type="text" class="form-control mb-2 mr-sm-2" name="keyword" placeholder="검색어를 입력하세요" value="${page.keyword}"/>
	                    <button type="button" id="searchBtn" class="btn btn-primary mb-2">검색</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

	<script>
		document.getElementById("searchBtn").onclick = function() { //id가 searchBtn인 html 엘리먼트에 클릭 이벤트가 발생하면, function() {} 내부의 코드가 실행

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
			
		};
	</script>

</body>
</html>