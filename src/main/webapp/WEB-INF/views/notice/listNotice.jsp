<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<style>
</style>

<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="ln_page">
			<p class="ln_title">공지사항 게시판</p>
			<br>
			<table class="table">
				<colgroup>
        		 	<col style="width: 60px;">
        			<col style="width: ;">
        			<col style="width: 120px;">
        			<col style="width: 100px;">
        			<col style="width: 80px;">
    			</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listNotice }" var="list">
					<tr>
						<td>${list.rnum}</td>
						<td class="ln_cont"><a href="viewNotice?n_no=${list.notice_no}">${list.notice_sub }</a></td>
						<td>
							<c:if test="${list.manager_number >= 20000 }">운영자</c:if>
							<c:if test="${list.teacher_number >= 100000 }">${list.teacher_name }</c:if>
							</td>
 							<td><fmt:parseDate value="${list.notice_date }" var="noticePostDate" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${noticePostDate }" pattern="yyyy.MM.dd"/></td>
							<td>${list.hit }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<button class="button" onclick="location.href='addNoticeForm'">
				<span>글쓰기</span>
			</button>

		<div class="ln_paging">
			<c:if test="${startPage != 1 }">
				<a
					href="<%=request.getContextPath() %>/listNotice?page=${startPage-1}&keyword=${keyword}">이전</a>
			</c:if>
			<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${p eq currentPage}">
					<font color="#6A60A9" size="4"><b>[${p}]</b></font>
				</c:if>
				<c:if test="${p ne currentPage}">
					<c:url var="listNoticeChk" value="listNotice?keyword=${keyword}">
						<c:param name="page" value="${p}" />
					</c:url>
					<a href="${listNoticeChk}">${p}</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a
					href="<%=request.getContextPath() %>/listNotice?page=${endPage+1}&keyword=${keyword}">다음</a>
			</c:if>
		</div>

		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
		</div>
</body>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</html>