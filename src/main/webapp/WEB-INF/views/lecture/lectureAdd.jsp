<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div>
	<section>
		<div class="cont">
			<article class="content1">
				<h2>강의등록</h2>
			</article>
		</div>
		<div>
			<article>
				<form id="frmAdd" name="add">
					<table class="table">
							<tr>
								<th>NO</th>
								<td><input type="hidden" name="teacher_number" value="100001" id="a1"></td>
								<th>강의명</th>
								<td><input type="text" name="lecture_title" id="a3"></td>
							</tr>
							<tr>
								<th>전공</th>
								<td><input type="text" name="lecture_major" id="a4"></td>
								<th>제한인원</th>
								<td><input type="text" name="lecture_limit" id="a8"></td>
							</tr>
							<tr>
								<th>교직원</th>
								<td><input type="text" value="나다"></td>
								<th>E-mail</th>
								<td><input type="text" value="나야"></td>
							</tr>
							<tr>
								<th>강의날짜</th>
								<td><input type="text" name="lecture_day" id="a7"></td>
								<th>강의기간</th>
								<td><input type="date" name="lecture_start" id="a9"> ~ <input type="date" name="lecture_end" id="a10"></td>
							</tr>
							<tr>
								<th>교과목개요 및 학습목표</th>
								<td colspan="3"><input type="text" name="lecture_target" id="a11"></td>
							</tr>
							<tr>
								<th>교재 및 참고문헌</th>
								<td colspan="3"><input type="text" name="lecture_reference" id="a12"></td>
							</tr>
					</table>
					<button id="btnAdd">등록</button>			
				</form>
			</article>
		</div>
	</section>
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
</body>
</html>