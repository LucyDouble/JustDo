<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<!-- 클래식 -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script> -->
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/addWork.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="an_page">
    <p class="an_title">시험 수정</p>
    <br>
<form class="frm" id="frm">
	<input type="hidden" name="exam_no" value="${examDto.exam_no }">
    <div class="work_form-group">
        <label class="work_an_label" for="exam_subject">&nbsp;&nbsp;제목</label>
        <input type="text" class="work_form-control form-control" id="exam_subject" name="exam_subject" placeholder="제목을 입력하세요." value="${examDto.exam_subject }">
    </div>
    <br>
    <div class="choice_form">
    	강의 선택 : 
    	<select name="lecture_no" id="lecture_no">
    		<option value="${examDto.lecture_no} " >${examDto.lecture_title }</option>
    		<c:forEach items="${lecturechk }" var="i">
    		<option value="${i.lecture_no }">${i.lecture_title }</option>
    		</c:forEach>
    	</select>
    	<br>
      시험 날 : 
	<input type="date" name="exam_date" id="exam_date" value="${examDto.exam_date }"> 
	<br>
	시험 시작 : 
	<input type="time" name="exam_start" id="exam_start" value="${examDto.exam_start }">
	시험 종료 : 
	<input type="time" name="exam_end" id="exam_end" value="${examDto.exam_end }">
    </div>
    <br>
    <div id="editor" class="form-group">
      <label class="an_label" for="exam_content">&nbsp;&nbsp;내용</label>
    <textarea cols="10" id="exam_content" name="exam_content" rows="10">${examDto.exam_content }</textarea>
    	
    	
   <script>
    CKEDITOR.replace('exam_content', { height: '400px',
      extraPlugins: 'editorplaceholder',
      editorplaceholder: '시험 문제를 입력하세요.'
    });

  </script>
  <label class="an_label" for="exam_answer">&nbsp;&nbsp;내용</label>
    <textarea cols="10" id="exam_answer" name="exam_answer" rows="10">${examDto.exam_answer }</textarea>
    	
    	
   <script>
    CKEDITOR.replace('exam_answer', { height: '400px',
      extraPlugins: 'editorplaceholder',
      editorplaceholder: '시험 답안지를 입력하세요.'
    });

  </script>
    </div>
    <br>
    <button type="button" class="button" id="edit"><span>수정</span></button>
    <!-- TODO 정말로 수정을 취소 하시겠습니까? -->
    <button type="button" class="button" id="cancle"><span>취소</span></button>
  </form>
  <script type="text/javascript">
	  $("#edit").click(function(){
		  var frm=document.getElementById("frm");
		  	var exam_subject=document.getElementById("exam_subject");
		  	var lecture_no = document.getElementById("lecture_no");
		  	var exam_date= document.getElementById("exam_start");
		  	var exam_start = document.getElementById("exam_start");
		  	var exam_end = document.getElementById("exam_end");
		  	var exam_content = document.getElementById("exam_content");
		  	if(exam_subject.value==""){
		  		alert("제목을 입력해 주세요.");
		  		return false;
		  	}
		  	else if(lecture_no.value=="back"){
		  		alert("강의를 선택해 주세요.");
		  		return false;
		  	}
		  	else if(exam_date.value==""||exam_start.value=="" ||exam_end.value==""){
		  		alert("시험 일자(시간)을 선택해 주세요.");
		  		return false;
		  	}
		  	else if(exam_start.value>exam_end.value){
		  		alert("종료 시간은 시작 시작 이후로 설정 해 주시길 바랍니다.");
		  		return false;
		  	}
	  	frm.action="editExam";
	      frm.method="POST";
	      frm.submit();
	  });
	  	$("#cancle").click(function(){
		  	var frm=document.getElementById("frm");
		  	frm.action="viewExam";
		      frm.method="POST";
		      frm.submit();
		});
  </script>
</div>
<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>