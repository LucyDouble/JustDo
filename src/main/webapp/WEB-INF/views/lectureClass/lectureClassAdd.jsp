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
      .cont {
    	border-bottom: 1px;
    	border-bottom-style: solid;
    	border-bottom-color: black;
    	margin-bottom: 50px;
    }
</style>
<body>
<section>
		<div class="cont">
			<article class="content1">
				<h2>분반설정</h2>
			</article>
		</div>
		<div>
			<article>
				<form id="classfrm">
							<input type="hidden" name= "lecture_no" value="<%=request.getParameter("lecture_no")%>">
							<input type="hidden" name= "lecture_no_1" value="<%=request.getParameter("lecture_no")%>">
					Class : <input type="text" name="lectureclass_class" readonly value="1"><br>
					수업시작 : <input type="time" name="lectureclass_start">
					수업종료 : <input type="time" name="lectureclass_end"><br>
					Class : <input type="text" name="lectureclass_class_1" readonly value="2"><br>
					수업시작 : <input type="time" name="lectureclass_start_2">
					수업종료 : <input type="time" name="lectureclass_end_3">
				</form>
				<button id="btnClass">설정</button>
			</article>
		</div>
	</section>
<script>
	$("#btnClass").click(function(){
		var frm = document.getElementById("classfrm");
		frm.action = "lectureClassAdd";
		frm.method = "post";
		frm.submit();
	});
</script>
</body>
</html>