<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
	<div class="ec_background">
		<div class="ec_popup">
			<div class="cd-popup-container">
			<div class="ec_head">
			<h2 class="ec_title">&nbsp;&nbsp;상담신청 수정</h2>
			</div>
				<form id="editCS" class="ec_Form" name="form">
					<div class="form-group">
					<input type="hidden" name="c_no" id="ec_no">
						<label class="ec_label" for="ec_name">이름</label>
							<input type="text" class="ec_label_input" id="ec_name" name="c_name" value="">
						<label class="ec_label" for="ec_phone">연락처</label>
							<input type="text" class="ec_label_input" id="ec_phone" name="c_phone" value="">
						<label class="ec_label" for="ec_email">이메일</label> 
							<input type="text" class="ec_label_input" id="ec_email" name="c_email" value="">
						<label class="ec_label" for="ec_time">희망상담시간</label>
							<input type="datetime-local" class="ec_label_input" id="ec_time" name="c_date" value="" >
					</div>
				</form>
						<div class="ec_btns">
						<button class="ec_cbtn" onclick="editclose();">취소</button>
						<button class="ec_ebtn" onclick="editCS();">수정</button>
						</div>
			</div>
		</div>
	</div>
	<script>
      function editshow() {
    	 $("#ec_no").val($("#vc_no").val());
    	 $("#ec_name").val($("#vc_name").val());
    	 $("#ec_phone").val($("#vc_phone").val());
    	 $("#ec_email").val($("#vc_email").val());
    	 // 히든에 넣어놓은애들 갖고와서 포맷형식 맞춰주기
  	 	 $("#ec_time").val($("#date2").val()+"T"+$("#clock").val()+":00"); 

        document.querySelector(".ec_background").className = "ec_background show";
      }
	
      document.querySelector(".ec_cbtn").addEventListener("click", editclose);

		function editclose() {
        document.querySelector(".ec_background").className = "ec_background";
      }

	function editCS(){
		var frm = document.getElementById("editCS");
		frm.action = "editCS";
		frm.method = "POST";
		frm.submit();
	}
    </script>  
