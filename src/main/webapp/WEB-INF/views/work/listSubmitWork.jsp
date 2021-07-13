<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제리스트-학생</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/listWork.css"/>">
<script src="https://kit.fontawesome.com/afd6aa68df.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
</head>
<body>
	
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="ln_title">과제 리스트</p>
		<!-- 서치바 -->
		<div class="lc_search_box">
			<form class="lc_search" action="#" method="get">
				<input class="lc_search_input" type="text" name="keyword" placeholder="검색"
				onmouseout="document.search.keyword.value = ''">
			</form>
			  <i class="fas fa-search"></i>
		</div>
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th class="work_title">수업명</th>
						<th>강사 명</th>
						<th class="work_title">제목</th>
						<th class="work_date">제출기간</th>
						<th>진행여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listWork }" var="i">
						<tr>
							<td>${i.rnum }</td>
							<td >${i.lecture_title }</td>
							<td>${i.name }</td>
							<td class="ln_cont" onclick="location.href='viewSubmitWork?work_no=${i.work_no }&registration_no=${i.registration_no }'">${i.work_subject }</td>
							<td>${i.work_start }~ ${i.work_end }</td>
							<td>
								<c:if test="${time<i.startday}">x</c:if> 
								<c:if test="${time>=i.startday && time<=i.endday}">진행중</c:if> 
								<c:if test="${time>i.endday}">완료</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		<c:if test="${keyword !='' }">
		<button class="button" onclick="location.href='listSubmitWork'">
				<span>목록</span>
		</button>
		</c:if>
	<br><br><br>



	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listSubmitWork?page=${startPage-1}&keyword=${keyword}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listSubmitWork?keyword=${keyword}">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listSubmitWork?page=${endPage+1}&keyword=${keyword}">다음</a>
	</c:if>
		 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
	<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>