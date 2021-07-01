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
			<ul class="LC_title">
				<li class="LC_title_cont" id="ln_title2"><p class="ln_title">수강신청</p></li>
				<li class="LC_title_cont"><p class="ln_title">수강목록</p></li>
			</ul>
			<div class="LC_content" id="LC_cont">
			<!-- 서치바 -->
			<div class="lc_search_box">
				<form class="lc_search" action="#" method="get">
					<input class="lc_search_input" type="text" name="keyword" placeholder="검색"
					onmouseout="document.search.keyword.value = ''">
				</form>
				  <i class="fas fa-search"></i>
			</div>
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
								<td>${vo.rnum }</td>
								<td>${vo.lectureclass_class }</td>
								<td>${vo.lecture_title }</td>
								<td>${vo.lectureclass_start } ~ ${vo.lectureclass_end }</td>
								<td>${vo.name }</td>
								<td>${vo.lecture_limit}</td>
								<td>${vo.lecture_personnel}</td>
								<td id="${vo.lectureclass_no}"><a href="javascript:void(0);" onclick="request('${vo.lectureclass_no}','${vo.lecture_no }');">신청</a></td>
								<td><a href="javascript:void(0);" onclick="pop('${vo.lecture_no}', '${ vo.lectureclass_class}');">보기</a></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
			
			<c:if test="${keyword !='' }">
			<button class="button" onclick="location.href='registration'">
					<span>목록</span>
			</button>
			</c:if>
			
			<div class="regis_page">
			<c:if test="${startPage != 1 }">
	   			<a href="<%=request.getContextPath() %>/registration?page=${startPage-1}&keyword=${keyword}">이전</a>
			</c:if>
			<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	 			<c:if test="${p eq currentPage}">
	 				<font color="#6A60A9" size="4"><b>[${p}]</b></font>
	 			</c:if>
	 			<c:if test="${p ne currentPage}">
	 				<c:url var="listWorkChk" value="registration?keyword=${keyword}">
	 				<c:param name="page" value="${p}" />
	 				</c:url>
	 				<a href="${listWorkChk}">${p}</a>
	 			</c:if>
	 		</c:forEach>
			<c:if test="${endPage < pageCnt }">
	   			<a href="<%=request.getContextPath() %>/registration?page=${endPage+1}&keyword=${keyword}">다음</a>
			</c:if>
			</div>
			<div id="calendar"></div>
			<p>안내문</p>
			<ul>
				<li>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
				<li>주의사항주의사항주의사항주의사항주의사항</li>
			</ul>
			</div>
			
			
			
			<div class="LC_content">
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
								<td>${vo.lecture_personnel}</td>
								<td><button>신청</button></td>
							</tr>
							</c:forEach>
						</tbody>					
				</table>
			<br><br>
			<div id="calendar2"></div>
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
		$.ajax({
    	url : "registrationAdd",
    	method: "POST",
    	data : {
					lectureclass_no : number,
					lecture_no : number1
    	},
    	success: function(data){
    		
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
				$('li').removeAttr('id');
				$(element).addClass("selected");
			}else{
				$(element).removeClass("selected");
			}			
		});
	});
	
    /* document.addEventListener('DOMContentLoaded', function() { */
     /*  document.onload = function(){ */
      var calendarEl = document.getElementById('calendar');
      var calendarEl2 = document.getElementById('calendar2');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
	        businessHours: true,
	        dayMaxEvents: true, // allow "more" link when too many events
	    	locale: 'ko',
	    	height: 550,
	    	headerToolbar: {
	    	        left: 'dayGridMonth',
	    	        center: 'title',
	    	        right: 'prev,next today'
	    	      },
	    	      
	    	 events: function(info, successCallback, failureCallback){
	    		$.ajax({
	    		url: 'calendarAdd2',
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
	    					var starttime = element.lectureclass_start;
	    					var endtime = element.lectureclass_end;
	    					events.push({
	    						title: element.lecture_title,
	    						start: startdate+"T"+starttime,
	    						end: enddate+"T"+endtime
	    					});
	    				});
	    			}
	    			successCallback(events);
	    		},
	    		});  
	    	} 
      });
      var calendar2 = new FullCalendar.Calendar(calendarEl2, {
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
      calendar2.render();
    /* }); */
   /*  } */
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>