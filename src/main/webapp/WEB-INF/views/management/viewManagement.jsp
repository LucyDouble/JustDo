<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/listWorkResult.css"/>">
<script src="https://kit.fontawesome.com/afd6aa68df.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/header.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<style type="text/css">
.graph_li { margin: 0; padding: 0; text-align: left;}
.graph_1  { width: 380px; list-style: none;margin: 0; padding: 0; float : left; clear: both; }
.graph_1 li   { position: relative; padding: 1px 0; white-space:nowrap; }
.graph_1 li span  { display: inline-block; position: relative; height: 30px; line-height: 30px; background: #DEDCEE;}
.graph_1 li em    { position: absolute; top: 0px; right: -65px; font-family: arial; color: #000; font-size: 20px;}
.graph_title_1{

	margin-top:30px;
	margin-bottom:10px;
	text-align: center;
	display: inline-block;
	float:left;
	font-size: 20px;
}
.graph_title_2{

	margin-top:30px;
	margin-bottom:10px;
	text-align: center;
	display: inline-block;
	font-size: 20px;
}
.graph_2  { width: 380px; list-style: none;margin: 0; padding: 0;left:120px; position: relative;}
.graph_2 li   { position: relative; padding: 1px 0; white-space:nowrap; }
.graph_2 li span  { display: inline-block; position: relative; height: 30px; line-height: 30px; background: #DEDCEE;}
.graph_2 li em    { position: absolute; top: 0px; right: -65px; font-family: arial; color: #000; font-size: 20px;}
.managementTd{width: 450px;}
</style>
</head>
<body>
	
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="ln_title">학생 관리</p>

		<table class="table">
				<thead>
					<tr>
						<th>학생 명</th>
						<th>강의 명</th>
						<th>class</th>
						<th style="width: 420px;">강의 기간</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${managementDTO.name}</td>
							<td>${managementDTO.lecture_title}</td>
							<td>${managementDTO.lectureclass_class }  </td>
							<td>${infoLecture.lecture_start}~${infoLecture.lecture_end}[${infoLecture.lectureclass_start }~${infoLecture.lectureclass_end }]</td>
						</tr>
				</tbody>
			</table>
			
	<table class="table">
		<tr>
			<th>ID</th>
			<td>${st.id }</td>
			<th>주소</th>
			<td class="managementTd">${st.address }</td>
		</tr>
		<tr>
			<th>PHONE</th>
			<td>${st.phone }</td>
			<th>E-MAIL</th>
			<td>${st.email }</td>
		</tr>
	</table>
	<div class="graph_title_1">&nbsp;&nbsp;평균 성적</div>
	<div class="graph_title_2">&nbsp;&nbsp;&nbsp;&nbsp;과제 제출률</div>
	<ul id="g1" class="graph_1">
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${managementDTO.avg_grade}%" >학생<em>0점</em></span></li>
        	<c:if test="${empty allGrade  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">1 반<em>0점</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">2 반<em>0점</em></span></li>
        	</c:if>
        	<c:if test="${not empty allGrade  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${allGrade.get(0)}%">1 반<em>0점</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${allGrade.get(1)}%">2 반<em>0점</em></span></li>
        	</c:if>
    </ul>		
	<ul id="g2" class="graph_2">
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${managementDTO.work_progress}%" >학생<em>0%</em></span></li>
        <c:if test="${empty workAllProgress  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">1 반<em>0%</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">2 반<em>0%</em></span></li>
        </c:if>
        <c:if test="${not empty workAllProgress  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${workAllProgress.get(0)}%">1 반<em>0%</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${workAllProgress.get(1)}%">2 반<em>0%</em></span></li>
        </c:if>
    </ul>		
	<br>
	<div class="graph_title_1">&nbsp;&nbsp;출석률</div>
	<div class="graph_title_2">   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학습 진행도</div>	
	<ul id="g3" class="graph_1">
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${managementDTO.att}%" >학생<em>0%</em></span></li>
        <c:if test="${empty allAttend  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">1 반<em>0%</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">2 반<em>0%</em></span></li>
        </c:if>
        <c:if test="${not empty allAttend  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${allAttend.get(0)}%">1 반<em>0%</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${allAttend.get(1)}%">2 반<em>0%</em></span></li>
        </c:if>
    </ul>	
    <ul id="g4" class="graph_2">
        <li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${myavg}%" >학생<em>0%</em></span></li>
        <c:if test="${empty class1Avg  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">1 반<em>0%</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: 0%">2 반<em>0%</em></span></li>
        </c:if>
        <c:if test="${not empty class1Avg  }">
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${class1Avg}%">1 반<em>0%</em></span></li>
        	<li class="graph_li">&nbsp;&nbsp;&nbsp;<span style="width: ${class2Avg}%">2 반<em>0%</em></span></li>
        </c:if>
    </ul>		
<br> <br> <br>


	
	
	</div>
<br> <br> <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
</body>
	<script type="text/javascript">
	
	
	
	
	
	
	drawGraph(document.getElementById("g1"));
	

	function drawGraph(obj) {
	    this.gages = obj.getElementsByTagName("span");
	    this.values = obj.getElementsByTagName("em");

	    for(var i = 0; i < this.gages.length; i ++) {
	        (function(idx) {
	            var current_value = 0;
	            var gage_object = this.gages[idx];
	            var gage_value = this.values[idx];
	            var gage_width = parseInt(gage_object.style.width);
	            var timer = null;

	            timer = setInterval(function() {
	                if(current_value <= gage_width) {
	                    current_value += Math.ceil((gage_width - current_value) / 15);
	                    if(current_value==0){
	                    	gage_object.style.width = 8 + "%";
	                    }else{
	                    gage_object.style.width = current_value+8 + "%";
	                    }
	                    gage_value.innerHTML = current_value + "점";
	                } else {
	                    clearInterval(timer);
	                }
	            }, 10);
	        })(i);
	    }
	}
	
	
	drawGraph2(document.getElementById("g2"));
	drawGraph2(document.getElementById("g3"));
	drawGraph2(document.getElementById("g4"));
	function drawGraph2(obj) {
	    this.gages = obj.getElementsByTagName("span");
	    this.values = obj.getElementsByTagName("em");

	    for(var i = 0; i < this.gages.length; i ++) {
	        (function(idx) {
	            var current_value = 0;
	            var gage_object = this.gages[idx];
	            var gage_value = this.values[idx];
	            var gage_width = parseInt(gage_object.style.width);
	            var timer = null;

	            timer = setInterval(function() {
	                if(current_value <= gage_width) {
	                    current_value += Math.ceil((gage_width - current_value) / 15);
	                    if(current_value==0){
	                    	gage_object.style.width = 8 + "%";
	                    }else{
	                    gage_object.style.width = current_value+8 + "%";
	                    }
	                    gage_value.innerHTML = current_value + "%";
	                } else {
	                    clearInterval(timer);
	                }
	            }, 10);
	        })(i);
	    }
	}
	</script>



</html>