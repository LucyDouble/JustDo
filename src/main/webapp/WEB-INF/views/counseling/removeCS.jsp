<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
	<div class="rc_background">
		<div class="popup">
			<div class="cd-popup-container">
				<div class="rc_cont">
				<img class="rc_warning" src="resources/images/alert.png">
				<p class="rc_p">상담신청을 정말 삭제 하시겠습니까?</p>
				</div>
				<ul id="close" class="cd-buttons">
					<li class="rc_li"><a class="rc_a" href="#0" id="rc_remove" onclick="delcs();">삭제</a></li>
					<li class="rc_li"><a class="rc_a" href="#0" id="rc_close">취소</a></li>
				</ul>
			</div>
		</div>
	</div>
	<script>
	document.querySelector("#btnRemove").addEventListener("click",removeshow);
	function removeshow() {
		document.querySelector(".rc_background").className = "rc_background show";
	}

	document.querySelector("#rc_close").addEventListener("click", removeclose);
	
	function removeclose() {
        document.querySelector(".rc_background").className = "rc_background";
      }
		    			  /*  	//삭제 버튼 클릭 이벤트
		    				 $(document).on('click', '#remove', function(){
		    			    var url = "${pageContext.request.contextPath}/removeCS";
		    			    url = url + "?c_no=" + ${counseling_no.counseling_no};
		    					location.href = url;
		    				}); */
	/* 	//삭제 버튼 클릭 이벤트
		$(document).on('click', '#rc_remove', function() {
			var url = "${pageContext.request.contextPath}/removeCS";
			url = url + "?c_no=" + ${counseling.counseling_no };
			location.href = url;
		}); */

		/* $(document).on('click', '#rc_remove', function(){
		    var cnt = $("input[name='item']:checked").length;
		    var arr = new Array();
		    $("input[name='item']:checked").each(function() {
		        arr.push($(this).attr('counseling_no'));
		    });
		    if(cnt == 0){
		        alert("선택된 신청인이 없습니다.");
		    }
		    else{
		        $.ajax = {
		            type: "POST",
		            url: "removeCS",
		            data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
		            dataType:"json",
		            success: function(jdata){
		                if(jdata != 1) {
		                    alert("삭제 오류");
		                }
		                else{
		                    alert("삭제 성공");
		                }
		            },
		            error: function(){alert("서버통신 오류");}
		        };
		    }
		} */
	</script>
</body>
</html>