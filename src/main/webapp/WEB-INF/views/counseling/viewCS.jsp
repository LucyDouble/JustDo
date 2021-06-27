<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<jsp:include page="../counseling/editCS.jsp"></jsp:include>
	<div class="vc_background">
		<div class="vc_popup">
			<div class="cd-popup-container">
			<div class="vc_head">
			<h2 class="vc_title">&nbsp;&nbsp;상담신청 조회</h2>
			</div>	
				<form action="" class="vc_Form" method="get">
					<div class="form-group">
						<label class="vc_label" for="vc_name">이름</label>
							<input type="text" class="vc_label_input" id="vc_name" name="counseling_name" value="" readonly>
						<label class="vc_label" for="vc_phone">연락처</label>
							<input type="text" class="vc_label_input" id="vc_phone" name="counseling_phone" value="" readonly>
						<label class="vc_label" for="vc_email">이메일</label> 
							<input type="text" class="vc_label_input" id="vc_email" name="counseling_email" value="" readonly>
						<label class="vc_label" for="vc_time">희망상담시간</label>
							<input type="text" class="vc_label_input" id="vc_time"  name="counseling_date" value="" readonly>
					</div>
				</form>
						<div class="vc_btns">
						<button class="vc_cbtn" onclick="viewclose();">취소</button>
						<button class="vc_ebtn" onclick="editshow();">수정</button>
						</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="date2" value="">
	<input type="hidden" id="clock" value="">
	<script>
	function viewshow(name, phone, email, date, date2, clock) {
			 $("#vc_name").val(name);
			 $("#vc_phone").val(phone);
			 $("#vc_email").val(email);
			 $("#vc_time").val(date); 
			 $("#date2").val(date2);
			 $("#clock").val(clock);
			 console.log(date2);
			 console.log(clock);
			 document.querySelector(".vc_background").className = "vc_background show"; 
			 }
		
		 document.querySelector(".vc_ebtn").addEventListener("click", viewclose);
		 
		 function viewclose(){
			 document.querySelector(".vc_background").className = "vc_background";
			 
		 }
		 </script>