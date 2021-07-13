<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css"/>
<link rel="stylesheet" href="resources/css/common/header.css"/>
<link rel="stylesheet" href="resources/css/lectureList.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
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
								<td><input type="hidden" name="teacher_number" class="form-control" value="${DTO.teacher_number }"></td>
								<th>강의명</th>
								<td><input type="text" name="lecture_title" class="form-control" maxlength="49" id="in1"></td>
							</tr>
							<tr>
								<th>전공</th>
								<td><input type="text" name="lecture_major" class="form-control" maxlength="20" id="in2"></td>
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
								<td colspan="3"><input type="date" name="lecture_start" class="form-control month" id="in3"> ~ <input type="date" name="lecture_end" class="form-control month" id="in4"></td>
							</tr>
							<tr>
								<th style="line-height:5">교과목개요 및 학습목표</th>
								<td colspan="3">
								<textarea style="resize:none;" rows="3" cols="24" name="lecture_target" class="form-control" maxlength="99" id="in5"></textarea>
								</td>
							</tr>
							<tr>
								<th style="line-height:5">교재 및 참고문헌</th>
								<td colspan="3">
								<textarea style="resize:none;" rows="3" cols="24" name="lecture_reference" class="form-control" maxlength="99" id="in6"></textarea>
								</td>
							</tr>
					</table>
				</form>
					<button id="btnAdd" class="button">등록</button>			
		</div>
</div>
<script>
	
    $("#btnAdd").click(function(){
      	var frm = document.getElementById("frmAdd");
        
      	var title = $("#in1").val();
      	var major = $("#in2").val();
      	var start = $("#in3").val();
      	var end = $("#in4").val();
      	var target = $("#in5").val();
      	var ref = $("#in6").val();
      	
      	/* 현재시간 구하기 */
      	var today = new Date();
      	var year = today.getFullYear();
      	var month = ('0' + (today.getMonth() + 1)).slice(-2);
      	var day = ('0' + today.getDate()).slice(-2);
      	var dateString = year + '-' + month  + '-' + day;
		
      	if(title==""){
			alert("강의명을 입력하지 않았습니다.");
			$("#in1").focus();
			return false;
		}
		if(major==""){
			alert("전공을 입력하지 않았습니다.");
			$("#in2").focus();
			return false;
		}
		if(start==""){
			alert("강의 시작기간을 입력하지 않았습니다.");
			$("#in3").focus();
			return false;
		}
		if(end==""){
			alert("강의 종료기간을 입력하지 않았습니다.");
			$("#in4").focus();
			return false;
		}
		if(target==""){
			alert("학습목표를 입력하지 않았습니다.");
			$("#in5").focus();
			return false;
		}
		if(ref==""){
			alert("참고문헌을 입력하지 않았습니다.");
			$("#in6").focus();
			return false;
		}
        
		if(start>end){
			alert("시작기간이 종료기간보다 늦을 수 없습니다.");
			$("#in3").focus();
			return false;
		}
		if(start>end){
			alert("시작기간이 종료기간보다 늦을 수 없습니다.");
			$("#in3").focus();
			return false;
		}
		if(start<dateString){
			alert("설정한 시작기간은 현재시간보다 늦을 수 없습니다.");
			$("#in3").focus();
			return false;
		}
        frm.action="lectureAdd";
        frm.method="POST";
        frm.submit();
        
    });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>