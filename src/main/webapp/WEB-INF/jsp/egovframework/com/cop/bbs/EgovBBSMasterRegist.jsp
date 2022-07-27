<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.boardMasterVO.title"/></c:set>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">


<title>${pageTitle} <spring:message code="title.create" /></title><!-- ê²ìí ë§ì¤í° ë±ë¡ -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="boardMasterVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 ******************************************************** */
function fn_egov_init(){

	document.getElementById("boardMasterVO").bbsNm.focus();

}
/* ********************************************************
 ******************************************************** */
function fn_egov_regist_bbs(form){
	//input item Client-Side validate
	if (!validateBoardMasterVO(form)) {	
		return false;
	} else {
		
		var validateForm = document.getElementById("boardMasterVO");

		if(validateForm.bbsTyCode.value == 'BBST03') {
			if(validateForm.replyPosblAt.value == 'Y') {
				alert("<spring:message code="comCopBbs.boardMasterVO.guestReply" />");
				return;
			}
			if(validateForm.fileAtchPosblAt.value == 'Y') {
				alert("<spring:message code="comCopBbs.boardMasterVO.guestFile" />");
				return;
			}
		} else {
			if(validateForm.fileAtchPosblAt.value == 'Y' && validateForm.atchPosblFileNumber.value == '0') {
				alert('ì²¨ë¶ê°ë¥íì¼ì«ìë¥¼ ì ííì¸ì.');
				return;
			}
		}
		
		if(confirm("<spring:message code="common.regist.msg" />")){	
			form.submit();	
		}
	} 
}
</script>

<style>
select {
    height: 30px;
    line-height: 30px;
    border: 1px solid #ccc;
}
</style>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="layout-container">

	<h2>${pageTitle} <spring:message code="title.create" /></h2>
	
<form:form commandName="boardMasterVO" action="${pageContext.request.contextPath}/cop/bbs/insertBBSMaster.do" method="post" onSubmit="fn_egov_regist_bbs(document.forms[0]); return false;"> 
<div class="wTableFrm">

	<table class="datatables-demo table table-striped table-bordered dataTable no-footer" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 20%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- ê²ìíëª -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsNm"/> </c:set>
		<tr>
			<th><label for="bbsNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="bbsNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="bbsNm" cssClass="error" /></div>     
			</td>
		</tr>
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsIntrcn"/> </c:set>
		<tr>
			<th><label for="bbsIntrcn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd">
				<form:textarea path="bbsIntrcn" title="${title} ${inputTxt}" cols="300" rows="20" />   
				<div><form:errors path="bbsIntrcn" cssClass="error" /></div>  
			</td>
		</tr>
		
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsTyCode"/> </c:set>
		<tr>
			<th><label for="bbsTyCode">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="bbsTyCode" title="${title} ${inputTxt}" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:options items="${bbsTyCode}" itemValue="code" itemLabel="codeNm" />
				</form:select>
				<div><form:errors path="bbsTyCode" cssClass="error" /></div>       
			</td>
		</tr>
		<!-- 
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.replyPosblAt"/> </c:set>
		<tr>
			<th><label for="replyPosblAt">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="replyPosblAt" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="replyPosblAt" cssClass="error" /></div>       
			</td>
		</tr>
		 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.fileAtchPosblAt"/> </c:set>
		<tr>
			<th><label for="fileAtchPosblAt">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="fileAtchPosblAt" title="${title} ${inputTxt}" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="fileAtchPosblAt" cssClass="error" /></div>       
			</td>
		</tr>
		
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.atchPosblFileNumber"/> </c:set>
		<tr>
			<th><label for="atchPosblFileNumber">${title } <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="atchPosblFileNumber" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="0" selected="selected">없음</form:option>
					<form:option value='1'>1</form:option>
	  		   		<form:option value='2'>2</form:option>
	  		   		<form:option value='3'>3</form:option>
				</form:select>
				<div><form:errors path="atchPosblFileNumber" cssClass="error" /></div>       
			</td>
		</tr>
		<!-- 
		<c:if test="${useComment == 'true' || useSatisfaction == 'true'}">
		  <tr>
		    <th><label for="option"><spring:message code="comCopBbs.boardMasterVO.detail.option" />&nbsp;&nbsp;&nbsp;&nbsp;</label></th>
		    <td class="left">
		     	<form:select path="option" title="추가선택사항선택" >
		  		   <form:option value=""  label="미선택" />
		  		   <c:if test="${useComment == 'true'}">
		  		   	 <form:option value='comment'><spring:message code="comCopBbs.boardMasterVO.detail.option2" /></form:option>
		  		   </c:if>
		  		   <c:if test="${useSatisfaction == 'true'}">
		  		   	<form:option value='stsfdg'><spring:message code="comCopBbs.boardMasterVO.detail.option3" /></form:option>
		  		   </c:if>
		  	   </form:select>
		    </td>
		  </tr>
		</c:if>
		 -->
		<!-- 2009.06.26 : 2단계 기능 추가 방법 변경 -->
		
		<!-- 사용여부 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.useAt"/> </c:set>
		<tr>
			<th><label for="useAt">${title } <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="useAt" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="useAt" cssClass="error" /></div>       
			</td>
		</tr>
		
	</tbody>
	</table>

	<!-- íë¨ ë²í¼ -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- ë±ë¡ -->
		<span class="btn_s"><a href="<c:url value='/cop/bbs/selectBBSMasterInfs.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- ëª©ë¡ -->
	</div><div style="clear:both;"></div>
	
</div>

<input name="cmmntyId" type="hidden" value="<c:out value='${searchVO.cmmntyId}'/>">
<input name="blogId" type="hidden" value="<c:out value='${searchVO.blogId}'/>">
<input name="blogAt" type="hidden" value="<c:out value='${searchVO.blogAt}'/>">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>


</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>