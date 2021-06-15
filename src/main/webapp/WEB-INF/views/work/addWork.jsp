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
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="an_page">
    <p class="an_title">과제 등록</p>
    <br>
<form action="addWork" class="addForm" method="POST">
	<input type="hidden" name="lecture_no">
    <div class="form-group">
        <label class="an_label" for="work_subject">&nbsp;&nbsp;제목</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
    </div>
    <br>
    <div>
    	강의 선택:
    	<select name="lecture_no" id="lecture_no">
    		<option value="back" >강의를 선택하세요</option>
    		<c:forEach items="${lecturechk }" var="i">
    		<option value="${i.lecture_no }">${i.lecture_title }</option>
    		</c:forEach>
    	</select>
    </div>
    <div>
    	class 선택:
    	<select name="work_class" id="work_class">
    		<option value="back" >class를 선택하세요</option>
    		<c:forEach items="${lecturechk }" var="i">
    		<option value="${i.lecture_no }">${i.lecture_title }</option>
    		</c:forEach>
    	</select>
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
    <button type="button" class="button" onclick="location.href='listWork'"><span>목록</span></button>
    <button type="submit" class="button"><span>등록</span></button>
  </form>
</div>
</body>
</html>