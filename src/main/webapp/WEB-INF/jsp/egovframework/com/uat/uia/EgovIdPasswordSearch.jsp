<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<script>

function fnCheckUsrId(userSe) {
	// 일반회원
	if (userSe == "GNR") {
		document.getElementById("idGnr").className = "on";
		
		document.getElementById("idUsr").className = "";
		document.idForm.userSe.value = "GNR";
	// 기업회원
	}else if (userSe == "USR") {
		document.getElementById("idGnr").className = "";
		
		document.getElementById("idUsr").className = "on";
		document.idForm.userSe.value = "USR";
	}
}

function fnCheckUsrPassword(userSe) {
	// 일반회원
	if (userSe == "GNR") {
		document.getElementById("pwGnr").className = "on";
		
		document.getElementById("pwUsr").className = "";
		document.passwordForm.userSe.value = "GNR";
	// 기업회원
	} else if (userSe == "USR") {
		document.getElementById("pwGnr").className = "";
		document.getElementById("pwUsr").className = "on";
		document.passwordForm.userSe.value = "USR";
	}
}

function fnSearchId() {
	if (document.idForm.name.value =="") {
		alert("<spring:message code="comUatUia.idPw.validate.name" />");
	} else if (document.idForm.email.value =="") {
		alert("<spring:message code="comUatUia.idPw.validate.email" />");
	} else {
		document.idForm.submit();
	}
}

function fnSearchPassword() {
	if (document.passwordForm.id.value =="") {
		alert("<spring:message code="comUatUia.idPw.validate.id" />");
	} else if (document.passwordForm.name.value =="") {
		alert("<spring:message code="comUatUia.idPw.validate.name" />");
	} else if (document.passwordForm.email.value =="") {
		alert("<spring:message code="comUatUia.idPw.validate.email" />");
	}else {
		document.passwordForm.submit();
	}
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

</script>




<div id="subWrap" class="login forget sub01">
    <div class="sub_visual">
        <h2>아이디/비밀번호 찾기</h2>
    </div>
	
	<div id="go_direct" style="position:absolute; top:35%"></div>
	
    <div id="container">

        <!--start content-->
        <div class="contentWrap">
	        <!--start con01-->
	        <div class="con01">
	            <div class="inner">
	            	<div class="leftMenu2">
	                    <strong>회원가입</strong>
	                    <ul>
	                       
	                        <li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
		                    <li class="on"><a href="javascript:goFindId();">아이디/비밀번호 찾기</a></li>
		                    <li><a href="javascript:goRegiUsrheader();">회원가입</a></li>
		                    <li><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                    </ul>
	                </div>
	                <!--end leftMenu2-->
	                <div>
		                <div class="mem_form">
		                    <!-- <form id="frmNIDLogin" name="frmNIDLogin" target="_self" method="POST"> -->
		                    <form name="idForm" action ="<c:url value='/uat/uia/searchId.do'/>" method="post">
		                    	<input type="hidden" name="userSe" value="GNR" />
		                        <fieldset class="login_form">
		                            <legend>아이디 찾기</legend>
		                            <p>
		                                이름과 이메일을 입력하시면<br> 해당 이메일로 아이디를 알려드립니다.
		                            </p>
		                            <div class="name_area input_area">
		                                <div class="input_row" id="name_area">
		                                    <span class="input_box">
		                                        <label for="name" id="label_name_area" class="sound_only">이름</label>
		                                        <input type="text" id="name" name="name" placeholder="이름" class="int" title="이름">
		                                    </span>
		                                </div>
		                            </div>
		                            <div class="mail_area input_area">
		                                <div class="input_row" id="pw_area">
		                                    <span class="input_box">
		                                        <label for="mail" id="label_mail_area" class="sound_only">이메일</label>
		                                        <input type="email" id="email" name="email" placeholder="이메일" class="int" title="이메일">
		                                    </span>
		                                </div>
		                            </div>
		
		                            <!-- <input type="submit" title="아이디 찾기" alt="아이디 찾기" value="아이디 찾기" class="id_find"> -->
		                            <input type="button" class="id_find" onClick="fnSearchId();" value="아이디 찾기" style="background: #333;color: #fff;margin: 10% 0;font-size: 18px;font-weight: 600;cursor: pointer;"/>
		                        </fieldset>
		                    </form>
		                </div>
		                <!--end mem_form-->
		                <div class="mem_form">
		                    <!-- <form id="frmNIDLogin" name="frmNIDLogin" target="_self" method="POST"> -->
		                    <form name="passwordForm" action ="<c:url value='/uat/uia/searchPassword.do'/>" method="post">
		                    	<input type="hidden" name="userSe" value="GNR" />
		                        <fieldset class="login_form">
		                            <legend>비밀번호 찾기</legend>
		                            <p>
		                                아이디, 이름, 이메일을 입력하시면<br> 해당 이메일로 임시 비밀번호를 알려드립니다.
		                            </p>
		                            <div class="id_area input_area">
		                                <div class="input_row" id="id_area">
		                                    <span class="input_box">
		                                        <label for="id" id="label_id_area" class="sound_only">아이디</label>
		                                        <input type="text" id="id" name="id" placeholder="아이디" class="int" title="아아디">
		                                    </span>
		                                </div>
		                            </div>
		                            <div class="name_area input_area">
		                                <div class="input_row" id="name_area">
		                                    <span class="input_box">
		                                        <label for="name" id="label_name_area" class="sound_only">이름</label>
		                                        <input type="text" id="name" name="name" placeholder="이름" class="int" title="이름">
		                                    </span>
		                                </div>
		                            </div>
		                            <div class="mail_area input_area">
		                                <div class="input_row" id="pw_area">
		                                    <span class="input_box">
		                                        <label for="mail" id="label_mail_area" class="sound_only">이메일</label>
		                                        <input type="email" id="email" name="email" placeholder="이메일" class="int" title="이메일">
		                                    </span>
		                                </div>
		                            </div>
		
		                            <!-- <input type="submit" title="비밀번호 찾기" alt="비밀번호 찾기" value="비밀번호 찾기" class="pw_find"> -->
		                            <input type="button" class="pw_find" onClick="fnSearchPassword();" value="비밀번호 찾기" style="background: #333;color: #fff;margin: 10% 0;font-size: 18px;font-weight: 600;cursor: pointer;">
		                        </fieldset>
		                    </form>
		                    <ul class="list-text">
	        					<li><span class="clr-caution">회원가입 시 등록하신 메일주소와 입력하신 메일주소가 일치하지 않으면 메일이 발송되지 않습니다.</span></li>
			        			<li>E-mail 주소를 분실하신 경우 전남도립국악단 <strong>(061-285-6928)</strong>로 문의해 주시기 바랍니다.</li>
				        	</ul>
		                </div>
		                <!--end mem_form-->
	                </div>
	            </div>
	            <!--end inner-->
	        </div>
	        <!--end con01-->
		</div>
		<!--end contentWrap-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>
