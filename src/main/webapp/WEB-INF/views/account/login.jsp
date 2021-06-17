<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	
  <style>
:root{
	--body-background-color: #f5f6f7;
	--font-color: #black;
	--border-gray-color : #dadada;
	--jd-color: #6A60A9;
}


*{
	margin:0;
	padding:0;
}

body{
	background:var(--body-background-color);
}

.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.main-container .main-wrap{
	width:768px;

}

.main-container .main-wrap .logo-wrap{
	padding-top:55px;
}
.main-container .main-wrap .logo-wrap img
{
	width: 300px;
	height: 300px;
}

.main-container .main-wrap header .sel-lang-wrap{
	display:flex;
	justify-content:flex-end;
}

.main-container .main-wrap header .logo-wrap{
	display:flex;	
	flex-direction: column;
	align-items: center;
}
.login-input-section-wrap{
	padding-top: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.login-input-wrap{
	width: 465px;
	height :48px;
	border: solid 1px var(	--border-gray-color );
	background: white;
}
.password-wrap{
	margin-top: 13px;
}
.login-input-wrap input{
	border: none;
	width:430px;
	margin-top: 10px;
	font-size: 14px;
	margin-left: 10px;
	height:30px;
}
.login-button-wrap {
	padding-top: 13px;
}
.login-button-wrap button{
	width: 465px;
	height :48px;
	font-size: 18px;
	background: var(--jd-color);
	color: white;
	border: solid 1px var(--jd-color);
}
.login-stay-sign-in{
	width: 465px;
	height: 52px;
	
	display: flex;
	font-size: 15px;
	color: #4e4e4e;
	align-items: center;
	justify-content: flex-start;
	border-bottom: solid 1px var(--border-gray-color);
}
.login-stay-sign-in i{
	font-size: 25px;
	color: #9ba1a3;
}
.login-stay-sign-in span{
	padding-left: 5px;
	line-height: 25px;
}
#login{
cursor : pointer;
}
.Easy-sgin-in-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 40px;

}
.Easy-sgin-in-wrap h2{
	font-size: 20px;
}
.Easy-sgin-in-wrap .sign-button-list
{
	padding-top:25px;
	list-style: none;
	width: 465px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.Easy-sgin-in-wrap .sign-button-list li{
	padding-bottom: 10px;
}
.Easy-sgin-in-wrap .sign-button-list li button{
	width: 465px;
	height: 56px;
	border: solid 1px var(--border-gray-color);
	text-align: left;
	background: white;
}
.Easy-sgin-in-wrap .sign-button-list li button i{
	padding-left: 15px;
	font-size: 20px;
}

.Easy-sgin-in-wrap .sign-button-list li button span{
	padding-left: 20px;
	font-size: 18px;
}
.Easy-sgin-in-wrap .forget-msg{
	color:var(--font-color);
	font-size: 14px;
	padding-top: 10px;

}
footer{
   
	padding-top: 95px;
	padding-bottom: 15px;

	display:flex;
	flex-direction:column;
	align-items:center;
	width:768px;



}
.copyright-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	height: 15px;


}
footer .copyright-wrap span img{
	width: 59px;
	
	height: 11px;
}
footer .copyright-wrap span{
	font-size: 13px;
	line-height: 15px;
}

    
  </style>

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
			<c:if test="${msg == '실패'}">
							<tr>
								<td colspan=2>
									아이디 또는 패스워드가 틀렸습니다.
								</td>
							</tr>
						</c:if>
	
			<div class="login-button-wrap">
				<button id="login" value="로그인">Sign in</button>
			</div>
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