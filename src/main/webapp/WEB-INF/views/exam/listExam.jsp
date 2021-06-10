<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 목록</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">

<style>
@font-face {
  	src: url("<c:url value="/resources/fonts/SCDream4.otf"/>")format("opentype");  
	
	font-family: SCDream4;
}

body {
	margin: 0px;
	padding: 0px;
	text-align: center;
	width: 800px;
	margin: auto;
	font-family: SCDream4;
}

.listnotice_title {
	font-size: 25px;
	font-weight: bold;
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

footer {
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 150px;
	width: 100%;
	background: grey;
	color: white;
}

.button {
	display: inline-block;
	border-radius: 7px;
	background-color: #6A60A9;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	width: 70px;
	height: 35px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	float: right;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '*';
	position: absolute;
	opacity: 0;
	top: -5px;
	right: -10px;
	transition: 0.2s;
}

.button:hover span {
	padding-right: 10px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.cont2 {
	text-align: left;
}

.cont2:hover {
	cursor : pointer;
	font-weight: bold;
/* 	 transform: scale(1.03); 
	transition: all 0.5s;
	ease-in-out;  */
}
</style>
<body>
	<br>
	<br>
	<p class="listnotice_title">공지사항 게시판</p>
	<br>
	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td class="cont2">테스트입니다</td>
				<td>운영자</td>
				<td>2021-06-04</td>
			</tr>
			<tr>
				<td>2</td>
				<td class="cont2">테스트입니다</td>
				<td>운영자</td>
				<td>2021-06-04</td>
			</tr>
			<tr>
				<td>3</td>
				<td class="cont2">테스트입니다</td>
				<td>운영자</td>
				<td>2021-06-04</td>
			</tr>
			<tr>
				<td>4</td>
				<td class="cont2">테스트입니다/테스트입니다/테스트입니다/테스트입니다/테스트입니다/테스트입니다</td>
				<td>운영자</td>
				<td>2021-06-04</td>
			</tr>
			<tr>
				<td>5</td>
				<td class="cont2">테스트입니다</td>
				<td>운영자</td>
				<td>2021-06-04</td>
			</tr>
		</tbody>
	</table>
	<br><br>
	<button class="button">
		<span>글쓰기</span>
	</button>
</body>

</html>