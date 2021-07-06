<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css">
<link rel="stylesheet" href="resources/css/common/header.css">
<link rel="stylesheet" href="resources/css/videoList.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
			<div>
				<p class="ln_title">학습동영상</p>
				<p>수강과목</p>
				<select name="title" onchange="goTitle()" id="listTitle">
					<option>강의목록</option>
					<c:forEach var="vo" items="${list}">
					<option value="${vo.lectureclass_no}">${vo.lecture_title} Class:${vo.lectureclass_class}</option>
					</c:forEach>
				</select>
				<p id="lecTitle"></p>
				전체 평균 진도율 : <progress></progress>
				강의 평균 진도율 : <progress></progress>
				<a href="#" onclick="goAdd()">등록</a>
			</div>
			<div>
				<ul class="thum">
				
				</ul>
			</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		// 셀릭트 선택 시 과목 출력
		function goTitle(){
			var opt = document.getElementById("listTitle");
			var optText = opt.options[opt.selectedIndex].text;
			var optVal = opt.options[opt.selectedIndex].value; // lectureclass 번호 값
			$("#lecTitle").text(optText);
			$.ajax({
				url:"listThumbnail",
				type:"POST",
				data:{
					lectureclass_no : optVal
				},
				dataType:"json",
				success:function(data){
					var list = "";
					
				},
				error:function(){
					
				}
			});
		}
		// 등록 폼으로 이동
		function goAdd(){
			var opt = document.getElementById("listTitle");
			var optVal = opt.options[opt.selectedIndex].value; // lectureclass 번호 값
			location.href="addVideo?lectureclass_no="+optVal;
		}
	</script>
</body>
</html>