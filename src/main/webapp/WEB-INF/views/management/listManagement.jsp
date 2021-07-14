<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리</title>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/listAttend.css"/>">
<script src="https://kit.fontawesome.com/afd6aa68df.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>"> 
</head>
<body>
	
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<c:if test="${empty managementList }">
			<p class="ln_title">학생관리</p>
		</c:if>
		<c:if test="${not empty managementList }">
			<c:if test="${lecture_state ==1 }">
				<p class="ln_title">${lecture_title }</p>
			</c:if>
			<c:if test="${lecture_state !=1 }">
				<p class="ln_title_end">${lecture_title }</p>
				<p class="an_sub">종료된 강의입니다.</p>
			</c:if>
		</c:if>
		<!--<hr>-->
		<div>
			<form id="choiceFrm">
				강의 선택:
				<div class="selectbox">
					<label for="lecture_no">강의를 선택하세요</label> 
					<select name="lecture_no" id="lecture_no">
						<option value="back">강의를 선택하세요</option>
						<c:forEach items="${list }" var="i">
							<option value="${i.lecture_no }">${i.lecture_title }</option>
						</c:forEach>
					</select>
				</div>
				<button type="button" class="chbutton"  id="chbutton"><span>조회하기</span></button>
			</form>
		</div>
	<br>
 <c:if test="${not empty managementList }">
 
 
 <table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th >학생명</th>
						<th >class</th>
						<th >평균성적</th>
						<th >과제제출률</th>
						<th >출결</th>
						<th >학습진행률</th>
						<th >상세</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${managementList }" var="i">
						<tr>
							<td >${i.rnum}</td>
							<td >${i.name }</td>
							<td>${i.lectureclass_class}</td>
							<td>${i.avg_grade}	</td>
							<td>${i.work_progress}%	</td>
							<td>${i.att}%	</td>
							<td>${i.video_progress }%</td>
							<td>
							<form id ="ResultFrm" action="viewManagement" method="post">
								<input type="hidden" name="student_number" value="${i.student_number }">
								<input type="hidden" name="lecture_no" value="${lecture_no }">
								<input type="hidden" name="lecture_title" value="${lecture_title }">
								<input type="hidden" name="name" value="${i.name }">
								<input type="hidden" name="lectureclass_class" value="${i.lectureclass_class }">
								<input type="hidden" name="avg_grade" value="${i.avg_grade }">
								<input type="hidden" name="work_progress" value="${i.work_progress }">
								<input type="hidden" name="att" value="${i.att }">
								<input type="submit" id ="ResultBtn" value="보러가기">
							</form>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
 
 <br><br>
 
 
	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listManagement?page=${startPage-1}&lecture_no=${lecture_no}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listManagement?lecture_no=${lecture_no}">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listManagement?page=${endPage+1}&lecture_no=${lecture_no}">다음</a>
	</c:if>
</c:if> 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
	<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>

<script type="text/javascript">

$("#chbutton").click(function(){
	var frm = document.getElementById("choiceFrm");
	var lecture_no = document.getElementById("lecture_no");
	if(lecture_no.value=="back"){
		swal("EMPTY LECTURE","강의를 선택해 주세요.","warning");
  		return false;
  	}
		frm.action="listManagement";
	    frm.method="GET";
	    frm.submit();
});


/* select창 */
$(document).ready(function() { 
	var selectTarget = $('.selectbox select'); 
	selectTarget.change(function(){ 
		var select_name = $(this).children('option:selected').text(); 
		$(this).siblings('label').text(select_name);
		}); 
	});
/* select창 */
$(function() {
	  var selectTarget = $('.selectbox select');

	  // focus 가 되었을 때와 focus 를 잃었을 때
	  selectTarget.on({
	    'focus': function() {
	      $(this).parent().addClass('focus');
	    },
	    'blur': function() {
	      $(this).parent().removeClass('focus');
	    }
	  });

	  selectTarget.change(function() {
	    var select_name = $(this).children('option:selected').text();
	    $(this).siblings('label').text(select_name);
	    $(this).parent().removeClass('focus');
	  });
	});
</script>
</body>

</html>