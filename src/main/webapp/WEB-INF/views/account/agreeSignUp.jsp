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
					<li>회원가입 약관 동의(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk"
						id="check1"></li>
				</ul> <textarea name="" id="">(회원가입) 

  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

  ② “몰”은  회원으로 가입할 것을 신청한 이용자 중 다음 젝약사항에 해당하지 않는 한 회원으로 등록합니다.

    1. 가입신청자가 이 약관 회원 탈퇴 및 자격상실 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 회원 탈퇴 및 자격상실 약관에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우

  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.

  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
    </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk"
						id="check2"></li>
				</ul> <textarea name="" id="">개인정보보호

  ① “JD교육원”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. 

  ② “JD교육원”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.

  ③ “JD교육원”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 

  ④ “JD교육원”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.

  ⑤ “JD교육원”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

  ⑥ 이용자는 언제든지 “JD교육원”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “JD교육원”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “JD교육원”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
 
  ⑦ “JD교육원”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.

  ⑧ “JD교육원” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.

  ⑨ “JD교육원”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
    </textarea>
			</li>
			<li class="checkBox check04">
				<ul class="clearfix">
					<li>회원 탈퇴 및 자격 상실에 대한 안내(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" id="check3">
					</li>
				</ul> <textarea name="" id="">(회원 탈퇴 및 자격 상실 등) 

  ① 회원은 “JD교육원”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.

  ② 회원이 다음 각 호의 사유에 해당하는 경우, “JD교육원”은 회원자격을 제한 및 정지시킬 수 있습니다.

    1. 가입 신청 시에 허위 내용을 등록한 경우
    2. 다른 사람의 “JD교육원” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    3. “JD교육원”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

  ③ “JD교육원”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “JD교육원”은 회원자격을 상실시킬 수 있습니다.

  ④ “JD교육원”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

    </textarea>
			</li>
			<li class="checkBox check05">
				<ul class="clearfix">
					<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk">
					</li>
				</ul> <textarea name="" id="">본 동의는 JD교육원 서비스(이하 “서비스”라 한다)에서 수집한 아래와 같은 항목을 이용하여, 고객님에게 전자적 전송매체를 통해 마케팅 · 이벤트 등 프로모션 등의 목적으로 광고 또는 정보를 전송하는 것에 대한 광고성 정보 수신동의로서, 고객님은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며, 본 동의를 거부할 경우 받는 별도의 불이익은 없습니다.


광고성 정보 전송에 대한 안내

내용 및 목적	이용항목	이용기간
이메일 및 SMS를 통해, JD교육원의 상품 또는 서비스에 대한 마케팅, 이벤트 등 프로모션 정보 전송	이메일 주소, 휴대전화번호	회원탈퇴/동의 철회시까지
안내

고객이 수집 및 이용에 동의한 개인정보를 활용하여, 전자적 전송매체를 통해, JD교육원의 상품 또는 서비스에 대한 마케팅, 이벤트 등 프로모션 정보를 전송할 수 있습니다.
법령에 따른 개인정보의 수집/이용 및 개인정보 처리와 관련된 일반 사항은 서비스의 개인정보처리방침에 따릅니다.
고객이 본 수신동의를 철회하고자 할 경우 서비스 홈페이지 https://www.mygenomebox.com을 통해 수신동의 철회 요청을 할 수 있습니다.
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
	var chk3 = $('input:checkbox[id="check3"]').is(":checked") == true;
	console.log(chk1);
	console.log(chk2);
	if(chk1 ==false || chk2==false || chk3==false){
		alert("필수 약관 동의를 확인해주세요");
	}else{
		location.href='signUp';
	}
});

</script>
</html>