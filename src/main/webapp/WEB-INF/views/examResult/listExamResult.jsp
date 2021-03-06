<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험리스트-강사</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/listWorkResult.css"/>">
<link rel="stylesheet"
    href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
    src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<script src="https://kit.fontawesome.com/afd6aa68df.js" crossorigin="anonymous"></script>

</head>
<body>
	
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="ln_title">시험 리스트</p>

		<table class="table">
				<thead>
					<tr>
						<th>수업 명</th>
						<th>시험 명</th>
						<th>시험 날짜</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${lecture_title}</td>
							<td>${exam_subject}</td>
							<td>${exam_date} [${exam_start }~ ${exam_end }]  </td>
						</tr>
				</tbody>
			</table>
			<br>
		<!-- 서치바 -->
		<div class="lc_search_box_workResult lc_search_box">
			<form class="lc_search" action="listExamResult" method="POST">
				<input class="lc_search_input" type="text" name="keyword" placeholder="학생이름"
				onmouseout="document.search.keyword.value = ''">
				<input type="hidden" name="exam_no" value="${exam_no }">
				<input type="hidden" name="exam_subject" value="${exam_subject }">
				<input type="hidden" name="lectureclass_class" value="${lecture_class }">
				<input type="hidden" name="lecture_title" value="${lecture_title }">
				<input type="hidden" name="exam_start" value="${exam_start }">
				<input type="hidden" name="exam_end" value="${exam_end }">				
			</form>
			 <i class="fas fa-search i"></i>
		</div>
		
			<table class="table_workResult table">
				<thead>
					<tr>
						<th>No.</th>
						<th>학생명</th>
						<th>class</th>
						<th>제출</th>
						<th>성적</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listExam }" var="i">
						<tr>
							<td>${i.rnum }</td>
							<td>${i.name }</td>
							<td>${i.lectureclass_class} </td>
							<td><c:if test="${i.exam_submit ==null }">x</c:if>
									<c:if test="${i.exam_submit !=null }">o</c:if>
							</td>
							<form id="frm" action="viewExamResult" method="POST">
								<td class="ln_cont ln_cont_workResult" id="workSubmit" >
									<input type="hidden" name="exam_no" value="${exam_no }" >
									<input type="hidden" name="exam_date" value="${i.exam_date}">
									<input type="hidden" name="exam_start" value="${i.exam_start }">
									<input type="hidden" name="exam_end" value="${i.exam_end }">
									<%-- <input type="hidden" name="exam_content" value="${i.exam_content }"> --%>
									<%-- <input type="hidden" name="exam_submit" value="${i.exam_submit }"> --%>
									<%-- <input type="hidden" name="exam_answer" value="${i.exam_answer }"> --%>
									<input type="hidden" name="lectureclass_class" value="${i.lectureclass_class }">
									<input type="hidden" name="name" value="${i.name}">
									<input type="hidden" name="registration_no" value="${i.registration_no}" >
									<input type="hidden" name="exam_grade" value="${i.exam_grade}" >
									<input type="hidden" name="lecture_title" value="${lecture_title}" >
									<input type="hidden" name="exam_subject" value="${exam_subject}" >
									<button type="submit" id ="ResultBtn">
										<c:if test="${i.exam_grade==0  && i.exam_submit !=null }">0[채점]</c:if>
										<c:if test="${i.exam_grade!=0}">${i.exam_grade}</c:if>
									</button>
										<c:if test="${i.exam_grade==0  && i.exam_submit ==null }">-</c:if>
								</td>
							</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			
	<div class="graph_title">평균 점수</div>
	<ul id="g1" class="graph">
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${total}%" >전체<em>0점</em></span></li>
        <br>
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${classOne}%">1 반<em>0점</em></span></li>
        <br>
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${classTwo}%">2 반<em>0점</em></span></li>
    </ul>
			
			
			
			<br>
<br>
<br>
	<div class="pageNo" >
		<button style="clear:both;" class="button" onclick="location.href='listExam'">
				<span>시험목록</span>
		</button>
		<c:if test="${keyword !='' }">
		<button class="button" onclick="location.href='listExamResult'">
				<span>목록</span>
		</button>
		</c:if> 
	<br><br><br>


	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listExamResult?page=${startPage-1}&keyword=${keyword}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listWorkChk" value="listExamResult?keyword=${keyword}">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listWorkChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listExamResult?page=${endPage+1}&keyword=${keyword}">다음</a>
	</c:if>
	</div>	 
		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>
	</div>
	
	
	
	


  


	<script type="text/javascript">
	
	
	
	
	
	
	drawGraph(document.getElementById("g1"));

	function drawGraph(obj) {
	    this.gages = obj.getElementsByTagName("span");
	    this.values = obj.getElementsByTagName("em");

	    for(var i = 0; i < this.gages.length; i ++) {
	        (function(idx) {
	            var current_value = 0;
	            var gage_object = this.gages[idx];
	            var gage_value = this.values[idx];
	            var gage_width = parseInt(gage_object.style.width);
	            var timer = null;

	            timer = setInterval(function() {
	                if(current_value <= gage_width) {
	                    current_value += Math.ceil((gage_width - current_value) / 15);
	                    if(current_value==0){
	                    	gage_object.style.width = 8 + "%";
	                    }else{
	                    gage_object.style.width = current_value+8 + "%";
	                    }
	                    gage_value.innerHTML = current_value + "점";
	                } else {
	                    clearInterval(timer);
	                }
	            }, 10);
	        })(i);
	    }
	}
	</script>
	
	
	
	
	
<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	
</body>
</html>