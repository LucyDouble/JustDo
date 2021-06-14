<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>"> 
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
	<div class="ac_page">
		<table class="table">
			<thead>
				<tr>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>희망상담시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="lc_form-control"></td>
					<td><input type="text" class="lc_form-control"></td>
					<td><input type="text" class="lc_form-control"></td>
					<td><input type="text" class="lc_form-control"></td>
				</tr>
			</tbody>
		</table>
		<button class="button" onclick="location.href=''">
			<span>등록</span>
		</button>
		<br> <br>
	</div>
</body>
</html>