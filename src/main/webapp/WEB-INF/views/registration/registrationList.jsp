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
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css">
<link rel="stylesheet" href="resources/css/registrationList.css">
<link rel="stylesheet" href="resources/fullcalendar/lib/main.css">
<link rel="stylesheet" href="resources/css/common/header.css">
<link rel="stylesheet" href="resources/css/common/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="resources/fullcalendar/lib/main.js"></script>
<script src="https://kit.fontawesome.com/afd6aa68df.js"	crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="ln_page">
			<p class="ln_title">수강목록</p>
			<div class="LC_content" id="LC_cont2">
			<button class="button" onclick="location.href='registration';" id="askBtn"><span>수강신청</span></button>
				<c:if test="${empty list2}">
					<p class="warn">등록된 강의가 없습니다.</p>
				</c:if>
				<c:if test="${not empty list2}">
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
							<c:forEach var="vo" items="${list2}">
							<tr>
								<td>${vo.rnum }</td>
								<td>${vo.lectureclass_class }</td>
								<td>${vo.lecture_title }</td>
								<td>${vo.starttime} ~ ${vo.endtime}</td>
								<td>${vo.name }</td>
								<td>${vo.lecture_limit}</td>
								<td>${vo.lectureclass_personnel}</td>
								<td><a href="javascript:void(0);" onclick="lectureRemove('${vo.lectureclass_no}');">수강취소</a></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
				</c:if>
				<br><br>
				<div id="calendar2"></div>
				<div class="warning">
					<p style="font-size: 22px;">안내문</p>
					<ul>
						<li style="list-style: disc;">수강취소 시 별도의 안내가 없이 취소되므로 유의하여 눌러주시기 바랍니다.</li>
						<li style="list-style: disc;">수강취소 시 취소를 번복할 수 없으므로 주의 하시기 바랍니다.</li>
						<li style="list-style: disc;">수강신청 및 취소 후 반드시 수강목록을 확인하시어 불이익이 발생하지 않도록 주의하시기 바랍니다.</li>
						<li style="list-style: disc;">본인의 과실로 수강신청 오류가 생길 경우 책임은 본인에게 있습니다.</li>
					</ul>
				</div>
			</div>
</div>
<script>
	/* 수강취소 기능 */
	function lectureRemove(num){
		$.ajax({
			url:"registrationRemove",
			type:"post",
			data: { lectureclass_no : num },
			success:function(data){
				location.reload();
			},
			error:function(){
				
			}
		});
	}
	
   	  /* 캘린더 출력 */
      var calendarEl2 = document.getElementById('calendar2');
    
      var calendar2 = new FullCalendar.Calendar(calendarEl2, {
	        businessHours: true,
	       /*  dayMaxEvents: true, // allow "more" link when too many events */
	    	locale: 'ko',
	    	height: 'auto',
	    	headerToolbar: {
	    		 	left: 'dayGridMonth',
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
	    					var starttime = element.starttime;
	    					var endtime = element.endtime;
	    					var myClass = element.lectureclass_class;
	    					if(myClass==1){
		    					events.push({
		    						title: element.lecture_title+' ('+starttime+' ~ '+endtime+')',
		    						color: "#6A60A9",
		    						start: startdate,
		    						end: enddate
		    					});
	    					}else{
	    						events.push({
		    						title: element.lecture_title+' ('+starttime+' ~ '+endtime+')',
		    						color: "#08182B",
		    						start: startdate,
		    						end: enddate
		    					});
	    					}
	    				});
	    			}
	    			successCallback(events);
	    		},
	    		});  
	    	} 
      });
      calendar2.render();
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>