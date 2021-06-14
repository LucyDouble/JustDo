<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/common/header.css"/>"> 

<header id="header">
        <a href=""><img class="logo" src="resources/images/logo.png"></a>
        
        <div id="top_menu">
            <a href="#">이용안내</a> <a href="#">로그인</a> <a href="#">회원가입</a>
        </div>
        
        <nav>
            <ul>
                <li class="aboutJD"><a id="aboutJD" href="#">JD소개</a>
                    <div id="drop_content">
                        <a href="#">JD 소개</a> <a href="#">이용방법</a> <a href="#">오시는 길</a>
                    </div>
                </li>
                <li class="aboutJD"><a href="#">강사소개</a>
                    <div id="drop_content">
                        <a href="#">강남 교육원</a> 
                        <a href="#">종각 교육원</a> 
                        <a href="#">부평 교육원</a> 
                    </div>
                </li>
                
                <li class="aboutJD"><a href="#">수강신청</a></li>
                
                <li class="aboutJD"><a href="#">마이페이지</a>
                    <div id="drop_content">
                        <a href="#">로그인</a>
                        <a href="#">회원가입</a> 
                        <a href="#">수강과목</a>
                    </div>
                </li>
                <li class="aboutJD"><a href="#">상담센터</a>
                    <div id="drop_content">
                        <a href="#">상담 신청</a> 
                        <a href="#">상담 조회</a> 
                    </div>
                </li>
            </ul>
        </nav>
        <a href=""><img class="logo3"  src="resources/images/logo3.jpg"></a>
    </header>