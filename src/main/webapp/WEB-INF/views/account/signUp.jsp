<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.form {
	margin-top: 100px;
	position: absolute;
	left: 40%;
}

label {
	font-weight: bold;
	font-size: 18px;
}

.btn {
	display: inline-block;
	border-radius: 7px;
	background-color: #6A60A9;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 5px;
	width: 50px;
	height: 20px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	float: right;
}

.btn btn-primary px-3 {
	display: inline-block;
	border-radius: 7px;
	background-color: #6A60A9;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 5px;
	width: 150px;
	height: 40px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	float: right;
}
</style>

</head>

<body>

	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<form method="GET" class="form">
		<div class="signUp-group">
			<label for="category">구분</label><br> <input type="radio"
				name="signUpSelect" checked="checked" value="student">수강생 <input
				type="radio" name="signUpSelect" value="teacher">교직원
		</div>
		<br>
		<!-- 아이디 -->
		<div class="form-group">
			<label for="sign_id">아이디</label> <br> <input type="text"
				class="form-control" id="sign_id" name="sign_id" placeholder="ID"
				required>
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="sign_pw">비밀번호</label> <br> <input type="password"
				class="form-control" id="sign_pw" name="sign_pw"
				placeholder="PASSWORD" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="sign_pw2">비밀번호 확인</label> <br> <input
				type="password" class="form-control" id="sign_pw2" name="sign_pw2"
				placeholder="Confirm Password" required>
			<div class="check_font" id="pw2_check"></div>
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<label for="sign_name">이름</label><br> <input type="text"
				class="form-control" id="sign_name" name="sign_name"
				placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>

		<!-- 본인확인 이메일 -->
		<div class="form-group">
			<label for="sign_email">이메일</label><br> <input type="text"
				class="form-control" name="sign_email" id="sign_email"
				placeholder="E-mail" required>
		<br>
<input type="text" style="margin-top: 5px;"
				class="email_form" name="email_confirm" id="email_confirm"
				placeholder="인증번호를 입력해주세요!" required>

			<div class="check_font" id="email_check"></div>
		</div>
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="student_phone">휴대전화</label><br> <input type="text"
				class="form-control" id="student_phone" name="student_phone"
				placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		<br>
		<div class="reg_button">

			<button class="btn btn-primary px-3" id="reg_submit">
				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
			</button>
		</div>
	</form>








	<script type="text/javascript">
		//모든 공백 체크 정규식
		var empCheck = /\s/g;
		//아이디 정규식
		var idCheck = /^[A-Za-z0-9]{4,12}$/;
		// 비밀번호 정규식
		var pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		// 이름 정규식
		var nameCheck = /^[가-힣]$/;
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#sign_id")
				.blur(
						function() {
							var sign_id = $('#sign_id').val();
							var signUpSelect = $(
									'input[name="signUpSelect"]:checked').val();
							console.log(signUpSelect);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/idCheck?sign_id='
												+ sign_id
												+ "&signUpSelect="
												+ signUpSelect,
										type : 'GET',
										success : function(data) {
											console.log("1 = 중복o / 0 = 중복x : "
													+ data);
											console.log(sign_id);

											if (data == 1) {
												// 1 : 아이디가 중복되는 문구
												$("#id_check").text(
														"사용중인 아이디입니다 :(");
												$("#id_check").css("color",
														"red");
												$("#id_check").css("font-size",
														"5px");
												$("#reg_submit").attr(
														"disabled", true);
											} else {

												if (idCheck.test(sign_id)) {
													// 0 : 아이디 길이 / 문자열 검사
													$("#id_check").text(
															"사용 가능한 아이디입니다 :)");
													$("#id_check").css("color",
															"blue");
													$("#id_check").css(
															"font-size", "5px");
													$("#reg_submit").attr(
															"disabled", false);

												} else if (sign_id == "") {

													$('#id_check').text(
															'아이디를 입력해주세요');
													$('#id_check').css('color',
															'red');
													$("#id_check").css(
															"font-size", "5px");
													$("#reg_submit").attr(
															"disabled", true);

												} else {

													$('#id_check')
															.text(
																	"아이디는 영어와 숫자 4~12자리만 가능합니다.");
													$('#id_check').css('color',
															'red');
													$('#id_check').css(
															'font-size', '5px')
													$("#reg_submit").attr(
															"disabled", true);
												}

											}
										},
										error : function() {
											console.log("실패");
										}
									});
							$("#sign_name").blur(function() {
								if (nameCheck.test($(this).val())) {
									console.log(nameCheck.test($(this).val()));
									$("#name_check").text('');
								} else {
									$('#name_check').text('이름은 한글만 입력 가능합니다.');
									$('#name_check').css('color', 'red');
									$('#name_check').css('font-size', '5px');
								}
							});
						});

		// 비밀번호 유효성 검사
		$("#sign_pw").blur(function() {
			var sign_pw = $('#sign_pw').val();

			if (pwCheck.test($('#sign_pw').val())) {
				console.log('true');
				$('#pw_check').text('');
			} else if (sign_pw == "") {
				$('#pw_check').text('비밀번호를 입력해주세요');
				$('#pw_check').css('color', 'red');
				$("#pw_check").css('font-size', '5px');
				$("#reg_submit").attr("disabled", true);

			} else {
				console.log('false');
				$('#pw_check').text('비밀번호는 숫자, 문자, 특수문자 조합 8~15자리만 가능합니다. :(')
				$('#pw_check').css('color', 'red');
				$('#pw_check').css('font-size', '5px')

			}
		});

		// 비밀번호 일치 확인
		$("#sign_pw2").blur(function() {
			var sign_pw2 = $('#sign_pw2').val();

			if ($('#sign_pw').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
				$('#pw2_check').css('color', 'red');
				$('#pw2_check').css('font-size', '5px')
				console.log(sign_pw2);

			} else {
				$('#pw2_check').text('');
			}
		});

		$('#sign_email')
				.blur(
						function() {
							// id = "id_reg" / name = "userId"
							var sign_email = $(this).val();
							var signUpSelect = $(
									'input[name="signUpSelect"]:checked').val();
							console.log(signUpSelect);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/emailCheck?sign_email='
												+ sign_email
												+ "&signUpSelect="
												+ signUpSelect,
										type : 'get',
										dataType : 'json',
										success : function(data) {
											console.log(data);

											if (data == 1) {
												// 1 : 아이디가 중복되는 문구
												$("#email_check").text(
														"이미 가입된 이메일입니다 :(");
												$("#email_check").css("color",
														"red");
												$("#email_check").css('font-size', '5px');
												$("#reg_submit").attr(
														"disabled", true);
											} else {
												// 이메일
												if (mailJ.test($('#sign_email')
														.val())) {
													console.log(mailJ.test($(
															'#sign_email')
															.val()));
													$("#email_check").text('');
													$("#reg_submit").attr(
															"disabled", false);
												} else {
													$('#email_check').text(
															'이메일을 확인해주세요 :)');
													$('#email_check').css(
															'color', 'red');
													$("#email_check").css('font-size', '5px');
													$("#reg_submit").attr(
															"disabled", true);
												}

											}

										},
										error : function(error) {
											console.log("실패");
										}
									});

						});
	</script>
</body>

</html>