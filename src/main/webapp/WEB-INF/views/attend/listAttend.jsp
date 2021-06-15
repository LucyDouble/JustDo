<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
<script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
<style>
.container{

    display: none;
    top: 150px;
    width: 500px;
    height: 500px;
    z-index: 1;
     position: fixed;
}
</style>
</head>
<body>
	<h1>출석하기</h1>
	<hr>
	<div>
		<form action="">
	    	강의 선택:
	    	<select name="lecture_no" id="lecture_no">
	    		<option value="back" >강의를 선택하세요</option>
	    		<c:forEach items="${lecturechk }" var="i">
	    		<option value="${i.lecture_no }">${i.lecture_title }</option>
	    		</c:forEach>
	    	</select>
	    	<input type="submit" value="출결하기">
    	</form>
    </div>
	<hr>
	
	
	
	<div>
		<input id="content" type="text" name="content" /> 
		<input type="button" id="execute" value="QR코드 생성" />
		<input type="button" id="check" value="QR코드 확인"  />
		
		<img id="img" style="display:none; width: 250px; height: 250px;" onload="this.style.display = 'block'"/>
	</div>


<HR>

		<div class="container" id="container">
			<p id="closeScan">&#10006;</p>
        	<div class="col-md-6">
            	<video id="preview" width="100%"></video>
            </div>
        </div>
        <div class="scan_con">
               <label>SCAN QR CODE</label>
               <input type="text" name="text" id="text" readonyy="" placeholder="scan qrcode" class="form-control">
        </div>

<hr>


	<script type="text/javascript">
	
	
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