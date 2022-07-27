<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.userManagePasswordUpdt.title"/></c:set>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/jsbn.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rsa.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/prng4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rng.js'/>"></script>	

<script type="text/javaScript" language="javascript" defer="defer">

function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(form){
 //   if(validatePasswordChgVO(form)){
	 
	 	var oldPassword = document.passwordChgVO.tmpoldPassword.value;
		var newPassword = document.passwordChgVO.tmpnewPassword.value;
		var newPassword2 = document.passwordChgVO.tmpnewPassword2.value;
		
		
		if(oldPassword == ''){
			alert('기존 비밀번호는 필수값입니다.');
			return;
		}
		
		if(newPassword == ''){
			alert('신규비밀번호는 필수값입니다.');
			return;
		}
		
		if(newPassword2 == ''){
			alert('신규비밀번호확인은 필수값입니다.');
			return;
		}
		
		var regex = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

		if(!regex.test(newPassword)){
			alert('비밀번호는 영문,특수문자,숫자 포함 형태의 8~20자리로 입력해주세요.');
			return;
		}
		
		
		if(newPassword != newPassword2){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return false;
        }
		
	     
    	//RSA 암호화 생성
    	var rsa = new RSAKey();
    	rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
    	
    	//사용자 계정정보를 암호화 처리
    	oldPassword = rsa.encrypt(oldPassword);
    	newPassword = rsa.encrypt(newPassword);
    	newPassword2 = rsa.encrypt(newPassword2); 

    	document.passwordChgVO.oldPassword.value = oldPassword;
    	document.passwordChgVO.newPassword.value = newPassword;
    	document.passwordChgVO.newPassword2.value = newPassword2;

		
		
		
        document.passwordChgVO.submit();
        return  true;
        
//    }else{
    	//return false;
    //}
 
}


<c:if test="${!empty resultMsg}">
	alert("<spring:message code="${resultMsg}" />");
	window.location.href="/uss/umt/EgovMberManage.do";
</c:if>
</script>
</head>
<body>


<div class="layout-container">
	<!-- íì´í -->
	<h2><spring:message code="comUssUmt.userManage.title" /> ${pageTitle}</h2>

<form name="passwordChgVO" method="post" action="<c:url value="/uss/umt/EgovMberPasswordUpdt.do"/>" onsubmit="fnUpdate(document.forms[0]); return false;">
<input name="checkedIdForDel" type="hidden" />
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />


<input type="hidden" id="RSAModulus" value="${RSAModulus}" /><!-- 서버에서 전달한값을 셋팅한다. -->
<input type="hidden" id="RSAExponent" value="${RSAExponent}" />

<input name="oldPassword" id="oldPassword" type="hidden" size="20" value=""  maxlength="100" >
<input name="newPassword" id="newPassword" type="hidden" size="20" value=""  maxlength="100" >
<input name="newPassword2" id="newPassword2" type="hidden" size="20" value=""  maxlength="100" >

<div class="wTableFrm">
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.id" /></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
				<input name="mberId" id="mberId" type="text" size="20" value="<c:out value='${mberManageVO.mberId}'/>"  maxlength="20" readonly >
                <input name="uniqId" id="uniqId" type="hidden" size="20" value="<c:out value='${mberManageVO.uniqId}'/>" >
                <input name="userTy" id="userTy" type="hidden" size="20" value="<c:out value='${mberManageVO.userTy}'/>" >
			</td>
		</tr>
		
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.oldPass" /></c:set>
		<tr>
			<th>${title}<span class="pilsu">*</span></th>
			<td class="left">
				<input name="tmpoldPassword" id="tmpoldPassword" type="password" size="20" value=""  maxlength="100" >
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.pass" /></c:set>
		<tr>
			<th>${title}<span class="pilsu">*</span></th>
			<td class="left">
			    <input name="tmpnewPassword" id="tmpnewPassword" type="password" size="20" value=""  maxlength="100" >
			</td>
		</tr>
		<c:set var="title"><spring:message code="comUssUmt.userManagePasswordUpdt.passConfirm" /></c:set>
		<tr>
			<th>${title}<span class="pilsu">*</span></th>
			<td class="left">
			    <input name="tmpnewPassword2" id="tmpnewPassword2" type="password" size="20" value=""  maxlength="100" >
			</td>
		</tr>
	</tbody>
	</table>

	<div class="btn">
	<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />

	<span class="btn_s"><a href="<c:url value='/uss/umt/EgovMberManage.do' />"  title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	<button class="btn_s2" onClick="document.passwordChgVO.reset();;return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />"><spring:message code="button.reset" /></button>
	</div><div style="clear:both;"></div>
	
</div>

</form>


</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>