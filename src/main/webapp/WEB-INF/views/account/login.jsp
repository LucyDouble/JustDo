<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>로그인 페이지</h1>
	<hr />
		<c:choose>
			<c:when test="${empty studentDTO.id && empty teacherDTO.id}">
			<!-- 로그인이 안되어 있으면 -->
				<form id="loginFrm" action="loginCheck">
				<div class="form-group">
			<label for="category"></label><br> <input type="radio"
				name="select" checked="checked" value="student">수강생 <input
				type="radio" name="select" value="teacher">교직원
		</div>
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" id="id" placeholder="Id"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="password" id="password" placeholder="Password"></td>
						</tr>
						<c:if test="${msg == '실패'}">
							<tr>
								<td colspan=2>
									아이디 또는 패스워드가 틀렸습니다.
								</td>
							</tr>
						</c:if>
						<tr>
							<td>
								<input type="button" id="login" value="로그인" />
							</td>
							<td>
								<input type="button" id="signUp" value="회원가입" />
							</td>
									
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test = "${not empty studentDTO.id}">
				<h3>${studentDTO.student_name}님 환영합니다.</h3>
				</c:when>
				<c:otherwise>
					<h3>${teacherDTO.teacher_name}님 환영합니다</h3>
				</c:otherwise>
				</c:choose>
				<a href="logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
		<hr />
		<a href="signUpPage">메인</a>
</body>
<script type="text/javascript">

		$('#login').click(function(){

			// 입력 값 체크
		
		/* 	if($('input[name="select"]:checked').val() == 'student'){
				document.getElementsByName('id')[0] = 'student_id';
				document.getElementsByName('password')[0] = 'student_password';
				alert(document.getElementsByName('password')[0].value);
			}else{
				document.getElementsByName('id')[0] = 'teacher_id';
				document.getElementsByName('password')[0] = 'teacher_password';
			}
			if($.trim($('#id').val()) == ""){
				alert("아이디를 입력해 주세요.");
				$('#id').focus();
				return;
			}else if($.trim($('#password').val()) == ""){
				alert("패스워드를 입력해 주세요.");
				$('#password').focus();
				return; 
			}*/
			//전송
			$('#loginFrm').submit();
		});
		//회원가입 버튼
		$('#signUp').click(function() {
			location.href="signUpPage";
		});

</script>
</html>