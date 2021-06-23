<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section>
		<article>
			<ul>
				<li>수강목록</li>
				<li>수강신청</li>
			</ul>
		</article>
		<article>
			<form>
				<table class="table">
					<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>수업시간</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>접수현황</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.lecture_no }</td>
								<td>${vo.lectureclass_class }</td>
								<td>${vo.lecture_title }</td>
								<td>${vo.lectureclass_start} ~ ${vo.lectureclass_end}</td>
								<td>${vo.teacher_number }</td>
								<td>${vo.lecture_limit}</td>
								<td>0</td>
								<td><button>신청</button></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
			</form>
		</article>
		<article>
			<p>캘린더</p>
			<p>6월강사일정</p>
		</article>
		<article>
			<p>안내문</p>
			<ul>
				<li>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
			</ul>
		</article>
		
		<article>
			<form id="ReFrm">
				<input type="hidden" name="student_number" id="id" value="1">
				</form>
				<table class="table">
					<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>수업시간</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>접수현황</th>
								<th>강의계획서</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.lecture_no }</td>
								<td>${vo.lectureclass_class }</td>
								<td>${vo.lecture_title }</td>
								<td>${vo.lectureclass_start } ~ ${vo.lectureclass_end }</td>
								<td>${vo.teacher_number }</td>
								<td>${vo.lecture_limit }</td>
								<td id="${vo.lectureclass_no}">0</td>
								<td><button  onclick="request('${vo.lectureclass_no}','${vo.lecture_no }');">신청</button></td>
								<td><a href="javascript:void(0);" onclick="pop('${vo.lecture_no}', '${ vo.lectureclass_class}');">보기</a></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
			
			
		</article>
		<article>
			<p>캘린더</p>
			<p>6월강사일정</p>
		</article>
		<article>
			<p>안내문</p>
			<ul>
				<li>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
			</ul>
		</article>
	</section>	
<script>
	function pop(num, num1){
		var w = 800;
		var h = 700;
		var width = (window.screen.width-w) / 2;
		var height = (window.screen.height-h) / 2;
		window.open("lecturePlan?lecture_no="+num+"&lectureclass_class="+num1, "lecturePlan", "width="+w+", height="+h+", left="+width+", top="+height);
	}
	function request(number, number1){
		var studentNo = $("#id").val();
		$.ajax({
    	url : "registrationAdd",
    	method: "POST",
    	data : {
					student_number : studentNo,
					lectureclass_no : number,
					lecture_no : number1
    	},
    	success: function(data){
    		
    	},
    	error : function(){
    		
    	}
    	
    	}); 
	}
</script>
</body>
</html>