<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<script type="text/javaScript" language="javascript">
function checkLogin(userSe) {   
    document.loginForm.rdoSlctUsr[0].checked = false;
    document.loginForm.rdoSlctUsr[1].checked = false;
    document.loginForm.rdoSlctUsr[2].checked = true;
    document.loginForm.userSe.value = "USR";
}

function actionLogin() {
	if (document.loginForm.beforid.value =="") {
        alert("아이디를 입력하세요");
    } else if (document.loginForm.beforpassword.value =="") {
        alert("비밀번호를 입력하세요");
    } else {
    	
    	var uid = document.loginForm.beforid.value;
    	var pwd = document.loginForm.beforpassword.value;
     
    	//RSA 암호화 생성
    	var rsa = new RSAKey();
    	rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
    	
    	//사용자 계정정보를 암호화 처리
    	uid = rsa.encrypt(uid);
    	pwd = rsa.encrypt(pwd); 

    	document.loginForm.id.value = uid;
    	document.loginForm.password.value = pwd;
    	
        document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
        document.loginForm.submit();
    }
}

function actionCrtfctLogin() {
    document.defaultForm.action="<c:url value='/uat/uia/actionCrtfctLogin.do'/>";
    document.defaultForm.submit();
}

function goFindId() {
    document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
    document.defaultForm.submit();
}

function goRegiUsr() {
	
	var useMemberManage = '${useMemberManage}';

	<%-- if(useMemberManage != 'true'){
		사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요.
		alert("<spring:message code="comUatUia.validate.userManagmentCheck" />");
		return false;
	} --%>

    document.loginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
    document.loginForm.submit();
    

}

function goGpkiIssu() {
    document.defaultForm.action="<c:url value='/uat/uia/egovGpkiIssu.do'/>";
    document.defaultForm.submit();
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {

    var message = '<c:out value="${message}"/>';
	
    getid(document.loginForm);
    
    fnLoginTypeSelect("typeGnr");
    
    if (message) {
    	alert(message);
    }
    
}

function fnLoginTypeSelect(objName){

		
		document.getElementById("typeGnr").className = "";
		document.getElementById("typeUsr").className = "";
		
		document.getElementById(objName).className = "on";
		
		if(objName == "typeGnr"){ //일반회원
			document.loginForm.userSe.value = "GNR";
		}else if(objName == "typeUsr"){	//업무사용자
			document.loginForm.userSe.value = "USR";
		}
		
		//document.loginForm.userSe.value = "USR";
	
}

function fnShowLogin(stat) {
	if (stat < 1) {	//일반로그인
		$(".login_input").eq(0).show();
		$(".login_input").eq(1).hide();
	} else {		//공인인증서 로그인
		$(".login_input").eq(0).hide();
		$(".login_type").hide();
		$(".login_input").eq(1).show();
	}
}

function enterkey() {
    if (window.event.keyCode == 13) {
         // 엔터키가 눌렸을 때 실행할 내용
         actionLogin();
    }
}

$(document).ready(function(){
	if($("#RSAModulus").val() == ''){
		window.location.href="/uat/uia/egovLoginUsr.do";
	}
});

</script>

<div id="subWrap" class="login">
    <div class="sub_visual">
        <h2>로그인</h2>
    </div>

    <div id="container">
        <!--start con01-->
        <div class="con01">
            <div class="inner">
            	<div class="leftMenu2">
                    <strong>회원가입</strong>
                    <ul>
                        <li class="on"><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
                        <li><a href="/publeView.do?id=userForget">아이디/비밀번호 찾기</a></li>
                        <li><a href="/publeView.do?id=userJoinAgree">회원가입</a></li>
                        <li><a href="/publeView.do?id=userPaidJoinAgree">유료회원</a></li>
                    </ul>
                </div>
                <!--end leftMenu2-->
            	
            	<div id="go_direct">
	                <div class="text_area">
	                    <p>
	                        전라남도립국악단 홈페이지를 방문해 주셔서 감사합니다.<br>
	                        전라남도립국악단의 정보를 이용하기 위해서는 로그인이 필요합니다.<br>
	                        회원님의 로그인 정보를 입력해 주세요.
	                    </p>
	                </div>
	                <div class="mem_form">
	                    <form name="loginForm" id="loginForm" action="/uat/uia/actionLogin.do" method="post">
	                        <input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
							<input name="userSe" type="hidden" value="USR"/>
							<input type="hidden" id="RSAModulus" value="${RSAModulus}" /><!-- 서버에서 전달한값을 셋팅한다. -->
							<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
							<input type="hidden" name="id" id="id" />
							<input type="hidden" name="password" id="password"/>
	                        <fieldset class="login_form">
	                            <legend>로그인</legend>
	                            <div class="id_area input_area">
	                                <div class="input_row" id="id_area">
	                                    <span class="input_box">
	                                        <label for="beforid" id="label_id_area" class="sound_only">아이디</label>
	                                        <input type="text" id="beforid" name="beforid" placeholder="아이디" class="int">
	                                    </span>
	                                </div>
	                            </div>
	                            <div class="pw_area input_area">
	                                <div class="input_row" id="pw_area">
	                                    <span class="input_box">
	                                        <label for="beforpassword" id="label_pw_area" class="sound_only">비밀번호</label>
	                                        <input type="password" id="beforpassword" name="beforpassword" placeholder="비밀번호" class="int">
	                                    </span>
	                                </div>
	                            </div>
	
	                            <input type="button" title="로그인" alt="로그인" value="로그인" class="login_btn" onclick="actionLogin()">
	                        </fieldset>
	                    </form>
	                    <div class="forget_msg">
	                        <a href="/publeView.do?id=userJoinAgree">아직 회원이 아니신가요?</a>
	                        <a href="/publeView.do?id=userForget">아이디 및 비밀번호를 잊으셨나요?</a>
	                    </div>
	                </div>
	                <!--end mem_form-->
                </div>
            </div>
            <!--end inner-->
        </div>
        <!--end con01-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>