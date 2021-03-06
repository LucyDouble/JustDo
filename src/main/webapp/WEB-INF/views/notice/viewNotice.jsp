<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 조회</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>"> 
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="vn_page">
    <p class="vn_title">게시글 조회</p>
    <br>
 <table class="table">
        <thead>
            <tr>
                <th class="vn_cont">${notice.notice_sub }</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="vn_cont"><p class="vn_cont_p">작성자</p>&nbsp;<c:if test="${notice.manager_number >= 20000 }">운영자</c:if>
                								<c:if test="${notice.teacher_number >= 100000 }">${notice.teacher_name }</c:if>
                 </td>
            </tr>
            <tr>
                <td class="vn_cont"><p class="vn_cont_p">작성일</p>&nbsp;&nbsp;${notice.notice_date }</td>
            </tr>
              <tr>
                <td class="vn_cont"><p class="vn_cont_p">첨부파일</p>&nbsp;&nbsp;<div class="vn_filelist">
                	<c:forEach items="${listFile }" var="i"><a class="vn_filelist" href="fileDownload?n_no=${notice.notice_no }&notice_filename=${i.notice_filename }">${i.notice_filename }</a>&nbsp;&nbsp;</c:forEach>
                	</div>
                </td>
            </tr>
            <tr class="cont3">
                <%-- <td class="vn_cont"><img src="${notice.notice_filepath}${notice.notice_filename}" >${notice.notice_con }</td> --%>
                <td class="vn_cont">${notice.notice_con }</td>
            </tr>
	
        </tbody>
        </table>
        
    <button class="button" onclick="location.href='listNotice'"><span>목록</span></button>
    <c:if test="${sessionScope.student_number == null}">
     <c:if test="${sessionScope.teacher_number == notice.teacher_number || sessionScope.manager_number == notice.manager_number }">
    <button id="btnUpdate" class="button" onclick="location.href='editNoticeForm?n_no=${notice.notice_no}'"><span>수정</span></button>
    <button id="btnRemove" class="button"><span>삭제</span></button>
   	</c:if>
   	</c:if>
    </div>
    <div class="comment_Wrapper"><jsp:include page="../comment/noticeComment.jsp"></jsp:include></div>
    
    <script>
    </script>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <jsp:include page="../notice/removeNotice.jsp"></jsp:include>
</body>
</html>