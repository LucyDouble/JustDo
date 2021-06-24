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
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">

    <p class="vn_title">제출 과제 조회</p>
    <table class="table">
				<thead>
					<tr>
						<th>수업 명</th>
						<th>과제 명</th>
						<th>제출 기간</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${workDto.lecture_title}</td>
							<td>${workDto.work_subject}</td>
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
    
    <c:if test="${not empty workDto.work_submit}">
 	<table class="table">
        <thead>
            <tr>
                <th class="vn_cont">&nbsp;&nbsp;나의 결과물</th>
            </tr>
        </thead>
        <tbody>
           
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${workDto.work_submit}</td>
            </tr>
        </tbody>
    </table>
    </c:if>
    <c:if test="${time>endtime}">
   		<button type="button" class="button" onclick="history.back();"><span>확인</span></button>
    </c:if>
    
    <c:if test="${time<=endtime && time>=starttime}">
	   		<button type="button" class="button" onclick="location.href='listSubmitWork'"><span>목록</span></button>
	    <c:if test="${empty workDto.work_submit }">
	    <form action="submitWorkForm" method="POST">
	    	<input type="hidden" value="${workDto.work_no }" name="work_no">
	    	<input type="hidden" value="${workDto.registration_no }" name="registration_no">
	   		<input type="submit" class="button" value="DO"></input>
	   	</form>
	   	</c:if>
	   	 <c:if test="${not empty workDto.work_submit}" >
	   	<form action="editSubmitWorkForm" method="POST" id="frm">
	    	<input type="hidden" value="${workDto.work_no }" name="work_no">
	    	<input type="hidden" value="${workDto.registration_no }" name="registration_no">
	   		<input type="submit" class="button" value="수정"></input>
	   		 <button type="button" class="button" id="remove" ><span>삭제</span></button>
	   	</form>
	   	</c:if>
    </c:if>
    
    
    </div>
	<script>
    $("#remove").click(function(){
    	var frm=document.getElementById("frm");
    	frm.action="removeSubmitWork";
        frm.method="POST";
        frm.submit();
    });
    
    </script>
</body>
    <%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>
</html>