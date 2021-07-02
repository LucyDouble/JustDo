<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/listWork.css"/>">
<script src="https://kit.fontawesome.com/afd6aa68df.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/footer.css"/>">
<style>
.container {
	display: none;
	top: 150px;
	width: 500px;
	height: 500px;
	z-index: 1;
	position: fixed;
}

.selectbox {
	display: inline-block;
	position: relative;
	width: 320px;
	height: 30px;
	line-height: 30px;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	border: 1px solid #DEDCEE;
	z-index: 1;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.selectbox label {
	position: absolute;
	top: 0px;
	left: 5px;
	height: 30px;
	line-height: 30px;
	color: #999;
	z-index: -1;
	border-radius: 3px;
}

.selectbox select {
	width: 100%;
	height: 30px;
	line-height: 30px;
	font-family: inherit;
	border: 0;
	opacity: 0;
	border-radius: 3px;
	filter: alpha(opacity = 0);
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
/* focus 효과 */
.selectbox.focus {
  border-color: #66afe9;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
}
.chbutton {
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
	margin: 5px;
}
</style>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">

		<p class="ln_title">출석하기</p>
		<hr>
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
				<button type="button" class="chbutton"  id="chbutton"><span>출결하기</span></button>
			</form>
		</div>
		<hr>

<c:if test="${not empty attendList }">

		<div>
			<input id="content" type="text" name="content" /> 
			<input type="button" id="check" class="chbutton" value="입실하기" /> 
			<input type="button" id="execute" class="chbutton" value="QR생성" /> 
			<input type="button" id="check" class="chbutton" value="퇴실하기" /> 
			<img id="img" style="display: none; width: 250px; height: 250px;" onload="this.style.display = 'block'" />
		</div>


		<HR>

		<div class="container" id="container">
			<p id="closeScan">&#10006;</p>
			<div class="col-md-6">
				<video id="preview" width="100%"></video>
			</div>
		</div>
		<div class="scan_con">
			<label>SCAN QR CODE</label> <input type="text" name="text" id="text"
				readonyy="" placeholder="scan qrcode" class="form-control">
		</div>

		<hr>
		<table class="table">
				<thead>
					<tr>
						<th>날짜</th>
						<th >입실시간</th>
						<th >퇴실시간</th>
						<th >출결</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${attendList }" var="i">
						<tr>
							<td>${i.attend_date}</td>
							<td >${i.attend_start }</td>
							<td>${i.attend_end }</td>
							<td>기다려</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
</c:if>




		<sciprt src="js/jqurey-3.1.1.js"></sciprt>
		<sciprt src="js/bootstrap.js"></sciprt>

	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script type="text/javascript">
	
	
	$("#chbutton").click(function(){
		var frm = document.getElementById("choiceFrm");
		var lecture_no = document.getElementById("lecture_no");
		if(lecture_no.value=="back"){
	  		alert("강의를 선택해 주세요.");
	  		return false;
	  	}
			frm.action="listAttend";
		    frm.method="GET";
		    frm.submit();
	});
	
	
	
	$(document).ready(function() { 
		var selectTarget = $('.selectbox select'); 
		selectTarget.change(function(){ 
			var select_name = $(this).children('option:selected').text(); 
			$(this).siblings('label').text(select_name);
			}); 
		});
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

	
	
	var content = $("#content").val();
	let scanner = new Instascan.Scanner({ video: document.getElementById('preview')});
    Instascan.Camera.getCameras().then(function(cameras){
        if(cameras.length > 0 ){
            scanner.start(cameras[0]);
        } else{
            alert('No cameras found');
        }

    }).catch(function(e) {
        console.error(e);
    });

    scanner.addListener('scan',function(c){
    	var content = $("#content").val();
    	var container = document.getElementById("container");
        document.getElementById('text').value=c;
        if(content==c){
        	alert("출석이 되었습니다.")
        	container.style.display ="none"
        }else{
        	alert("올바른 qr을 입력해주세요.")
        	container.style.display ="none"
        }
    });
	
	
  
	
	
		$("#execute").click(function(){
			alert("s");
			
			url="qr";
			
			var content = $("#content").val();
			$("#img").attr("src",url+"?content="+content);
		});


		$("#check").click(function(){
			alert("스캐너야 열려라잉");
			var content = $("#content").val();
			var container = document.getElementById("container");
	        var close = document.getElementById("closeScan");
	        if(container.style.display ="none"){
	        	container.style.display ="block"
	         }

	        close.onclick = function(){
	        	container.style.display = "none";
	        }
	        
	        
		});
</script>
</body>
</html>