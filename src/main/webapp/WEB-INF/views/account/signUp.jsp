<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</style>

</head>

<body>

	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<form method="POST" class="form">
		<!-- 아이디 -->
		<div class="form-group">
			<label for="student_id">아이디</label> <br> <input type="text"
				class="form-control" id="student_id" name="student_id"
				placeholder="ID" required>
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="student_pw">비밀번호</label> <br> <input type="password"
				class="form-control" id="student_pw" name="student_pw"
				placeholder="PASSWORD" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="student_pw2">비밀번호 확인</label> <br> <input
				type="password" class="form-control" id="student_pw2"
				name="student_pw2" placeholder="Confirm Password" required>
			<div class="check_font" id="pw2_check"></div>
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<label for="student_name">이름</label><br> <input type="text"
				class="form-control" id="student_name" name="student_name"
				placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<!-- 생년월일 -->
		<div class="form-group required">
			<label for="student_birth">생년월일</label><br> <input type="text"
				class="form-control" id="student_birth" name="student_birth"
				placeholder="ex) 19950625" required>
			<div class="check_font" id="birth_check"></div>
		</div>
		<!-- 본인확인 이메일 -->
		<div class="form-group">
			<label for="student_email">이메일</label><br> <input type="text"
				class="form-control" name="student_email" id="student_email"
				placeholder="E-mail" required>
			<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
                    <button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
                        <i class="fa fa-envelope"></i>&nbsp;인증
                    </button>&nbsp;
                    <button type="button" class="btn btn-outline-info btn-sm px-3">
                        <i class="fa fa-envelope"></i>&nbsp;확인
                    </button>&nbsp; -->
			<div class="check_font" id="email_check"></div>
		</div>
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="student_phone">휴대전화</label><br> <input type="text"
				class="form-control" id="student_phone" name="student_phone"
				placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		<div class="form-group">
			<label for="category">구분</label><br> <input type="radio"
				name="signUpSelect" checked="checked" value="student">수강생 <input
				type="radio" name="signUpSelect" value="teacher">교직원
		</div>
		<div class="reg_button">

			<button class="btn btn-primary px-3" id="reg_submit">
				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
			</button>
		</div>
	</form>








	<script type="text/javascript">
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[A-Za-z0-9]{6,12}$/;
		// 비밀번호 정규식
		var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/;
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#student_id")
				.blur(
						function() {
							var student_id = $('#student_id').val();
							$
									.ajax({
										url : '${pageContext.request.contextPath}/idCheck?student_id='
												+ student_id,
										type : 'GET',
										success : function(data) {
											console.log("1 = 중복o / 0 = 중복x : "
													+ data);
											console.log(student_id);

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

												if (idJ.test(student_id)) {
													// 0 : 아이디 길이 / 문자열 검사
													$("#id_check").text(
															"사용 가능한 아이디입니다 :)");
													$("#id_check").css("color",
															"blue");
													$("#id_check").css(
															"font-size", "5px");
													$("#reg_submit").attr(
															"disabled", false);

												} else if (student_id == "") {

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
																	"아이디는 영어와 숫자 6~12자리만 가능합니다.");
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
						});

		// 비밀번호 유효성 검사
		$("#student_pw").blur(function() {
			if (pwJ.test($('#student_pw').val())) {
				console.log('true');
				$('#pw_check').text('');
			} else {
				console.log('false');
				$('#pw_check').text('비밀번호는 숫자, 문자, 특수문자 조합 8~15자리만 가능합니다. :(')
				$('#pw_check').css('color', 'red');
				$('#pw_check').css('font-size', '5px')

			}
		});

		// 비밀번호 일치 확인
		$("#student_pw2").blur(function() {
			if ($('#student_pw').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
				$('#pw2_check').css('color', 'red');
				$('#pw2_check').css('font-size', '5px')

			} else {
				$('#pw2_check').text('비밀번호가 일치합니다. :)');
				$('#pw2_check').css('color', 'blue');
				$('#pw2_check').css('font-size', '5px')

			}
		});
	</script>
</body>

</html>