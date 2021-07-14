<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제수정-학생</title>
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
	<form id="frm" action="editSubmitWork" method="POST">

    <p class="vn_title">제출 과제 수정</p>
    <table class="table">
				<thead>
					<tr>
						<th>수업 명</th>
						<th>과제 명</th>
						<th>제출 기간</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${workDto.lecture_title}</td>
							<td>${workDto.work_subject}</td>
							<td> ${workDto.work_start}~${workDto.work_end }  </td>
						</tr>
				</tbody>
			</table>
			<br>
    
    <br>
    <table class="table">
        <thead>
            <tr>
                <th class="vn_cont">&nbsp;&nbsp;과제 내용</th>
            </tr>
        </thead>
        <tbody>
            <tr class="cont3">
                <td class="vn_cont">&nbsp;&nbsp;${workDto.work_content }</td>
            </tr>
        </tbody>
    </table>
    
 	    <br>
    <div id="editor" class="form-group">
	    <label class="an_label" for="work_content">&nbsp;&nbsp;내용</label>
	    <textarea cols="10" id="work_content" name="work_submit" rows="10">${workDto.work_submit }</textarea>
	    <input type="hidden" name="work_no" value="${workDto.work_no}">
	    <input type="hidden" name="registration_no" value="${workDto.registration_no}">
    </div>
    	
    <script>
	    CKEDITOR.replace('work_content', { height: '400px',
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