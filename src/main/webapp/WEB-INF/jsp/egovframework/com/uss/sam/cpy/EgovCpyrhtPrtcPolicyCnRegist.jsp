<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">


<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_cpyrhtprtcpolicycn(){

	// 첫 입력란에 포커스..
	cpyrhtPrtcPolicyVO.cpyrhtPrtcPolicyCn.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_cpyrhtprtcpolicycn(form){

	// 서버사이드 테스트용
	/*
		form.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnRegist.do'/>";
		form.submit();
		return;
	*/

	if (!validateCpyrhtPrtcPolicyVO(form)) {

	return;

	} else {

		form.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnRegist.do'/>";
		form.submit();

	}


}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_cpyrhtprtcpolicylist() {

	cpyrhtPrtcPolicyVO.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>";
	cpyrhtPrtcPolicyVO.submit();

}

</script>

<style>
div.btn {
	margin-left: 44%;
}
textarea {
	min-width: 800px;
}
</style>
</head>
<body onLoad="fn_egov_initl_cpyrhtprtcpolicycn();">

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="ussSamCpy.cpyrhtPrtcPolicyCnRegist.cpyrhtPrtcPolicyCnRegist"/></h2><!-- 저작권 보호정책 등록 -->

<form:form commandName="cpyrhtPrtcPolicyVO" action="${pageContext.request.contextPath}/uss/sam/cpy/CpyrhtPrtcPolicyCnRegist.do" method="post">

<div class="wTableFrm">
	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:25%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="ussSamCpy.cpyrhtPrtcPolicyCnRegist.cpyrhtPrtcPolicyCn"/> <span class="pilsu">*</span></th><!-- 저작권 보호정책 등록 -->
			<td class="left">
				<c:set var="cpyrhtPrtcPoliCn"><spring:message code="ussSamCpy.cpyrhtPrtcPolicyCnRegist.cpyrhtPrtcPolicyCn"/></c:set>
				<form:textarea path="cpyrhtPrtcPolicyCn" cssClass="txaClass" title="${cpyrhtPrtcPoliCn}" cssStyle="height:300px"/>
				<div><form:errors path="cpyrhtPrtcPolicyCn"/></div>
			</td>
		</tr>
	</table>
	
	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_cpyrhtprtcpolicycn(document.forms[0]); return false;" />
		<span class="btn_s"><a href="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>" onclick="fn_egov_inqire_cpyrhtprtcpolicylist(); return false;"><spring:message code="button.list" /></a></span>
	</div>
</div>
</form:form>

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

