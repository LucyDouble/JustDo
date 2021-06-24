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
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="an_page">
    <p class="an_title">과제 등록</p>
    <br>
<form  class="addForm" id="frm" >
    <div class="work_form-group">
        <label class="work_an_label" for="work_subject">&nbsp;&nbsp;제목</label>
        <input type="text" class="work_form-control form-control" id="work_subject" name="work_subject" placeholder="제목을 입력하세요.">
    </div>
    <br>
    <div class="choice_form">
    	강의 선택 : 
    	<select name="lecture_no" id="lecture_no">
    		<option value="back" >강의를 선택하세요</option>
    		<c:forEach items="${lecturechk }" var="i">
    		<option value="${i.lecture_no }">${i.lecture_title }</option>
    		</c:forEach>
    	</select>
    	<br>
          과제 시작 : 
	<input type="date" name="work_start" id="work_start" > 
	<br>
	마감 날짜 : 
	<input type="date" name="work_end" id="work_end">
    </div>
    <br>
    <div id="editor" class="form-group">
      <label class="an_label" for="work_content">&nbsp;&nbsp;내용</label>
    <textarea cols="10" id="work_content" name="work_content" rows="10"></textarea>
    	
    	
   <script>
    CKEDITOR.replace('work_content', { height: '400px',
      extraPlugins: 'editorplaceholder',
      editorplaceholder: '내용을 입력하세요.'
    });

    
  </script>
    </div>
    <br>
    <button type="button" class="button" onclick="history.back();"><span>취소</span></button>
    <button type="submit" class="button" id="add"><span>등록</span></button>
  </form>
  <script type="text/javascript">
  $("#add").click(function(){
	  	var frm=document.getElementById("frm");
	  	var work_subject=document.getElementById("work_subject");
	  	var lecture_no = document.getElementById("lecture_no");
	  	var work_start = document.getElementById("work_start");
	  	var work_end = document.getElementById("work_end");
	  	var work_content = document.getElementById("work_content");
	  	
	  	if(work_subject.value==""){
	  		alert("제목을 입력해 주세요.");
	  		return false;
	  	}
	  	else if(lecture_no.value=="back"){
	  		alert("강의를 선택해 주세요.");
	  		return false;
	  	}
	  	else if(work_start.value=="" ||work_end.value==""){
	  		alert("체출기간을 선택해 주세요."+work_start.value);
	  		return false;
	  	}
	  	else if(work_start.value>work_end.value){
	  		alert("마감날짜는 "+work_start.value+"(시작날짜) 이후로 설정 해 주시길 바랍니다.");
	  		return false;
	  	}
	  	/* else if(work_content.value==""){
	  		alert("과제 내용을 입력해 주세요.");
	  		return false;
	  	} */
	  	frm.action="addWork";
	    frm.method="POST";
	    frm.submit();
	});
  </script>
</div>
<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>