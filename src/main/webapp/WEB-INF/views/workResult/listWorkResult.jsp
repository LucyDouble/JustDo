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


.search_bar {
	padding: 3px 0;
	outline: 1;
	border: 1px solid transparent;
	border-bottom: 1px solid #575756;
	border-radius: 0;
}

.search_btn {
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
}

.search_btn span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.search_btn span:after {
	content: '*';
	position: absolute;
	opacity: 0;
	top: -5px;
	right: -10px;
	transition: 0.2s;
}

.search_btn:hover span {
	padding-right: 10px;
}

.search_btn:hover span:after {
	opacity: 1;
	right: 0;
}

.search {
	float: right;
	margin-bottom: 20px;
	padding: 0;
} 



</style>
</head>
<body>
	
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="ln_title">과제 리스트</p>
		<!-- 서치바 -->
		<div class="search">
			<form class="search_form" action="listWorkResult" method="POST">
				<input class="search_bar" type="text" name="keyword" placeholder="이름">
				<button class="search_btn" type="submit"><span>검색</span></button>
				<input type="hidden" name="work_no" value="${work_no }">
				<input type="hidden" name="work_subject" value="${work_subject }">
				<input type="hidden" name="lecture_class" value="${lecture_class }">
				<input type="hidden" name="lecture_title" value="${lecture_title }">
				<input type="hidden" name="work_start" value="${work_start }">
				<input type="hidden" name="work_end" value="${work_end }">				
			</form>
		</div>
		수업명 : ${lecture_title}
		<br>
		과제명 : ${work_subject}
		<br>
		제출 기간 : ${work_start}~${work_end } 
		<br>
		class : ${lecture_class }
		
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>학생명</th>
						<th>제출여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listWork }" var="i">
						<tr>
							<td>${i.rnum }</td>
							<td>${i.name }</td>
							<td class="ln_cont" onclick="location.href=''">
								<c:if test="${i.work_answer ==null }">x</c:if>
								<c:if test="${i.work_answer !=null }">제출</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

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