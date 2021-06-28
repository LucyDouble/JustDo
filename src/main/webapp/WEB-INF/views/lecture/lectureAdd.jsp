<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의등록</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/lectureList.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="ln_page">
				<p class="ln_title">강의등록</p>
		<div>
				<form id="frmAdd" name="add">
					<table class="table">
							<tr>
								<th>NO</th>
								<td><input type="hidden" name="teacher_number" value="100001"></td>
								<th>강의명</th>
								<td><input type="text" name="lecture_title" class="form-control"></td>
							</tr>
							<tr>
								<th>전공</th>
								<td><input type="text" name="lecture_major" class="form-control"></td>
								<th>제한인원</th>
								<td><input type="text" name="lecture_limit" class="form-control" value="30" readonly></td>
							</tr>
							<tr>
								<th>교직원</th>
								<td><input type="text" value="${DTO.id}" class="form-control" readonly></td>
								<th>E-mail</th>
								<td><input type="text" value="${DTO.email}" class="form-control" readonly></td>
							</tr>
							<tr>
								<!-- <th>강의날짜</th>
								<td><input type="text" name="lecture_day" class="form-control"></td> -->
								<th>강의기간</th>
								<td colspan="3"><input type="date" name="lecture_start" class="form-control month"> ~ <input type="date" name="lecture_end" class="form-control month"></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3"><input type="text" name="lecture_target" class="form-control"></td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3"><input type="text" name="lecture_reference" class="form-control"></td>
							</tr>
					</table>
					<button id="btnAdd" class="button">등록</button>			
				</form>
		</div>
</div>
<script>
	
    $("#btnAdd").click(function(){
      	var frm = document.getElementById("frmAdd") 
       /*  var dataString = $("#frmAdd").serialize(); */
        
        
        frm.action="lectureAdd";
        frm.method="POST";
        frm.submit();
        
       /*   $.ajax({
        	url : "lectureAdd",
        	method: "POST",
        	data : dataString,
        	success: function(data){
        		
        	},
        	error : function(){
        		
        	}
        	
        }); */
    });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>