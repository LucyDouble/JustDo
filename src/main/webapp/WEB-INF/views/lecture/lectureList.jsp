<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 목록</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/lectureList.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="ln_page">
			<p class="ln_title">강의정보</p>
			<c:if test="${empty list}">
				<p>등록된 강의가 없습니다.</p>
			</c:if>
			<c:if test="${not empty list}">
		<div>
				<form id="lecturefrm">
					<table class="table">
						<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>강의기간</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">	
								<tr>
									<td>${vo.rnum}</td>
									<c:if test="${vo.lecture_check == 0 }">
									<td><a class="lecNo" href="javascript:void(0);" onclick="LeClass('${vo.lecture_no}');">설정</a></td>
									</c:if>
									<c:if test="${vo.lecture_check == 1 }">
									<td style="color: #EE2560">완료</td>
									</c:if>
									<td>${vo.lecture_title}</td>
									<td>${vo.lecture_start} ~ ${vo.lecture_end}</td>
									<td>${vo.name}</td>
									<td>${vo.lecture_limit}</td>
									<td>${vo.lecture_personnel}</td>
									<td><label class="checkbox">
									<input type="radio" name="lectureNo" value="${vo.lecture_no}"><span class="icon"></span></label></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
		</div>
			</c:if>
			<div class="btns">
					<button class="button" onclick="addForm();"><span>등록</span></button>
					<button class="button" id="btnEdit"><span>수정</span></button>
					<button class="button" id="btnRemove"><span>삭제</span></button>
			</div>
		</div>
<script>
/* 등록 폼 이동 */
function addForm(){
	location.href="lectureAddForm";
}

/* 수정 버튼 클릭 시 */
$("#btnEdit").click(function(){
	var frm = document.getElementById("lecturefrm");
	var check = $("input:radio[name='lectureNo']").is(":checked");
	if(check==true){
		frm.action="lectureEditForm";
	    frm.method="GET";
	    frm.submit();
	} else{
		alert("수정할려면 박스에 체크해주세요");
	}
});

/* 분반 설정창 오픈 */
function LeClass(num){
	var w = 800;
	var h = 700;
	var width = (window.screen.width-w) / 2;
	var height = (window.screen.height-h) / 2;
	window.open("lectureClassAddForm?lecture_no="+num, "lectureClassAddForm", "width="+w+", height="+h+", left="+width+", top="+height);
}

</script>
<jsp:include page="../lecture/lectureRemove.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>