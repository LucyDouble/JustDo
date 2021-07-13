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
				<div class="video_cont2">
					<p id="lecTitle"></p>
				</div>
				<div class="video_cont1">
					<p class="viTitle">수강과목</p>
					<div class="selectbox3">
						<label for="listTitle">강의목록</label>  
						<select name="title" onchange="goTitle()" id="listTitle">
							<option>강의목록</option>
							<c:forEach var="vo" items="${list}">
							<option value="${vo.lecture_no}">${vo.lecture_title}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<c:if test="${100000 > user}">
				<div class="graph_title">
					<ul id="g1" class="graph">
					</ul>
				</div>
				</c:if>
				
			    
				<c:if test="${100000 < user}">
				<button class="button" onclick="goAdd()"><span>등록</span></button>
				<button class="button" id="editVideo"><span>수정</span></button>
				<button class="button" id="removeVideo"><span>삭제</span></button>
				</c:if>
			<form id="frm">
			<div class="studio">
				<p>강의를 선택해주세요.</p>
			</div>
			</form>
			</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		function viewVideo(num, num1){
			location.href="viewVideo?video_no="+num+"&lecture_no="+num1;
		}
		// 셀릭트 선택 시 과목 출력
		function goTitle(){
			$(document).ready(function() { 
				var selectTarget = $('.selectbox3 select'); 
				selectTarget.change(function(){ 
					var select_name = $(this).children('option:selected').text(); 
					$(this).siblings('label').text(select_name);
					}); 
				});
			$(function() {
				  var selectTarget = $('.selectbox3 select');

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
					lecture_no : optVal
				},
				dataType:"json",
				success:function(data){
					var listVideo = data.list;
					var number = data.lecture_no;
					console.log(number);
					console.log(listVideo);
					if(listVideo.length == 0){
						ulClass.append("<p>등록한 동영상이 없습니다.</p>");
					}
					$.each(listVideo, function(i, item){
						var format = toMMSS(item.video_alltime);
						list += "<ul class='cover'><c:if test='${100000< user}'><label class='checkbox'><input type='radio' class='cheakVNo checkbox' name='cheakVNo' value='"
								+item.video_no+"'><span class='icon'></span></label></c:if><li class='imgcover'><a href='javascript:void(0);' onclick='viewVideo("
								+item.video_no+","+number+");'><img class='videoImg' src='"+item.video_image
								+"'><div class='thumcover'></div><img class='playBtn' src='resources/images/play_btn.png'>"
								+"<span class='durationTime'>"+format+"</span></a></li>"
								+"<p class='videoDate''>"+item.video_date+"</p><p class='videoTitle'>"+item.video_title+"</p>"
								+"</ul>"
					});
					ulClass.append(list);
				},
				error:function(){
					
				}
			});
			$.ajax({
				url:"avgProgress",
				type:"POST",
				data:{
					lecture_no : optVal
				},
				dataType:"json",
				success:function(data){
					var avgUl = $("#g1");
					avgUl.empty();
					var avgData = data.avg;
					var myAvg = data.myavg;
					var class1Avg = data.class1Avg;
					var class2Avg = data.class2Avg;
					var goLi = "";
					var goLi2 = "";
					var goLi3 = "";
					var goLi4 = "";
					if(isNaN(avgData)){
						goLi = "<p class='proError'>학습중인 동영상이 없어 데이터가 없습니다.</p>"
					}else{
						goLi = "<li class='graph_li'><span id='graphTitle'>강의 전체 진도율</span>&nbsp;&nbsp;<span style='width: "+avgData+"%'>"
						+"<em>"+avgData+"%</em></span></li>";
						goLi2 = "<li class='graph_li'><span id='graphTitle'>나의 전체 진도율</span>&nbsp;&nbsp;<span style='width: "+myAvg+"%'>"
						+"<em>"+myAvg+"%</em></span></li>";
						goLi3 = "<li class='graph_li'><span id='avgli'>1반 평균 진도율 </span>&nbsp;&nbsp;<span style='width: "+class1Avg+"%'>"
						+"<em>"+class1Avg+"%</em></span></li>";
						goLi4 = "<li class='graph_li'><span id='avgli'>2반 평균 진도율 </span>&nbsp;&nbsp;<span style='width: "+class2Avg+"%'>"
						+"<em>"+class2Avg+"%</em></span></li>";
					}
					avgUl.append(goLi);
					avgUl.append(goLi2);
					avgUl.append(goLi3);
					avgUl.append(goLi4);
				},
				error:function(){
					
				}
			});
		}
		// 등록 폼으로 이동
		function goAdd(){
			var opt = document.getElementById("listTitle");
			var optVal = opt.options[opt.selectedIndex].value; // lectureclass 번호 값
			location.href="addVideo?lecture_no="+optVal;
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
		function toMMSS(num) {
		    var myNum = parseInt(num, 10);
		    var hours   = Math.floor(myNum / 3600);
		    var minutes = Math.floor((myNum - (hours * 3600)) / 60);
		    var seconds = myNum - (hours * 3600) - (minutes * 60);

		    if (hours   < 10) {hours   = "0"+hours;}
		    if (minutes < 10) {minutes = "0"+minutes;}
		    if (seconds < 10) {seconds = "0"+seconds;}
		    return minutes+':'+seconds;
		}
	</script>
	<jsp:include page="../video/removeVideo.jsp"></jsp:include>
</body>
</html>