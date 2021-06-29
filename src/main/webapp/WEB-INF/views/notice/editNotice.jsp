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
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">

</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="en_page">
		<p class="en_title">게시글 수정</p>
		<br>
		<form action="editNotice" class="addForm" name="form" method="post">
		<input type="hidden" name="n_no" value="${notice.notice_no }" />	
			<div class="form-group">
				<label class="en_label" for="subject">제목</label> <input
					type="text" class="form-control" id="subject" name="n_sub" placeholder="제목을 입력하세요." value="${notice.notice_sub }">
			</div>
			<br> 
			<div id="editor" class="form-group">
				<label class="en_label" for="content">내용</label>
				<textarea id="editor1" name="editor1" rows="10" cols="10">${notice.notice_con }</textarea>
				<script type="text/javascript">
					CKEDITOR.editorConfig = function( config ) {
					    config.filebrowserUploadMethod = 'form';
					};
					CKEDITOR.replace('editor1', {
						height : '400px',
						extraPlugins : 'editorplaceholder',
						editorplaceholder : '내용을 입력하세요.',
						filebrowserUploadUrl:'${pageContext.request.contextPath}/fileupload'
					});
 					window.parent.CKEDITOR.tools.callFunction(1,"${url}","전송완료");
				</script>
				
					<!-- printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>"); -->
				<br>
			</div>
			
			<button type="submit" id="btnUpdate" class="button"><span>수정</span>
			</button>
		</form>
		<button type="submit" class="button" onclick="location.href='listNotice'">
			<span>취소</span>
		</button>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>


</script>
</html>