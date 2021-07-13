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
<link rel="stylesheet" href="resources/css/lectureList.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
		<div>
				<p class="ln_title LClass">분반설정</p>
		</div>
		<div class="classFrm">
				<form id="classfrm">
							<input type="hidden" name= "lecture_no" value="<%=request.getParameter("lecture_no")%>">
							<input type="hidden" name= "lecture_no_1" value="<%=request.getParameter("lecture_no")%>">
					Class  <input type="text" class="form-control" name="lectureclass_class" readonly value="1" id="class1"><br>
					수업시작 <input type="time" class="form-control" name="lectureclass_start" id="time1" value="09:00" readonly>
					수업종료  <input type="time" class="form-control" name="lectureclass_end" id="time2"><br>
					Class  <input type="text" class="form-control" name="lectureclass_class_1" readonly value="2" id="class2"><br>
					수업시작  <input type="time" class="form-control" name="lectureclass_start_2" id="time3"  >
					수업종료  <input type="time" class="form-control" name="lectureclass_end_3" id="time4" value="23:00" readonly>
				</form>
				<button id="btnClass" class="button">설정</button>
		</div>
<script>
	$("#btnClass").click(function(){
		
	    var t1 = $("#time1").val();
	    var t2 = $("#time2").val();
	    var t3 = $("#time3").val();
	    var t4 = $("#time4").val();
	    if(t1 != "" && t2 != "" && t3 != "" && t4 != ""){
		    if(t1 > t2){
		    	alert("Class 1의 종료시간을 잘못 입력했습니다.");
		    	$("#time1").focus();
		    	return false;
		    }
		    if(t2 > t3){
		    	alert("Class 2의 시작시간을 잘못 입력했습니다.");
		    	$("#time3").focus();
		    	return false;
		    }
	    } else{
	    	alert("입력하지 않은 값이 있습니다.")
	    	return false;
	    }
	    
    	var frm = $("#classfrm").serialize()
	    
	    $.ajax({
	    	url: "lectureClassAdd",
	    	type: "post",
	    	data: frm,
	    	success: function(data){
	    		opener.location.reload();
	    	    window.close();
		 	},
		 	error : function(){
		 		
		 	}
	    }); 
	});
</script>
</body>
</html>