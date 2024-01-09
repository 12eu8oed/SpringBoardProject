<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
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

<div id="nav" class="navbar navbar-light" style="background-color: #4c4c4c;">
	<%@ include file="../include/nav.jsp" %>  
</div>
 
<div class="container mt-4">
	<div class="card mb-4"> 
		<div class="card-header">
			<h3>${view.title}</h3>
		</div>
		
		<div class="card-body">
			<h6 class="card-subtitle"><b>작성자</b> : ${view.writer}</h6>
		</div>
		
		<div class="card-body border-top">
			<p class="card-text">${view.content}</p>
		</div>
	</div>
	
	<div>
		<a href="/board/modify?bno=${view.bno}" class="btn btn-outline-primary">게시물 수정</a>
		<a href="/board/delete?bno=${view.bno}" class="btn btn-outline-danger" onclick="return confirm('정말 삭제하시겠습니까?')">게시물 삭제</a>
	</div>
</div>

	<!-- 댓글 시작 -->
	
	<hr />
	
	<ul>
<!-- 		<li> -->
<!-- 			<div> -->
<!-- 				<p>첫번째 댓글 작성자</p> -->
<!-- 				<p>첫번째 댓글</p> -->
<!-- 			</div> -->
<!-- 		</li> -->
<!-- 		<li> -->
<!-- 			<div> -->
<!-- 				<p>두번째 댓글 작성자</p> -->
<!-- 				<p>두번째 댓글</p> -->
<!-- 			</div> -->
<!-- 		</li> -->
<!-- 		<li> -->
<!-- 			<div> -->
<!-- 				<p>세번째 댓글 작성자</p> -->
<!-- 				<p>세번째 댓글</p> -->
<!-- 			</div> -->

		<div class="list-group">
			<c:forEach items="${reply}" var="reply" >
				<div class="list-group-item">
					<h5 class="mb-1">${reply.writer.toString()} / ${reply.regDate}</h5>
					<p class="mb-1">${reply.content}</p>
				</div>
			</c:forEach>
		</div>
	</ul>
	
<div>
	<p>
		<label>댓글 작성자</label> <input type="text">
	</p>
	<p>
		<textarea rows="5" cols="50"></textarea>
	</p>
	<p>
		<button type="button">댓글 작성</button>
	</p>
</div>
	
	<!-- 댓글 끝 -->

</body>
</html>
