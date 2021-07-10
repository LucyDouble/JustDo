<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<br>
    <!-- 댓글  -->
    	<section class = "comments">
    	<!-- 댓글 카운트  -->
    	<div id="countComment" class="comment-header" style="font-weight : bold; margin-bottom : 10px;"></div>
    	<div id="commentAll"></div>
    	</section>
    	<!-- 댓글 출력 -->
    	<div id="listComment">
    		<label for="writeComment">댓글 입력</label>
    		<textarea class="cmtTextBox" id="writeComment" rows="1"></textarea>
    	<div class="btnWriteText">
    		<button id="commentSubmit" class="submitBtn">입력</button>
    	</div>
    	</div>
</body>
<script>
$(function(){
	getCommentList();
});

var notice_no = '${notice.notice_no}';
var notice_comment = ' ';

function getCommentList() {
	$.ajax({
		type : 'get',
		url : '${pageContext.request.contextPath}/commentList/'+ notice_no,
		dataType : 'json',
		success : function(data) {
			$('#countComment').html(data.length + ' comments');
			$('#commentAll').html('');
			$(data).each(function(index, item) {
				notice_comment += '<div class="media d-block d-md-flex mt-4">';
				notice_comment += '<div class="media-body text-center text-md-left ml-md-3 ml-0">';
				notice_comment += '<h5 class="font-weight-bold mt-0">';
					//수정삭제버튼
					if (  ("${sessionScope.manager_name}" != "") || ("${sessionScope.DTO.getStudent_number()}" == item.student_number) && "{sessionScope.DTO.getTeacher_number()}" == item.teacher_number)  {
													
						notice_comment += '<button id="commentDeleteBtn' + item.notice_no + '" onclick="commentDeleteBtn('+ item.notice_no + ')" type="button" class="commentDeleteBtn"><i class="fa fa-trash" aria-hidden="true"></i></button>';
						notice_comment += '<button id="commentEditBtn'	+ item.notice_no + '" onclick="commentEditBtn(' + item.notice_no + ')" type="button" class="commentEditBtn"><i class="fa fa-paint-brush" aria-hidden="true"></i></button>';
					}
					
					notice_comment += '<a class="text-default">'	+ item.reply_writer_id;
					if("${storeSelectSession.manager_id}" == item.reply_writer_id){
						notice_comment +='     [관리자]';
					}						
					
					notice_comment += '</a></h5><input id="UserBoardReplyInput' + item.uboard_reply_id +'" class="form-control w-75" value="'+ item.uboard_reply_con +'" style="border: 0px; background: white;" readonly="true"></input><hr /></div></div>';
			$('#UserBoardReplyAllBody').html(uboard_reply);
									});
			notice_comment = '';
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
</html>