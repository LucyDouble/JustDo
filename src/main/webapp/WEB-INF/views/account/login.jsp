<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype HTML>
<html>
<link rel="stylesheet" href="<c:url value="/resources/css/account/login.css"/>"> 
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
			<div class="sel-lang-wrap">
			</div>
			<div class="logo-wrap">
				<img src="resources/images/logo.png">
			</div>
			
		</header>
		
		<section class="login-input-section-wrap">
			
			<div class="login-input-wrap">	
				<input name="id" id="id" placeholder="Username" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input name="password" id="password" placeholder="Password" type="password"></input>
			</div>
				<div class="form-group">
			<label for="category"></label><br> <input type="radio"
				name="loginSelect" checked="checked" value="student">수강생 <input
				type="radio" name="loginSelect" value="teacher">교직원
		</div>
	
			<div class="login-button-wrap">
				<button id="login" value="로그인">Sign in</button>
			</div>
			<br>
			<c:if test="${msg == '실패'}">
							<p style="font-size:5px; color:red">아이디 또는 패스워드가 틀렸습니다.</p>
						</c:if>
			<div class="login-stay-sign-in">
				<i class="far fa-check-circle"></i>
			</div>
		</section>
		<section class="Easy-sgin-in-wrap">

		
			<p class="forget-msg">Forgot your Username or Password? | Sign up</p>
		</section>
		
		</div>
	</div>
	</form>
</body>
<script type = "text/javascript">
$('#login').click(function(){

	// 입력 값 체크

	//전송
	$('#loginFrm').submit();
});
//회원가입 버튼
$('#signUp').click(function() {
	location.href="signUpPage";
});
</script>
</html>