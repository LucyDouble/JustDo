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
				</div></li>
			<li class="aboutJD"><a href="#">강사소개</a>
				<div id="drop_content">
					<a href="#">submenu</a> <a href="#">submenu</a> <a href="#">submenu</a>
				</div></li>
			</li>
			<li class="aboutJD"><a href="#">마이페이지</a>
				<div id="drop_content">
					<a href="#">submenu</a> <a href="#">submenu</a> <a href="#">submenu</a>
				</div></li>
			<li class="aboutJD"><a href="#">상담센터</a>
				<div id="drop_content">
					<a href="#">submenu</a> <a href="#">submenu</a> <a href="#">submenu</a>
				</div>
			</li>
		</ul>
	</nav>
</header>