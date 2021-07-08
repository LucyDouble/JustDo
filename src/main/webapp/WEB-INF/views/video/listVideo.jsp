<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css">
<link rel="stylesheet" href="resources/css/common/header.css">
<link rel="stylesheet" href="resources/css/videoList.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
			<div class="selectLc">
				<p class="ln_title">학습동영상</p>
				<p>수강과목</p>
				<select name="title" onchange="goTitle()" id="listTitle">
					<option>강의목록</option>
					<c:forEach var="vo" items="${list}">
					<option value="${vo.lectureclass_no}">${vo.lecture_title} Class:${vo.lectureclass_class}</option>
					</c:forEach>
				</select>
				<p id="lecTitle"></p>
				전체 평균 진도율 : <progress></progress>
				강의 평균 진도율 : <progress></progress>
				<c:if test="${100000 < user}">
				<button class="button" onclick="goAdd()"><span>등록</span></button>
				<button class="button" id="editVideo"><span>수정</span></button>
				<button class="button" id="removeVideo"><span>삭제</span></button>
				</c:if>
			</div>
			<form id="frm">
			<div class="studio">
				<p>강의를 선택해주세요.</p>
			</div>
			</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		function viewVideo(num){
			location.href="viewVideo?video_no="+num;
		}
		// 셀릭트 선택 시 과목 출력
		function goTitle(){
			var opt = document.getElementById("listTitle");
			var optText = opt.options[opt.selectedIndex].text;
			var optVal = opt.options[opt.selectedIndex].value; // lectureclass 번호 값
			$("#lecTitle").text(optText);
			var list = "";
			var ulClass = $(".studio");
			ulClass.empty();
			$.ajax({
				url:"listThumbnail",
				type:"POST",
				data:{
					lectureclass_no : optVal
				},
				dataType:"json",
				success:function(data){
					var listVideo = data.list;
					$.each(listVideo, function(i, item){
						list += "<ul class='cover'><c:if test='${100000< user}'><label class='checkbox'><input type='radio' class='cheakVNo checkbox' name='cheakVNo' value='"+item.video_no+"'><span class='icon'></span></label></c:if><li class='imgcover'><a href='javascript:void(0);' onclick='viewVideo("+item.video_no+");'><img class='videoImg' src='"+item.video_image
								+"'><div class='thumcover'></div><img class='playBtn' src='resources/images/play_btn.png'></a></li>"
								+"<p class='videoDate''>"+item.video_date+"</p><p class='videoTitle'>"+item.video_title+"</p>"
								+"</ul>"
					});
					ulClass.append(list);
				},
				error:function(){
					
				}
			});
		}
		// 등록 폼으로 이동
		function goAdd(){
			var opt = document.getElementById("listTitle");
			var optVal = opt.options[opt.selectedIndex].value; // lectureclass 번호 값
			location.href="addVideo?lectureclass_no="+optVal;
		}
		// 수정 버튼 클릭 시 
		$("#editVideo").click(function(){
			var frm = document.getElementById("frm");
			var check = $("input:radio[name='cheakVNo']").is(":checked");
			if(check==true){
				frm.action="editVideo";
			    frm.method="GET";
			    frm.submit();
			} else{
				alert("수정할려면 박스에 체크해주세요");
			}
		});
	</script>
	<jsp:include page="../video/removeVideo.jsp"></jsp:include>
</body>
</html>