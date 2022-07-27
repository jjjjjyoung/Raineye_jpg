<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<title><spring:message code="ussSamIpm.indvdlInfoPolicyUpdt.indvdlInfoPolicyUpdt"/></title><!-- 개인정보보호정책 관리 수정 -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<validator:javascript formName="indvdlInfoPolicy" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_IndvdlInfoPolicy(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_IndvdlInfoPolicy(){
	location.href = "<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_IndvdlInfoPolicy(){
	var varFrom = document.indvdlInfoPolicy;
	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/sam/ipm/updtIndvdlInfoPolicy.do' />";
		if(!validateIndvdlInfoPolicy(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}
</script>
</head>
<body onLoad="fn_egov_init_IndvdlInfoPolicy();">

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="ussSamIpm.indvdlInfoPolicyUpdt.indvdlInfoPolicyUpdt"/></h2><!-- 개인정보보호정책 관리 수정 -->


<form:form commandName="indvdlInfoPolicy" name="indvdlInfoPolicy" action="${pageContext.request.contextPath}/uss/sam/ipm/updtIndvdlInfoPolicy.do" method="post" enctype="multipart/form-data">

<div class="wTableFrm">
	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:24%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyUpdt.indvdlInfoNm"/> <span class="pilsu">*</span></th><!-- 개인정보보호정책 명  -->
			<td class="left">
			    <form:input path="indvdlInfoNm" cssClass="txaIpt" maxlength="255"/>
      			<form:errors path="indvdlInfoNm" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyUpdt.indvdlInfoYn"/> <span class="pilsu">*</span></th><!-- 동의여부 -->
			<td class="left">
			    <select title="<spring:message code="ussSamIpm.indvdlInfoPolicyUpdt.indvdlInfoYn"/>" name="indvdlInfoYn" id="indvdlInfoYn"><!-- 동의여부 -->
	    			<option value="Y" <c:if test="${indvdlInfoPolicy.indvdlInfoYn == 'Y'}">selected</c:if>><spring:message code="input.yes"/></option><!-- 예 -->
	    			<option value="N" <c:if test="${indvdlInfoPolicy.indvdlInfoYn == 'N'}">selected</c:if>><spring:message code="input.no"/></option><!-- 아니오 -->
				</select>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyUpdt.indvdlInfoDc"/> <span class="pilsu">*</span></th><!-- 개인정보보호정책 내용 -->
			<td class="left">
			    <form:textarea path="indvdlInfoDc" rows="10" cols="14" cssClass="txaClass2"/>
				<form:errors path="indvdlInfoDc" cssClass="error"/>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value='<spring:message code="button.save" />' onclick="fn_egov_save_IndvdlInfoPolicy(); return false;" />
		<span class="btn_s"><a href="<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do' />" onclick=""><spring:message code="button.list" /></a></span>
	</div>
	<div style="clear:both;"></div>
</div>

<input name="indvdlInfoId" type="hidden" value="${indvdlInfoPolicy.indvdlInfoId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
<%-- <ckeditor:replace replace="indvdlInfoDc" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor/" /> --%>

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

