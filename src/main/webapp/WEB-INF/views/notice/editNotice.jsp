<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="en_page">
		<p class="en_title">게시글 수정</p>
		<br>
		<form action="" class="addForm">
			<div class="form-group">
				<label class="en_label" for="subject">&nbsp;&nbsp;제목</label> <input
					type="text" class="form-control" id="subject" name="subject"
					placeholder="제목을 입력하세요.">
			</div>
			<br>
			<div id="editor" class="form-group">
				<label class="en_label" for="content">&nbsp;&nbsp;내용</label>
				<%-- <textarea class="form-control2" id="content" name="content" rows="10"></textarea>
      <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
    	<script>
    	CKEDITOR.replace('content')
    	</script> --%>
				<textarea cols="10" id="editor1" name="editor1" rows="10"></textarea>
				<%-- <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script> --%>


				<script>
	    CKEDITOR.replace('editor1', { height: '400px',
	      extraPlugins: 'editorplaceholder',
	      editorplaceholder: '내용을 입력하세요.'
	    });

  </script>
				<br>
				<button type="submit" class="button" onclick="location.href='viewNotice'"><span>취소</span></button>
				<button type="submit" class="button" onclick="location.href='viewNotice'"><span>수정</span></button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>