<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('form').on('submit', function(e) {
	        if ($('#title').val() === "" || $('#writer').val() === "" || $('#content').val() === "") {
	            alert("제목, 작성자, 내용을 다 작성해주세요");
	            e.preventDefault(); // This will prevent the form from being submitted
	        }
	    });
	});
	</script>
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
    <form method="post">   <!-- action="/uploadImage" enctype="multipart/form-data" -->
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title">
        </div>
        
        <div class="form-group">
            <label for="writer">작성자</label>
            <c:if test="${not empty sessionScope.vo}">
	            <input type="text" class="form-control" id="writer" name="writer" value="${sessionScope.vo.writer}" readonly>       
            </c:if>
            <c:if test="${empty sessionScope.vo}">
	            <input type="text" class="form-control" id="writer" name="writer">
            </c:if>
        </div>
        
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="5"></textarea>
        </div>

<!-- 		<!-- 사진 첨부 -->
<!--         <div class="form-group"> -->
<!--             <label for="photo">사진 및 파일 첨부</label> -->
<!--             <input type="file" class="form-control-file" id="filePath" name="filePath"> -->
<!--         </div> -->
                
        <button type="submit" class="btn btn-outline-primary">작성</button>
    </form>
</div>

<div class="container mt-4">
	<label for="imageUpload">이미지 업로드:</label>
	<input type="file" id="imageUpload" name=image>
	<button id="uploadBtn" class="btn btn-outline-primary">업로드</button>
</div>

<script>
$(document).ready(function() {
    $('#uploadBtn').click(function(e) {
        e.preventDefault();
        var formData = new FormData();
        formData.append('file', $('#imageUpload')[0].files[0]);

        $.ajax({
            url: '/uploadImage',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                alert('이미지 업로드 성공');
                $('#imagePath').val(data.filePath); // 서버로부터 받은 이미지 경로를 hidden input에 저장
            },
            error: function() {
                alert('이미지 업로드 실패');
            }
        });
    });

    $('#postForm').submit(function(e) {
        e.preventDefault();
        var postData = {
            title: $('#title').val(),
            content: $('#content').val(),
            imagePath: $('#imagePath').val() // 이미지 경로 포함
        };

        $.ajax({
            url: '/board/write', // 게시글 데이터를 처리하는 서버의 URL
            type: 'POST',
            data: postData,
            success: function(data) {
                alert('게시글 작성 성공');
                window.location.href = '/board/list'; // 성공 후 리스트 페이지로 리다이렉트
            },
            error: function() {
                alert('게시글 작성 실패');
            }
        });
    });
});
</script>

</body>
</html>
