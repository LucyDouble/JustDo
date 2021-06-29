<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 수정</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/lectureList.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
				<p class="ln_title">강의수정</p>
			<div>
					<form id="frmEdit" name="edit">
						<table class="table editTB">
							<tr>
								<th>NO</th>
								<td><input type="hidden" name="teacher_number"
									value="${DTO.teacher_number }" id="a1"><input type="text" class="form-control" name="lecture_no" value="${view.lecture_no}" readonly></td>
								<th>강의명</th>
								<td><input type="text" name="lecture_title" class="form-control" value="${view.lecture_title}" maxlength="49"></td>
							</tr>
							<tr>
								<th>전공</th>
								<td><input type="text" name="lecture_major" class="form-control" value="${view.lecture_major}" maxlength="20"></td>
								<th>제한인원</th>
								<td><input type="text" name="lecture_limit" class="form-control" value="${view.lecture_limit}" readonly></td>
							</tr>
							<tr>
								<th>교직원</th>
								<td><input type="text" value="${DTO.name}" class="form-control"></td>
								<th>E-mail</th>
								<td><input type="text" value="${DTO.email}" class="form-control"></td>
							</tr>
							<tr>
								<%-- <th>강의날짜</th>
								<td><input type="text" name="lecture_day" class="form-control" value="${view.lecture_day}"></td> --%>
								<th>강의기간</th>
								<td colspan="3"><input type="date" name="lecture_start" class="form-control month" value="${view.lecture_start}">
									~ <input type="date" name="lecture_end" class="form-control month" value="${view.lecture_end}"></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3">
								<textarea style="resize:none;" rows="4" cols="24" name="lecture_target" class="form-control">${view.lecture_target}</textarea>
								</td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3">
								<textarea style="resize:none;" rows="4" cols="24" name="lecture_reference" class="form-control">${view.lecture_reference}</textarea>
								</td>
							</tr>
						</table>
						<button id="btnEdit" class="button">수정</button>
					</form>
			</div>
	</div>
	<script>
		$("#btnEdit").click(function() {
			var frm = document.getElementById("frmEdit")
			/*  var dataString = $("#frmAdd").serialize(); */

			frm.action = "lectureEdit";
			frm.method = "POST";
			frm.submit();

			/*   $.ajax({
			 	url : "lectureAdd",
			 	method: "POST",
			 	data : dataString,
			 	success: function(data){
			 		
			 	},
			 	error : function(){
			 		
			 	}
			 	
			 }); */
		});
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>