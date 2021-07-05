<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>

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
		<form id="editForm" method="post" class="editForm" enctype="multipart/form-data" accept-charset="UTF-8">
		<input type="hidden" id="n_no" name="n_no" value="${notice.notice_no }" />	
		<input type="hidden" id="n_filepath"  value="${notice.notice_filepath }" />	
		<input type="hidden" id="n_filename"  value="${notice.notice_filename }" />	
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
			
			<div id="sampel1">
			<label for="input-file" class="file_label" ><span>파일</span></label>
			<input type="file" id="input-file" class="input-file" name="notice_filepath" onchange="loadFile(this)">
			</div>
			
			<div id="sample2">
			<c:if test="${empty notice.notice_filename }">
			<label  id="file_name" class="reg_file">
			</label>
			</c:if>
			<c:if test="${!empty notice.notice_filename }">
			<label  id="file_name" class="reg_file">${notice.notice_filename }
			<img class="file_del_btn" onclick="delFile();" src="resources/images/cross.png">
			</label>
			</c:if>
			</div>
			
		</form>
			<button id="btnUpdate" class="button" onclick="submitBtn()"><span>완료</span></button>
		<button type="submit" class="button" onclick="location.href='listNotice'">
			<span>취소</span>
		</button>

		<form id="delFile" action="delFile" method="post">
			<p>
				 <input type="hidden"	name="no" value="${notice.notice_no }" /> 
			</p>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	
 	/* $('.file_label').click(function() {
		var fn = $("#val0").val();
		console.log(fn);
		if (fn == 1 ) {
			var result = confirm("등록된 첨부파일을 변경하시겠습니까?"); 
		} else if (fn == 0 ){
			return true;
			} 
		 	if (!result) {
			return false;
		}
	}); */
	
 	$('.file_label').click(function() {
		var fn = $("#file_name").val();
		console.log(fn);
		if (fn != null ) {
			var result = confirm("등록된 첨부파일을 변경하시겠습니까?"); 
		} 
		 	if (!result) {
			return false;
		}
	});
	
 	// ajax로 x아이콘클릭시 삭제 바로 구현
 	/*  $('.file_del_btn').click(function() {
		var result = confirm("등록된 첨부파일을 삭제하시겠습니까?");
		var n_no = $('#n_no').val();
		console.log(n_no);
		if (result) {
			$.ajax({
				url : "delFile",
				type : "post",
				data : {
					no : n_no
				},
				success : function(data) {
					$('#file_name').empty();
				},
				error : function(data) {
					alert("삭제에 실패했습니다.")
				}
			});
		}
	});  */
 	
	function submitBtn() {
		var frm = document.getElementById("editForm");
		frm.action = "editNotice";
		frm.method = "POST";
		frm.enctype = "multipart/form-data";
		frm.submit();
	}
	
 	function delFile() {
		var chk = confirm("등록된 첨부파일을 삭제하시겠습니까?");
			if (chk==true) {
				$('#file_name').empty();
				var form = document.getElementById("delFile");
				frm.action = "delFile";
				frm.method = "POST";
			    form.submit();
		    }
	}
	
	function loadFile(input) {
		var file = input.files[0];
		var name = document.getElementById('file_name');
		name.textContent = file.name;
	}
</script>
</html>