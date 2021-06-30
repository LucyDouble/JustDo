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
<link rel="stylesheet"
    href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
    src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.grade{
    width: 350px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
.grade_table{
	box-shadow: 0px -5px 10px 0px rgb(0 0 0 / 15%);
}
.table_G{
	box-shadow: 0px 10px 20px 0px rgb(0 0 0 / 15%);
}
.grade_span{
	background-color:#6A60A9; 
	border: none;
}
.editgrade{
	display: inline;
}
.editgrade2{
	display: none;
}
</style>
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">
	<input type="hidden" name="exam_no" id="exam_no" value="${examDto.exam_no }">
	<input type="hidden" name="registration_no" id="registration_no" value="${examDto.registration_no }">
    <p class="vn_title">시험 조회</p>
    <br>
    <div style="float: right;">시험 시간 : ${examDto.exam_date} [${examDto.exam_start }~ ${examDto.exam_end }]</div>
    <br>
 <table class="table table_G">
        <thead>
            <tr>
                
                <th class="vn_cont grade">&nbsp;&nbsp;${examDto.name}</th>
                <th style="background-color: white;"></th>
                <th class="vn_cont grade">
                	<span class="editgrade" id="editgrade">&nbsp;&nbsp;성적 : ${examDto.exam_grade } <span style="float: right;"><input  class="grade_span"  type="button" value="수정" onclick="openedit();">&nbsp;&nbsp;</span></span>
                	<span class="editgrade2">&nbsp;&nbsp;성적 : <input type="text" placeholder="${examDto.exam_grade }" id="exam_grade" style="border: none;"> <span style="float: right;"><button  class="grade_span"  value="수정" onclick="edit();">수정</button>&nbsp;&nbsp;</span></span>
                </th>
            </tr>
        </thead>
        <tbody class="grade_table">
            <tr class="cont3" >
                <td class="vn_cont" colspan="3">&nbsp;&nbsp;<br><strong style="font-size: 22px;">[시험문제]</strong><br><br>${examDto.exam_content }</td>
            </tr>
            <tr class="cont3">
                <td class="vn_cont" colspan="3" style="background-color:#FFFCF0; ">&nbsp;&nbsp;<br><strong style="font-size: 22px;">[학생 답]</strong><br><br>${examDto.exam_submit }</td>
            </tr>
            <tr class="cont3">
                <td class="vn_cont" colspan="3">&nbsp;&nbsp;<br><strong style="font-size: 22px;">[답안지]</strong><br><br>${examDto.exam_answer }</td>
            </tr>
        </tbody>
    </table>
    <form action="listExamResult"  method="post">
		<input type="hidden" name="exam_no" value="${examDto.exam_no }" >
		<input type="hidden" name="exam_date" value="${examDto.exam_date}">
		<input type="hidden" name="exam_start" value="${examDto.exam_start }">
		<input type="hidden" name="exam_end" value="${examDto.exam_end }">
		<input type="hidden" name="exam_content" value="${examDto.exam_content }">
		<input type="hidden" name="exam_submit" value="${examDto.exam_submit }">
		<input type="hidden" name="exam_answer" value="${examDto.exam_answer }">
		<input type="hidden" name="lectureclass_class" value="${examDto.lectureclass_class }">
		<input type="hidden" name="name" value="${examDto.name}">
		<input type="hidden" name="registration_no" value="${examDto.registration_no}" >
		<input type="hidden" name="exam_grade" value="${examDto.exam_grade}" >
		<input type="hidden" name="lecture_title" value="${examDto.lecture_title}" >
		<input type="hidden" name="exam_subject" value="${examDto.exam_subject}" >
    	<button type="submit" class="button"><span>목록</span></button>
    </form>
    </div>

    <br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
 <script type="text/javascript">
 	function openedit(){
 		$(".editgrade").css("display","none");
 		$(".editgrade2").css("display","inline");
 	}

   	function edit(){
 		var exam_grade = $("#exam_grade").val();
 		var exam_no = $("#exam_no").val();
 		var registration_no = $("#registration_no").val();
 		if(isNaN(exam_grade)){
 			alert("숫자가 아님요");
 			return false;
 		}
 		 if(exam_grade!=100 && exam_grade.length==3){
 			alert("1~100이하의 점수를 주세요.");
 			return false;
 		}
 		 $.ajax({
 			url:'editExamGrade'
 			,type:'post'
 			,data: {exam_grade:exam_grade
 						,exam_no:exam_no
 						,registration_no:registration_no}
 			,success :function(data){
 					$("#editgrade").html("&nbsp;&nbsp;성적 :"+exam_grade+'<span style="float: right;"><input  class="grade_span"  type="button" value="수정" onclick="openedit();">&nbsp;&nbsp;</span>');	
 			
 			}
 			
 			
 		}); 
 		
 		
 		
 		
 		$(".editgrade").css("display","inline");
 		$(".editgrade2").css("display","none");
 	} 
 </script>
</html>