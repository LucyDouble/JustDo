<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="ac_page">
		<form action="addCS" class="addCSForm" method="POST">
						<input type="hidden" name="manager_number" value="20001">
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>희망상담시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="lc_form-control" name="counseling_name"></td>
						<td><input type="text" class="lc_form-control" name="counseling_phone"></td>
						<td><input type="text" class="lc_form-control" name="counseling_email"></td>
						<td><input type="datetime-local" id="currentDate" class="lc_form-control" name="counseling_da"></td>
					</tr>
				</tbody>
			</table>
			<button id="ac_add_Btn" class="button" ><span>등록</span></button>
		</form>
		<br> <br>
	</div>
</body>
<script>
	$('#ac_add_Btn').click(function(){
		  if ($(".lc_form-control").val() == "") {
				swal("","정보를 모두 입력해주세요","warning");
				return false;
			} else {
				return true;
			}
	});
</script>
</html>