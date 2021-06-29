<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
*{
	font-size: 20px;
	font-family: 'BMHANNAPro';
}
input{
	font-family: sans-serif;
}
/* modal창 감싸고 있는 배경 Div */
.background_modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* 아이디 출력창(실제 내용) */
.modal_contents {
	background-color: #fefefe;
	margin: auto;
	margin-top: 5%;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 30%;
	text-align: center;
}
/* close 버튼 */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 28px;
}
.selectedInfo {
	font-size: 24px;
}

.pwSearch_btn{
-webkit-box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0
		rgb(0 0 0/ 12%);
	-webkit-transition: color .15s ease-in-out, background-color .15s
		ease-in-out, border-color .15s ease-in-out, -webkit-box-shadow .15s
		ease-in-out;
	font-size: 18px;
	border: 0;
	-webkit-border-radius: .125rem;
	text-transform: uppercase;
	white-space: normal;
	word-wrap: break-word;
	color: #fff;
	background : #6A60A9;
	cursor: pointer;
}
</style>

<!-- 시간 추가 modal -->
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<h4>
			<b> 아이디</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class="pwSearch_btn">
		비밀번호 찾기</button>
	</div>
</div>