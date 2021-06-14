<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
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
     .table th {
    font-size: 18px;
    color: #fff;
    line-height: 1.4;
    background-color: #6A60A9;
    }
    .table td {
    font-size: 15px;
    color: black;
    line-height: 1.4;
    }
    .table .table tr:nth-child(even) {
    background-color: #f8f6ff;
    }
    .table {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -webkit-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -o-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -ms-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    }
    .cont {
    	border-bottom: 1px;
    	border-bottom-style: solid;
    	border-bottom-color: black;
    	margin-bottom: 50px;
    }
    .content1 {
    	margin: 30px;
    	
    }
    h2 {
    	
    }
</style>
</head>
<body>
<div>
	<section>
		<div class="cont">
			<article class="content1">
				<h2>강의정보</h2>
			</article>
		</div>
		<div>
			<article>
				<form id="lecturefrm" action="lectureAddForm" method="get">
					<table class="table">
						<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>강의시간</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">	
								<tr>
									<td>${vo.lecture_no}</td>
									<td>${vo.lecture_class}</td>
									<td>${vo.lecture_title}</td>
									<td>${vo.lecture_starttime} ~ ${vo.lecture_endtime}</td>
									<td>교직원</td>
									<td>${vo.lecture_limit}</td>
									<td>0</td>
									<td><input type="radio"></td>
								</tr>
							</c:forEach>	
						</tbody>
					</table>
                    <input type="submit" value="등록">
<!--                     <input type="button" value="등록" onclick="window.location='lectureAddForm'"> -->
					<!-- <input type="button" value="등록" onclick="popupCenter();"> -->
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</form>
			</article>
		</div>
	</section>
</div>
<script>
function popupCenter() {
	var w = 1000;
	var h = 700;
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2);

	window.open("lectureAddForm", "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}
function gg(){
	location.href='lectureAddForm';
}
</script>
</body>
</html>