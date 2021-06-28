<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 조회-교직원</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>"> 
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">
	<form id="frm">
	<input type="hidden" name="exam_no" value="${examDto.exam_no }">
    <p class="vn_title">시험 조회</p>
    <br>
    <div style="float: right;">시험 시간 : ${examDto.exam_date} [${examDto.exam_start }~ ${examDto.exam_end }]</div>
    <br>
 <table class="table">
        <thead>
            <tr>
                
                <th class="vn_cont">&nbsp;&nbsp;${examDto.exam_subject }</th>
            </tr>
        </thead>
        <tbody>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;<br><strong style="font-size: 22px;">[시험문제]</strong><br><br>${examDto.exam_content }</td>
            </tr>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;<br><strong style="font-size: 22px;">[답안지]</strong><br><br>${examDto.exam_answer }</td>
            </tr>
        </tbody>
    </table>
    <button type="button" class="button" onclick="location.href='listExam'"><span>목록</span></button>
    <c:if test="${time<examDto.examdate}">
	    <button type="button" class="button" id="edit" ><span>수정</span></button>
	    <button type="button" class="button"  id="btnRemove"><span>삭제</span></button>
    </c:if>
    </form>
    </div>
	<div class="rc_background">
		<div class="popup">
			<div class="cd-popup-container">
				<div class="rc_cont">
				<img class="rc_warning" src="resources/images/alert.png">
				<p class="rc_p">정말 삭제 하시겠습니까?</p>
				</div>
				<ul id="close" class="cd-buttons">
					<li class="rc_li"><a class="rc_a" id="remove">삭제</a></li>
					<li class="rc_li"><a class="rc_a" id="rc_close">취소</a></li>
				</ul>
			</div>
		</div>
	</div>

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
    	frm.action="removeExam";
        frm.method="POST";
        frm.submit();
    });
    $("#edit").click(function(){
    	var frm=document.getElementById("frm");
    	frm.action="editExamFrom";
        frm.method="POST";
        frm.submit();
    });
    
    </script>
    <br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
 
</html>