<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<header id="header">
	<a href="<%=request.getContextPath()%>/jdHome?command=main"><img
		class="logo" src="resources/images/logo.png"></a>

	<div id="top_menu">
		<c:choose>
			<c:when
				test="${sessionScope.student_id == null && sessionScope.teacher_id ==null}">
				<a href="login">로그인</a>
				<a href="signUp" id="signUp">회원가입</a>
			</c:when>
			<c:otherwise>
				<a href="logout">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>

	<nav>
		<ul>
			<li class="aboutJD"><a id="aboutJD" href="#">JD안내</a>
				<div id="drop_content">
					<a href="aboutJD">JD 소개</a> <a href="#">이용방법</a> <a href="#">오시는
						길</a>
				</div></li>
			<li class=""><a href="#">강사소개</a>
				<div id="drop_content">
					<a href="#">강남 교육원</a> <a href="#">종각 교육원</a> <a href="#">부평
						교육원</a>
				</div></li>

			<li class="aboutJD"><a href="#">수강신청</a></li>

			<li class="aboutJD"><a href="#">마이페이지</a>
				<div id="drop_content">
					<c:choose>
						<c:when
							test="${sessionScope.student_id == null && sessionScope.teacher_id ==null}">
							<a href="login" id="login">로그인</a>
							<a href="signUpPage">회원가입</a>
							<a href="<%=request.getContextPath()%>/lecture">수강과목</a>
						</c:when>
						<c:otherwise>
							<a href="logout" id="logout">로그아웃</a>
							<c:if
								test="${sessionScope.student_id !=null && sessionScope.teacher_id == null }">
								<a href="editStudentForm">수강생 정보수정</a>
							</c:if>
							<c:if
								test="${sessionScpoe.student_id == null && sessionScope.teacher_id != null }">
								<a href="editTeacherForm">교직원 정보수정</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div></li>
			<li class="aboutJD"><a href="#">상담센터</a>
				<div id="drop_content">
					<a href="#">상담 신청</a> <a href="#">상담 조회</a>
				</div></li>
		</ul>
	</nav>
	<a href=""><img class="logo3" src="resources/images/logo3.jpg"></a>
</header>
<script>

</script>