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
	<form id="frm">
	<!-- TODO -->
	<input type="hidden" name="teacher_number" value="100001">
	<input type="hidden" name="work_no" value="${workDto.work_no }">
    <p class="vn_title">과제 조회</p>
    <br>
 <table class="table">
        <thead>
            <tr>
                
                <th class="vn_cont">&nbsp;&nbsp;${workDto.work_subject }</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="vn_cont">&nbsp;&nbsp;제출 기한 : ${workDto.work_start }~${workDto.work_end }</td>
            </tr>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${workDto.work_content }</td>
            </tr>
        </tbody>
    </table>
    <button type="button" class="button" onclick="location.href='listWork'"><span>목록</span></button>
    <c:if test="${time<=workDto.endday}">
	    <button type="button" class="button" id="edit" ><span>수정</span></button>
	    <button type="button" class="button" id="remove" ><span>삭제</span></button>
    </c:if>
    </form>
    </div>
    <script>
    $("#remove").click(function(){
    	var frm=document.getElementById("frm");
    	frm.action="removeWork";
        frm.method="POST";
        frm.submit();
    });
    $("#edit").click(function(){
    	var frm=document.getElementById("frm");
    	frm.action="editWorkFrom";
        frm.method="POST";
        frm.submit();
    });
    
    </script>
</body>
    <%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>
</html>