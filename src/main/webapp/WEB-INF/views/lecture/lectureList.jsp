<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	@font-face {
    src : url("resources/fonts/SCDream4.otf");
    font-family: SCDream4;
    }
     body {
        margin: 0px;
        padding: 0px;
        width: 800px;
        margin: auto;
        font-family: SCDream4;
    }
     .table th {
    font-size: 18px;
    color: #fff;
    line-height: 1.4;
    background-color: #6A60A9;
    }
    .table td {
    font-size: 15px;
    color: black;
    line-height: 1.4;
    }
    .table .table tr:nth-child(even) {
    background-color: #f8f6ff;
    }
    .table {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -webkit-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -o-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -ms-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    }
    .cont {
    	border-bottom: 1px;
    	border-bottom-style: solid;
    	border-bottom-color: black;
    	margin-bottom: 50px;
    }
    .content1 {
    	margin: 30px;
    	
    }
    h2 {
    	
    }
    .lecNo{
    	text-decoration: none;
    	color: black;
    }
</style>
</head>
<body>
<div>
	<section>
		<div class="cont">
			<article class="content1">
				<h2>강의정보</h2>
			</article>
		</div>
		<div>
			<article>
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
							<c:forEach var="vo" items="${list}" varStatus="status">	
							<c:set var="vo2" value="${list2[status.index]}"/>
								<tr>
									<td>${vo.lecture_no}</td>
									<td>${vo2.lecture_no }</td>
									<c:if test="${vo.lecture_no != vo2.lecture_no }">
									<td><a class="lecNo" href="lectureClassAddForm?lecture_no=${vo.lecture_no}">설정</a></td>
									</c:if>
									<c:if test="${vo.lecture_no == vo2.lecture_no }">
									<td>완료고고고</td>
									</c:if>
									<td>${vo.lecture_title}</td>
									<td>${vo.lecture_start} ~ ${vo.lecture_end}</td>
									<td>교직원</td>
									<td>${vo.lecture_limit}</td>
									<td>0</td>
									<td><input type="radio" name="lectureNo" value="${vo.lecture_no}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
					<button onclick="addForm();">등록</button>
					<button id="btnEdit">수정</button>
					<button id="btnRemove">삭제</button>
			</article>
		</div>
	</section>
</div>
<script>
/* 새창으로 열기 */
/* function popupCenter() {
	var w = 1000;
	var h = 700;
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
	window.open("lectureAddForm", "add", "width="+w+", height="+h+", left="+xPos+", top="+yPos);
} */

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


</script>
<jsp:include page="../lecture/lectureRemove.jsp"></jsp:include>
</body>
</html>