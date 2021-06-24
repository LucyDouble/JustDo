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

	<div class="background">
		<div class="ec_popup">
			<div class="cd-popup-container">
			<div class="ec_head">
			<h2 class="ec_title">&nbsp;&nbsp;상담신청 수정</h2>
			</div>
				<form action="" class="ec_Form">
					<div class="form-group">
						<label class="ec_label" for="ec_name">이름</label>
							<input type="text" class="ec_label_input" id="ec_name" name="name" value="">
						<label class="ec_label" for="ec_phone">연락처</label>
							<input type="text" class="ec_label_input" id="ec_phone" name="name" value="">
						<label class="ec_label" for="ec_email">이메일</label> 
							<input type="text" class="ec_label_input" id="ec_email" name="name" value="">
						<label class="ec_label" for="ec_time">희망상담시간</label>
							<input type="text" class="ec_label_input" id="ec_time" name="name" value="">
						<div class="ec_btns">
						<button class="ec_cbtn">취소</button>
						<button class="ec_ebtn">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
		

	<script>
      function editshow() {
        document.querySelector(".background").className = "background show";
      }

      function editclose() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
    </script>
</body>
</html>