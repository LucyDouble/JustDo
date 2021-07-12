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
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/fonts.css" />
<link rel="stylesheet" href="resources/css/common/header.css" />
<link rel="stylesheet" href="resources/css/common/footer.css" />
<link rel="stylesheet"
	href="<c:url value="resources/css/account/studentSearch.css"/>">
<script type="text/javascript" src="resources/js/header.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<style>
.form-group{

}
</style>
<!-- <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script> -->


</head>
<body>
	<%@ include file="/WEB-INF/views/account/studentIdSearchModal.jsp"%>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>

		<div class="container" style = "height : 600px; width : 1000px;">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black">
					<h5>수강생 아이디/비밀번호 찾기</h5>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1"
						name="student_search" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-black"
						for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2"
						name="student_search" onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-black"
						for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1"
								name="inputName_1">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_1">이메일</label>
						<div>
							<input type="text" class="form-control" id="inputEmail_1"
								name="inputEmail_1">
						</div>
					</div>

					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()"
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId"
								name="inputId">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"
								name="inputEmail_2">
						</div>
					</div>

					<div class="form-group">
						<button id="searchBtn2" type="button"
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";

		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";

		}
	}
	$(document).ready(function() {
		$('#searchBtn').click(function() {
			console.log("modal1");
			$('#background_modal').show();
		});
		$('.close').on('click', function() {
			console.log("modal2");
			$('#background_modal').hide();
		});
		$(window).on('click', function() {
			console.log("modal3");
			if (event.target == $('#background_modal').get(0)) {
				$('#background_modal').hide();

			}
		});

	});

	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	/* var storeV = ""; */
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function() {
		console.log($('#inputName_1').val());

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/searchId?inputName_1="
					+ $('#inputName_1').val() + "&inputEmail_1="
					+ $('#inputEmail_1').val(),
			success : function(data) {
				console.log(data);

				if (data == 0) {
					$('#id_value').text("회원 정보를 확인해주세요!");

				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
					/* storeV = $("#store_id1 option:selected").val(); */
				}
			}
		});
	}

	// 비밀번호 찾기 이메일로 보내기
	$('#searchBtn2')
			.click(
					function() {
						console.log($('#inputId').val());
						console.log($('#inputEmail_2').val());
						$
								.ajax({
									type : "get",
									url : "${pageContext.request.contextPath}/searchPassword?inputId="
											+ $('#inputId').val()
											+ "&inputEmail_2="
											+ $('#inputEmail_2').val(),
									success : function(data) {
										alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");

									}

								});

					});

	// 비밀번호 찾기 눌렀을 때
	// 1 패스워드 찾기 창으로 이어진 후 2 패스워드 창에 아이디가 적힘
	// 3 모달창 종료
	$('#pwSearch_btn').click(function() {

		/* var idV = $('#id_value').val(); // 오류 뜸 */
		console.log(idV);
		/* console.log(storeV); */

		// 1. 패스워드 찾기 창으로 이어지고
		$('#search_2').prop("checked", true);

		// 메서드 호출
		search_check(2);

		// 2.아이디 & 매장 자동 저장
		$('#inputId').attr("value", idV);
		/* $('#store_id2').val(storeV).prop("selected", true); */

		// 마지막으로 모달창 종료
		$('#background_modal').hide();
	});
</script>
</html>