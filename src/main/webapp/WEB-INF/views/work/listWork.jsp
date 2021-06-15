<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제리스트-강사</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<style>
a {
	text-decoration: none;
	color: #08182B;
}
</style>
</head>
<body>
	
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="ln_title">과제 리스트</p>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>수업명</th>
					<th>제목</th>
					<th>class</th>
					<th>제출기간</th>
					<th>진행여부</th>
					<th>제출현황</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listWork }" var="i">
					<tr>
						<td>${i.work_no }</td>
						<td>${i.lecture_title }</td>
						<td class="cont2">${i.work_subject }</td>
						<td>${i.lecture_class }</td>
						<td>${i.work_start }~ ${i.work_end }</td>
						<td><c:if test="${time<i.startday}">진행전</c:if> <c:if
								test="${time>=i.startday && time<=i.endday}">진행중</c:if> <c:if
								test="${time>i.endday}">완료</c:if></td>
						<td><c:if test="${time>=i.startday}">보러가기</c:if></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<form action="addWorkFrom" method="post">
			<input type="hidden" name="teacher_number" value="100001">
			<button class="button">
				<span>과제등록</span>
			</button>
		</form>


	<br><br><br>



	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listWork?page=${startPage-1}&search=${search}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listWork">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listWork?page=${endPage+1}&search=${search}">다음</a>
	</c:if>
		 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
</body>
</html>