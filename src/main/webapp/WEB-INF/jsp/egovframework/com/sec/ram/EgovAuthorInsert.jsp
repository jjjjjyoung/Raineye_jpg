<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopSecRam.title"/></c:set>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javaScript" language="javascript">
function fncSelectAuthorList() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
	varFrom.submit();
}

function fncAuthorInsert(form) {
	if(confirm("<spring:message code="common.regist.msg" />")){	//ë±ë¡íìê² ìµëê¹?
        if(!validateAuthorManage(form)){
        	return false;
        }else{
        	form.submit();
        }
    }
}

function fncAuthorUpdate() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorUpdate.do'/>";

	if(confirm("<spring:message code="common.regist.msg" />")){	//ë±ë¡íìê² ìµëê¹?
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorDelete() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorDelete.do'/>";
	if(confirm("<spring:message code="common.delete.msg" />")){ //ì­ì íìê² ìµëê¹?
	    varFrom.submit();
	}
}
</script>

</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="layout-container">

	<!-- íì´í -->
	<h2>${pageTitle} <spring:message code="title.create" /></h2><!-- ê¶íê´ë¦¬ ë±ë¡ -->


<form:form commandName="authorManage" action="${pageContext.request.contextPath}/sec/ram/EgovAuthorInsert.do" method="post" onSubmit="fncAuthorInsert(document.forms[0]); return false;"> 
<div class="wTableFrm">
	<!-- ë±ë¡í¼ -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>

	<tbody>
		<!-- ìë ¥ -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- ê¶íì½ë -->
		<c:set var="title"><spring:message code="comCopSecRam.regist.authorCode" /></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
			    <form:input path="authorCode" title="${title} ${inputTxt}" size="40" maxlength="30" />
   				<div><form:errors path="authorCode" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- ê¶íëª -->
		<c:set var="title"><spring:message code="comCopSecRam.regist.authorNm" /></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
			    <form:input path="authorNm" title="${title} ${inputTxt}" size="40" maxlength="60" />
   				<div><form:errors path="authorNm" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- ì¤ëª -->
		<c:set var="title"><spring:message code="comCopSecRam.regist.authorDc" /></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
			    <form:textarea path="authorDc" title="${title} ${inputTxt}" cols="300" rows="10" />   
				<div><form:errors path="authorDc" cssClass="error" /></div> 
			</td>
		</tr>
	</tbody>
	</table>

	<!-- íë¨ ë²í¼ -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- ë±ë¡ -->
		<span class="btn_s"><a href="<c:url value='/sec/ram/EgovAuthorList.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- ëª©ë¡ -->
	</div><div style="clear:both;"></div>
	
</div>
</form:form>	

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

