<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 정보</title>
    <!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div id="nav" class="navbar navbar-light" style="background-color: #4c4c4c;">
	<%@ include file="../include/nav.jsp" %>  
</div>

	<div class="container">
    <h2 class="mt-5">회원가입</h2>
    <form action="${pageContext.request.contextPath}/signUp" method="post">
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="writer">닉네임</label>
            <input type="text" class="form-control" id="writer" name="writer" placeholder="닉네임을 입력하세요" required>
        </div>
        <button type="submit" class="btn btn-primary">회원가입</button>
    </form>
</div>

<!-- 부트스트랩 JS 연결 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>