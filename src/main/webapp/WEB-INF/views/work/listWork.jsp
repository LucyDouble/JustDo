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
<link rel="stylesheet" href="<c:url value="/resources/css/listWork.css"/>">
<script src="https://kit.fontawesome.com/afd6aa68df.js" crossorigin="anonymous"></script>

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
						<th class="work_title">제목</th>
						<th>class</th>
						<th class="work_date">제출기간</th>
						<th>진행여부</th>
						<th>제출현황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listWork }" var="i">
						<tr>
							<td>${i.work_no }</td>
							<td >${i.lecture_title }</td>
							<td class="ln_cont" onclick="location.href='viewWork?work_no=${i.work_no }'">${i.work_subject }</td>
							<td>${i.lecture_class }</td>
							<td>${i.work_start }~ ${i.work_end }</td>
							<td>
								<c:if test="${time<i.startday}">진행전</c:if> 
								<c:if test="${time>=i.startday && time<=i.endday}">진행중</c:if> 
								<c:if test="${time>i.endday}">완료</c:if>
							</td>
		<form id ="ResultFrm" action="listWorkResult" method="post">
							<td  >
								<c:if test="${time>=i.startday}" >
									<input type="hidden" name="work_no" value="${i.work_no }">
									<input type="hidden" name="work_subject" value="${i.work_subject }">
									<input type="hidden" name="lecture_class" value="${i.lecture_class }">
									<input type="hidden" name="lecture_title" value="${i.lecture_title }">
									<input type="hidden" name="work_start" value="${i.work_start }">
									<input type="hidden" name="work_end" value="${i.work_end }">
									<input type="submit" id ="ResultBtn" value="보러가기">
								</c:if>
							</td>
		</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<form action="addWorkForm" method="post">
			<!-- TODO -->
			<input type="hidden" name="teacher_number" value="100001">
			<button class="button">
				<span>과제등록</span>
			</button>
		</form>
		<c:if test="${keyword !='' }">
		<button class="button" onclick="location.href='listWork'">
				<span>목록</span>
		</button>
		</c:if>
	<br><br><br>



	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listWork?page=${startPage-1}&keyword=${keyword}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listWork?keyword=${keyword}">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listWork?page=${endPage+1}&keyword=${keyword}">다음</a>
	</c:if>
		 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
</body>
</html>