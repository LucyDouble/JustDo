# JustDo
###### 자신없는 독학, 실천없는 계획! JD교육원이 도와드리겠습니다.
##### 팀원 : 권용휘, 고현민(팀장), 박강훈, 이호재, 정재만
##### 개발기간 : 6월7일~7월14일
---
## contents
1. [프로젝트 소개](#프로젝트-소개)
2. [개발환경](#개발환경)
3. [프로젝트 기능구현](#프로젝트-기능구현)
4. [주요기능](#주요기능)
5. [개발문서](#개발문서)
---
## 프로젝트 소개
- 교직원이 강의마다  2개씩 분반을 나누어 개설하여 학생들을 관리하며, 해당 강의에 필요한 동영상을 등록
- 시험과 과제를 제출하여 학생들의 학습 능률 향상
- 수강생의 경우에는 원하는 강의를 수강 신청하여 학습동영상을 시청 후 과제와 시험을 수행

---
## 개발환경
|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JS, CSS3, JQuery|
|BackEnd|JAVA(JDK 1.8), Spring(v5.2.3), JSP, MyBatis|
|OS|Windows 10|
|IDE|STS3, VisualStudio|
|Server|Tomcat(v8.5)|
|Document|Notion, ERDCloud, KakaoOven|
|CS|Github|
|DataBase|SQL Developer, Oracle(XE 11g)|
|API|Zxing, kakao 우편번호 찾기 서비스, kakao Map, kakao Channel, Couldinary, channelTalk, CKEditor, Fullcalendar|

---
## 프로젝트 기능구현
- 비회원
  - 소개, 이용방법, 오시는 길, 강사소개란 읽기 가능.
  - 카카오톡 상담하기 사용 가능.
  - 채널톡 사용가능.
  - 회원가입 가능.
-  운영자
  - 상담하기 답변 
  - 공지사항 등록, 수정, 삭제 및 댓글 가능
  - 교직원 회원가입 시 승인
- 교직원
  - 공지사항 등록, 수정, 삭제 및 댓글 가능
  - 강의 등록, 수정, 삭제
  - 학습동영상 등록, 수정, 삭제 및 댓글 가능
  - 과제 등록, 수정, 삭제
  - 시험 등록, 수정, 삭제
  - 시험 점수 부여
  - 학생 관리
- 학생
  - 수강신청 등록, 수정, 삭제
  - 공지사항 읽기 및 댓글 가능
  - 학습 동영상 시청 및 댓글 가능
  - 과제 제출
  - 시험 제출
  - QR 출석
