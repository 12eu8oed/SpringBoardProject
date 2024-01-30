<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 프로필</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .profile-container {
            max-width: 600px;
            margin: auto;
            padding-top: 20px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid #ddd;
            margin-bottom: 10px;
        }
        .profile-header h3 {
            margin-bottom: 5px;
        }
        .profile-stats {
            margin-bottom: 20px;
        }
        .profile-stats div {
            margin-bottom: 10px;
        }
        .profile-content {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div id="nav" class="navbar navbar-light" style="background-color: #4c4c4c;">
	<%@ include file="../include/nav.jsp" %>  
</div>

<div class="container profile-container">
    <div class="profile-header">
        <img src="path_to_profile_image.jpg" alt="프로필 이미지">
        <h3>${sessionScope.vo.writer}</h3>
        <p>계정 만든 날짜 및 시간: <fmt:formatDate value="${sessionScope.vo.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
    </div>
    <div class="profile-stats">
        <div>게시물 수: 구현중...</div>
        <div>팔로워 수: 구현중...</div>
    </div>
    <div class="profile-content">
        <p>여기에 사용자에 대한 세부 정보를 추가할 수 있습니다.</p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
