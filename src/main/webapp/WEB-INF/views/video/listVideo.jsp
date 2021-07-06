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
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<link rel="stylesheet" href="resources/css/videoList.css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
			<div>
				<p class="ln_title">학습동영상</p>
				<p>수강과목</p>
				<select>
					<option>ㄱㄱㄱㄱ</option>
				</select>
				<p>과목과목과목</p>
				<progress></progress>
				<progress></progress>
			</div>
			<form action="addVideo" method="post" enctype="multipart/form-data">
				<input type="file" value="파일선택" name="file">
				<input type="submit" value="업로드">
			</form>
			<div>
				<ul>
					<li><a></a></li>
				</ul>
			</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>