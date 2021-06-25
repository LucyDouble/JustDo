<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">

	<div class="vc_background">
		<div class="vc_popup">
			<div class="cd-popup-container">
			<div class="vc_head">
			<h2 class="vc_title">&nbsp;&nbsp;상담신청 조회</h2>
			</div>
				<form action="" class="vc_Form" method="get">
					<div class="form-group">
						<label class="vc_label" for="vc_name">이름</label>
							<input type="text" class="vc_label_input" id="vc_name" name="counseling_name" readonly>
						<label class="vc_label" for="vc_phone">연락처</label>
							<input type="text" class="vc_label_input" id="vc_phone" name="counseling_phone" readonly>
						<label class="vc_label" for="vc_email">이메일</label> 
							<input type="text" class="vc_label_input" id="vc_email" name="counseling_email" readonly>
						<label class="vc_label" for="vc_time">희망상담시간</label>
							<input type="text" class="vc_label_input" id="vc_time"  name="counseling_date" readonly>
					</div>
				</form>
						<div class="vc_btns">
						<button class="vc_cbtn" onclick="viewclose();">취소</button>
						<button type="submit" class="vc_ebtn">수정</button>
						</div>
			</div>
		</div>a
	</div>
	<script>
	function viewshow(name, phone, email, date) {
		 $("#vc_name").val(name);
		 $("#vc_phone").val(phone);
		 $("#vc_email").val(email);
		 $("#vc_time").val(date);
		 document.querySelector(".vc_background").className = "vc_background show"; 
		 }
	 function viewclose(){
		 document.querySelector(".vc_background").className = "vc_background";
	 }
	</script>
