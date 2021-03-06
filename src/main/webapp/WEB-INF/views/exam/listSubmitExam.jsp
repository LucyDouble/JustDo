<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험리스트-학생</title>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
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
		<p class="ln_title">시험 리스트</p>
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
						<th class="work_title">강의명</th>
						<th>강사 명</th>
						<th class="work_title">제목</th>
						<th class="work_date">시험시간</th>
						<th>진행여부</th>
						<th>성적</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listExam }" var="i">
						<tr>
							<td>${i.rnum }</td>
							<td >${i.lecture_title }</td>
							<td>${i.name }</td>
							<c:choose>
								<c:when test="${time2<i.examdate }">
									<td class="ln_cont" onclick="noStart();">${i.exam_subject }</td>
								</c:when>
								<c:when test="${time2==i.examdate && time<i.examStart }">
									<td class="ln_cont" onclick="noStart();">${i.exam_subject }</td>
								</c:when>
								<c:otherwise>
									<td class="ln_cont" onclick="location.href='viewSubmitExam?exam_no=${i.exam_no }&registration_no=${i.registration_no }'">${i.exam_subject }</td>
								</c:otherwise>
							</c:choose>
							<td>${i.exam_date } [${i.exam_start }~ ${i.exam_end }]</td>
							<td>
								<c:if test="${time2<i.examdate}">진행전</c:if>
								<c:if test="${time2==i.examdate}">
									<c:if test="${time<i.examStart}">진행전</c:if> 
								    <c:if test="${time<=i.examEnd && time>=i.examStart}"><strong style="color: #6A60A9;">진행중</strong></c:if> 
									<c:if test="${time>i.examEnd}">완료</c:if>
								</c:if>
								<c:if test="${time2>i.examdate}">완료</c:if> 
							</td>
							<td>
								${i.exam_grade }
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
	
		<c:if test="${keyword !='' }">
		<button class="button" onclick="location.href='listSubmitExam'">
				<span>목록</span>
		</button>
		</c:if>
	<br><br><br>



	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listSubmitExam?page=${startPage-1}&keyword=${keyword}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listSubmitExam?keyword=${keyword}">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listSubmitExam?page=${endPage+1}&keyword=${keyword}">다음</a>
	</c:if>
		 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
	<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
function noStart(){
	swal("Fail","시험 시간이 아닙니다.","warning");
}

</script>
</html>