<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의계획서</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css">
<link rel="stylesheet" href="resources/css/lecturePlan.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="ln_page">
		<div class="cont">
				<p class="ln_title">강의계획서</p>
		</div>
					<table class="table">
							<tr>
								<th>NO</th>
								<td>${view.lecture_no}</td>
								<th>분반</th>
								<td>${view.lectureclass_class}</td>
							</tr>
							<tr>
								<th>강의명</th>
								<td>${view.lecture_title}</td>
								<th>전공</th>
								<td>${view.lecture_major}</td>
							</tr>
							<tr>
								<th>교직원</th>
								<td>${view.name}</td>
								<th>E-mail</th>
								<td>${view.email}</td>
							</tr>
							<tr>
								<th>제한인원</th>
								<td>${view.lecture_limit}</td>
								<th>강의기간</th>
								<td>${view.lecture_start} ~ ${view.lecture_end}</td>
							</tr>
							<tr>
								<th>강의시간</th>
								<td colspan="3">${view.lectureclass_start} ~ ${view.lectureclass_end}</td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3">${view.lecture_target}</td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3">${view.lecture_reference}</td>
							</tr>
					</table>
</div>
</body>
</html>