<%
/**
 * @Class Name  : EgovAuthorInsert.java
 * @Description : EgovAuthorInsert jsp
 * @Modification Information
 * @
 * @  ìì ì¼         ìì ì          ìì ë´ì©
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          ìµì´ ìì±
 *   2016.06.13    ì¥ëí            íì¤íë ììí¬ v3.6 ê°ì 
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *
 */
 %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopSecGmt.title"/></c:set>


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">
	
<script type="text/javaScript" language="javascript">

function fncSelectGroupList() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sec/gmt/EgovGroupList.do'/>";
    varFrom.submit();
}

function fncGroupInsert(form) {

    if(confirm("<spring:message code="common.regist.msg" />")){	//ë±ë¡íìê² ìµëê¹?
        if(!validateGroupManage(form)){
            return false;
        }else{
        	form.submit();
        }
    }
}

</script> 
</head>

<body>

<div class="layout-container">

	<!-- íì´í -->
	<h2>${pageTitle} <spring:message code="title.create" /></h2><!-- ê·¸ë£¹ê´ë¦¬ ë±ë¡ -->


<form:form commandName="groupManage" method="post" action="${pageContext.request.contextPath}/sec/gmt/EgovGroupInsert.do" onSubmit="fncGroupInsert(document.forms[0]); return false;"> 
<div class="wTableFrm">
	<!-- ë±ë¡í¼ -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- ìë ¥ -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- ê·¸ë£¹ëª -->
		<c:set var="title"><spring:message code="comCopSecGmt.regist.groupNm" /></c:set>
		<tr>
			<th>${title} <span class="pilsu">*</span></th>
			<td class="left">
				<form:input path="groupNm" title="${title} ${inputTxt}" size="40" maxlength="50" />
				<div><form:errors path="groupNm" cssClass="error" /></div> 
			</td>
		</tr>
		<!-- ì¤ëª -->
		<c:set var="title"><spring:message code="comCopSecGmt.regist.groupDc" /></c:set>
		<tr>
			<th>${title}</th>
			<td class="left">
			    <form:textarea path="groupDc" title="${title} ${inputTxt}" cols="300" rows="10" />   
				<div><form:errors path="groupDc" cssClass="error" /></div> 
			</td>
		</tr>
	</tbody>
	</table>

	<!-- íë¨ ë²í¼ -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- ë±ë¡ -->
		<span class="btn_s"><a href="<c:url value='/sec/gmt/EgovGroupList.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- ëª©ë¡ -->
	</div><div style="clear:both;"></div>
	
</div>
</form:form>	

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

