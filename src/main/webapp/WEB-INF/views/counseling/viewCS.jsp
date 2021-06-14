<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>

	<button id="show">팝업열기</button>
	<div class="background">
		<div class="vc_popup">
			<!-- <div class="cd-popup-container"> -->
			<div class="vc_head">
			<h2 class="vc_title">&nbsp;&nbsp;상담신청 조회</h2>
			</div>
				<form action="" class="vc_Form">
					<div class="form-group">
						<label class="vc_label" for="vc_name">이름</label>
							<input type="text" class="vc_label_input" id="vc_name" name="name" value="" readonly>
						<label class="vc_label" for="vc_phone">연락처</label>
							<input type="text" class="vc_label_input" id="vc_phone" name="name" value="" readonly>
						<label class="vc_label" for="vc_email">이메일</label> 
							<input type="text" class="vc_label_input" id="vc_email" name="name" value="" readonly>
						<label class="vc_label" for="vc_time">희망상담시간</label>
							<input type="text" class="vc_label_input" id="vc_time" name="name" value="" readonly>
						<div class="vc_btns">
						<button class="vc_cbtn">취소</button>
						<button class="vc_ebtn">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	<script>
      function show() {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
    </script>
</body>
</html>