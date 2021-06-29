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
<style>
@font-face {
    src : url("resources/fonts/SCDream4.otf");
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
</head>
<body>
<div>
	<section>
		<div class="cont">
			<article class="content1">
				<h2>강의계획서</h2>
			</article>
		</div>
		<div>
			<article>
					<table class="table">
							<tr>
								<th>NO</th>
								<td><p>${view.lecture_no}</p></td>
								<th>분반</th>
								<td><p>${view.lectureclass_class}</p></td>
							</tr>
							<tr>
								<th>강의명</th>
								<td><p>${view.lecture_title}</p></td>
								<th>전공</th>
								<td><p>${view.lecture_major}</p></td>
							</tr>
							<tr>
								<th>교직원</th>
								<td><p>${view.teacher_number}</p></td>
								<th>E-mail</th>
								<td><p>${view.teacher_number}</p></td>
							</tr>
							<tr>
								<th colspan="3">강의시간</th>
								<td><p>${view.lectureclass_start} ~ ${view.lectureclass_end}</p></td>
								
							</tr>
							<tr>
								<th>제한인원</th>
								<td><p>${view.lecture_limit}</p></td>
								<th>강의기간</th>
								<td><p>${view.lecture_start} ~ ${view.lecture_end}</p></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3"><p>${view.lecture_target}</p></td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3"><p>${view.lecture_reference}</p></td>
							</tr>
					</table>
			</article>
		</div>
	</section>
</div>
</body>
</html>