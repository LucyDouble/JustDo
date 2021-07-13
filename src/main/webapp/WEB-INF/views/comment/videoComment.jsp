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
.btn{
float : right;
}
</style>
</head> 
 <body> 
<br>
    <!-- 댓글  -->
    	<section class = "comments my-5">
    	<!-- 댓글 카운트  -->
    	<div id="countComment" class="card-header font-weight-bold 0" style="font-weight : bold; margin-bottom : 10px;"></div>
    	<div id="commentAll"></div>
    	</section>
    	<!-- 댓글 출력 -->
    	<div id="md-form mt-4">
    		<label for="writeComment" style ="float: left">댓글 입력</label>
    		<textarea class="form-control md-textarea" id="writeComment" rows="1" style = "min-height : 100px; font-size : 12px;"></textarea>
    	<div class="text-center my-4">
    		<button id="commentSubmit" style="float:right; " class="btn btn-default btn-sm btn-rounded">입력</button>
    	</div>
    	</div>
</body>

<script>
 $(function(){
	getCommentList();
});
 
var video_no = '${view.video_no}';
var comment_con = ' ';
function getCommentList() {
	$.ajax({
		type : 'get',
		url : '${pageContext.request.contextPath}/listVideo/commentList/'+ video_no,
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
				console.log("${sessionScope.student_number}" == item.student_number);
				
				
				
				
					//수정삭제버튼
					if("${sessionScope.student_number}" != ""){
						if ("${sessionScope.student_number}" == item.student_number)  {
							comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="btn btn-default btn-sm btn-rounded" >삭제</button>';
							comment_con += '<button id="commentUpdateBtn' + item.comment_number + '" onclick="modifyComment(' + item.comment_number +')" type ="button" class="btn btn-default btn-sm btn-rounded" >수정</button>';							
						}
					}
					
					if("${sessionScope.teacher_number}" != ""){
						if("${sessionScope.teacher_number}" == item.teacher_number){
							comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="btn btn-default btn-sm btn-rounded" >삭제</button>';
							comment_con += '<button id="commentUpdateBtn' + item.comment_number + '" onclick="modifyComment(' + item.comment_number +')" type ="button" class="btn btn-default btn-sm btn-rounded" >수정</button>';

						}
					}
					if("${sessionScope.manager_number}" != ""){
						comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="btn btn-default btn-sm btn-rounded" >삭제</button>';
						comment_con += '<button id="commentUpdateBtn' + item.comment_number + '" onclick="modifyComment(' + item.comment_number +')" type ="button" class="btn btn-default btn-sm btn-rounded" >수정</button>';

					}
					if(item.student_name != null){
					comment_con += '<div class="text-default name_float">'	+ item.student_name+ '</div>';
					}else if(item.teacher_name != null){
						comment_con += '<div class="text-default name_float">'	+item.teacher_name + '[교직원]' + '</div>';
					}else if(item.manager_name != null){
						comment_con += '<div class="text-default name_float">'	+item.manager_name + '[운영자]' +'</div>';
					}
					
					comment_con += '</a></h5><input id="commentInput' + item.comment_number +'" class="form-control " value="'+ item.comment_con +'" style="width : 1000px; min-height : 30px; border: 0px;  background: white;" font-size : 12px; readonly="true"></input><hr /></div></div>';
			$('#commentAll').html(comment_con);
									});
			comment_con = '';
		}
	});
}

$('#commentSubmit').click(function(){
	
	var comment_con = $('#writeComment').val();
	var writer_number = "";
	if("${sessionScope.student_number}" != ""){
		writer_number = "${sessionScope.student_number}";
	}else if("${sessionScope.teacher_number}" != ""){
		writer_number = "${sessionScope.teacher_number}";
	}else if("${sessionScope.manager_number}" != ""){
		writer_number = "${sessionScope.manager_number}";
	}else{
		alert("로그인 후 이용해주세요");
	}
	console.log(writer_number + 'aaa');
	console.log(comment_con + 'bbb');
	console.log(video_no + 'ccc');
	
	if(comment_con){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/listVideo/writeComment',
			dataType : 'text',
			data : {
				video_no : video_no,
				writer_number : writer_number,
				comment_con : comment_con
			},
			success : function(data){
				
				console.log('댓글 작성 성공');
				getCommentList();
				$('#writeComment').val('');
			}
			
		});
	}else{
		alert("댓글을 입력해주세요.");
		console.log(writer_number);
		console.log(comment_con);
		console.log(video_no);
		console.log(writer_date);
	}
});

function deleteComment(comment_number){
	if(confirm("삭제하시겠습니까?") == true){
		$.ajax({
			type :'DELETE',
			url : '${pageContext.request.contextPath}/listVideo/deleteComment/' + comment_number,
			success : function(data){
				console.log('삭제 성공');
				getCommentList();
			}
		});
	}
};
function updateComment(comment_number){
	if(confirm("수정하시겠습니까?") == true){
		var comment_con = $('#commentInput' + comment_number).val();
		$.ajax({
			type:'GET',
			url : '${pageContext.request.contextPath}/listVideo/updateComment',
			data : {
				comment_con : comment_con,
				comment_number : comment_number
			},
				
			success : function(data){
				console.log('수정 성공');
				console.log(comment_con);
				getCommentList();
				$('#commentInput').val('');
			}
		})
	}
}
function modifyComment(comment_number){
	$('#commentInput' + comment_number).attr("readonly", false);
	$('#commentInput' + comment_number).focus();
	$('#commentUpdateBtn' + comment_number).attr("onclick", "updateComment(" + comment_number + ")");

}

</script>
