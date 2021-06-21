<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
@font-face {
	src: url("resources/fonts/SCDream4.otf");
	font-family: SCDream4;
}

body {
	margin: 0px;
	padding: 0px;
	width: 800px;
	margin: auto;
	font-family: SCDream4;
}
</style>
<body>
	<div>
		<section>
			<div class="cont">
				<article class="content1">
					<h2>강의수정</h2>
				</article>
			</div>
			<div>
				<article>
					<form id="frmEdit" name="edit">
						<table class="table">
							<tr>
								<th>NO</th>
								<td><input type="hidden" name="teacher_number"
									value="100001" id="a1"><input type="text" name="lecture_no" value="${view.lecture_no}" readonly></td>
								<th>강의명</th>
								<td><input type="text" name="lecture_title" id="a3" value="${view.lecture_title}"></td>
							</tr>
							<tr>
								<th>전공</th>
								<td><input type="text" name="lecture_major" id="a4" value="${view.lecture_major}"></td>
								<th>제한인원</th>
								<td><input type="text" name="lecture_limit" id="a8" value="${view.lecture_limit}" readonly></td>
							</tr>
							<tr>
								<th>교직원</th>
								<td><input type="text" value="나다"></td>
								<th>E-mail</th>
								<td><input type="text" value="나야"></td>
							</tr>
							<tr>
								<th>강의날짜</th>
								<td><input type="text" name="lecture_day" id="a7" value="${view.lecture_day}"></td>
								<th>강의기간</th>
								<td><input type="date" name="lecture_start" id="a9" value="${view.lecture_start}">
									~ <input type="date" name="lecture_end" id="a10" value="${view.lecture_end}"></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3"><input type="text" name="lecture_target" id="a11" value="${view.lecture_target}"></td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3"><input type="text" name="lecture_reference" id="a12" value="${view.lecture_reference}"></td>
							</tr>
						</table>
						<button id="btnEdit">수정</button>
					</form>
				</article>
			</div>
		</section>
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
</body>
</html>