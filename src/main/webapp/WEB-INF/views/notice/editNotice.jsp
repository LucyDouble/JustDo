<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js">
	
</script>

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
	<div class="en_page">
		<p class="en_title">게시글 수정</p>
		<br>
		<form id="editForm" method="post" class="editForm" enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="hidden" id="n_no" name="n_no" value="${notice.notice_no }" /> 
			<input type="hidden" id="n_filepath" value="${notice.notice_filepath }" /> 
			<input type="hidden" id="n_filename" value="${notice.notice_filename }" />
			<div class="form-group">
				<label class="en_label" for="subject">제목</label> 
				<input type="text" class="form-control" id="subject" name="n_sub" placeholder="제목을 입력하세요." value="${notice.notice_sub }">
			</div>
			<br>
			<div id="editor" class="form-group">
				<label class="en_label" for="content">내용</label>
				<textarea id="editor1" name="editor1" rows="10" cols="10">${notice.notice_con }</textarea>
				<script type="text/javascript">
					CKEDITOR.editorConfig = function(config) {
						config.filebrowserUploadMethod = 'form';
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

				<!-- printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>"); -->
				<br>
			</div>

			<div id="sampel1" class="en_file_input">
				<label for="input-file" class="file_label"><span>파일</span></label>
				<input type="file" id="input-file" class="input-file" name="notice_filepath" multiple="multiple">
				<p id="fileName" class="fileName"></p><c:if test="${empty listFile }">
					<label id="file_name" class="reg_file"></label>
					<input type="hidden" id="val0" value="0">
				</c:if>
				<c:if test="${not empty listFile }">
					<c:forEach items="${listFile }" var="i">
						<label id="${i.notice_filename }" class="reg_file">${i.notice_filename }<img	class="file_del_btn" onclick="delFile('${i.notice_filename }');" src="resources/images/cross.png">
						</label>
					</c:forEach>
					<input type="hidden" id="val0" value="1">
				</c:if> 
			</div>

			<!-- <div id="sample2"> -->
				<%-- <c:if test="${empty listFile }">
					<label id="file_name" class="reg_file"></label>
					<input type="hidden" id="val0" value="0">
				</c:if>
				<c:if test="${not empty listFile }">
					<c:forEach items="${listFile }" var="i">
						<label id="${i.notice_filename }" class="reg_file">${i.notice_filename }<img	class="file_del_btn" onclick="delFile('${i.notice_filename }');" src="resources/images/cross.png">
						</label>
					</c:forEach>
					<input type="hidden" id="val0" value="1">
				</c:if>  --%>
			<!-- </div> -->
			<div class="cnt"></div>
			<div class="cnt2"></div>
		</form>
		<div class="en_btns">
			<button id="btnUpdate" class="button" onclick="submitBtn()">
				<span>완료</span>
			</button>
			<button type="submit" class="button"
				onclick="location.href='listNotice'">
				<span>취소</span>
			</button>
		</div>
		<form id="delFile" action="delFile" method="post">
			<p>
				<input type="hidden" name="no" value="${notice.notice_no }" />
			</p>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	/* $('.file_label').click(function() {
		var fn = $("#val0").val();
		console.log(fn);
		if (fn == 1) {
			var result = confirm("첨부파일을 추가 하시겠습니까?");
		} else if (fn == 0) {
			return true;
		}
		if (!result) {
			return false;
		}
	}); */

	/* $('.file_label').click(function() {
	var fn = $("#file_name").val();
	console.log(fn);
	if (fn != null) {
		var result = confirm("등록된 첨부파일을 변경하시겠습니까?"); 
	} else if (fn == null){
		return true;
	}
	 	if (!result) {
		return false;
	}
	}); */

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
		if(CKEDITOR.instances.editor1.getData() =='' || CKEDITOR.instances.editor1.getData().length ==0){
			swal("","제목과 내용을 입력해 주세요","warning");
               $("#editor1").focus();
            return false;
        } else {
		var frm = document.getElementById("editForm");
		frm.action = "editNotice";
		frm.method = "POST";
		frm.enctype = "multipart/form-data";
		frm.submit();
        }		
	}

	let aa = 0;

	function delFile(name) {
		//var files = $("#input-file")[0].files;

		var chk = confirm("등록된 첨부파일을 삭제하시겠습니까?");
		var gg = document.getElementById(name);
		var bb = $(".cnt");
		var cc = $(".cnt2");
		cc.empty();
		var asd = "";
		var asd1 = "";
		if (chk == true) {
			gg.style.display = "none"; // 라벨에 파일이름뿌린거 지우기
			aa += 1;
			asd = "<input type='hidden' name='"+aa+"' value='"+name+"'>"
			bb.append(asd);
			console.log(aa);
			asd1 = "<input type='hidden' name='allcount' value='"+aa+"'>"
			cc.append(asd1)
			//				window.location.reload(); // 새로고침
			//	var thisfile = ${i.notice_filename };
			//	thisfile.empty(); // 라벨에 파일이름뿌린거 지우기

			/* $.ajax({
			url: "delFile",
			type: "POST",
			data: {
				filename : name
			},
			success:function(data){
				window.location.reload();
			},
			error:function(){
				
			}
			}); */
		}
	}
	// input file 이름 라벨로 뿌리기
	window.onload = function() {
		target = document.getElementById('input-file');
		target.addEventListener('change', function() {
			fileList = "";
			for (i = 0; i < target.files.length; i++) {
			fileList += target.files[i].name + '&nbsp;&nbsp;';
			}
			target2 = document.getElementById('fileName');
			target2.innerHTML = fileList;
		});
	}
</script>
</html>