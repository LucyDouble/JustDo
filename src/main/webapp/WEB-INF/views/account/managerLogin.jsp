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
	<form id="loginFrm" action="managerLoginCheck" method="post">
		<div class="main-container">
			<div class="main-wrap">
				<header>
					<div class="sel-lang-wrap"></div>
					<div class="logo-wrap">
						<a href="<%=request.getContextPath()%>/jdHome?command=main"><img
							src="resources/images/logo4.png"></a>
					</div>

				</header>

				<section class="login-input-section-wrap">

					<div class="login-input-wrap">
						<input name="id" id="id" placeholder="아이디" type="text"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input name="password" id="password" placeholder="비밀번호"
							type="password"></input>
					</div>
					<div class="login-button-wrap">
						<button id="login" value="로그인">Sign in</button>
					</div>
					<br>
					<c:if test="${msg == '실패'}">
						<p style="font-size: 5px; color: red">아이디 또는 패스워드가 틀렸습니다.</p>
					</c:if>
					<div class="login-stay-sign-in">
						<i class="far fa-check-circle"></i>
					</div>
				</section>

			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	$('#login').click(function() {

		// 입력 값 체크

		//전송
		$('#loginFrm').submit();
	});

</script>
</html>