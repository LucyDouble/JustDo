<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JD 오시는길</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/jd/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/jd/aboutAddress.css"/>">
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="ln_page">
		<p class="an_title">오시는 길</p>
		<p class="an_sub">JD교육원 오시는 길 입니다.</p>
		<input type="button" class="buttonAdr" id="btn1" value="종로 교육원">
		&nbsp;&nbsp; 
		<input type="button" class="buttonAdr" id="btn2" value="강남 교육원">
		&nbsp;&nbsp; 
		<input type="button" class="buttonAdr" id="btn3" value="부평 교육원">
		<br><br><br>
		<table class="table">
			<tbody>
				<tr>
					<td class="menutd" style="background-color: #f2f5f9;">주소</td>
					<td class="contd" style="padding-left: 20px;" id="adr">서울 중구 남대문로 120 1F~101F</td>
				</tr>
				<tr>
					<td class="menutd" id="busbus" style="background-color: #f2f5f9;line-height: 72px;">버스</td>
					<td class="contd" style="padding-left: 20px;" id="bus">
						우리은행 종로지점 정류장<br>
						<img src="./resources/images/aboutJD/busB.jpg"> 163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62<br>
						<img src="./resources/images/aboutJD/busG.jpg"> 7017 / 7021 / 7022 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="./resources/images/aboutJD/busR.jpg"> 8110
					</td>
				</tr>
				<tr>
					<td class="menutd" style="background-color: #f2f5f9;">지하철</td>
					<td class="contd" style="padding-left: 20px;" id="subw">지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M</td>
				</tr>
				<tr>
					<td colspan="2" class="maptd">
						<!-- 1. 지도 노드 -->
						<div id="daumRoughmapContainer1625705183208"
							class="root_daum_roughmap root_daum_roughmap_landing"></div> 
						<div id="daumRoughmapContainer1625708996649" 
							class="root_daum_roughmap root_daum_roughmap_landing"></div>
						<div id="daumRoughmapContainer1625723702552" 
							class="root_daum_roughmap root_daum_roughmap_landing"></div>
					</td>
				</tr>
			</tbody>
		</table>
		<br><br><br>
	</div>
	<input type="hidden" id="btn1val" value="0">
	<input type="hidden" id="btn2val" value="0">
	<input type="hidden" id="btn3val" value="0">
	<!-- 2. 설치 스크립트 * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
	<script charset="UTF-8" class="daum_roughmap_loader_script" 
		src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
 		new daum.roughmap.Lander({
			"timestamp" : "1625705183208",
			"key" : "26iwr",
			"mapWidth" : "1000",
			"mapHeight" : "360"
		}).render(); 

		
		
	</script>
	<script type="text/javascript" charset="UTF-8">
 		 $("#btn1").click(function(){
			 
 			  var bus="우리은행 종로지점 정류장<br>"+
					"<img src='./resources/images/aboutJD/busB.jpg'> 163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62<br>"+
					"<img src='./resources/images/aboutJD/busG.jpg'> 7017 / 7021 / 7022 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
					"<img src='./resources/images/aboutJD/busR.jpg'> 8110"; 
 			 
			 $("#daumRoughmapContainer1625705183208").css("display","block");
			 $("#daumRoughmapContainer1625708996649").css("display","none");
			 $("#daumRoughmapContainer1625723702552").css("display","none");
			 $("#adr").html("서울 중구 남대문로 120 1F~101F");
		 	 $("#bus").html(bus);
			 $("#subw").html("지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M");
			 $("#btn1").css("background-color","#DEDCEE");
			 $("#btn2").css("background-color","#f2f5f9");
			 $("#btn3").css("background-color","#f2f5f9");
			 $("#busbus").css("line-height","72px");
	
		 });
		 $("#btn2").click(function(){
			 
			 var bus="역삼역.포스코P&S타워 정류장<br>"+
				"<img src='./resources/images/aboutJD/busB.jpg'> 146 / 740 / 341 / 360 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				"<img src='./resources/images/aboutJD/busR.jpg'> 1100 / 1700 / 2000 / 7007 / 8001";
			 
			 $("#daumRoughmapContainer1625705183208").css("display","none");
			 $("#daumRoughmapContainer1625708996649").css("display","block");
			 $("#daumRoughmapContainer1625723702552").css("display","none");
			 $("#btn1").css("background-color","#f2f5f9");
			 $("#btn2").css("background-color","#DEDCEE");
			 $("#btn3").css("background-color","#f2f5f9");
			 $("#busbus").css("line-height","48px");
			 
			 if($("#btn2val").val()=="0"){
				 new daum.roughmap.Lander({
						"timestamp" : "1625708996649",
						"key" : "26iyr",
						"mapWidth" : "1000",
						"mapHeight" : "360"
					}).render();
			 }
			 $("#adr").html("서울 강남구 테헤란로 134 1F~101F");
		 	 $("#bus").html(bus); 
			 $("#subw").html("지하철 2호선 역삼역 3번출구 100m");
			 $("#btn2val").val("2");

		 });
		 $("#btn3").click(function(){
			 
			 var bus="부평고등학교/(구)부평세무서<br>"+
				"<img src='./resources/images/aboutJD/busB.jpg'> 7612 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				"<img src='./resources/images/aboutJD/busR.jpg'> 1000 / 1200 / 1300 / 1301 / 1302 / 1400 / 1500 / 1601 / M6628 / M6724 <br><br>"+
				"부평역<br>"+
				"<img src='./resources/images/aboutJD/busB.jpg'> 602 / 760 / 5620 / 5714 / 6514 / 6623 / 6631"; 
			 
			 $("#daumRoughmapContainer1625705183208").css("display","none");
			 $("#daumRoughmapContainer1625708996649").css("display","none");
			 $("#daumRoughmapContainer1625723702552").css("display","block");
			 $("#btn1").css("background-color","#f2f5f9");
			 $("#btn2").css("background-color","#f2f5f9");
			 $("#btn3").css("background-color","#DEDCEE");
			 $("#busbus").css("line-height","120px");
			 
			 
			 if($("#btn3val").val()=="0"){
					new daum.roughmap.Lander({
						"timestamp" : "1625723702552",
						"key" : "26j6z",
						"mapWidth" : "1000",
						"mapHeight" : "360"
					}).render();
			 }
			 $("#adr").html("인천 부평구 대정로 66 1F~101F");
		 	 $("#bus").html(bus); 
			 $("#subw").html("지하철 인천 1호선 부평역 7번 출구 400m");
			 $("#btn3val").val("2");
		 });
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>