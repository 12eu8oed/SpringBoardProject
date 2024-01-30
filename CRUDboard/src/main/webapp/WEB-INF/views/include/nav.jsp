<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
			<!-- 이 코드는 오직 메뉴에 대한 코드만 -->
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.2.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
</head> 

	<!-- 메뉴부분 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-blue">
	  <div class="collapse navbar-collapse">
	    <ul class="navbar-nav mr-auto ">
	      <li class="nav-item mr-3">
	        <a class="nav-link btn" style="background-color: #99CCFF;" href="/board/listPageSearch?num=1">글 목록(페이징+검색)</a>
	      </li>
	<!--       <li class="nav-item mr-3"> -->
	<!--         <a class="nav-link btn btn-primary" href="/board/listPage?num=1">글 목록(페이징)</a> -->
	<!--       </li> -->
	      <li class="nav-item mr-3">
	        <a class="nav-link btn btn-info" href="/board/list">글 목록</a>
	      </li>
	      <li class="nav-item ">
	        <a class="nav-link btn btn-warning" href="/board/write">글 작성</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<!-- 로그인 섹션 -->
	<div class="top-right">
		<div>
		    <c:choose>
		        <c:when test="${not empty sessionScope.vo}">
		            <!-- 로그인 성공 시 표시될 환영 메시지 -->
		            	<div class="d-flex align-items-center">
               	 			<div class="alert alert-success mb-0">
                    			${sessionScope.vo.writer}님 반갑습니다!
                			</div>
                			<a class="btn btn-warning ml-2" href="/userInfo">사용자 정보</a>
                			<a class="btn ml-2" style="background-color: #E75D6C;" href="/logout">로그아웃</a>
            			</div>
		        </c:when>
		        <c:otherwise>
			            <!-- 로그인 폼 -->
			            <form class="form-inline" action="/login" method="POST">
			                <input type="text" name="id" class="form-control mb-2 mr-sm-2" placeholder="아이디">
			                <input type="password" name="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호">
			                <button type="submit" class="btn btn-primary mb-2 mr-sm-2">로그인</button>
			                <a class="btn btn-warning mb-2 mr-sm-2" href="/signUp">회원가입</a>
			            </form>
		        </c:otherwise>
		    </c:choose>
		</div>
		
		<!-- 로그인 오류 메시지 -->
	    <c:if test="${not empty requestScope.loginError}">
	        <div class="alert alert-danger" role="alert">
	            ${requestScope.loginError}
	        </div>
	    </c:if>  	
	</div>