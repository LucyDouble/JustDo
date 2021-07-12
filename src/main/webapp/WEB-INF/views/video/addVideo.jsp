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
		<p class="ln_title">학습동영상 등록</p>
		<form id="addForm" class="addForm" enctype="multipart/form-data">
			<input type="hidden" value="${number}" name="lecture_no">
			<input type="hidden" id="video_alltime" name="video_alltime">
			<div class="form-group">
				<label class="an_label" for="video_title">제목</label>
				<input type="text" class="form-control" id="subject" name="video_title" placeholder="제목을 입력하세요.">
			</div>
			<br>
			<div id="editor" class="form-group">
				<label class="an_label" for="video_content">내용</label>
				<textarea id="editor1" class="editor1" name="video_content" rows="10" cols="10"></textarea>
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
			<input type="file" id="input-file" class="input-file" name="video_file_org">
             <p id="fileName" class="fileName"></p>
		</form>
			<button id="addVideo" class="button"><span>등록</span></button>
	</div>
	
	<script>
		// 총 재생시간 추출
		var myVideos = [];
		
		window.URL = window.URL || window.webkitURL;
		
		document.getElementById('input-file').onchange = setFileInfo;
		
		function setFileInfo() {
			  var files = this.files;
			  myVideos.push(files[0]);
			  var video = document.createElement('video');
			  video.preload = 'metadata';

			  video.onloadedmetadata = function() {
			    window.URL.revokeObjectURL(video.src);
			    var duration = video.duration;
			    myVideos[myVideos.length - 1].duration = duration;
			    updateInfos();
			  }

			  video.src = URL.createObjectURL(files[0]);
		}
		
		function updateInfos() {
			var videoTime = "";
			var videoName = "";
			var name = document.getElementById('fileName');
			  for (var i = 0; i < myVideos.length; i++) {
			   videoTime = myVideos[i].duration;
			   videoName = myVideos[i].name;
			  }
			  var allTime = Math.round(videoTime);
			  name.textContent = videoName;
			  $("#video_alltime").val(allTime);
			}
		
		
		// 등록 버튼
		$("#addVideo").click(function(){
			var frm = document.getElementById("addForm");
			frm.action="addVideo";
			frm.method="POST";
			frm.submit();
		});
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>