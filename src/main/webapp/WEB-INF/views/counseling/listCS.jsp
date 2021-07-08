<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://kit.fontawesome.com/afd6aa68df.js" crossorigin="anonymous"></script>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="lc_page">
		<p class="lc_title">상담신청 게시판</p>
		<br>

		<div class="lc_search_box">
			<form name="lc_search" action="#" method="get">
				<input class="lc_search_input" type="text" name="keyword"
					placeholder="검색" onmouseout="document.search.keyword.value = ''">
			</form>
			<i class="fas fa-search"></i>
		</div>
		<form id="lc_form">
			<table class="table">
				<thead>
					<tr>
						<th><label class="checkbox"> <input type="checkbox"
								id="checkall" class="checkbox" name="allCheck" /> <span
								class="icon"></span>
						</label></th>
						<th>No.</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>희망상담시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listCS }" var="list">
						<tr>
							<td><label class="checkbox"> <input type="checkbox"
									id="item" class="checkbox" name=item value="${list.counseling_no }" /> <span class="icon"></span>
							</label></td>
							<td>${list.counseling_no }</td>
 							<td class="lc_cont" onclick="viewshow('${list.counseling_no }','${list.counseling_name }','${list.counseling_phone }','${list.counseling_email }','${list.counseling_date } [TIME] ${list.clock } ','${list.counseling_date }','${list.clock }');">${list.counseling_name }</td> 
							<td>${list.counseling_phone }</td>
							<td>${list.counseling_email }</td>
							<td>${list.counseling_date }<p class="hopetime">시간</p>${list.clock }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<button id="btnRemove" class="button" onclick="btnRemoveClick();">
			<span>삭제</span>
		</button>

		<div class="ln_paging">
			<c:if test="${startPage != 1 }">
				<a
					href="<%=request.getContextPath() %>/listCS?page=${startPage-1}&keyword=${keyword}">이전</a>
			</c:if>
			<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${p eq currentPage}">
					<font color="#6A60A9" size="4"><b>[${p}]</b></font>
				</c:if>
				<c:if test="${p ne currentPage}">
					<c:url var="listCSChk" value="listCS?keyword=${keyword}">
						<c:param name="page" value="${p}" />
					</c:url>
					<a href="${listCSChk}">${p}</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a
					href="<%=request.getContextPath() %>/listCS?page=${endPage+1}&keyword=${keyword}">다음</a>
			</c:if>
		</div>
		<br>
	</div>
	<br>
	<br>
	<jsp:include page="../counseling/addCS.jsp"></jsp:include>
	<script>

		$("#checkall").change(function() {
			if ($("#checkall").is(":checked")) {
				//alert("체크박스 체크했음!");
				$("input[name='item']").prop('checked', true);
			} else {
				//alert("체크박스 체크 해제!");
				$("input[name='item']").prop('checked', false);
			}
		});

		//삭제 버튼 클릭시 모달팝업
		function btnRemoveClick(){
			if ($('input').is(":checked") == false){
				swal ("NOT CHECKBOX","체크박스 선택 후 삭제 해주세요.", "warning");
			} 
			else{
			document.querySelector(".rc_background").className = "rc_background show";
				}
			}
		
	</script>

	<jsp:include page="../counseling/removeCS.jsp"></jsp:include>
	<jsp:include page="../counseling/viewCS.jsp"></jsp:include>
	<jsp:include page="../counseling/editCS.jsp"></jsp:include>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>