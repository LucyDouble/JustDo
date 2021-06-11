<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
</head>
<style>
.rn_modal {
	width:300px;
	height:120px;
	border-radius: 7px;
	border:1px solid;
	background:gray;
}

button {
	
}
</style>
<body>
	<div class="rn_modal">
		<p>글을 정말 삭제하시겠습니까?</p>
		<button class="no_btn">취소</button>
		<button class="ok_btn">삭제</button>
	</div>
		
	<script>
	</script>
</body>
</html>