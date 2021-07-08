<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css">
<link rel="stylesheet" href="resources/css/common/header.css">
<link rel="stylesheet" href="resources/css/videoList.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="ln_title">학습동영상 수정</p>
		<form id="editForm" class="addForm" enctype="multipart/form-data">
			<input type="hidden" value="${view.lectureclass_no}" name="lectureclass_no">
			<input type="hidden" value="${view.video_no}" name="video_no">
			<div class="form-group">
				<label class="an_label" for="video_title">제목</label>
				<input type="text" class="form-control" id="subject" name="video_title" placeholder="제목을 입력하세요." value="${view.video_title }">
			</div>
			<br>
			<div id="editor" class="form-group">
				<label class="an_label" for="video_content">내용</label>
				<textarea id="editor1" class="editor1" name="video_content" rows="10" cols="10">${view.video_content }</textarea>
				<script>
					CKEDITOR.editorConfig = function(config) {
						config.filebrowserUploadMethod = 'form';
						config.extraPlugins = 'base64image';
					};
					CKEDITOR.replace(
										'editor1',
									{
										height : '400px',
										extraPlugins : 'editorplaceholder',
										editorplaceholder : '내용을 입력하세요.',
										filebrowserUploadUrl : '${pageContext.request.contextPath}/fileupload'
									});
					window.parent.CKEDITOR.tools.callFunction(1, "${url}", "전송완료");
				</script>
			</div>
			<br> 
			<label for="input-file" class="file_label" ><span>파일</span></label>
			<input type="file" id="input-file" class="input-file" name="video_file_org" onchange="loadFile(this)" required>
             <p id="fileName" class="fileName"></p>
		</form>
			<button id="editVideo" class="button"><span>수정</span></button>
	</div>
	
	<script>
		// ckeditor
		
		// 인풋파일이름 출력
		function loadFile(input) {
		    var file = input.files[0];

		    var name = document.getElementById('fileName');
		    name.textContent = file.name;
		}
		// 등록 버튼
		$("#editVideo").click(function(){
			var frm = document.getElementById("editForm");
			frm.action="editVideo";
			frm.method="POST";
			frm.submit();
		});
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>