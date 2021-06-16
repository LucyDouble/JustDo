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
    <p class="an_title">공지사항 작성</p>
    <br>
<form action="" class="addForm">
    <div class="form-group">
        <label class="an_label" for="subject">&nbsp;&nbsp;제목</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
    </div>
    <br>
    <div id="editor" class="form-group">
      <label class="an_label" for="content">&nbsp;&nbsp;내용</label>
    	<textarea cols="10" id="editor1" name="editor1" rows="10"></textarea>
    	
    	
   <script>
    CKEDITOR.replace('editor1', { height: '400px',
      extraPlugins: 'editorplaceholder',
      editorplaceholder: '내용을 입력하세요.'
    });

  </script>
    </div>
    <br>
    <button type="submit" class="button" onclick="location.href='listNotice'"><span>목록</span></button>
    <button type="submit" class="button" onclick="location.href='listNotice'"><span>등록</span></button>
  </form>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>