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
	<div class="rn_background">
		<div class="popup">
			<div class="cd-popup-container">
				<img class="rn_warning" src="resources/images/alert.png">
				<p class="rn_p">게시글을 정말 삭제 하시겠습니까?</p>
				</div>
				<ul id="close" class="cd-buttons">
					<li class="rn_li"><a class="rn_a" href="#0" id="remove">삭제</a></li>
					<li class="rn_li"><a class="rn_a" href="#0" id="close">취소</a></li>
				</ul>
			</div>
		</div>

	<script>
      function show() {
        document.querySelector(".rn_background").className = "rn_background show";
      }

      function close() {
        document.querySelector(".rn_background").className = "rn_background";
      }

      document.querySelector("#btnRemove").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
    			   
    			   	//삭제 버튼 클릭 이벤트
    				$(document).on('click', '#remove', function(){
    			    var url = "${pageContext.request.contextPath}/removeNotice";
    			    url = url + "?n_no=" + ${notice.notice_no};
    					location.href = url;
    				});
    </script>
</body>
</html>