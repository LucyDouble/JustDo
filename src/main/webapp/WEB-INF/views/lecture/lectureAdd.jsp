<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
@font-face {
    src : url("resources/fonts/SCDream4.otf");
    font-family: SCDream4;
    }
     body {
        margin: 0px;
        padding: 0px;
        width: 800px;
        margin: auto;
        font-family: SCDream4;
    }
</style>
<body>


	
		
				
		
		
	
			
				<form id="frmAdd" method="POST" action="lectureAdd">
					<table class="table">
							<tr>
								<th>NO</th>
								<td><input type="hidden" name="teacher_number" value="66"></td>
								<th>분반</th>
								<td><input type="text" name="lecture_class"></td>
							</tr>
							<tr>
								<th>강의명</th>
								<td><input type="text" name="lecture_title"></td>
								<th>전공</th>
								<td><input type="text" name="lecture_major"></td>
							</tr>
							<!-- <tr>
								<th>교직원</th>
								<td><input type="text" value=""></td>
								<th>E-mail</th>
								<td><input type="text" value=""></td>
							</tr>
							<tr>
								<th>강의시간</th>
								<td><input type="time" name="lecture_starttime"> ~ <input type="time" name="lecture_endtime"></td>
								<th>강의날짜</th>
								<td><input type="text" name="lecture_day"></td>
							</tr>
							<tr>
								<th>제한인원</th>
								<td><input type="text" name="lecture_limit"></td>
								<th>강의기간</th>
								<td><input type="date" name="lecture_start"> ~ <input type="date" name="lecture_end"></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3"><input type="text" name="lecture_target"></td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3"><input type="text" name="lecture_reference"></td>
							</tr>-->
							<tr>
							<td>
								<!-- <input type="button" value="등록" id="btnAdd"> -->
								<input type="submit" value="등록">
							</td>	
							</tr>
					</table>
				</form>
					<form method="POST" action="lectureAdd">
							
							<!-- 	<input type="hidden" name="teacher_number" value="66"> -->
							
						<!-- 		<input type="text" name="lecture_class">
							
								<input type="text" name="lecture_title">
								
								<input type="text" name="lecture_major"> -->
							
							<!-- <tr>
								<th>교직원</th>
								<td><input type="text" value=""></td>
								<th>E-mail</th>
								<td><input type="text" value=""></td>
							</tr>
							<tr>
								<th>강의시간</th>
								<td><input type="time" name="lecture_starttime"> ~ <input type="time" name="lecture_endtime"></td>
								<th>강의날짜</th>
								<td><input type="text" name="lecture_day"></td>
							</tr>
							<tr>
								<th>제한인원</th>
								<td><input type="text" name="lecture_limit"></td>
								<th>강의기간</th>
								<td><input type="date" name="lecture_start"> ~ <input type="date" name="lecture_end"></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3"><input type="text" name="lecture_target"></td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3"><input type="text" name="lecture_reference"></td>
							</tr>-->
							
								<!-- <input type="button" value="등록" id="btnAdd"> -->
								
						
						<input type="submit" value="등록">
					</form>
			
		
	

<script>
	$("#btnAdd").click(function(){
		var frm = document.getElementById("frmAdd");
		console.log("1번");
		frm.action="lectureAdd";
		console.log("2번");
		frm.method="POST";
		console.log("3번");
		frm.submit();
		console.log("4번");
	});
</script>
</body>
</html>