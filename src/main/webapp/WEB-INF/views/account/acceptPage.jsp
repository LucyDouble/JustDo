<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 승인</title>
<link rel="stylesheet" href="resources/css/fonts.css"/>
<link rel="stylesheet" href="resources/css/common/header.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css"/>
<link rel="stylesheet" href="resources/css/account/acceptPage.css"/>
<script type="text/javascript" src="resources/js/header.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="accept_page">
	<h2 style="text-align: center;">회원목록</h2>
	<br><br>
	<div>
	<form id="acceptFrm" >
		<table class="list">
			<tr class="index">
				<td >승인</td>
				<td>아이디</td>
				<td>이름</td>
				<td>주소</td>
				<td>핸드폰</td>
				<td>이메일</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr class = "value">
					<td><input type="radio" id="accept" class="accept"
						name="id" value="${list.id}"></td>
					<td><c:out value="${list.id}"></c:out></td>
					<td><c:out value="${list.name}"></c:out></td>
					<td><c:out value="${list.address }"></c:out></td>
					<td><c:out value="${list.phone}"></c:out></td>
					<td><c:out value="${list.email}"></c:out></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	</div>
	</div>
	<br>
	<div class = "btnPackage">
	<button id="acceptBtn" name="acceptBtn" class="button accept" value="승인">승인</button>
	<button id="denyBtn" name="denyBtn" class="button deny" value="거절">거절</button>
	</div>
</body>
<script type="text/javascript">
$("#acceptBtn").click(function(){
		var frm = document.getElementById("acceptFrm");
		var check = $("input:radio[name='id']").is(":checked");
		if(check==true){
			alert("승인되었습니다.");
			frm.action="acceptTeacher";
			frm.method="POST";
			frm.submit();
		}else{
			alert("체크를 확인해주세요");
		}
});
$("#denyBtn").click(function(){
	var frm = document.getElementById("acceptFrm");
	var check = $("input:radio[name='id']").is(":checked");
	if(check==true){
		alert("삭제되었습니다.");
		frm.action="denyTeacher";
		frm.method="POST";
		frm.submit();
		
	}else{
			alert("체크를 확인해주세요");
		}
		
	
});

</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>

</html>