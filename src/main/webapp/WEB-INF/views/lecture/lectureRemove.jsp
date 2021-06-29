<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="background">
		<div class="popup">
			<div class="cd-popup-container">
				<img class="rn_warning" src="resources/images/alert.png">
				<p class="rn_p">게시글을 정말 삭제 하시겠습니까?</p>
				</div>
				<ul id="close" class="cd-buttons">
					<li class="rn_li"><a class="rn_a" href="#" id="remove">삭제</a></li>
					<li class="rn_li"><a class="rn_a" href="#" id="cancle">취소</a></li>
				</ul>
			</div>
		</div>

	<script>
      function show() {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#btnRemove").addEventListener("click", function(){
    	  var check = $("input:radio[name='lectureNo']").is(":checked");
    	  if(check==true){
    		  show();
    	  }else{
    		  alert("삭제할려면 박스에 체크해주세요.");
    	  }
      });
      document.querySelector("#close").addEventListener("click", close);
      
      $("#remove").click(function(e){
    	  e.preventDefault();
    	  	var value = $("input:radio[name='lectureNo']:checked").val();
    		var check = $("input:radio[name='lectureNo']").is(":checked");
    		if(check==true){
    			$.ajax({
        			url: "lectureRemove?lectureNo="+value,
        			type: "get",
        			success:function(data){
        				/* window.location.reload(); */
        				location.href="lecture";
        			},
        			error:function(){
        				
        			}
        				
        		});
    		} else{
    			alert("삭제할려면 박스에 체크해주세요");
    		}  
    		
      });
      $("#cancle").click(function(e){
    	  e.preventDefault();
      });
    </script>
