<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/registrationList.css"/>">
<link rel="stylesheet" href="resources/fullcalendar/lib/main.css">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="resources/fullcalendar/lib/main.js"></script>
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="ln_page">
			<ul class="LC_title">
				<li class="LC_title_cont"><p class="ln_title">수강목록</p></li>
				<li class="LC_title_cont"><p class="ln_title">수강신청</p></li>
			</ul>
			<div class="LC_content" id="LC_cont">
			<form>
				<table class="table">
					<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>수업시간</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>접수현황</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.lecture_no }</td>
								<td>${vo.lectureclass_class }</td>
								<td>${vo.lecture_title }</td>
								<td>${vo.lectureclass_start} ~ ${vo.lectureclass_end}</td>
								<td>${vo.teacher_number }</td>
								<td>${vo.lecture_limit}</td>
								<td>${check}</td>
								<td><button>신청</button></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
			</form>
			<div id="calendar"></div>
			<p>6월강사일정</p>
			<p>안내문</p>
			<ul>
				<li>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
			</ul>
			</div>
			<div class="LC_content">
			<form id="ReFrm">
				<input type="hidden" name="student_number" id="id" value="1">
				</form>
				<table class="table">
					<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>수업시간</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>접수현황</th>
								<th>강의계획서</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.lecture_no }</td>
								<td>${vo.lectureclass_class }</td>
								<td>${vo.lecture_title }</td>
								<td>${vo.lectureclass_start } ~ ${vo.lectureclass_end }</td>
								<td>${vo.teacher_number }</td>
								<td>${vo.lecture_limit }</td>
								<td>${check}</td>
								<td id="${vo.lectureclass_no}"><button  onclick="request('${vo.lectureclass_no}','${vo.lecture_no }');">신청</button></td>
								<td><a href="javascript:void(0);" onclick="pop('${vo.lecture_no}', '${ vo.lectureclass_class}');">보기</a></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
			
			<p>캘린더</p>
			<p>6월강사일정</p>
			<p>안내문</p>
			<ul>
				<li>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
			</ul>
			</div>
</div>
<script>
	function pop(num, num1){
		var w = 800;
		var h = 700;
		var width = (window.screen.width-w) / 2;
		var height = (window.screen.height-h) / 2;
		window.open("lecturePlan?lecture_no="+num+"&lectureclass_class="+num1, "lecturePlan", "width="+w+", height="+h+", left="+width+", top="+height);
	}
	function request(number, number1){
		var studentNo = $("#id").val();
		$.ajax({
    	url : "registrationAdd",
    	method: "POST",
    	data : {
					student_number : studentNo,
					lectureclass_no : number,
					lecture_no : number1
    	},
    	success: function(data){
    		$("#"+number+" button").val("완료");
    	},
    	error : function(){
    		
    	}
    	
    	}); 
	}
	$(".LC_title_cont").click(function(){
		var btn = $(this).index();
		$(".LC_content").each(function(index, element){
			if(btn ==index){
				$(element).css("display","block");
			}else{
				$(element).css("display","none");
			}
		});
		$(".LC_title_cont").each(function(index, element){
			if(btn == index){
				$(element).addClass("selected");
			}else{
				$(element).removeClass("selected");
			}			
		});
	});
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
	        businessHours: true,
	    	locale: 'ko',
	    	height: 550,
	    	headerToolbar: {
	    	        left: '',
	    	        center: 'title',
	    	        right: 'prev,next today'
	    	      },
	    	      
	    	 events: function(info, successCallback, failureCallback){
	    		$.ajax({
	    		url: 'calendarAdd',
	    		type: 'post',
	    		dataType: 'json',	
	    		success:
	    			function(result){
	    			var events = [];
	    			if(result!=null){
	    				$.each(result, function(index, element){
	    					var enddate = element.lecture_end;
	    					if(enddate==null){
	    						enddate = element.lecture_start;
	    					}
	    					var startdate=moment(element.lecture_start).format('YYYY-MM-DD');
	    					var enddate=moment(enddate).format('YYYY-MM-DD');
	    					events.push({
	    						title: element.lecture_title,
	    						start: startdate,
	    						end: enddate
	    					});
	    				});
	    			}
	    			successCallback(events);
	    		},
	    		});  
	    	} 
      });
    
      calendar.render();
    });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>