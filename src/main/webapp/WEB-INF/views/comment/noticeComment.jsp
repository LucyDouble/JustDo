<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <head> 
 <meta charset="UTF-8"> 
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <style>
.name_float{
float : left;
}
</style>
</head> 
 <body> 
<br>
    <!-- 댓글  -->
    	<section class = "comments my-5">
    	<!-- 댓글 카운트  -->
    	<div id="countComment" class="card-header font-weight-bold" style="font-weight : bold; margin-bottom : 10px;"></div>
    	<div id="commentAll"></div>
    	</section>
    	<!-- 댓글 출력 -->
    	<div id="md-form mt-4">
    		<label for="writeComment">댓글 입력</label>
    		<textarea class="form-control md-textarea" id="writeComment" rows="1"></textarea>
    	<div class="text-center my-4">
    		<button id="commentSubmit" class="btn btn-default btn-sm btn-rounded">입력</button>
    	</div>
    	</div>
</body>
<script>
 $(function(){
	getCommentList();
});
 
var notice_no = '${notice.notice_no}';
var comment_con = ' ';

function getCommentList() {
	$.ajax({
		type : 'get',
		url : '${pageContext.request.contextPath}/listNotice/commentList/'+ notice_no,
		dataType : 'json',
		success : function(data) {
			$('#countComment').html(data.length + ' comments');
			$('#commentAll').html('');
			$(data).each(function(index, item) {
				
				comment_con += '<div class="media d-block d-md-flex mt-4">';
				comment_con += '<div class="media-body text-center text-md-left ml-md-3 ml-0">';
				comment_con += '<h5 class="font-weight-bold mt-0">';
				
			
				
				
				console.log("${sessionScope.student_number}");
				console.log("${sessionScope.teacher_number}");
				
				console.log( item.student_number + "aaa");
				console.log( item.teacher_number + "bbb");
				
				
				
				
					//수정삭제버튼
					if("${sessionScope.student_number}" != ""){
						if ("${sessionScope.student_number}" == item.student_number)  {
							comment_con += '<button type="button" >ㅇㅇㅇ</button>';
							
						}
					}
					
					if("${sessionScope.teacher_number}" != ""){
						if("${sessionScope.teacher_number}" == item.teacher_number){
							comment_con += '<button type="button" >ㄴㄴㄴ</button>';
							/* comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="commentDeleteBtn('+ item.comment_number + ')" type="button" class="btn btn-danger px-3 float-right"><i class="fa fa-trash" aria-hidden="true"></i></button>';
							comment_con += '<button id="commentEditBtn'	+ item.comment_number + '" onclick="commentEditBtn(' + item.comment_number + ')" type="button" class="btn btn-primary px-3 float-right"><i class="fa fa-paint-brush" aria-hidden="true"></i></button>'; */

						}
					}
					if("${sessionScope.manager_number}" != ""){
						if("${sessionScope.manager_number}" == item.manager_number){
							comment_con += '<button type="button">ㄷㄷㄷ</button>';
							

						}
					}
					if(item.student_name != null){
					comment_con += '<div class="text-default name_float">'	+ item.student_name+ '</div>';
					}else if(item.teacher_name != null){
						comment_con += '<div class="text-default name_float">'	+item.teacher_name + '[교직원]' + '</div>';
					}else if(item.manager_name != null){
						comment_con += '<div class="text-default name_float">'	+item.manager_name + '[운영자]' +'</div>';
					}
					
					comment_con += '</a></h5><input id="commentInput' + item.comment_num +'" class="form-control " value="'+ item.comment_con +'" style="width : 1000px; border: 0px; background: white;" readonly="true"></input><hr /></div></div>';
			$('#commentAll').html(comment_con);
									});
			comment_con = '';
		}
	});
}
/* var comment_con = $('#writeComment').val();
var student_id = "";
if("${sessionScope.student_id != null}"){
    comment_student_id = "${sessionScope.DTO.getName()}"; 
} else if("${sessionScope.teacher_id != null}"){
    comment_teacher_id = "${sessionScope.DTO.getName()}"; 
} else{
    comment_admin_id="${sessionScope.DTO.getName()}";
    if(comment_con){
    	$.ajax({
    		type : 'POST',
    		url : 
    	})
    	}
    } */
</script>
