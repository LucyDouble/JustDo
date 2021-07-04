<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<c:if test="${empty attendList }">
			<p class="ln_title">출석하기</p>
		</c:if>
		<c:if test="${not empty attendList }">
			<p class="ln_title">${lecture_title }</p>
		</c:if>
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
		<input type="hidden" id="stu_no2" value="${stu_no}">
		<input type="hidden" id="lecture_no2" value="${lecture_no}">
		<div>
			<input id="content" type="hidden" name="content" value="${content }"/>
			<input type="button" id="check" class="chbutton" value="입실하기" /> 
			<input type="button" id="execute" class="chbutton" value="QR생성" /> 
			<input type="button" id="check" class="chbutton" value="퇴실하기" /> 
			<!-- <img id="img" style="display: none; width: 250px; height: 250px;" onload="this.style.display = 'block'" /> -->
		</div>


		<HR>
<div class="videoModal">
		<div class="container" id="container" >
			<p id="closeScan">&#10006;</p>
			<div class="col-md-6" style="width: 100%;">
				<video id="preview" width="100%"></video>
			</div>
		</div>
</div>
	<br>
		<div class="scan_con" style="display: none;">
			<label>SCAN QR CODE</label> <input type="text" name="text" id="text"
				readonyy="" placeholder="scan qrcode" class="form-control">
		</div>


	<div class="rc_background2">
		<div class="popup2">
			<div class="cd-popup-container2">
				<div class="rc_cont2">
			<img id="img" style=" width: 350px; height: 350px;" onload="this.style.display = 'inline-block'" />
				</div>
				<ul id="close2" class="cd-buttons2">
					<li class="rc_li2"><a class="rc_a2" id="rc_close2">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>



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
			swal("EMPTY TITLE","제목을 입력해 주세요.","warning");
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
        	swal("출석이 되었습니다.","퇴실 인증을 안할 시 결석으로 처리 됩니다.","success");
        	/* alert("출석이 되었습니다.") */
        	document.querySelector(".videoModal").className = "videoModal";
        }else{
        	swal("Fail","올바른 qr을 입력해주세요.","warning");
        	/* alert("올바른 qr을 입력해주세요.") */
        	document.querySelector(".videoModal").className = "videoModal";
        }
    }); 

	
		$("#execute").click(function(){
			document.querySelector(".rc_background2").className = "rc_background2 show2";
			url="qr";
		
			var stu_no = $("#stu_no2").val();
			var lecture_no = $("#lecture_no2").val();
			$("#img").attr("src",url+"?stu_no="+stu_no+"&lecture_no="+lecture_no);
			$.ajax({
				url:'qr2'
		 			,type:'post'
		 			,data: {stu_no:stu_no
		 						,lecture_no:lecture_no }
		 			,success :function(data){
		 					$("#content").val(data);	
		 			
		 			}
			});
			
		});
		document.querySelector("#rc_close2").addEventListener("click", removeclose);
		
		function removeclose() {
	        document.querySelector(".rc_background2").className = "rc_background2";
	      }
/* 		$("#execute").click(function(){
			url="qr";
		
			var stu_no = $("#stu_no2").val();
			var lecture_no = $("#lecture_no2").val();
			$("#img").attr("src",url+"?stu_no="+stu_no+"&lecture_no="+lecture_no);
			$.ajax({
				url:'qr2'
		 			,type:'post'
		 			,data: {stu_no:stu_no
		 						,lecture_no:lecture_no }
		 			,success :function(data){
		 					$("#content").val(data);	
		 			
		 			}
			});
			
		}); */


		$("#check").click(function(){
			document.querySelector(".videoModal").className = "videoModal show";
	        
	        
		});
		document.querySelector("#closeScan").addEventListener("click", removeclose2);
		
		function removeclose2() {
	        document.querySelector(".videoModal").className = "videoModal";
	      }
</script>
</body>
</html>