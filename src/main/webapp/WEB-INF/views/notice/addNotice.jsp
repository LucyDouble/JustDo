<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script>
<!-- 클래식 -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script> -->

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/footer.css"/>">
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="an_page">
		<p class="an_title">공지사항 작성</p>
		<br>
		<form id="addForm" method="post" class="addForm"
			enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="hidden" name="manager_number" value="null"> <input
				type="hidden" name="teacher_number" value="${DTO.teacher_number}">
			<div class="form-group">
				<label class="an_label" for="notice_sub">제목</label> <input
					type="text" class="form-control" id="subject" name="notice_sub"
					placeholder="제목을 입력하세요.">
			</div>
			<br>
			<div id="editor" class="form-group">
				<label class="an_label" for="notice_con">내용</label>
				<textarea id="editor1" class="editor1" name="notice_con" rows="10"
					cols="10"></textarea>

				<script>
					/*  var ckeditor_config = {
						   resize_enaleb : false,
						   enterMode : CKEDITOR.ENTER_BR,
						   shiftEnterMode : CKEDITOR.ENTER_R,
					 	};
					  CKEDITOR.replace('editor1', { height: '400px',
					    extraPlugins: 'editorplaceholder',
					    editorplaceholder: '내용을 입력하세요.',
					    filebrowserUploadUrl:'${pageContext.request.contextPath}/fileupload',
					  },ckeditor_config );
					  window.parent.CKEDITOR.tools.callFunction(1, '${url}', '파일 전송 완료.'); */
					CKEDITOR.editorConfig = function(config) {
						config.filebrowserUploadMethod = 'form';
						config.extraPlugins = 'base64image';
					};
					CKEDITOR
							.replace(
									'editor1',
									{
										height : '400px',
										extraPlugins : 'editorplaceholder',
										editorplaceholder : '내용을 입력하세요.',
										filebrowserUploadUrl : '${pageContext.request.contextPath}/fileupload'
									});
					window.parent.CKEDITOR.tools.callFunction(1, "${url}",
							"전송완료");
				</script>
			</div>
			<br> 
			<!-- <input type="file" id="input-file" name="notice_filepath" value="파일첨부" style="float: left;"> -->
			<label for="input-file" class="file_label" ><span>파일</span></label>
			<input type="file" id="input-file" class="input-file" name="notice_filepath" multiple="multiple">
			<!-- <label class="reg_file" style="margin:10px; float:left;">fileName</label> -->
			<!-- <p style="margin:10px; float:left;">FILE NAME: </p> -->
             <p id="fileName" class="fileName"></p>
		</form>
		<button id="submitBtn" class="button" onclick="submitBtn();">
			<span>등록</span>
		</button>
		<button class="button" onclick="location.href='listNotice'">
			<span>목록</span>
		</button>
	</div>
	<script>
		function submitBtn() {
			var value = CKEDITOR.instances.editor1.getData();
			console.log($("#subject").val());
			console.log(value);
			
			if ($("#subject").val() == "") {
				swal("THERE IS NO TITLE","작성된 제목이 없습니다.","warning");
				return false;
			}
			if (value == "") {
				swal("THERE IS NO CONTENT","작성된 내용이 없습니다.","warning");
				return false;
			} 
			/* if (!$("#subject").val() == ""||!value == ""){
				swal("글등록이 완료되었습니다.")
			} */
			var frm = document.getElementById("addForm");
			frm.action = "addNotice";
			frm.method = "POST";
			frm.enctype = "multipart/form-data";
			frm.submit();
		}
		
		// input file 이름 라벨로 뿌리기(단일)
		/* function loadFile(input) {
		    var file = input.files[0];

		    var name = document.getElementById('fileName');
		    name.textContent = file.name;
		} */
		
		// input file 이름 라벨로 뿌리기(다중)
		 window.onload = function(){
		        target = document.getElementById('input-file');
		        target.addEventListener('change', function(){
		            fileList = "";
		            for(i = 0; i < target.files.length; i++){
		                fileList += target.files[i].name + '&nbsp;&nbsp;';
		            }
		            target2 = document.getElementById('fileName');
		            target2.innerHTML = fileList;
		        });
		    }
	
	</script>


	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>