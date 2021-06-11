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
                
                <th class="cont2">&nbsp;&nbsp;제목 테스트 입니다</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="cont2">&nbsp;&nbsp;운영자</td>
            </tr>
            <tr>
                <td class="cont2">&nbsp;&nbsp;2021-06-10</td>
            </tr>
            <tr class="cont3">
                <td class="cont2">&nbsp;&nbsp;내용박스</td>
            </tr>
			 <tr>
                <td class="cont2">&nbsp;&nbsp;댓글박스</td>
            </tr>
        </tbody>
    </table>
    <button type="submit" class="button"><span>삭제</span></button>
    <button type="submit" class="button"><span>수정</span></button>
    <button type="submit" class="button"><span>목록</span></button>
    </div>
</body>
</html>