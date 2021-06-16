<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>"> 
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">
    <p class="vn_title">게시글 조회</p>
    <br>
 <table class="table">
        <thead>
            <tr>
                
                <th class="vn_cont">&nbsp;&nbsp;${notice.notice_sub }</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="vn_cont">&nbsp;&nbsp;<p class="vn_cont_p">작성자</p>&nbsp;&nbsp;&nbsp;<c:if test="${notice.manager_number >= 20000 }">운영자</c:if>
                								<c:if test="${notice.teacher_number >= 100000 }">${notice.teacher_name }</c:if>
                 </td>
            </tr>
            <tr>
                <td class="vn_cont">&nbsp;&nbsp;<p class="vn_cont_p">작성일</p>&nbsp;&nbsp;&nbsp;${notice.notice_date }</td>
            </tr>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${notice.notice_con }</td>
            </tr>
			 <tr>
                <td class="vn_cont">&nbsp;&nbsp;댓글박스</td>
            </tr>
        </tbody>
    </table>
    <button type="submit" class="button" onclick="location.href='listNotice'"><span>목록</span></button>
    <button type="submit" class="button" onclick="location.href='editNotice'"><span>수정</span></button>
    <button type="submit" class="button"><span>삭제</span></button>
    </div>
    <script>
    </script>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>