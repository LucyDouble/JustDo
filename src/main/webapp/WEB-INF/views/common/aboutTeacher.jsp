<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/jd/aboutTeacher.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div id="section-teacher">
		<div class="tabmenu">
			<ul>
				<li id="gangnam-tab" class="btnCon">
					<input type="radio" checked name="tabmenu" id="gangnam">
					<label for="gangnam">강남 교육원</label>
					<div class="tabCon">
						<div id="teacher-img"><img src="./resources/images/teacher/male01.png"></div>
						<div id="teacher-con">
							<h2>권용휘 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male02.png"></div>
						<div id="teacher-con">
							<h2>박강훈 강사님</h2>
							<br>
							<h3>할 수 있을 때 하자!</h3>
							<h4>지금이 아니라면 할 수 없다는 생각으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/female01.png"></div>
						<div id="teacher-con">
							<h2>고현민 강사님</h2>
							<br>
							<h3>시작에 두려워 말고 지금 당장 시작하자!</h3>
							<h4>시작의 두려움을 떨구고 위대함을 펴칠 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/female02.png"></div>
						<div id="teacher-con">
							<h2>김은지 강사님</h2>
							<br>
							<h3>마음먹은대로 바로 실천하자!</h3>
							<h4>처음 가진 계획을 바로 실천하여 성곡하자는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male03.png"></div>
						<div id="teacher-con">
							<h2>유호종 강사님</h2>
							<br>
							<h3>작은 돌멩이 부터 옮겨 산을 만들자!</h3>
							<h4>작은 실천이 큰 산을 이룬다는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
					</div>
				</li>
				<li id="jongno-tab" class="btnCon">
					<input type="radio" name="tabmenu" id="jongno">
					<label for="jongno">종로 교육원</label>
					<div class="tabCon">
						<div id="teacher-img"><img src="./resources/images/teacher/male04.png"></div>
						<div id="teacher-con">
							<h2>이호재 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/female03.png"></div>
						<div id="teacher-con">
							<h2>이민희 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/female04.png"></div>
						<div id="teacher-con">
							<h2>김윤지 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male05.png"></div>
						<div id="teacher-con">
							<h2>오지혁 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male06.png"></div>
						<div id="teacher-con">
							<h2>문태현 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
					</div>
				</li>
				<li id="bupyeong-tab" class="btnCon">
					<input type="radio" name="tabmenu" id="bupyeong">
					<label for="bupyeong">부평 교육원</label>
					<div class="tabCon">
						<div id="teacher-img"><img src="./resources/images/teacher/female05.png"></div>
						<div id="teacher-con">
							<h2>이선진 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/female06.png"></div>
						<div id="teacher-con">
							<h2>김서희 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male07.png"></div>
						<div id="teacher-con">
							<h2>정재만 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male08.png"></div>
						<div id="teacher-con">
							<h2>이종현 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
						<div id="enter"></div>
						<div id="teacher-img"><img src="./resources/images/teacher/male09.png"></div>
						<div id="teacher-con">
							<h2>박승호 강사님</h2>
							<br>
							<h3>꾸준한 노력을 하자!</h3>
							<h4>웹 개발의 첫 디딤의 발을 두려워 하지 말고 함께 고민을 나누는 마음가짐으로 수강생 여러분들과 함께 나아가고자 합니다.</h4>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>