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
		<div class="popup">
			<div class="cd-popup-container">
				<div class="rc_cont">
				<img class="rc_warning" src="resources/images/alert.png">
				<p class="rc_p">상담신청을 정말 삭제 하시겠습니까?</p>
				</div>
				<ul id="close" class="cd-buttons">
					<li class="rc_li"><a class="rc_a" href="#0">삭제</a></li>
					<li class="rc_li"><a class="rc_a" href="#0">취소</a></li>
				</ul>
			</div>
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