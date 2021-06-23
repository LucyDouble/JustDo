<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JD 교육원</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
</head>
<body>

	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div id="section">
		<!-- 슬라이드  배너 -->
		<div class="slideshow-container">
			<div id="banner" class="mySlides fade">
				<img src="./resources/images/main/mainBanner.png">
			</div>

			<div id="banner" class="mySlides fade">
				<img src="./resources/images/main/jobSuccess.png">
			</div>
			<div id="banner" class="mySlides fade">
				<img src="./resources/images/main/footerBanner.png">
			</div>
		</div>
		<!-- 빠른 메뉴  -->
		<div class="quick_menu">
			<div class="quick_container">
				<ul>
					<li class="quick-wobble-vertical"
						style="background: url('<c:url value="/resources/images/main/information.png"/>') no-repeat; background-position-x: 55px; background-size: 30px 30px;">
						<a href=""><strong>이용 안내</strong></a>
					</li>
					<li><img
						src="https://iei.or.kr/resources/images/main/main_renewal/quick_menu_line.png">
					</li>
					<li class="quick-wobble-vertical"
						style="background: url('<c:url value="/resources/images/main/enrolment.png"/>') center top no-repeat; background-size: 35px 35px; padding-top:9px;">
						<a href=""><strong>온라인 수강신청</strong></a>
					</li>
					<li><img
						src="https://iei.or.kr/resources/images/main/main_renewal/quick_menu_line.png">
					</li>
					<li class="quick-wobble-vertical"
						style="background: url('<c:url value="/resources/images/main/consulting.png"/>') center top no-repeat; background-size: 30px 30px; padding-top:6px;">
						<a href=""><strong>상담신청 예약</strong></a>
					</li>
					<li><img
						src="https://iei.or.kr/resources/images/main/main_renewal/quick_menu_line.png">
					</li>
					<li class="quick-wobble-vertical"
						style="background: url('<c:url value="/resources/images/main/person.png"/>') center top no-repeat; background-size: 30px 30px; padding-top:6px;">
						<a href=""><strong>마이페이지</strong></a>
					</li>
					<li><img
						src="https://iei.or.kr/resources/images/main/main_renewal/quick_menu_line.png">
					</li>
				</ul>
				<div class="fixed_call" style="cursor: pointer;">
					<div class="icon_wrap">
						<img src="./resources/images/main/call.png">
					</div>
					<ul>
						<li>1234-4321</li>
						<li><h3>전국대표문의전화</h3></li>
					</ul>
				</div>
			</div>
			<!--//class="quick_container"-->
		</div>


		<!-- 온라인 교육 개강 -->
		<div class="large-header">
			<div class="root-section-divider">
				<span class="code-1"></span> <span class="code-2"></span> <span
					class="code-3"></span> <span class="code-4"></span> <span
					class="code-1"></span> <span class="code-5"></span>
			</div>
			<div id="onlineClass">
				<div>
					<h2>온라인 교육 개강안내</h2>
					<br>
				</div>
				<img src="./resources/images/main/securityClass.png"> <img
					src="./resources/images/main/javaClass.png"> <img
					src="./resources/images/main/bigdataClass.png">
			</div>
		</div>
	</div>
	<!-- 취업 회사 로고 -->
	<div class="large-header">
		<div class="root-section-divider">
			<span class="code-1"></span> <span class="code-2"></span> <span
				class="code-3"></span> <span class="code-4"></span> <span
				class="code-1"></span> <span class="code-5"></span>
		</div>
		<h2 class="main-sentence">
			국내 <span class="blue-point">500개</span> 이상의 기업이<br> JD 교육원을 통해
			당신을 기다립니다.
		</h2>
	</div>
	<div class="our-company">
		<div class="list-company">
			<ul>
				<li><div class="frame-logo">
						<a href="https://careers.kakao.com/index"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-kakao-29655f01.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://recruit.navercorp.com/naver/recruitMain"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-naver-8755e949.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://careers.11stcorp.com/home"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-11st-da268e71.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://deliveryhero.co.kr/career"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-deliveryhero-0b5c6ff3.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://www.woowahan.com/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-woowahan-80f85ab6.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://careers.linecorp.com/ko/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-line-7869c9a9.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://apply.lg.com/main/Index.rpi"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-lguplus-76f23b23.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://www.notion.so/3d0197c137ec43d18ff739b5b254a3c8"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-carrotmarket-1724127b.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://watcha.team/81b8ab72-1a44-4d6c-a418-bbaed702c429"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-watcha-a5c69a81.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://blog.socar.kr/10298"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-socar-9fbafa25.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://apply.workable.com/smartstudy/"><img  src="https://programmers.co.kr/packs/media/root_companies/img-logo-smartstudy-6bb5ae9f.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://www.rocketpunch.com/companies/qara/jobs"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-qara-55c57a86.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://stickerfarm.mojitok.com/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-platfarm-5d6c435d.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://m.netmarble.com/rem/www/noticelist.jsp"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-netmarble-7651c92d.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://kakaocommerce.recruiter.co.kr/appsite/company/index"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-kakaocommerce-9f373b17.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://careers.kakaoenterprise.com/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-kakaoenterprise-58a8002b.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://career.zigbang.com/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-zigbang-d81361c3.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href=""><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-dreamus-36ccab9f.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=37192838"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-dailyhotel-51cc330e.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href=""><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-ea-676b2128.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://career.myrealtrip.com/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-myrealtrip-8c2360f3.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://hello.remember.co.kr/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-dramacompany-f5547e4f.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://krafton.recruiter.co.kr/appsite/company/index"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-krafton-f69264c3.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://estsoft.recruiter.co.kr/appsite/company/index"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-estsoft-19f03130.png"></a>
					</div></li>
				<li><div class="frame-logo">
						<a href="https://tadacareer.vcnc.co.kr/"><img src="https://programmers.co.kr/packs/media/root_companies/img-logo-vcnc-b6b3a360.png"></a>
					</div></li>
			</ul>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			slides[slideIndex - 1].style.display = "block";
			setTimeout(showSlides, 4000);
		}
	</script>
</body>
</html>