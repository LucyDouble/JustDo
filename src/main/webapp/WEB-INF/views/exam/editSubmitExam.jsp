<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험수정-학생</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>"> 
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">
	<form id="frm" action="editSubmitExam" method="POST">

    <p class="vn_title">제출 시험 수정</p>
    <table class="table">
				<thead>
					<tr>
						<th>수업 명</th>
						<th>시험 명</th>
						<th>시험 시간</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${examDto.lecture_title}</td>
							<td>${examDto.exam_subject}</td>
							<td> ${examTime.exam_start}~${examTime.exam_end }  </td>
						</tr>
				</tbody>
			</table>
			<br>
    
    <br>
    <table class="table">
        <thead>
            <tr>
                <th class="vn_cont">&nbsp;&nbsp;시험 내용</th>
            </tr>
        </thead>
        <tbody>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${examDto.exam_content }</td>
            </tr>
        </tbody>
    </table>
    
 	    <br>
    <div id="editor" class="form-group">
	    <label class="an_label" for="exam_content">&nbsp;&nbsp;내용</label>
	    <textarea cols="10" id="exam_content" name="exam_submit" rows="10">${examDto.exam_submit }</textarea>
	    <input type="hidden" name="exam_no" value="${examDto.exam_no}">
	    <input type="hidden" name="registration_no" value="${examDto.registration_no}">
    </div>
    	
    <script>
	    CKEDITOR.replace('exam_content', { height: '400px',
	      extraPlugins: 'editorplaceholder',
	      editorplaceholder: '내용을 입력하세요.'
	    });
    </script>
   		<input type="submit" class="button"  value="수정"></input>
   		<input type="button" class="button" onclick="history.back();" value="취소"></input>
    
    
    
    </form>
    </div>
<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
 
</html>