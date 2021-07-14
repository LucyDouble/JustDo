<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="header">
	<a href="<%=request.getContextPath()%>/jdHome?command=main"><img
		class="logo" src="resources/images/mainlogo.png"></a>

	<div id="top_menu">
		<c:choose>
			<c:when
				test="${sessionScope.student_id == null && sessionScope.teacher_id ==null && sessionScope.manager_id == null}">
				<a href="login">로그인</a>
				<a href="agreeSignUp" id="signUp">회원가입</a>
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
					<a href="aboutJD">JD 소개</a> <a href="knowhow">이용방법</a> <a
						href="aboutAddress">오시는 길</a>
				</div></li>
			<li class=""><a href="aboutTeacher">강사소개</a>
				<div id="drop_content">
					<a href="#">강남 교육원</a> <a href="#">종각 교육원</a> <a href="#">부평
						교육원</a>
				</div></li>

			<li class="aboutJD"><a href="#">강의</a>
				<div id="drop_content">
					<c:if
						test="${sessionScope.student_id !=null && sessionScope.teacher_id == null && sessionScope.manager_id == null && sessionScope.manager_id == null}">
						<a href="listAttend">출석하기</a>
					</c:if>
					<c:if
						test="${sessionScope.student_id !=null && sessionScope.teacher_id == null && sessionScope.manager_id == null && sessionScope.manager_id == null}">
						<a href="listSubmitWork">과제 조회</a>
					</c:if>
					<c:if
						test="${sessionScope.student_id !=null && sessionScope.teacher_id == null && sessionScope.manager_id == null && sessionScope.manager_id == null}">
						<a href="listSubmitExam">시험 조회</a>
					</c:if>
					<c:if
						test="${sessionScpoe.student_id == null && sessionScope.teacher_id != null && sessionScope.manager_id == null}">
						<a href="listWork">과제 조회</a>
					</c:if>
					<c:if
						test="${sessionScpoe.student_id == null && sessionScope.teacher_id != null && sessionScope.manager_id == null}">
						<a href="listExam">시험 조회</a>
					</c:if>
					<c:if
						test="${sessionScpoe.student_id == null && sessionScope.teacher_id != null && sessionScope.manager_id == null}">
						<a href="listManagement">학생 관리</a>
					</c:if>
				</div></li>

			<li class="aboutJD"><a href="#">마이페이지</a>
				<div id="drop_content">
					<c:choose>
						<c:when
							test="${sessionScope.student_id == null && sessionScope.teacher_id ==null && sessionScope.manager_id == null}">
							<a href="login" id="login">로그인</a>
							<a href="agreeSignUp">회원가입</a>
							<a href="login">수강신청</a>
							<div class="find">
								<a href="#" id="find">아이디 | 패스워드 찾기</a>
								<div id="drop_content2">
									<a href="studentSearch">학생</a> <a href="teacherSearch">교직원</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<a href="logout" id="logout">로그아웃</a>
							<c:if
								test="${sessionScope.student_id !=null && sessionScope.teacher_id == null && sessionScope.manager_id == null && sessionScope.manager_id == null}">
								<a href="editStudentForm">수강생 정보수정</a>
							</c:if>
							<c:if
								test="${sessionScope.student_id !=null && sessionScope.teacher_id == null && sessionScope.manager_id == null && sessionScope.manager_id == null}">
								<a href="registration">수강신청</a>
							</c:if>
							<c:if
								test="${sessionScope.student_id !=null && sessionScope.teacher_id == null && sessionScope.manager_id == null && sessionScope.manager_id == null}">
								<a href="listVideo">학습동영상</a>
							</c:if>
							<c:if
								test="${sessionScope.student_id == null && sessionScope.teacher_id != null && sessionScope.manager_id == null}">
								<a href="lecture">강의등록</a>
							</c:if>
							<c:if
								test="${sessionScope.student_id == null && sessionScope.teacher_id != null && sessionScope.manager_id == null}">
								<a href="listVideo">학습동영상</a>
							</c:if>
							<c:if
								test="${sessionScope.student_id == null && sessionScope.teacher_id != null && sessionScope.manager_id == null}">
								<a href="editTeacherForm">교직원 정보수정</a>
							</c:if>
							<c:if
								test="${sessionScope.student_id == null && sessionScope.teacher_id == null && sessionScope.manager_id != null}">
								<a href="acceptTeacherForm">교직원 승인</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div></li>
			<li class=""><c:if
					test="${sessionScope.student_id !=  null || sessionScope.teacher_id != null || sessionScope.manager_id != null}">
					<a href="listNotice">공지사항</a>
				</c:if></li>
			<li class="aboutJD"><a href="#">상담센터</a>
				<div id="drop_content">
					<c:if
						test="${sessionScope.teacher_id != null || sessionScope.manager_id != null}">
						<a href="listCS">상담신청</a>
					</c:if>
					<c:if
						test="${sessionScope.student_id ==  null || sessionScope.teacher_id != null || sessionScope.manager_id != null}">
						<a href="http://pf.kakao.com/_xjxmxcws">카카오톡채널</a>
					</c:if>
				</div></li>
		</ul>
	</nav>
	<a href=""><img class="logo3" src="resources/images/logo3.jpg"></a>
</header>
<script>

</script>