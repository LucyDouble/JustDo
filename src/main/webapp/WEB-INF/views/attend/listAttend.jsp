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
<style type="text/css">
.graph_liAttend { margin: 0; padding: 0; text-align: left;}
.graphAttend  { width: 450px; list-style: none;margin: 0; padding: 0; clear: both; }
.graphAttend li   { position: relative; padding: 1px 0; white-space:nowrap; }
.graphAttend li span  { display: inline-block; position: relative; height: 30px; line-height: 30px; background: #DEDCEE;}
.graphAttend li em    { position: absolute; top: 0px; right: -40px; font-family: arial; color: #000; font-size: 14px;}
.graph_titleAttend{
	font :bold;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	float : left; 
}
.ln_title_end {
	font-size: 25px;
	font-weight: bold;
	clear: both;
}
.an_sub {
	font-size: 12px;
	font-weight: bold;
	clear: both;
	margin-bottom: 20px;
	color: #5b5b5b;
}
</style>
</head>
<body>

	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<c:if test="${empty attendList }">
			<p class="ln_title">출석하기</p>
		</c:if>
		<c:if test="${not empty attendList }">
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
				<button type="button" class="chbutton"  id="chbutton"><span>출결하기</span></button>
			</form>
		</div>
		<br>
		<!--<hr>-->
<c:if test="${not empty attendList }">
	<c:if test="${not empty msg  }">
	<script type="text/javascript">
		var msg = '${msg}';
		var msg1 = '${msg1}';
		swal(msg1,msg,"success");
	</script>
	</c:if>
	<c:if test="${not empty warning  }">
	<script type="text/javascript">
		var warning = '${warning}';
		var warning1 = '${warning1}';
		swal(warning1,warning,"warning");
	</script>
	</c:if>
			<table class="table table2">
				<thead>
					<tr>
						<th>강의기간</th>
						<th >강의시간</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${lecture_start } ~ ${lecture_end }</td>
							<td >${lectureclass_start } ~ ${lectureclass_end }</td>

						</tr>
				</tbody>
			</table>
	<form id="frm">
	
		<input type="hidden" id="lectureclass_start" name="lectureclass_start" value="${lectureclass_start}">
		<input type="hidden" id="lectureclass_end" name="lectureclass_end" value="${lectureclass_end}">
		<input type="hidden" id="stu_no2" name="stu_no2" value="${stu_no}">
		<input type="hidden" id="lecture_no2" name="lecture_no2" value="${lecture_no}">
		<input type="hidden" id="lectureclass_no" name="lectureclass_no" value="${lectureclass_no}">
		<c:if test="${endCh =='0' }">
			<div>
				<input id="content" type="hidden" name="content" value="${content }"/>
				<c:if test="${lecture_state ==1 }">
					<c:if test="${startCh=='0' }">
						<input type="button" id="check"  class="chbutton" value="입실하기" /> 
					</c:if>   
					<c:if test="${startCh=='1' }">
						<input type="button" id="checkEarly"  class="chbutton" value="조퇴하기" /> 
					</c:if>   
					<input type="button" id="execute"  class="chbutton" value="QR생성" /> 
					<input type="button" id="checkExit"  class="chbutton" value="퇴실하기" /> 
				</c:if>
			</div>
		</c:if>
		<br>
		
	<div class="graph_titleAttend">&nbsp;&nbsp;&nbsp;평균 출석률</div>
	<br>
	<ul id="g1Attend" class="graphAttend">
        <li class="graph_liAttend">&nbsp;&nbsp;&nbsp;<span class="grape_span" style="width: ${myPro}%" >나<em>${myPro}%</em></span></li>
        <li class="graph_liAttend">&nbsp;&nbsp;&nbsp;<span class="grape_span" style="width: ${classPro}%">우리반<em>${classPro}%</em></span></li>
    </ul>
		<!--<hr>-->
		
	<!-- 입실 video -->
	<div class="videoModal">
		<div class="container" id="container" >
			<p id="closeScan">&#10006;</p>
			<div class="col-md-6" style="width: 100%;">
				<video id="preview" width="100%"></video>
			</div>
		</div>
	</div>
	<br>
	<!-- 퇴실 video -->
	<div class="videoModalExit">
		<div class="containerExit" id="containerExit" >
			<p id="closeScanExit">&#10006;</p>
			<div class="col-md-6Exit" style="width: 100%;">
				<video id="previewExit" width="100%"></video>
			</div>
		</div>
	</div>
 	<!-- 조퇴 video -->
	<div class="videoModalEarly">
		<div class="containerEarly" id="containerExit" >
			<p id="closeScanEarly">&#10006;</p>
			<div class="col-md-6Early" style="width: 100%;">
				<video id="previewEarly" width="100%"></video>
			</div>
		</div>
	</div>
	<!-- 받아들인 qr 값-->
		<div class="scan_con" style="display: none;">
			<label>SCAN QR CODE</label> <input type="text" name="text" id="text"
				readonyy="" placeholder="scan qrcode" class="form-control">
		</div>

	<!-- qr박스 -->
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
	</form>



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
							<td>
							<c:if test="${i.attend_progress =='0' }">결석</c:if>
							<c:if test="${i.attend_progress =='1' }">지각</c:if>
							<c:if test="${i.attend_progress =='2' }">조퇴</c:if>
							<c:if test="${i.attend_progress =='3' }">지각+조퇴</c:if>
							<c:if test="${i.attend_progress =='4' }">출석</c:if>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>





		

	<br>
	<br>
	<br>
	
	
	<c:if test="${startPage != 1 }">
	   <a
		  href="<%=request.getContextPath() %>/listAttend?page=${startPage-1}">이전</a>
	</c:if>
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 	<c:if test="${p eq currentPage}">
	 		<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 	</c:if>
	 	<c:if test="${p ne currentPage}">
	 		<c:url var="listAttendChk" value="listAttend">
	 			<c:param name="page" value="${p}" />
	 		</c:url>
	 		<a href="${listAttendChk}">${p}</a>
	 	</c:if>
	 </c:forEach>
	<c:if test="${endPage < pageCnt }">
	   <a
		  href="<%=request.getContextPath() %>/listAttend?page=${endPage+1}">다음</a>
	</c:if>
</c:if>	
	</div>
	<br><br><br>
	<sciprt src="js/jqurey-3.1.1.js"></sciprt>
	<sciprt src="js/bootstrap.js"></sciprt>
	<jsp:include page="../common/footer.jsp"></jsp:include>


<script type="text/javascript">


	drawGraph(document.getElementById("g1Attend"));

function drawGraph(obj) {
    this.gages = obj.getElementsByClassName("grape_span");
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
                    	gage_object.style.width = 11 + "%";
                    }else{
                    gage_object.style.width = current_value+11 + "%";
                    }
                    gage_value.innerHTML = current_value + "%";
                } else {
                    clearInterval(timer);
                }
            }, 10);
        })(i);
    }
} 
</script>
	<script type="text/javascript">
	
	

	
	
	
	
	
	
	$("#chbutton").click(function(){
		var frm = document.getElementById("choiceFrm");
		var lecture_no = document.getElementById("lecture_no");
		if(lecture_no.value=="back"){
			swal("EMPTY LECTURE","강의를 선택해 주세요.","warning");
	  		return false;
	  	}
			frm.action="listAttend";
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

	
	
	/* 입실video모달창 */
	$("#check").click(function(){
		document.querySelector(".videoModal").className = "videoModal show";
        
        
	
	/* 입실video모달창 닫기 */
	document.querySelector("#closeScan").addEventListener("click", removeclose2);
	function removeclose2() {
        document.querySelector(".videoModal").className = "videoModal";
      }
	
	/* 입실video 키기 */
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

    /* 입실scan하고 출석 조지기*/
     scanner.addListener('scan',function(c){
    	var content = $("#content").val();
    	var container = document.getElementById("container");
        document.getElementById('text').value=c;
        if(content==c){
        	document.querySelector(".videoModal").className = "videoModal";
        	attend();
        }else{
        	swal("Fail","올바른 qr을 입력해주세요.","warning");
        	/* alert("올바른 qr을 입력해주세요.") */
        	document.querySelector(".videoModal").className = "videoModal";
        }
    }); 
	});
    /* 일실 update */
	function attend(){
		var frm = document.getElementById("frm");
		frm.action = "editAttend";
		frm.method = "POST";
		frm.submit();
	};
     /* qr생성하기 */
 		$("#execute").click(function(){
 			/* document.querySelector(".rc_background2").className = "rc_background2 show2"; */
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
		 				if($("#content").val() == ""){
		 					$("#content").val(data);	
		 				}
		 			}
			}); 
			document.querySelector(".rc_background2").className = "rc_background2 show2";
		}); 
	     
		/* qr창 닫기 */
		document.querySelector("#rc_close2").addEventListener("click", removeclose);
		function removeclose() {
	        document.querySelector(".rc_background2").className = "rc_background2";
	      }

		
		
		
		
		
		/* 퇴실video모달창 닫기 */
		document.querySelector("#closeScanExit").addEventListener("click", removecloseExit);
		function removecloseExit() {
	        document.querySelector(".videoModalExit").className = "videoModalExit";
	      }
		
		/* 퇴실video모달창 */
		$("#checkExit").click(function(){
			document.querySelector(".videoModalExit").className = "videoModalExit showExit";
	        
	        
		
		/* 퇴실video 키기 */
		var content = $("#content").val();
		let scanner = new Instascan.Scanner({ video: document.getElementById('previewExit')});
	    Instascan.Camera.getCameras().then(function(cameras){
	        if(cameras.length > 0 ){
	            scanner.start(cameras[0]);
	        } else{
	            alert('No cameras found');
	        }

	    }).catch(function(e) {
	        console.error(e);
	    });

	    /* 퇴실scan하고 출석 조지기*/
	     scanner.addListener('scan',function(c){
	    	var content = $("#content").val();
	    	var container = document.getElementById("containerExit");
	        document.getElementById('text').value=c;
	        if(content==c){
	        	
	        	document.querySelector(".videoModalExit").className = "videoModalExit";
	        	exit();
	        }else{
	        	swal("Fail","올바른 qr을 입력해주세요.","warning");
	
	        	document.querySelector(".videoModalExit").className = "videoModalExit";
	        }
	    }); 
		});
	    /* 퇴실 update */
		function exit(){
			var frm = document.getElementById("frm");
			frm.action = "editAttendExit";
			frm.method = "POST";
			frm.submit(); 
		};
		
		
		
		
		
		/* 조퇴video모달창 닫기 */
		document.querySelector("#closeScanEarly").addEventListener("click", removecloseEarly);
		function removecloseEarly() {
	        document.querySelector(".videoModalEarly").className = "videoModalEarly";
	      }
		
		/* 조퇴video모달창 */
		$("#checkEarly").click(function(){
			document.querySelector(".videoModalEarly").className = "videoModalEarly showEarly";
	        
	        
		
		/* 조퇴video 키기 */
		var content = $("#content").val();
		let scanner = new Instascan.Scanner({ video: document.getElementById('previewEarly')});
	    Instascan.Camera.getCameras().then(function(cameras){
	        if(cameras.length > 0 ){
	            scanner.start(cameras[0]);
	        } else{
	            alert('No cameras found');
	        }

	    }).catch(function(e) {
	        console.error(e);
	    });

	    /* 조퇴scan하고 출석 조지기*/
	     scanner.addListener('scan',function(c){
	    	var content = $("#content").val();
	    	var container = document.getElementById("containerEarly");
	        document.getElementById('text').value=c;
	        if(content==c){
	        	
	        	document.querySelector(".videoModalEarly").className = "videoModalEarly";
	        	Early();
	        }else{
	        	swal("Fail","올바른 qr을 입력해주세요.","warning");
	        	
	        	document.querySelector(".videoModalEarly").className = "videoModalEarly";
	        }
	    }); 
		});
	    /* 조퇴 update */
		function Early(){
			var frm = document.getElementById("frm");
			frm.action = "editAttendEarly";
			frm.method = "POST";
			frm.submit(); 
		};
		

		
		
		
		

</script>
</body>
</html>