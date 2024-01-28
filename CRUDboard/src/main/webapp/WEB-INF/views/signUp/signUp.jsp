<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 정보</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container my-4">
    <h2>사용자 정보</h2>
    <div class="card">
        <div class="card-body">
            <p><strong>닉네임:</strong> ${sessionScope.vo.writer}</p>
            <p><strong>계정 만든 날짜 및 시간:</strong> <fmt:formatDate value="${sessionScope.vo.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
            <!-- 추가적인 사용자 정보를 여기에 표시 -->
        </div>
    </div>
</div>

</body>
</html>