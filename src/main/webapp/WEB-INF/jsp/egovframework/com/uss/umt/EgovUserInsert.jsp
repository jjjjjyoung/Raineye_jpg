<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.deptUserManage.title"/></c:set>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/jsbn.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rsa.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/prng4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rng.js'/>"></script>	

<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/assets/js/app.js'/> "></script>
<script type="text/javaScript" language="javascript" defer="defer">
function fn_egov_init(){

	fn_modal_setting();

}
function fn_modal_setting(){
	$("#btnEmplyrId").egovModal( "egovModal" );
	
	$("#egovModal").setEgovModalTitle("<spring:message code="comUssUmt.userManageRegistModal.title" />"); 
	var content = "";
	content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"<spring:message code="comUssUmt.userManageRegistModal.userIsId" /> :"+"</div>"; 
	content = content + "<div class='modal-alignL'>"+"<input type='text' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResult' style='margin:10px 0 0 0'><spring:message code="comUssUmt.userManageRegistModal.initStatus" /></div>"; 
	$("#egovModal").setEgovModalBody(content);

	var footer = "";

	footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>사용</a></span>&nbsp;";
	footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>조회</a></span>&nbsp;";
	$("#egovModal").setEgovModalfooter(footer);

	$("input[name=checkIdModal]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_id_check();	
		}
	});
	
	footer = null;
	content = null;
}
/*********************************************************
 ******************************************************** */
function fn_id_check(){	
	$.ajax({
		type:"POST",
		url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					$("#divModalResult").html("<font color='red'><spring:message code="comUssUmt.userManageRegistModal.result" /> : ["+returnData.checkId+"]<spring:message code="comUssUmt.userManageRegistModal.useMsg" /></font>");
				}else{
					$("#divModalResult").html("<font color='blue'><spring:message code="comUssUmt.userManageRegistModal.result" /> : ["+returnData.checkId+"]<spring:message code="comUssUmt.userManageRegistModal.notUseMsg" /></font>");
				}
			}else{ alert("ERROR!");return;} 
		}
		});
}

/*********************************************************
 ******************************************************** */
function fn_id_checkOk(){
	$.ajax({
		type:"POST",
		url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					alert("<spring:message code="comUssUmt.userManageRegistModal.noIdMsg" />"); 
					return;
				}else{
					
					$("input[name=emplyrId]").val(returnData.checkId);
					$("#egovModal").setEgovModalClose();
				}
			}else{ alert("ERROR!");return;} 
		}
		});
}

function fnIdCheck1(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.userManageVO.emplyrId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.userManageVO.emplyrId.value = retVal;
	}
}

function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}

function fnInsert(form){
	if(confirm("<spring:message code="common.regist.msg" />")){
		var telRegex1 = /^\d{2,3}$/u;
		var telRegex2 = /^\d{3,4}$/u;
		var phonRegex = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var emailRegex= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var zipRegex = /^\d{5}$/u;
		
		
		var emplyrId = document.userManageVO.emplyrId.value;
		var emplyrNm = document.userManageVO.emplyrNm.value;
		
		var password = document.userManageVO.password.value;
		var password2 = document.userManageVO.password2.value;
		
		var passwordHint = document.userManageVO.passwordHint.value;
		var passwordCnsr = document.userManageVO.passwordCnsr.value;

		var areaNo = document.userManageVO.areaNo.value;
		var middleTelno = document.userManageVO.homemiddleTelno.value;
		var endTelno = document.userManageVO.homeendTelno.value;
		var moblphonNo = document.userManageVO.moblphonNo.value;
		var mberEmailAdres = document.userManageVO.mberEmailAdres.value;

		var zip = document.userManageVO.zip.value;
		var homeadres = document.userManageVO.homeadres.value;
		var emplyrSttusCode = document.userManageVO.emplyrSttusCode.value;
		var groupId = document.userManageVO.groupId.value;
		
		
		
		
		if(emplyrId == ''){
			alert('업무사용자아이디는 필수값입니다.');
			return;
		}
		
		if(emplyrNm == ''){
			alert('업무사용자 이름은 필수값입니다.');
			return;
		}
		
		if(password == ''){
			alert('비밀번호는 필수값입니다.');
			return;
		}
		
		var regex = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

		if(!regex.test(password)){
			alert('비밀번호는 영문,특수문자,숫자 포함 형태의 8~20자리로 입력해주세요.');
			return;
		}
		
		if(password2 == ''){
			alert('비밀번호확인은 필수값입니다.');
			return;
		}
		
		if(password != password2){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return false;
        }
		
		if(passwordHint == ''){
			alert('비밀번호 힌트는 필수값입니다.');
			return;
		}
		
		if(passwordCnsr == ''){
			alert('비밀번호정답은 필수값입니다.');
			return;
		}
		
		if(areaNo == '' || middleTelno == '' || endTelno == ''){
			alert('전화번호는 필수값입니다.');
			return;
		}
		
		if(moblphonNo == ''){
			alert('핸드폰번호는 필수값입니다.');
			return;
		}
		
		if(mberEmailAdres == ''){
			alert('이메일주소는 필수값입니다.');
			return;
		}
		
		if(zip == ''){
			alert('우편번호는 필수값입니다.');
			return;
		}
		
		if(homeadres == ''){
			alert('주소는 필수값입니다.');
			return;
		}
		
		if(emplyrSttusCode == ''){
			alert('업무회원상태코드는 필수값입니다.');
			return;
		}
		if(groupId == ''){
			alert('그룹아이디는 필수값입니다.');
			return;
		}
		
		if(!telRegex1.test(areaNo)||!telRegex2.test(middleTelno)||!telRegex2.test(endTelno)){
			alert('잘못 된 전화번호입니다. 숫자만 입력해주세요.');
			return false;
		}
		if(!phonRegex.test(moblphonNo)){
			alert('잘못 된 핸드폰 번호입니다. 01x-xxxx-xxxx 형식으로 입력하세요.');
			return false;
		}
		if(!emailRegex.test(mberEmailAdres)){
			alert('잘못 된 이메일 주소입니다. 아이디@이메일주소 형식으로 입력하세요.');
			return false;
		}
		if(!zipRegex.test(zip)){
			alert('잘못 된 우편번호 입니다. 숫자 5자로 입력하세요.');
			return false;
		}
		
		
		/* 
    	//RSA 암호화 생성
    	var rsa = new RSAKey();
    	rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
    	
    	//사용자 계정정보를 암호화 처리
    	password = rsa.encrypt(password);
    	password2 = rsa.encrypt(password2);
    	*/

    	document.userManageVO.password.value = password;
    	document.userManageVO.password2.value = password2;
    	

		
		
		document.userManageVO.submit();
		return true;
	}
}

function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do' />";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서등록';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}

function fn_egov_dn_info_setting(dn) {
	var frm = document.userManageVO;

	frm.subDn.value = dn;
}



</script>
<style>
.modal-content {width: 400px;}
.btn .btn_s a { margin-right: 10px;}
.btn_s2 {
    padding: 4px 8px !important;
    font-size: 13px !important;
}
.btn input.s_submit {
    background: #75c4e6 !important;
}
</style>
</head>
<body onload="fn_egov_init()">

<div class="layout-container">

	<h2>${pageTitle} <spring:message code="title.create" /></h2>
	
<form:form commandName="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserInsert.do" name="userManageVO" method="post" onSubmit="fnInsert(document.forms[0]); return false;">
<!-- 
<input type="hidden" id="RSAModulus" value="${RSAModulus}" />
<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
 -->
<div class="wTableFrm">
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<c:set var="inputSelect"><spring:message code="input.cSelect" /></c:set>
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.id"/></c:set>
		<tr>
			<th><label for="emplyrId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="emplyrId" id="emplyrId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" style="width:80%;" />
				<button id="btnEmplyrId" class="btn_s2" onClick="return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.deptUserManageRegistBtn.idSearch" /></button>
				<div><form:errors path="emplyrId" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.name"/></c:set>
		<tr>
			<th><label for="emplyrNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="emplyrNm" title="${title} ${inputTxt}" size="50" maxlength="60" />
				<div><form:errors path="emplyrNm" cssClass="error" /></div> 
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.pass"/></c:set>
		<tr>
			<th><label for="password">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:password path="password" title="${title} ${inputTxt}" size="50" maxlength="20" />
				<div><form:errors path="password" cssClass="error" /></div> 
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passConfirm"/></c:set>
		<tr>
			<th><label for="password2">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
			<input name="password2" id="password2" title="${title} ${inputTxt}" type="password" size="50" maxlength="20" />
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passHit"/></c:set>
		<tr>
			<th><label for="passwordHint">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:select path="passwordHint" id="passwordHint" title="${title} ${inputSelect}">
					<form:option value="" label="${inputSelect}"/>
					<form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				<div><form:errors path="passwordHint" cssClass="error"/></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passOk"/></c:set>
		<tr>
			<th><label for="passwordCnsr">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="passwordCnsr" id="passwordCnsr" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="50" maxlength="100" />
				<div><form:errors path="passwordCnsr" cssClass="error"/></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.insttCode"/></c:set>
		<tr>
			<th><label for="insttCode">${title}</label></th>
			<td class="left">
                    <form:select path="insttCode" id="insttCode" title="${title} ${inputSelect}">
                       <form:option value="" label="${inputSelect}"/>
                       <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="insttCode" cssClass="error"/></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.orgnztId"/></c:set>
		<tr>
			<th><label for="orgnztId">${title}</label></th>
			<td class="left">
                  <form:select path="orgnztId" id="orgnztId" title="${title} ${inputSelect}">
                       <form:option value="" label="${inputSelect}"/>
                       <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="orgnztId" cssClass="error"/></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.ofcps"/></c:set>
		<tr>
			<th><label for="ofcpsNm">${title}</label></th>
			<td class="left">
                    <form:input path="ofcpsNm" id="ofcpsNm" title="${title} ${inputTxt}" size="20" maxlength="50" />
                    <div><form:errors path="ofcpsNm" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.emplNum"/></c:set>
		<tr>
			<th><label for="emplNo">${title}</label></th>
			<td class="left">
                    <form:input path="emplNo" id="emplNo" title="${title} ${inputTxt}" size="20" maxlength="20" />
                    <div><form:errors path="emplNo" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.saxTypeCode"/></c:set>
		<tr>
			<th><label for="sexdstnCode">${title}</label></th>
			<td class="left">
				<form:select path="sexdstnCode" id="sexdstnCode" title="${title} ${inputSelect}">
					<form:option value="" label="${inputSelect}"/>
					<form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
				 <div><form:errors path="sexdstnCode" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.brth"/></c:set>
		<tr>
			<th><label for="brth">${title}</label></th>
			<td class="left">
				<form:input path="brth" id="brth"  title="${title} ${inputTxt}" size="20" maxlength="8" />
                <div><form:errors path="brth" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.tel"/></c:set>
		<tr>
			<th><label for="areaNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="areaNo" id="areaNo" title="${title} ${inputSelect}" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="homemiddleTelno" id="homemiddleTelno" size="5" maxlength="5" style="width:40px;"/>
                    - <form:input path="homeendTelno" id="homeendTelno"  size="5" maxlength="5" style="width:40px;"/>
                    <div><form:errors path="areaNo" cssClass="error" /></div>
                    <div><form:errors path="homemiddleTelno" cssClass="error" /></div>
                    <div><form:errors path="homeendTelno" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.areaNo"/></c:set>
		<tr>
			<th><label for="offmTelno">${title}</label></th>
			<td class="left">
                    <form:input path="offmTelno" id="offmTelno" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="offmTelno" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.offmTelno"/></c:set>
		<tr>
			<th><label for="fxnum">${title}</label></th>
			<td class="left">
                    <form:input path="fxnum" id="fxnum" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20"  maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.phone"/></c:set>
		<tr>
			<th><label for="moblphonNo">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="moblphonNo" id="moblphonNo" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20" maxlength="15" />
                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.email"/></c:set>
		<tr>
			<th><label for="emailAdres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="emailAdres" id="mberEmailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="30" maxlength="50" />
                    <div><form:errors path="emailAdres" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.post"/></c:set>
		<tr>
			<th><label for="zip">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <input name="zip" id="zip" title="${title} ${inputTxt}" type="text" size="20" value="" maxlength="5" style="width:60px;" />
                    <!-- form:hidden path="zip" id="zip" --> 
                    <!-- <button class="btn_s2" onClick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">ì°ë²ë²í¸ê²ì</button>  -->
                    <div><form:errors path="zip" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.addr"/></c:set>
		<tr>
			<th><label for="homeadres">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="homeadres" id="homeadres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="homeadres" cssClass="error" /></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.addrDetail"/></c:set>
		<tr>
			<th><label for="detailAdres">${title}</label></th>
			<td class="left">
                    <form:input path="detailAdres" id="detailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			</td>
		</tr>
		
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.groupId"/></c:set>
		<tr>
			<th><label for="groupId">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:select path="groupId" id="groupId" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.status"/></c:set>
		<tr>
			<th><label for="emplyrSttusCode">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" title="${title} ${inputSelect}">
                        <form:option value="" label="${inputSelect}"/>
                        <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="emplyrSttusCode" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 
		<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.subDn"/></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
                    <form:input path="subDn" id="subDn" title="${title} ${inputTxt}" size="40" maxlength="400" style="width:80%;" />
                    <button id="btnSubdn" class="btn_s2" onClick="fn_egov_inqire_cert(); return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.deptUserManageRegistBtn.Search" /></button>
                    <div><form:errors path="subDn" cssClass="error" /></div>
			</td>
		</tr>
		 -->
		 <form:hidden path="subDn" />
	</tbody>
	</table>

	<div class="btn">
		<span class="btn_s"><a href="<c:url value='/uss/umt/EgovUserManage.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
	</div><div style="clear:both;"></div>

</div><!-- div end(wTableFrm)  -->

<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
</form:form>

<!-- Egov Modal include  -->
<c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="Y" />
	<c:param name="modalName" value="egovModal" />
</c:import>

</div>
</body>
</html>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

