<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JD 교육원 - 이용안내</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/footer.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/jd/knowhow.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/header.js"/>"></script>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div id="contentArea">
	<h3 class="cont_h3">이용안내</h3>
		<div id="contentKnow">
			
			<div id="knowCont">
				<div id="studentCont">
					<ul class="student_title">
						<li class="student_img">
							<span class="student_name">학생</span>
						</li>
						<li class="student_txt">
							<span class="top_txt">JD 교육원의 다양한 강의 자룔로 기초부터 
							과제,평가까지!</span>
							스스로 복습하고, 익히고, 해결
							<span class="point_txt">하는 습관을 가질 수 있어요!</span>
							<br>
							JD 교육원의 다양한 강의 자료로 기초부터 과제, 평가까지!
						</li>
					</ul>
					<div class="student_list">
						<p>
							<img src="resources/images/knowJD/checkLecture.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="https://cls1.edunet.net/images/common/img_no1_blue.gif" alt="no.1"></span>수강 신청하기</li>
                            <li class="pos"><span>메인화면 &gt; 수강 &gt; 출석</span></li>
                            <li class="exp">원하는 강의를 수강 시청할 수 있다.</li>
                        </ul>
					</div>
					<div class="student_list">
						<p>
							<img src="resources/images/knowJD/attend.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="https://cls1.edunet.net/images/common/img_no2_blue.gif" alt="no.2"></span>출석하기</li>
                            <li class="pos"><span>메인화면 &gt; 수강 신청</span></li>
                            <li class="exp">수강 시작 5분 전부터 QR 출석을 할 수 있다 .
                                <span>※수강 시작 5분 후 지각 처리</span> 
                               	<span>※종료시간 직후부터 5분까지 퇴실 처리</span>
                            </li>
                        </ul>
					</div>
					<div class="student_list">
						<p>
							<img src="resources/images/knowJD/playClass.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="https://cls1.edunet.net/images/common/img_no3_blue.gif" alt="no.3"></span>수강 하기</li>
                            <li class="pos"><span>메인화면 &gt; 마이페이지&gt; 수강 조회</span></li>
                            <li class="exp">수강중인 강의를 확인하고, 강의를 수강할 수 있다.
                                <span>※학습 동영상은 일정 기간동안 재수강 가능하다.</span> 
                            </li>
                        </ul>
					</div>
					<div class="student_list">
						<p>
							<img src="resources/images/knowJD/exam.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="resources/images/knowJD/b4.png" alt="no.4"></span>과제/시험 보기</li>
                            <li class="pos"><span>메인화면 &gt; 마이페이지&gt; 수강과목&gt; 과제/시험</span></li>
                            <li class="exp">해당 수강 과목 중 과제와 시험을 수행할 수 있다.</li>
                        </ul>
					</div>
				<div class="student_list02">
                    <dl>
                        <dt><img src="https://cls1.edunet.net/images/common/ico_estudy2_03.png" alt="자율학습">스스로 학습이 가능한 <span class="point">자율학습 운영</span></dt>
                        <dd>
                            <ul>
                                <li>학생이 자율적으로 원하는 콘텐츠를 활용하여 학습을 진행하는 형태</li>
                                <li>학생수에 제한이 없고, 시스템에 의한 학습 관리 진행</li>
                                <li class="img"><img src="resources/images/knowJD/studentProcess.png" alt="가입>수강신청>자율학습>시험"></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
				</div>
				<div id="teacherCont">
					<ul class="teacher_title">
                        <li class="img"><span class="name">교직원</span></li>
                        <li class="teacher_txt">
                            <span class="top_txt">새로운 교직원 학습방법을 적용해 재미있는 수업을!</span>
                            때로는 <span class="point_txt">과제</span>로! 때로는 <span class="point_txt">시험</span>으로!
                        </li>
                    </ul>
					<div class="teacher_list">
	                     <p><img src="resources/images/knowJD/addClass.png"></p>
	                     <ul>
	                         <li class="tit"><span><img src="https://cls1.edunet.net/images/common/img_no1_green.gif" alt="no.1"></span>강의 개설하기</li>
	                         <li class="pos"><span>매인화면 &gt; 마이페이지 &gt; 강의 개설</span></li>
	                         <li class="exp">
					                             학생들의 학습 과정을 관리할 수 있는 강의를 개설할 수 있다.
	                         </li>
	                     </ul>
	                 </div>
	                 <div class="teacher_list">
						<p>
							<img src="resources/images/knowJD/mgStudent.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="https://cls1.edunet.net/images/common/img_no2_green.gif" alt="no.2"></span>학생 관리하기</li>
                            <li class="pos"><span>메인화면 &gt; 분반</span></li>
                            <li class="exp">현재 개설한 분반 정보를 제공한다. 여러 분반을 개설할 수 있다.</li>
                        </ul>
					</div>
					<div class="teacher_list">
						<p>
							<img src="resources/images/knowJD/addVedio.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="https://cls1.edunet.net/images/common/img_no3_green.gif" alt="no.3"></span>학습 동영상 등록하기</li>
                            <li class="pos"><span>메인화면 &gt; 분반&gt; 학습 동영상</span></li>
                            <li class="exp">해당 분반별 강의에서 학습 동영상을 등록할 수 있다.
                                <span>※분반별 학습 동영상 수강 진행상태 조회가 가능하다.</span> 
                            </li>
                        </ul>
					</div>
					<div class="teacher_list">
						<p>
							<img src="resources/images/knowJD/addExam.png">
						</p>
						<ul>
                            <li class="tit"><span><img src="resources/images/knowJD/g4.png" alt="no.4"></span>과제/시험 출제하기</li>
                            <li class="pos"><span>메인화면 &gt; 마이페이지&gt; 수강과목&gt; 과제/시험</span></li>
                            <li class="exp">해당 분반별 강의에서 과제와 시험을 출제할 수 있다.</li>
                        </ul>
					</div>
					<div class="teacher_list02">
	                   <dl>
	                       <dt><img src="https://cls1.edunet.net/images/common/ico_estudy2_04.png" alt="자율학습">효율적인 학생관리를 위한<span class="point">온라인 수업 운영</span></dt>
	                       <dd>
	                           <ul>
	                               <li>분반별 학생들을 관리하는 방식</li>
	                               <li>분반별 학생 수 제한</li>
	                               <li class="img"><img src="resources/images/knowJD/teacherProcess.png" alt="가입 >수강 개설>학습 동영상 등록>학습 진행"></li>
	                           </ul>
	                       </dd>
	                   </dl>
	               </div>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>