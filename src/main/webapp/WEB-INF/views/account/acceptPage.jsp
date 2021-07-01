<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
//1. 로그인세션제어(관리자는 제외)
String id = (String) session.getAttribute("id");//다운캐스팅
if(id == null || !id.equals("admin")){ //순서바뀌면 에러발생하므로 항상 null 먼저 비교할 것
	response.sendRedirect("/test/member/main");
}
%> --%>
<h2 style="text-align: center;">회원목록</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>주소</td>
		<td>핸드폰</td>
		<td>이메일</td>
	</tr>
	<c:forEach items="${list}" var="list">	
		<tr>
			<td><c:out value="${list.id}"></c:out></td>
			<td><c:out value="${list.password}"></c:out></td>
			<td><c:out value="${list.name}"></c:out></td>
			<td><c:out value="${list.address }"></c:out></td>
			<td><c:out value="${list.phone}"></c:out></td>
			<td><c:out value="${list.email}"></c:out></td>
		</tr>
	</c:forEach>
</table>

</body>

</html>