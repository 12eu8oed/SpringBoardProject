<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		
			<!-- 이 코드는 오직 메뉴에 대한 코드만 -->
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.2.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
</head> 

<nav class="navbar navbar-expand-lg navbar-light bg-blue">
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav mr-auto ">
      <li class="nav-item mr-3">
        <a class="nav-link btn btn-primary" href="/board/listPage?num=1">글 목록(페이징)</a>
      </li>
      <li class="nav-item mr-3">
        <a class="nav-link btn btn-info" href="/board/list">글 목록</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link btn btn-warning" href="/board/write">글 작성</a>
      </li>
    </ul>
  </div>
</nav>
<!-- <ul> 

	<li>
		<a href="/board/listPage?num=1">글 목록(페이징)</a> 
	</li>

	<li>
		<a href="/board/list">글 목록</a> 
	</li>
 
	<li>
		<a href="/board/write">글 작성</a> 
	</li> 
</ul> -->