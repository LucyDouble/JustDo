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
		<form action="editNotice" class="addForm" name="form" method="post">
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
			
			<%-- <c:if test="${empty notice.notice_filename  }" > --%>
			<div id="sampel1">
			<label for="input-file" class="file_label" ><span>파일</span></label>
			<input type="file" id="input-file" name="n_file" style="display:none;">
			</div>
			<%-- </c:if> --%>
			
			<%-- <c:if test="${not empty notice.notice_filename }" > --%>
			<div id="sample2">
			<label  id="file_name" class="reg_file" style="margin:10px; float:left;">${notice.notice_filename }<img class="file_del_btn" src="resources/images/cross.png"></label>
			</div>
			<%-- </c:if> --%>
			
			
			
			<button type="submit" id="btnUpdate" class="button"><span>수정</span></button>
		</form>
		<button type="submit" class="button" onclick="location.href='listNotice'">
			<span>취소</span>
		</button>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
			// 첨부파일이 없을때 x버튼 안보이게 하기		
			/* $("#file_name").val()==null){
				$("#file_del_btn").hide();
			} */
			
			//function aa(delFile){
					$('.file_del_btn').click(function(){
						var result = confirm("등록된 첨부파일을 삭제하시겠습니까?");
						var n_no = $('#n_no').val(); 
						console.log(n_no);
						if(result){
								/* 여기다가 그러치~~ 여기다가 ajax 쓰는게 좋겠지? */ 
								$.ajax({
									url:"delFile",
									type:"post",
									data:{ no : n_no},										
									success: function(data) {
									$('#file_name').empty();
								}, error:function(data){
									alert ("삭제에 실패했습니다.")
								}
								//머 대충 이렇게 될꺼임
								// 여기서부터 소스
								 /* if (data.result == "success"){
									 $("#sample1").show();		//show 또는 아래처럼 style(display, inline 등 명령어로 처리)
									 $("#sample2").hide();
								 }else{
									 alert(실패);
								 } */
									});
								}
							});
				/* 	$(".file_label").click(function() {
						$.ajax({
							url:"editName",
							type:"post",
							data:{filename:  $("#input-file").val()},
							success:function(data){
								console.log()
								var file = data.filename;
								$("#file_name").empty().html(file)
							}, error:function(data) {
								alert("파일이름 변경 실패")
							}
						});					
					}); */
			//}
</script>
</html>