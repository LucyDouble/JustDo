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
<title>시험수정-교직원</title>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script>
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
    <div class="choice_form_work">
    	강의 선택 :
		<div class="selectbox3">
		<label for="lecture_no">${examDto.lecture_title }</label> 
    	<select name="lecture_no" id="lecture_no">
    		<option value="${examDto.lecture_no} " >${examDto.lecture_title }</option>
    		<c:forEach items="${lecturechk }" var="i">
    		<option value="${i.lecture_no }">${i.lecture_title }</option>
    		</c:forEach>
    	</select>
    	</div>
    <div class="date_work">
      시험 날짜 : 
	<input type="date" name="exam_date" id="exam_date" value="${examDto.exam_date }" class="selectbox2"> 
	</div>
	<div class="date_work">
	시험 시작 : 
	<input type="time" name="exam_start" id="exam_start" value="${examDto.exam_start }" class="selectbox4">
	시험 종료 : 
	<input type="time" name="exam_end" id="exam_end" value="${examDto.exam_end }" class="selectbox4">
    </div>
    </div>
    <br>
    <div id="editor" class="form-group">
      <label class="an_label" for="exam_content">&nbsp;&nbsp;내용</label>
    <textarea cols="10" id="exam_content" name="exam_content" rows="10">${examDto.exam_content }</textarea>
    	
    	<br>
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
  $(document).ready(function() { 
		var selectTarget = $('.selectbox3 select'); 
		selectTarget.change(function(){ 
			var select_name = $(this).children('option:selected').text(); 
			$(this).siblings('label').text(select_name);
			}); 
		});
	$(function() {
		  var selectTarget = $('.selectbox3 select');

		  // focus 가 되었을 때와 focus 를 잃었을 때
		  selectTarget.on({
		    'focus': function() {
		      $(this).parent().addClass('focus');
		    },
		    'blur': function() {
		      $(this).parent().removeClass('focus');
		    }
		  });

		  selectTarget.change(function() {
		    var select_name = $(this).children('option:selected').text();
		    $(this).siblings('label').text(select_name);
		    $(this).parent().removeClass('focus');
		  });
		});  
  
	  $("#edit").click(function(){
		  var frm=document.getElementById("frm");
		  	var exam_subject=document.getElementById("exam_subject");
		  	var lecture_no = document.getElementById("lecture_no");
		  	var exam_date= document.getElementById("exam_date");
		  	var exam_start = document.getElementById("exam_start");
		  	var exam_end = document.getElementById("exam_end");
		  	var exam_content = document.getElementById("exam_content");
		  	
		  	var today = new Date();
		  	var dd = today.getDate();
		  	var mm = today.getMonth()+1;
		  	var yyyy = today.getFullYear();
		  	 if(dd<10){
		         dd='0'+dd
		     } 
		     if(mm<10){
		         mm='0'+mm
		     }
		  	today = yyyy+'-'+mm+'-'+dd;
		  	
		  	if(exam_subject.value==""){
		  		swal("EMPTY TITLE","제목을 입력해 주세요.","warning");
		  		return false;
		  	}
		  	else if(lecture_no.value=="back"){
		  		swal("EMPTY LECTURE","강의를 선택해 주세요.","warning");
		  		return false;
		  	}
		  	else if(exam_date.value==""||exam_start.value=="" ||exam_end.value==""){
		  		swal("EMPTY DATE","시험기간을 선택해 주세요.","warning");
		  		return false;
		  	}
		  	else if(exam_date.value<today){
		  		swal("DATE ERROR","시험 날짜는 최소"+today+"(오늘)로 설정 해 주시길 바랍니다.","warning");
		  		return false;
		  	}
		  	else if(exam_start.value>exam_end.value){
		  		swal("TIMR ERROR","종료 시간은 시작 시작 이후로 설정 해 주시길 바랍니다.","warning");
		  		return false;
		  	}
		  	else if(CKEDITOR.instances.exam_content.getData() =='' || CKEDITOR.instances.exam_content.getData().length ==0){
	            swal("EMPTY CONTENT","내용을 입력해주세요.","warning");
	               $("#exam_content").focus();
	            return false;
	        }
		  	else if(CKEDITOR.instances.exam_answer.getData() =='' || CKEDITOR.instances.exam_answer.getData().length ==0){
	            swal("EMPTY CONTENT","내용을 입력해주세요.","warning");
	               $("#exam_answer").focus();
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