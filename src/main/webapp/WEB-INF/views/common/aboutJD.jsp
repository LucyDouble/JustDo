<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JD 소개</title>
<link rel="stylesheet" href="<c:url value="/resources/css/jd/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/jd/aboutJD.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div id="section2">
		<div id="introduce">
			<div id="introduce02">
				<img src="./resources/images/aboutJD/aboutLogo.png">
				<h1>IT 인력양성의 새로운 기준, JD 교육원에서 시작합니다.</h1>
				<br>
				<br>
				<h4>
					NCS 기반의 교육 산업을 추진하여 지식과 기술을 갖춘 능력 중심의 인재를 양성하기 위한 시스템 구축.<br>
					JD 교육원은 최적의 교육환경을 통해 기술 인력을 양성합니다.
					<br>
					<br>
					최고의 IT 전문가가 죄고 싶으신가요?&nbsp;&nbsp;&nbsp;
					JD 교육원이 함께 도와드리겠습니다.
				</h4>

				<div id="organization">
					<img src="./resources/images/aboutJD/organization.png">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>