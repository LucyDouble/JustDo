<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JD 교육원</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
<
style>.teacherMyPage_teacherInfo {
	margin: 30px 20px;
	position: relative;
}

.teacherMyPage_teacherTable th {
	color: black;
	width: 240px;
	height: 80px;
	font-size: 25px;
	padding: 10px 40px;
	border-top: 2px solid darkgray;
	border-bottom: 2px solid darkgray;
	border-right: 2px solid darkgray;
}

.teacherMyPage_teacherTable td {
	width: 600px;
	color: black;
	border-top: 2px solid darkgray;
	border-bottom: 2px solid darkgray;
	background-color: #white;
}

.teacherMyPage_teacherTable input[type=text] {
	width: 400px;
	height: 50px;
	margin-left: 70px;
	border-radius: 7px;
	border: 1px solid ivory;
	background-color: #eee;
	padding-left: 20px;
	font-size: 20px;
}

.teacherMyPage_title {
	margin-top: 30px;
}

.teacherMyPage_deleteBtn {
	border: none;
	background-color: #212121;
	width: 130px;
	height: 50px;
	color: white;
	margin-left: 190px;
	font-size: 20px;
	border-radius: 10px;
	background-color: red;
}

.teacherMyPage_deleteBtn:hover {
	background-color: palevioletred;
	cursor: pointer;
}

.teacherMyPage_deleteModal {
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	z-index: 1;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}

.teacherMyPage_deleteDiv {
	position: absolute;
	top: 20%;
	left: 35%;
	width: 500px;
	height: 200px;
	background-color: #eee;
	text-align: center;
	border-radius: 10px;
}

.teacherMyPage_deleteDiv p {
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 35px;
}

.teacherMyPage_deleteOkBtn, .teacherMyPage_deleteCancelBtn {
	background-color: red;
	border: none;
	width: 130px;
	height: 50px;
	color: white;
	margin-left: 30px;
	margin-right: 30px;
	font-size: 18px;
	border-radius: 10px;
}

.teacherMyPage_deleteCancelBtn {
	background-color: black !important;
}

.teacherMyPage_deleteOkBtn:hover {
	background-color: #EE2560;
	cursor: pointer;
}

.teacherMyPage_deleteCancelBtn:hover {
	background-color: #8e8e8e !important;
	cursor: pointer;
}

.edit:hover {
	color: #EE2560
;
	cursor: pointer;
}

@media ( max-width :570px) {
	.container {
		min-width: 100% !important;
	}
	.teacherMyPage_teacherTable th {
		padding: 10px 10px;
		width: 100px;
	}
	.teacherMyPage_teacherTable td {
		width: 350px;
	}
	.teacherMyPage_deleteBtn {
		width: 80px;
		margin-left: 115px;
		font-size: 15px;
		height: 35px;
	}
}
</style>
</head>
<body>

	<div class="container">
		<h1 class="teacherMyPage_title">마이 페이지</h1>
		<hr>
		<div class="teacherMyPage_teacherInfo">
			<form id="teacherMyPage_myForm">
				<table class="teacherMyPage_teacherTable">
					<tr id="teacherMyPage_teacherIdTr">
						<th>회원아이디</th>
						<td><input type="text" name="id" id="teacherMyPage_id"
							value="${DTO.id }" readonly></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="teacherMyPage_name"
							value="${DTO.name }" readonly>
							<p id="edit_name" class="edit"
								style="float: right; font-size: 18px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('name')">수정하기</p>
							<p id="errorName"
								style="display: none; margin-left: 70px; color: #6A60A9
; font-size: 15px; margin-bottom: 0px;"></p></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="password" id="teacherMyPage_pw"
							value="**********" readonly>
							<p id="edit_pw" class="edit"
								style="float: right; font-size: 18px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('pw')">수정하기</p>
							<p id="errorPassword"
								style="display: none; margin-left: 70px; color: red; font-size: 15px; margin-bottom: 0px;"></p></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" name="phone" id="teacherMyPage_phone"
							value="${DTO.phone }" readonly>
							<p id="edit_phone" class="edit"
								style="float: right; font-size: 18px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('phone')">수정하기</p>
							<p id="errorPhone"
								style="display: none; margin-left: 70px; color: red; font-size: 15px; margin-bottom: 0px;"></p></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address"
							id="teacherMyPage_address" value="${DTO.address }" readonly>
							<p id="edit_address" class="edit"
								style="float: right; font-size: 18px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('address')">수정하기</p>
							<p id="errorAddress"
								style="display: none; margin-left: 70px; color: red; font-size: 15px; margin-bottom: 0px;"></p></td>
					</tr>
					<tr>
						<th>회원이메일</th>
						<td><input type="text" name="email" id="teacherMyPage_email"
							value="${DTO.email}" readonly></td>
					</tr>
					<tr>
						<th>회원정보관리</th>
						<td class="teacherMyPage_btnTd"><input type="button"
							id="teacherMyPage_deleteBtn" value="탈퇴"
							class="teacherMyPage_deleteBtn"></td>
					</tr>
				</table>
			</form>


		</div>

		<!-- 삭제 모달창 -->
		<div id="teacherMyPage_deleteModal" class="teacherMyPage_deleteModal">
			<div class="teacherMyPage_deleteDiv">
				<p>정말 탈퇴하시겠습니까?</p>
				<input type="button" id="teacherMyPage_deleteOkBtn"
					class="teacherMyPage_deleteOkBtn" value="탈퇴하기"> <input
					type="button" id="teacherMyPage_deleteCancelBtn"
					class="teacherMyPage_deleteCancelBtn" value="취소하기">
			</div>
		</div>

	</div>
</body>
<script>
$(document).ready(function(){
   $('#teacherMyPage_mainModal').hide(); // 시작시 수정모달창을 가림
   $('#teacherMyPage_deleteModal').hide(); // 시작시 삭제모달창 가림
});
      
   var teacher_id = "${teacherSession.teacher_id}";   
      
	///////////// 수정버튼을 눌렀을 경우 //////////////
	function edit(e){ //수정하기 버튼을 눌렀을 경우
		if(e == "pw"){
    		$('#teacherMyPage_' + e).val("");
		}
    		$('#teacherMyPage_' + e).focus();
    		$('#teacherMyPage_' + e).css("border","3px solid red").attr("readonly", false);
    		$('#edit_' + e).text("수정완료").attr("id", "edit_" + e + "Ok").attr("onclick", "editOk(" + "'" + e + "'" + ")");
	  	}
	// 유효성검사 정규식
	var nameP =  /^[0-9a-zA-Z가-힣]{2,20}$/;
	var phoneP = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	var emailP = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var birthP = /^[0-9]{8}$/;
	var passwordP = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
	///////////수정확인 버튼을 눌렀을 경우/////////////
	function editOk(e){ 
    	if(e == "name"){
    		if(nameP.test($('#teacherMyPage_name').val())){
    			$('#errorName').css("display","none");
    			editFinish(e);
    		} else{
    			console.log(($('#teacherMyPage_name').val()));
    			$('#errorName').show().html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
    		}
    	} else if (e == "phone"){
    		if(phoneP.test($('#teacherMyPage_phone').val())){
    			$('#errorPhone').css("display","none");
    			editFinish(e);
    		} else {
    			$('#errorPhone').show().html("형식에맞지 않는 번호입니다.");
    		}
    	} else if (e == "email"){
    		if(emailP.test($('#teacherMyPage_email').val())){
    			$('#errorEmail').css("display","none");
    			editFinish(e);
    		} else {
    			$('#errorEmail').show().html("이메일 주소를 다시 확인해주세요.");
    		}
    
    	} else if (e == "pw"){
    		if(passwordP.test($('#teacherMyPage_pw').val())){
    			$('#errorPassword').css("display","none");
    			editFinish(e);
    		} else{
    			$('#errorPassword').show().html("비밀번호는 8~16자 특수문자, 영문, 숫자 혼합이어야 합니다.");
    		}
    		/* editFinish(e);
    		$('#teacherMyPage_pw').val("********"); */
    	}else if(e == "address"){
    		editFinish(e);
    	}
	}
	////////// 수정에서 유효성검사를 통과했을경우 메서드 ///////////
	function editFinish(e){
 		$.ajax({
			url : '${pageContext.request.contextPath}' + '/account/teacherEdit' + e + '',
			type : 'post',
			data : $('#teacherMyPage_myForm').serialize(),
   			success : function(data){
    			alert("수정을 완료했습니다.");
    			$('#teacherMyPage_' + e).css("border","none").attr("readonly", true);
    			$('#edit_' + e + 'Ok').text("수정하기").attr("id", "edit_" + e ).attr("onclick", "edit(" + "'" + e + "'" + ")");
   			}
   		});
	}
	
         //////////삭제버튼 클릭시 삭제확인 모달창이 뜸///////////
         $('#teacherMyPage_deleteBtn').click(function(){
        	 $('#teacherMyPage_deleteModal').show();
         });
         
         /////////모달창에서 삭제확인버튼클릭시 로그인페이지로 이동////////
         $('#teacherMyPage_deleteOkBtn').click(function(){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/account/teacherDelete',
               type : 'post',
               data : $('#teacherMyPage_myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>/jdHome'
               }
            });
            $('#teacherMyPage_mainModal').hide();
         });
         
         /////////모달창에서 취소버튼 클릭시 다시 마이페이지이동//////////
         $('#teacherMyPage_deleteCancelBtn').click(function(){
        	 
        	 $('#teacherMyPage_deleteModal').hide();
         
         });
         
      	//////////모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음//////////
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#teacherMyPage_mainModal').get(0)) {
                $('#teacherMyPage_mainModal').hide();
             }
         });
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#teacherMyPage_deleteModal').get(0)) {
                $('#teacherMyPage_deleteModal').hide();
             }
         });
      	
         //////////닫기버튼을 누르면 수정모달창 닫음//////////
         $('#teacherMyPage_close').click(function(){
            $('#teacherMyPage_mainModal').hide();
         
         });
   </script>
</html>