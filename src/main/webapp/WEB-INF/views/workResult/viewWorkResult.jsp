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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">
	<form id="frm">

    <p class="vn_title">제출 과제 조회</p>
    
    <table class="table">
				<thead>
					<tr>
						<th>학생 명</th>
						<th>class</th>
						<th>제출 기간</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${workDto.name}</td>
							<td>${workDto.lecture_class}</td>
							<td> ${workDto.work_start}~${workDto.work_end }  </td>
						</tr>
				</tbody>
			</table>
			<br>
    
    <br>
    <table class="table">
        <thead>
            <tr>
                <th class="vn_cont">&nbsp;&nbsp;과제 내용</th>
            </tr>
        </thead>
        <tbody>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${workDto.work_content }</td>
            </tr>
        </tbody>
    </table>
    
    
 	<table class="table">
        <thead>
            <tr>
                <th class="vn_cont">&nbsp;&nbsp;학생 결과물</th>
            </tr>
        </thead>
        <tbody>
           
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${workDto.work_submit}</td>
            </tr>
        </tbody>
    </table>
    <button type="button" class="button" onclick="history.back();"><span>확인</span></button>
    </form>
    </div>
<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>