<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<style>

.search_bar {
	padding: 3px 0;
	outline: 1;
	border: 1px solid transparent;
	border-bottom: 1px solid #575756;
	border-radius: 0;
}

.search_btn {
	display: inline-block;
	border-radius: 7px;
	background-color: #6A60A9;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	width: 70px;
	height: 35px;
	transition: all 0.5s;
	cursor: pointer;
}

.search_btn span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.search_btn span:after {
	content: '*';
	position: absolute;
	opacity: 0;
	top: -5px;
	right: -10px;
	transition: 0.2s;
}

.search_btn:hover span {
	padding-right: 10px;
}

.search_btn:hover span:after {
	opacity: 1;
	right: 0;
}

.search {
	float: right;
	margin-bottom: 20px;
	padding: 0;
} 


</style>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="lc_page">
		<p class="lc_title">상담신청 게시판</p>
		<br>

		<!-- 서치바 -->
		<div class="search">
			<form class="search_form" action="#" method="get">
				<input class="search_bar" type="text" name="keyword" placeholder="이름으로 검색">
				<button class="search_btn" type="submit"><span>검색</span></button>
			</form>
		</div>

		<form id="lc_form">
			<table class="table">
				<thead>
					<tr>
						<th><label class="checkbox"> <input type="checkbox"
								id="checkall" class="checkbox" /> <span class="icon"></span>
						</label></th>
						<th>No.</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>희망상담시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label class="checkbox"> <input type="checkbox"
								class="checkbox" name="item" /> <span class="icon"></span>
						</label></td>
						<!-- <input type="checkbox" class="checkbox" name="item" /><span></span></td> -->
						<td>1</td>
						<td>고현민</td>
						<td>010-1111-2222</td>
						<td>jdhm@jdec.co.kr</td>
						<td>2021-06-12 16:00</td>
					</tr>
					<tr>
						<td><label class="checkbox"> <input type="checkbox"
								class="checkbox" name="item" /> <span class="icon"></span>
						</label></td>
						<td>2</td>
						<td>권용휘</td>
						<td>010-1111-3333</td>
						<td>jdyh@jdec.co.kr</td>
						<td>2021-06-04 17:00</td>
					</tr>
					<tr>
						<td><label class="checkbox"> <input type="checkbox"
								class="checkbox" name="item" /> <span class="icon"></span>
						</label></td>
						<td>3</td>
						<td>박강훈</td>
						<td>010-1111-5555</td>
						<td>jdkh@jdec.co.kr</td>
						<td>2021-06-04 18:00</td>
					</tr>
					<tr>
						<td><label class="checkbox"> <input type="checkbox"
								class="checkbox" name="item" /> <span class="icon"></span>
						</label></td>
						<td>4</td>
						<td>이호재</td>
						<td>010-1111-6666</td>
						<td>jdhj@jdec.co.kr</td>
						<td>2021-06-04 19:00</td>
					</tr>
					<tr>
						<td><label class="checkbox"> <input type="checkbox"
								class="checkbox" name="item" /> <span class="icon"></span>
						</label></td>
						<td>5</td>
						<td>정재만</td>
						<td>010-1111-7777</td>
						<td>jdjm@jdec.co.kr</td>
						<td>2021-06-04 20:00</td>
					</tr>
				</tbody>
			</table>
		</form>
		<button class="button" onclick="location.href=''">
			<span>삭제</span>
		</button>

		<br> <br> <br>
	</div>
	<jsp:include page="../counseling/addCS.jsp"></jsp:include>
	<script>
	$("#checkall").change(function(){
	    if($("#checkall").is(":checked")){
	     //alert("체크박스 체크했음!");
	     $("input[name='item']").prop('checked', true);
	    }else{
	        //alert("체크박스 체크 해제!");
	     $("input[name='item']").prop('checked', false);
	    }
	});

</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>