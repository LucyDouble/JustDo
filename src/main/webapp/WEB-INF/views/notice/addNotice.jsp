<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<!-- 클래식 -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script> -->

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="an_page">
    <p class="an_title">공지사항 작성</p>
    <br>
<form id="addForm" class="addForm">
<input type="hidden" name="manager_number" value="20001">
<input type="hidden" name="teacher_number" value="100001">
    <div class="form-group">
        <label class="an_label" for="notice_sub">제목</label>
        <input type="text" class="form-control" id="subject" name="notice_sub" placeholder="제목을 입력하세요.">
    </div>
    <br>
    <div id="editor" class="form-group">
      <label class="an_label" for="notice_con">내용</label>
    	<textarea id="editor1" class="editor1" name="notice_con" rows="10" cols="10"></textarea>
    	
    	
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
    CKEDITOR.editorConfig = function( config ) {
	    config.filebrowserUploadMethod = 'form';
	};
	CKEDITOR.replace('editor1',  {
		height : '400px',
		extraPlugins : 'editorplaceholder',
		editorplaceholder : '내용을 입력하세요.',
		filebrowserUploadUrl:'${pageContext.request.contextPath}/fileupload'
	});
		window.parent.CKEDITOR.tools.callFunction(1,"${url}","전송완료");
  </script>
    </div>
    <br>
  </form>
    <button id="submitBtn" class="button" onclick="submitBtn();"><span>등록</span></button>
    <button class="button" onclick="location.href='listNotice'"><span>목록</span></button>
</div>
	<script>
	function submitBtn(){
		var value = CKEDITOR.instances.editor1.getData();
		console.log($("#subject").val());
		console.log(value);
		if ($("#subject").val() == ""){
			alert("작성된 제목이 없습니다.");
			return false;
		} 
		if (value == ""){
			alert("작성된 내용이 없습니다.");
			return false;
		} 
		var frm = document.getElementById("addForm");
		frm.action = "addNotice";
		frm.method = "POST";
		frm.submit();
	}	
	
	</script>


<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>