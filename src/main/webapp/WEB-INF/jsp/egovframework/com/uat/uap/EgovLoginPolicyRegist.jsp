<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>

<script type="text/javaScript" language="javascript">

function fncSelectLoginPolicyList() {
    var varFrom = document.getElementById("loginPolicy");
    varFrom.action = "<c:url value='/uat/uap/selectLoginPolicyList.do'/>";
    varFrom.submit();
}

function fncLoginPolicyInsert() {

    var varFrom = document.getElementById("loginPolicy");
    varFrom.action = "<c:url value='/uat/uap/addLoginPolicy.do'/>";

    if(confirm("<spring:message code="comUatUap.loginPolicyRegist.validate.confirm.save"/>")){ //저장 하시겠습니까?
	    if(ipValidate())
	        varFrom.submit();
	    else
	        return;
    }
}

function ipValidate() {

    var varFrom = document.getElementById("loginPolicy");
    var IPvalue = varFrom.ipInfo.value;

    var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
    var ipArray = IPvalue.match(ipPattern);

    var result = "";
    var thisSegment;

    if(IPvalue == "0.0.0.0") {
        alert(IPvalue + " : <spring:message code="comUatUap.loginPolicyRegist.validate.info.exceptionIP"/>"); //예외 아이피 입니다.
        result = false;
    } else if (IPvalue == "255.255.255.255") {
        alert(result =IPvalue + " : <spring:message code="comUatUap.loginPolicyRegist.validate.info.exceptionIP"/>"); //예외 아이피 입니다.
        result = false;
    } else {
        result = true;
    }

    if(ipArray == null) {
        alert("<spring:message code="comUatUap.loginPolicyRegist.validate.info.invalidForm"/>"); //형식이 일치 하지않습니다.
        result = false;
    } else {
        for (var i=1; i<5; i++) {

            thisSegment = ipArray[i];

            if (thisSegment > 255) {
                alert("<spring:message code="comUatUap.loginPolicyRegist.validate.info.invalidForm"/>"); //형식이 일치 하지않습니다.
                result = false;
            }

            if ((i == 0) && (thisSegment > 255)) {
                alert("<spring:message code="comUatUap.loginPolicyRegist.validate.info.invalidForm"/>"); //형식이 일치 하지않습니다.
                result = false;
            }
        }
    }

    return result;
}

</script>

<style>
.layout-container form {
    width: 100% !important;
}

.wTableFrm table th, .wTable th {
	width: 30%;
}
.wTableFrm table td, .wTable td {
	width: 70%;
}
  
div.btn {
	margin-left: 35%;
}
</style>

</head>

<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="comUatUap.loginPolicyRegist.pageTop.title"/></h2><!-- 로그인정책 등록 -->

<div class="wTableFrm">
	<form:form commandName="loginPolicy" method="post" action="${pageContext.request.contextPath}/uat/uap/addLoginPolicy.do' />">

	<!-- 등록폼 -->
	<table class="wTable">
		<tr>
			<th><spring:message code="comUatUap.loginPolicyRegist.emplyrId"/> <span class="pilsu">*</span></th><!-- 사용자ID -->
			<td class="left">
			    <input id="emplyrId" name="emplyrId" type="text" value="<c:out value='${loginPolicy.emplyrId}'/>" title="<spring:message code="comUatUap.loginPolicyRegist.emplyrId"/>" size="30" maxlength="30" readonly="readonly" /><!-- 사용자ID -->
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUatUap.loginPolicyRegist.emplyrNm"/> <span class="pilsu">*</span></th><!-- 사용자명 -->
			<td class="left">
			    <input id="emplyrNm" type="text" name="emplyrNm" value="<c:out value='${loginPolicy.emplyrNm}'/>" title="<spring:message code="comUatUap.loginPolicyRegist.emplyrNm"/>" size="30" maxlength="50" readonly="readonly" /><!-- 사용자명 -->
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUatUap.loginPolicyRegist.ipInfo"/> <span class="pilsu">*</span></th><!-- IP정보 -->
			<td class="left">
			    <input id="ipInfo" type="text" name="ipInfo" title="<spring:message code="comUatUap.loginPolicyRegist.ipInfo"/>" size="30" maxLength="23" />&nbsp;<form:errors path="ipInfo" /><!-- IP정보 -->
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUatUap.loginPolicyRegist.lmttAt"/> <span class="pilsu">*</span></th><!-- IP제한여부 -->
			<td class="left">
			   <select name="lmttAt" id="lmttAt" title="<spring:message code="comUatUap.loginPolicyRegist.lmttAt"/>"><!-- IP제한여부 -->
		          <option value="Y">Y</option>
		          <option value="N">N</option>
		      </select>&nbsp;<form:errors path="lmttAt" />
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fncLoginPolicyInsert(); return false;" /><!-- 저장 -->
		<span class="btn_s"><a href="<c:url value='/uat/uap/selectLoginPolicyList.do'/>?pageIndex=<c:out value='${loginPolicyVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${loginPolicyVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectLoginPolicyList(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>
	<input type="hidden" name="dplctPermAt" value="Y" >
	<input type="hidden" name="searchCondition" value="<c:out value='${loginPolicyVO.searchCondition}'/>" >
	<input type="hidden" name="searchKeyword" value="<c:out value='${loginPolicyVO.searchKeyword}'/>" >
	<input type="hidden" name="pageIndex" value="<c:out value='${loginPolicyVO.pageIndex}'/>" >
	</form:form>
</div>

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
