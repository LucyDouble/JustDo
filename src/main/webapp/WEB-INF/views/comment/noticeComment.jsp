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
    	<div id="countComment" class="card-header font-weight-bold 0" style="font-weight : bold; margin-bottom : 10px;"></div>
    	<div id="commentAll"></div>
    	</section>
    	<!-- 댓글 출력 -->
    	<div id="md-form mt-4">
    		<label for="writeComment" style ="float: left">댓글 입력</label>
    		<textarea class="form-control md-textarea" id="writeComment" rows="1"></textarea>
    	<div class="text-center my-4">
    		<button id="commentSubmit" style="float:right" class="btn btn-default btn-sm btn-rounded">입력</button>
    	</div>
    	</div>
</body>

<script>
 $(function(){
	getCommentList();
});
 
var notice_no = '${notice.notice_no}';
var comment_con = ' ';
var comment_number
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
				console.log("${sessionScope.student_number}" == item.student_number);
				
				
				
				
					//수정삭제버튼
					if("${sessionScope.student_number}" != ""){
						if ("${sessionScope.student_number}" == item.student_number)  {
							comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="comment_btn" >삭제</button>';
							comment_con += '<button id="commentUpdateBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="comment_btn" >수정</button>';							
						}
					}
					
					if("${sessionScope.teacher_number}" != ""){
						if("${sessionScope.teacher_number}" == item.teacher_number){
							comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="comment_btn" >삭제</button>';
							comment_con += '<button id="commentUpdateBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="comment_btn" >수정</button>';
						/* 	comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="commentDeleteBtn('+ item.comment_number + ')" type="button" class="btn btn-danger px-3 float-right"><i class="fa fa-trash" aria-hidden="true"></i></button>';
							comment_con += '<button id="commentEditBtn'	+ item.comment_number + '" onclick="commentEditBtn(' + item.comment_number + ')" type="button" class="btn btn-primary px-3 float-right"><i class="fa fa-paint-brush" aria-hidden="true"></i></button>';  */

						}
					}
					if("${sessionScope.manager_number}" != ""){
						comment_con += '<button id="commentDeleteBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="comment_btn" >삭제</button>';
						comment_con += '<button id="commentUpdateBtn' + item.comment_number + '" onclick="deleteComment(' + item.comment_number +')" type ="button" class="comment_btn" >수정</button>';

					}
					if(item.student_name != null){
					comment_con += '<div class="text-default name_float">'	+ item.student_name+ '</div>';
					}else if(item.teacher_name != null){
						comment_con += '<div class="text-default name_float">'	+item.teacher_name + '[교직원]' + '</div>';
					}else if(item.manager_name != null){
						comment_con += '<div class="text-default name_float">'	+item.manager_name + '[운영자]' +'</div>';
					}
					
					comment_con += '</a></h5><input id="commentInput' + item.comment_number +'" class="form-control " value="'+ item.comment_con +'" style="width : 1000px; border: 0px; background: white;" readonly="true"></input><hr /></div></div>';
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
	console.log(notice_no + 'ccc');
	
	if(comment_con){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/listNotice/writeComment',
			dataType : 'text',
			data : {
				notice_no : notice_no,
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
		console.log(notice_no);
		console.log(writer_date);
	}
});

function deleteComment(comment_number){
	if(confirm("삭제하시겠습니까?") == true){
		$.ajax({
			type :'DELETE',
			url : '${pageContext.request.contextPath}/listNotice/deleteComment/' + comment_number,
			success : function(data){
				console.log('삭제 성공');
				getCommentList();
			}
		});
	}
};
function updateComment(comment_number){
	if(confirm("수정하시겠습니까?") == true){
		$.ajax({
			type:'put',
			url : '${pageContext.request.contextPath}"/listNotice/updateComment/' + comment_number,
			header : {
				"content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			data : JSON.stringify({
				comment_con : comment_con
			}),
			success : function(data){
				console.log('수정 성공');
				getCommentList();
				$('#writeComment').val('');
			}
		})
	}
}
function updateComment(id){
	$('')
}

</script>
