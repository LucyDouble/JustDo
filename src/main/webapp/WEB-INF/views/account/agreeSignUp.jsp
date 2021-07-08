<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<title>회원가입약관</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	background-color: #f7f7f7;
}

ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

div {
	width: 600px;
	margin: 0 auto;
}

ul.join_box {
	border: 1px solid #ddd;
	background-color: #fff;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 96%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
}

.footBtwrap {
	margin-top: 15px;
}

.footBtwrap>li {
	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 20px;
	text-align: center;
	line-height: 60px;
}

.agreeBtn1 {
	background-color: #fff;
	color: #888
}

.agreeBtn2 {
	background-color: #6A60A9;
	color: #fff
}
</style>
</head>

<body>
	<div>
		<a href="<%=request.getContextPath()%>/jdHome?command=main"><img
			class="logo" src="resources/images/logo4.png"></a> <br> <br>
		<ul class="join_box">
			<li class="checkBox check01">
				<ul class="clearfix">
					<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
						동의합니다.</li>
					<li class="checkAllBtn"><input type="checkbox" name="chkAll"
						id="chk" class="chkAll"></li>
				</ul>
			</li>
			<li class="checkBox check02">
				<ul class="clearfix">
					<li>이용약관 동의(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk"
						id="check1"></li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
    </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk"
						id="check2"></li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
    </textarea>
			</li>
			<li class="checkBox check04">
				<ul class="clearfix">
					<li>위치정보 이용약관 동의(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk">
					</li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
    </textarea>
			</li>
			<li class="checkBox check05">
				<ul class="clearfix">
					<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk">
					</li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
                    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>

			</li>
		</ul>
		<ul class="footBtwrap clearfix">
			<li><button class="agreeBtn1"
					onclick="location.href='jdHome'">취소</button></li>
			<li><button class="agreeBtn2">동의</button></li>
		</ul>
	</div>
</body>
<script>
function allCheck(a){
    $("[name=chk]").prop("checked", $(a).prop("checked"));
}
function oneCheck(a){
    var allChkBox = $("[name=chkAll]")
    var chkBoxName = $(a).attr("name");
    if($(a).prop("checked")){
    	console.log(allChkBox.val());
        checkBoxLength = $("[name=" + chkBoxName + "]").length;
        checkedLength = $("[name=" + chkBoxName + "]:checked").length;
        if(checkBoxLength == checkedLength){
            allChkBox.prop('checked', true);
        }else{
            allChkBox.prop('checked', false);

        }
    }else{
    allChkBox.prop("checked", false);
}
}

$(function(){
    $("[name=chkAll]").click(function(){
        allCheck(this);
    });
    $("[name=chk]").each(function(){
        $(this).click(function(){
            oneCheck(this);
        })
    })
});
 $(".agreeBtn2").click(function(){
	var chk1 = $('input:checkbox[id="check1"]').is(":checked") == true;
	var chk2 = $('input:checkbox[id="check2"]').is(":checked") == true;
	console.log(chk1);
	console.log(chk2);
	if(chk1 ==false || chk2==false){
		alert("필수 약관 동의를 확인해주세요");
	}else{
		location.href='signUp';
	}
});

</script>
</html>