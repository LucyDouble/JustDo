<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험리스트-교직원</title>
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
		<p class="ln_title">시험 리스트 ${time2 }</p>
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
						<th class="work_date">시험 일</th>
						<th>진행여부</th>
						<th>제출현황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listExam }" var="i">
						<tr>
							<td>${i.rnum }</td>
							<td>${i.lecture_title }</td>
							<td class="ln_cont" onclick="location.href='viewExam?exam_no=${i.exam_no }'">${i.exam_subject }</td>
							<td>${i.exam_date} [${i.exam_start }~ ${i.exam_end }]</td>
							
							<td>
								<c:if test="${time<i.examdate}">진행전</c:if> 
								<c:if test="${time==i.examdate && time2<i.examStart}">진행전</c:if> 
								<c:if test="${time==i.examdate && time2>=i.examStart && time2 <=i.examEnd}"><strong style="color: #6A60A9;">진행중</strong></c:if> 
								<c:if test="${time==i.examdate && time2>i.examEnd}">완료</c:if> 
								<c:if test="${time>i.examdate}">완료</c:if>
							</td>
		<form id ="ResultFrm" action="listExamResult" method="post">
							<td  >
							 	<c:if test="${time>i.examdate || (time==i.examdate && time2>i.examEnd)}" >
									<input type="hidden" name="exam_no" value="${i.exam_no }">
									<input type="hidden" name="exam_subject" value="${i.exam_subject }">
									<input type="hidden" name="lecture_no" value="${i.lecture_no }">
									<input type="hidden" name="lectureclass_class" value="${i.lectureclass_class }">
									<input type="hidden" name="lecture_title" value="${i.lecture_title }">
									<input type="hidden" name="exam_start" value="${i.exam_start }">
									<input type="hidden" name="exam_end" value="${i.exam_end }">
									<input type="hidden" name="exam_date" value="${i.exam_date }">
									<input type="submit" id ="ResultBtn" value="보러가기">
								</c:if>
							</td>
		</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<form action="addExamForm" method="post">
			<button class="button">
				<span>시험등록</span>
			</button>
		</form>
		<c:if test="${keyword !='' }">
		<button class="button" onclick="location.href='listExam'">
				<span>목록</span>
		</button>
		</c:if>
	<br><br><br>



	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listExam?page=${startPage-1}&keyword=${keyword}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listExam?keyword=${keyword}">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listExam?page=${endPage+1}&keyword=${keyword}">다음</a>
	</c:if>
		 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
	<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>