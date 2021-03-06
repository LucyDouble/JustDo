<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/fonts.css"/>
<link rel="stylesheet" href="resources/css/common/header.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css"/>
<link rel="stylesheet"
	href="<c:url value="resources/css/account/studentEdit.css"/>">
	<script type="text/javascript" src="resources/js/header.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="container">
		<h1 class="studentMyPage_title">마이 페이지</h1>
		<br>
		<div class="studentMyPage_studentInfo">
			<form id="studentMyPage_myForm">
				<table class="studentMyPage_studentTable">
					<tr id="studentMyPage_studentIdTr">
						<th class="studentMyPage_studentIdTh">아이디</th>
						<td><input type="text" name="id" id="studentMyPage_id"
							value="${DTO.id }" readonly></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="studentMyPage_name"
							value="${DTO.name }"readonly>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="password" id="studentMyPage_pw"
							value="**********" readonly>
							<p id="edit_pw" class="edit pwd_edit"
								style="float: right; font-size: 15px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('pw')">수정하기</p>
							<p id="errorPassword" 
								style="display: none;color: red;font-size: 12px;position: absolute;top: 141px;left: 710px;"></p>
						</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" name="phone" id="studentMyPage_phone"
							value="${DTO.phone }" readonly>
							<p id="edit_phone" class="edit phone_edit"
								style="float: right; font-size: 15px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('phone')">수정하기</p>
							<p id="errorPhone"
								style="display: none;color: red;font-size: 12px;position: absolute;top: 203px;left: 710px;"></p></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address"
							id="studentMyPage_address" value="${DTO.address }" readonly>
							<p id="edit_address" class="edit address_edit"
								style="float: right; font-size: 15px; margin-top: 10px; margin-right: 30px;"
								onclick="edit('address')">수정하기</p>
							<p id="errorAddress"
								style="display: none; margin-left: 70px; color: red; font-size: 15px; margin-bottom: 0px;"></p></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" id="studentMyPage_email"
							value="${DTO.email}" readonly>
						</td>
					</tr>
				</table>
				<div class="deleteBtn">
					<input type="button" id="studentMyPage_deleteBtn" value="탈퇴하기"
						class="studentMyPage_deleteBtn">
				</div>
			</form>


		</div>

		<!-- 삭제 모달창 -->
		<div id="studentMyPage_deleteModal" class="studentMyPage_deleteModal">
			<div id="studentMyPage_deleteDiv">
				<p>정말 탈퇴하시겠습니까?</p>
				<input type="button" id="studentMyPage_deleteOkBtn"
					class="studentMyPage_deleteOkBtn" value="탈퇴하기"> 
				<input type="button" id="studentMyPage_deleteCancelBtn"
					class="studentMyPage_deleteCancelBtn" value="취소하기">
			</div>
		</div>

	</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	
</body>
<script>
$(document).ready(function(){
   $('#studentMyPage_mainModal').hide(); // 시작시 수정모달창을 가림
   $('#studentMyPage_deleteModal').hide(); // 시작시 삭제모달창 가림
});
      
   var student_id = "${studentSession.student_id}";   
      
	///////////// 수정버튼을 눌렀을 경우 //////////////
	function edit(e){ //수정하기 버튼을 눌렀을 경우
		if(e == "pw"){
    		$('#studentMyPage_' + e).val("");
		}
    		$('#studentMyPage_' + e).focus();
    		$('#studentMyPage_' + e).css("border","3px solid red").attr("readonly", false);
    		$('#edit_' + e).text("수정완료").attr("id", "edit_" + e + "Ok").attr("onclick", "editOk(" + "'" + e + "'" + ")");
	  	}
	// 유효성검사 정규식
/* 	var nameP =  /^[0-9a-zA-Z가-힣]{2,20}$/; */
	var phoneP = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	var emailP = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var birthP = /^[0-9]{8}$/;
	var passwordP = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
	///////////수정확인 버튼을 눌렀을 경우/////////////
	function editOk(e){ 
    /* 	if(e == "name"){
    		if(nameP.test($('#studentMyPage_name').val())){
    			$('#errorName').css("display","none");
    			editFinish(e);
    		} else{
    			console.log(($('#studentMyPage_name').val()));
    			$('#errorName').show().html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
    		}
    	} */ if (e == "phone"){
    		if(phoneP.test($('#studentMyPage_phone').val())){
    			$('#errorPhone').css("display","none");
    			editFinish(e);
    		} else {
    			$('#errorPhone').show().html("형식에맞지 않는 번호입니다.");
    		}
    	} else if (e == "email"){
    		if(emailP.test($('#studentMyPage_email').val())){
    			$('#errorEmail').css("display","none");
    			editFinish(e);
    		} else {
    			$('#errorEmail').show().html("이메일 주소를 다시 확인해주세요.");
    		}
    
    	} else if (e == "pw"){
    		if(passwordP.test($('#studentMyPage_pw').val())){
    			$('#errorPassword').css("display","none");
    			editFinish(e);
    		} else{
    			$('#errorPassword').show().html("비밀번호는 8~16자 특수문자, 영문, 숫자 혼합이어야 합니다.");
    		}
    		/* editFinish(e);
    		$('#studentMyPage_pw').val("********"); */
    	}else if(e == "address"){
    		editFinish(e);
    	}
	}
	////////// 수정에서 유효성검사를 통과했을경우 메서드 ///////////
	function editFinish(e){
 		$.ajax({
			url : '${pageContext.request.contextPath}' + '/account/studentEdit' + e + '',
			type : 'post',
			data : $('#studentMyPage_myForm').serialize(),
   			success : function(data){
    			alert("수정을 완료했습니다.");
    			$('#studentMyPage_' + e).css("border","none").attr("readonly", true);
    			$('#edit_' + e + 'Ok').text("수정하기").attr("id", "edit_" + e ).attr("onclick", "edit(" + "'" + e + "'" + ")");
   			}
   		});
	}
	
         //////////삭제버튼 클릭시 삭제확인 모달창이 뜸///////////
         $('#studentMyPage_deleteBtn').click(function(){
        	 $('#studentMyPage_deleteModal').show();
         });
         
         /////////모달창에서 삭제확인버튼클릭시 로그인페이지로 이동////////
         $('#studentMyPage_deleteOkBtn').click(function(){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/account/studentDelete',
               type : 'post',
               data : $('#studentMyPage_myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>/jdHome'
					}
				});
				$('#studentMyPage_mainModal').hide();
			});

	/////////모달창에서 취소버튼 클릭시 다시 마이페이지이동//////////
	$('#studentMyPage_deleteCancelBtn').click(function() {

		$('#studentMyPage_deleteModal').hide();

	});

	//////////모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음//////////
	$(window).on('click', function() {
		//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
		if (event.target == $('#studentMyPage_mainModal').get(0)) {
			$('#studentMyPage_mainModal').hide();
		}
	});
	$(window).on('click', function() {
		//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
		if (event.target == $('#studentMyPage_deleteModal').get(0)) {
			$('#studentMyPage_deleteModal').hide();
		}
	});

	//////////닫기버튼을 누르면 수정모달창 닫음//////////
	$('#studentMyPage_close').click(function() {
		$('#studentMyPage_mainModal').hide();

	});
</script>
</html>