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
<style>
</style>

<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
    <p class="ln_title">공지사항 게시판</p>
    <br>
    <table class="table">
        <thead>
            <tr>
                <th>No.</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성시간</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td class="ln_cont">테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>2</td>
                <td class="ln_cont">테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>3</td>
                <td class="ln_cont">테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>4</td>
                <td class="ln_cont">테스트입니다/테스트입니다/테스트입니다/테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>5</td>
                <td class="ln_cont">테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
        </tbody>
    </table>
    <button class="button" onclick="location.href='addNotice'"><span>글쓰기</span></button>
    <sciprt src="js/jqurey-3.1.1.js"></sciprt>
    <sciprt src="js/bootstrap.js"></sciprt>
    </div>
    
</body>
</html>