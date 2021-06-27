<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.form {
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

#post_btn {
	display: inline-block;
	border-radius: 7px;
	background-color: #6A60A9;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 5px;
	width: 80px;
	height: 20px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	float: right;
}

#email_submit {
	display: inline-block;
	border-radius: 7px;
	background-color: #6A60A9;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 5px;
	width: 80px;
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

#mail_check_input_box_false {
	background-color: #ebebe4;
}

#mail_check_input_box_true {
	background-color: white;
}

#email_check {
	top: 30px;
}

label {
	font-size: 20px;
}

.logo{
	width:250px;
	height:250px;
}
</style>

</head>

<body>

	<form id="form" class="form" action="signUp" method="POST">
		<div class="signUp-group">
    <a href="<%=request.getContextPath()%>/jdHome?command=main"><img class="logo" src="resources/images/logo.png"></a>
    <br>
			<label for="category">구분</label><br> <input type="radio"
				name="signUpSelect" checked="checked" value="student">수강생 <input
				type="radio" name="signUpSelect" value="teacher">교직원
		</div>
		<div class="number-group">
			<input type="hidden">
		</div>
		<br>
		<!-- 아이디 -->
		<div class="id-group">
			<label for="id">아이디</label> <br> <input type="text"
				style="width: 250px; height: 30px" class="form-control" id="id"
				name="id" placeholder="ID" required>
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="password-group">
			<label for="password">비밀번호</label> <br> <input type="password"
				style="width: 250px; height: 30px" class="form-control"
				id="password" name="password" placeholder="PASSWORD" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="passwordCheck-group">
			<label for="password2">비밀번호 확인</label> <br> <input
				type="password" class="form-control" id="password2" name="password2"
				style="width: 250px; height: 30px" placeholder="Confirm Password"
				required>
			<div class="check_font" id="pw2_check"></div>
		</div>
		<!-- 이름 -->
		<div class="name-group">
			<label for="name">이름</label><br> <input type="text"
				style="width: 250px; height: 30px" class="form-control" id="name"
				name="name" placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<div class="address_group">
			<label for="address">주소</label><input type="button"
				id="post_btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" style="width: 250px; height: 30px"
				id="address" name="address" placeholder="주소를 입력해주세요"><br>
			<span id="guide" style="color: #999; display: none"></span>
		</div>


		<!-- 본인확인 이메일 -->
		<div class="mail-group">
			<div class="mail_name">
				<label for="email">이메일</label>
			</div>
			<div class="mail_input_box">
				<input class="email" name="email" id="email"
					style="width: 250px; height: 30px">
			</div>
			<div class="check_font" id="email_check"></div>
			<div class="mail_check_button">
				<button class="email_submit" id="email_submit">인증번호전송</button>
				<div class="clearfix"></div>
			</div>
			<div class="mail_check_wrap">
				<div class="mail_check_input_box">
					<input class="mail_check_input" style="width: 250px; height: 30px"
						disabled="disabled">
				</div>
				<div class="clearfix"></div>
				<span id="mail_check_input_box_warn"></span>
			</div>
		</div>

		<!-- 휴대전화 -->
		<div class="phone-group">
			<label for="phone">휴대전화</label><br> <input type="text"
				style="width: 250px; height: 30px" class="form-control" id="phone"
				name="phone" placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		<br>



		<div class="reg_button">
			<!-- 			<button class="btn btn-primary px-3" id="reg_submit">
 -->
			<input type="submit" class="btn btn-primary px-3" id="reg_submit"
				value="가입하기" />
		<br><br><br><br><br><br><br><br>
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
		var nameCheck = /^[가-힣]{2,8}$/;
		// 이메일 검사 정규식
		var mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneCheck = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		//이메일 전송 인증번호 저장 코드
		var code = "";

		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#id").blur(
				function() {
					var id = $('#id').val();
					var signUpSelect = $('input[name="signUpSelect"]:checked')
							.val();
					console.log(signUpSelect);
					$.ajax({
						url : '${pageContext.request.contextPath}/idCheck?id='
								+ id + "&signUpSelect=" + signUpSelect,
						type : 'GET',
						success : function(data) {
							console.log("1 = 중복o / 0 = 중복x : " + data);
							console.log(id);

							if (data == 1) {
								// 1 : 아이디가 중복되는 문구
								$("#id_check").text("사용중인 아이디입니다 :(");
								$("#id_check").css("color", "red");
								$("#id_check").css("font-size", "5px");
								$("#reg_submit").attr("disabled", true);
							} else {

								if (idCheck.test(id)) {
									// 0 : 아이디 길이 / 문자열 검사
									$("#id_check").text("사용 가능한 아이디입니다 :)");
									$("#id_check").css("color", "blue");
									$("#id_check").css("font-size", "5px");
									$("#reg_submit").attr("disabled", false);

								} else if (id == "") {

									$('#id_check').text('아이디를 입력해주세요');
									$('#id_check').css('color', 'red');
									$("#id_check").css("font-size", "5px");
									$("#reg_submit").attr("disabled", true);

								} else {

									$('#id_check').text(
											"아이디는 영어와 숫자 4~12자리만 가능합니다.");
									$('#id_check').css('color', 'red');
									$('#id_check').css('font-size', '5px')
									$("#reg_submit").attr("disabled", true);
								}

							}
						},
						error : function() {
							console.log("실패");
						}
					});
					$("#name").blur(function() {
						if (nameCheck.test($(this).val())) {
							console.log(nameCheck.test($(this).val()));
							$("#name_check").text('');
						} else {
							$('#name_check').text('이름은 한글 2~8자리만 입력 가능합니다.');
							$('#name_check').css('color', 'red');
							$('#name_check').css('font-size', '5px');
						}
					});
				});

		// 비밀번호 유효성 검사
		$("#password").blur(function() {
			var password = $('#password').val();

			if (pwCheck.test($('#password').val())) {
				console.log('true');
				$('#pw_check').text('');
			} else if (password == "") {
				$('#pw_check').text('비밀번호를 입력해주세요');
				$('#pw_check').css('color', 'red');
				$("#pw_check").css('font-size', '5px');
				$("#reg_submit").attr("disabled", true);

			} else {
				console.log('false');
				$('#pw_check').text('비밀번호는 숫자, 문자, 특수문자 조합 8~16자리만 가능합니다. :(')
				$('#pw_check').css('color', 'red');
				$('#pw_check').css('font-size', '5px')

			}
		});

		// 비밀번호 일치 확인
		$("#password2").blur(function() {
			var password2 = $('#password2').val();

			if ($('#password').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
				$('#pw2_check').css('color', 'red');
				$('#pw2_check').css('font-size', '5px')
				console.log(password2);

			} else {
				$('#pw2_check').text('');
			}
		});

		$('#email')
				.blur(
						function() {
							var email = $(this).val();
							var signUpSelect = $(
									'input[name="signUpSelect"]:checked').val();
							console.log(signUpSelect);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/emailCheck?email='
												+ email
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
												$("#email_check").css(
														'font-size', '5px');
												$("#reg_submit").attr(
														"disabled", true);
												$("#email_submit").hide();
											} else {
												// 이메일
												if (mailCheck.test($('#email')
														.val())) {
													$("#email_check")
															.text(
																	'사용 가능한 이메일입니다. :)');
													$("#reg_submit").attr(
															"disabled", false);
													$('#email_check').css(
															'color', 'blue');
													$("#email_check").css(
															'font-size', '5px');
													$("#email_submit").show();
												} else {
													$('#email_check').text(
															'이메일을 확인해주세요 :()');
													$('#email_check').css(
															'color', 'red');
													$("#email_check").css(
															'font-size', '5px');
													$("#reg_submit").attr(
															"disabled", true);
													$("#email_submit").hide();

												}

											}

										},
										error : function(error) {
											console.log("실패");
										}
									});

						});

		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function() {
			alert("인증번호를 발송했습니다.");
			var email = $(".email").val(); // 입력 이메일
			var checkBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
			$.ajax({
				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {
					checkBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
			})
		});

		/* 인증번호 비교 */
		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val();
			var checkResult = $("#mail_check_input_box_warn");

			if (inputCode == code) {
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				$(".correct").css('font-size', '5px');
				$(".correct").css('color', 'blue');
			} else {
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				$(".incorrect").css('font-size', '5px');
				$(".incorrect").css('color', 'red');
			}
		});

		/* 휴대전화  */
		$('#phone')
				.blur(
						function() {
							var phone = $(this).val();
							var signUpSelect = $(
									'input[name="signUpSelect"]:checked').val();
							console.log(signUpSelect);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/phoneCheck?phone='
												+ phone
												+ "&signUpSelect="
												+ signUpSelect,
										type : 'get',
										dataType : 'json',
										success : function(data) {
											console.log(data);

											if (data == 1) {
												// 1 : 아이디가 중복되는 문구
												$("#phone_check").text(
														"이미 등록된 번호입니다 :(");
												$("#phone_check").css("color",
														"red");
												$("#phone_check").css(
														'font-size', '5px');
												$("#reg_submit").attr(
														"disabled", true);
											} else {
												// 이메일
												if (phoneCheck.test($('#phone')
														.val())) {
													$("#phone_check")
															.text(
																	'사용 가능한 번호 입니다. :)');
													$("#reg_submit").attr(
															"disabled", false);
													$('#phone_check').css(
															'color', 'blue');
													$("#phone_check").css(
															'font-size', '5px');
												} else {
													$('#phone_check').text(
															'번호를 입력해주세요');
													$("#phone_check").css(
															'font-size', '5px');
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

		/* 가입하기 버튼  */
		var inval_Arr = new Array(4).fill(false);
		$('#reg_submit').click(
				function() {
					var form = $('#form');
					// 비밀번호
					if (($('#password').val() == ($('#password2').val()))
							&& pwCheck.test($('#password').val())) {
						inval_Arr[0] = true;
					} else {
						inval_Arr[0] = false;
					}
					//이름
					if (nameCheck.test($('#name').val())) {
						inval_Arr[1] = true;
					} else {
						inval_Arr[1] = false;
					}
					//이메일
					if (mailCheck.test($('#email').val())) {
						console.log(emailCheck.test($('#email').val()));
						inval_Arr[2] = true;
					} else {
						inval_Arr[2] = false;
					}
					// 휴대폰번호
					if (phoneCheck.test($('#phone').val())) {
						console.log(phoneCheck.test($('#phone').val()));
						inval_Arr[3] = true;
					} else {
						inval_Arr[3] = false;
					}
					var validAll = true;
					for (var i = 0; i < inval_Arr.length; i++) {
						if (inval_Arr[i] == false) {
							validAll = false;
						}
					}
					if (validAll) {

						/* 	alert('회원가입을 축하합니다.');
							form.action = "account/signUp";
							form.method = "post";
							form.submit(); */
					} else {
						alert('입력한 정보들을 다시 확인해주세요.');
					}

				});

		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("address").value = roadAddr + extraRoadAddr;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
</body>

</html>