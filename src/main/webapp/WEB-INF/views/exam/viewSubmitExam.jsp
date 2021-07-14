<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험조회-학생</title>
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
    <p class="vn_title">제출 시험 조회</p>
    <c:choose>
    	<c:when test="${time2==examTime.examdate && time <=examTime.examEnd }">
		    <table class="table">
						<thead>
							<tr>
								<th>수업 명</th>
								<th>시험 명</th>
								<th>시험 시간</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${examDto.lecture_title}</td>
									<td>${examDto.exam_subject}</td>
									<td> ${examDto.exam_date}[${examTime.exam_start}~${examTime.exam_end}]</td>
								</tr>
						</tbody>
				</table>
		    <br>
		    <table class="table">
		        <thead>
		            <tr>
		                <th class="vn_cont">&nbsp;&nbsp;시험 문제</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr class="cont3">
		                <td class="vn_cont">&nbsp;&nbsp;${examDto.exam_content }</td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <c:if test="${not empty examDto.exam_submit}">
		 	<table class="table">
		        <thead>
		            <tr>
		                <th class="vn_cont">&nbsp;&nbsp;나의 답</th>
		            </tr>
		        </thead>
		        <tbody>
		           
		            <tr class="cont3">
		                <td class="vn_cont">&nbsp;&nbsp;${examDto.exam_submit}</td>
		            </tr>
		        </tbody>
		    </table>
		    </c:if>
    	</c:when>
    	<c:otherwise>
    			<table class="table">
						<thead>
							<tr>
								<th>수업 명</th>
								<th>시험 명</th>
								<th>시험 시간</th>
								<th>성적</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${examDto.lecture_title}</td>
									<td>${examDto.exam_subject}</td>
									<td> ${examDto.exam_date}[${examTime.exam_start}~${examTime.exam_end}]</td>
									<td> ${examDto.exam_grade}</td>
								</tr>
						</tbody>
				</table>
				<br>
		 	<table class="table">
		        <thead>
		            <tr>
		                
		                <th >&nbsp;&nbsp;${examDto.name}</th>
		            </tr>
		        </thead>
		        <tbody class="grade_table">
		            <tr class="cont3" >
		                <td class="vn_cont" >&nbsp;&nbsp;<br><strong style="font-size: 22px;">[시험문제]</strong><br><br>${examDto.exam_content }</td>
		            </tr>
		            <tr class="cont3">
		                <td class="vn_cont"  style="background-color:#FFFCF0; ">&nbsp;&nbsp;<br><strong style="font-size: 22px;">[학생 답]</strong><br><br>${examDto.exam_submit }</td>
		            </tr>
		            <tr class="cont3">
		                <td class="vn_cont" >&nbsp;&nbsp;<br><strong style="font-size: 22px;">[답안지]</strong><br><br>${examDto.exam_answer }</td>
		            </tr>
		        </tbody>
		    </table>    	
    	</c:otherwise>
    </c:choose>
    
    
    <c:if test="${time2>examTime.examdate}">
   		<button type="button" class="button" onclick="history.back();"><span>확인</span></button>
    </c:if>
    <c:if test="${time2==examTime.examdate && time >examTime.examEnd}">
   		<button type="button" class="button" onclick="history.back();"><span>확인</span></button>
    </c:if>
    
    <c:if test="${time2==examTime.examdate && time <=examTime.examEnd}">
	   		<button type="button" class="button" onclick="location.href='listSubmitExam'"><span>목록</span></button>
	    <c:if test="${empty examDto.exam_submit }">
	    <form action="submitExamForm" method="POST">
	    	<input type="hidden" value="${examDto.exam_no }" name="exam_no">
	    	<input type="hidden" value="${examDto.registration_no }" name="registration_no">
	   		<input type="submit" class="button" value="DO"></input>
	   	</form>
	   	</c:if>
	   	 <c:if test="${not empty examDto.exam_submit}" >
	   	<form id="frm">
	    	<input type="hidden" value="${examDto.exam_no }" name="exam_no">
	    	<input type="hidden" value="${examDto.registration_no }" name="registration_no">
	   		<input type="button" class="button"  id="edit"  value="수정"></input>
	   		 <button type="button" class="button" id="btnRemove"><span>삭제</span></button>
	   	</form>
	   	</c:if>
    </c:if> 
    
    
    </div>
	<div class="rc_background">
		<div class="popup">
			<div class="cd-popup-container">
				<div class="rc_cont">
				<img class="rc_warning" src="resources/images/alert.png">
				<p class="rc_p">정말 삭제 하시겠습니까?</p>
				</div>
				<ul id="close" class="cd-buttons">
					<li class="rc_li"><a class="rc_a" id="remove" >삭제</a></li>
					<li class="rc_li"><a class="rc_a" id="rc_close">취소</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br><br><br>
	<sciprt src="js/jqurey-3.1.1.js"></sciprt>
	<sciprt src="js/bootstrap.js"></sciprt>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
	document.querySelector("#btnRemove").addEventListener("click",removeshow);
	function removeshow() {
		document.querySelector(".rc_background").className = "rc_background show";
	}

	document.querySelector("#rc_close").addEventListener("click", removeclose);
	
	function removeclose() {
        document.querySelector(".rc_background").className = "rc_background";
      }
    $("#remove").click(function(){
    	var frm=document.getElementById("frm");
    	frm.action="removeSubmitExam";
        frm.method="POST";
        frm.submit();
    });
    $("#edit").click(function(){
    	var frm=document.getElementById("frm");
    	frm.action="editSubmitExamForm";
        frm.method="POST";
        frm.submit();
    });
    
    </script>
</body>
</html>