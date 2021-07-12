<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype HTML>
<html>
<link rel="stylesheet"
	href="<c:url value="resources/css/account/login.css"/>">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>


</head>
<body>
	<form id="loginFrm" action="loginCheck" method="post">
		<div class="main-container">
			<div class="main-wrap">
				<header>
					<div class="sel-lang-wrap"></div>
					<div class="logo-wrap">
						<a href="<%=request.getContextPath()%>/jdHome?command=main"><img
							src="resources/images/logo.png"></a>
					</div>

				</header>
				<div style="text-align: center;width:100%;/* height:30px; *//* line-height: 30px; */">
					<p style="font-size: 30px;">로그인</p>
				</div>
				<section class="login-input-section-wrap">
					<div class="form-group">
						<ul>
							<li><input type="radio" id="student" name="loginSelect"
								checked="checked"> <label for="student">수강생</label>
								<div class="check"></div>
							</li>

							<li><input type="radio" id="teacher" name="loginSelect">
								<label for="teacher">교직원</label>
								<div class="check">
									<div class="inside"></div>
								</div>
							</li>
						</ul>
					</div>
					<div class="login-input-wrap">
						<input name="id" id="id" placeholder="아이디" type="text" required></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input name="password" id="password" placeholder="비밀번호"
							type="password" required></input>
					</div>

					<div class="login-button-wrap">
						<button id="login" value="로그인">로그인</button>
					</div>
					<br>
					<c:if test="${msg == '실패'}">
						<p style="font-size: 5px; color: red">아이디 또는 패스워드가 틀렸습니다.</p>
					</c:if>
					<c:if test="${msg ==  '승인대기'}">
						<p style="font-size: 5px; color: red">승인 이후 사용 가능합니다.</p>
					</c:if>
					<div class="login-stay-sign-in">
						<i class="far fa-check-circle"></i>
					</div>
				</section>
				<section class="Easy-sgin-in-wrap">
					<div class="link_box">
						아직 JD 회원이 아니신가요? <a href="agreeSignUp" class="signUpLink"> 회원 가입</a>
					</div>
				</section>
			</div>
		</div>
	</form>
</body>
<%
	String strReferer = request.getHeader("referer");

if (strReferer == null) {
%>
<script language="javascript">
	alert("잘못된 접근입니다. 이전 페이지로 다시 돌아갑니다.");
	document.location.href = "jdHome";
</script>
<%
	return;
}
%>
<script type="text/javascript">
	$('#login').click(function() {

		// 입력 값 체크

		//전송
		$('#loginFrm').submit();
	});
	//회원가입 버튼
	$('#signUp').click(function() {
		location.href = "signUp";
	});
</script>
</html>