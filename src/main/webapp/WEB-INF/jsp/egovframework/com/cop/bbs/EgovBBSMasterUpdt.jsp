
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.boardMasterVO.title"/></c:set>
<title>${pageTitle } <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<validator:javascript formName="boardMasterVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 ******************************************************** */
function fn_egov_init(){
	document.getElementById("boardMasterVO").bbsNm.focus();
}
/* ********************************************************
 ******************************************************** */
function fn_egov_updt_bbs(form, bbsId){
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
				alert("첨부가능파일숫자를 입력하세요."")
				return;
			}
		}
		
		if(confirm("<spring:message code="common.update.msg" />")){	
			form.submit();	
		}					
	}	
}
/* ********************************************************
 ******************************************************** */
function fn_egov_inqire_bbslist() {
	boardMasterVO.action = "<c:url value='/cop/bbs/selectBBSMasterInfs.do'/>";
	boardMasterVO.submit();	
}
</script>
</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div id="wrap">
    <div class="content">
    
<form:form commandName="boardMasterVO" action="${pageContext.request.contextPath}/cop/bbs/updateBBSMaster.do" method="post" onSubmit="fn_egov_updt_bbs(document.forms[0]); return false;">  
<div class="wTableFrm">
	<h2>${pageTitle} <spring:message code="title.update" /></h2><!-- ê²ìí ë§ì¤í° ìì  -->

	<table class="wTable" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />" style="border-top: 3px solid #6bc3b0;">
	<caption>${pageTitle} <spring:message code="title.update" /></caption>
	<colgroup>
		<col style="width: 20%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.updt.bbsNm"/> </c:set>
		<tr>
			<th><label for="bbsNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="bbsNm" title="${title} ${inputTxt }" size="70" maxlength="70" />
   				<div><form:errors path="bbsNm" cssClass="error" /></div>     
			</td>
		</tr>
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.updt.bbsIntrcn"/> </c:set>
		<tr>
			<th><label for="bbsIntrcn">${title} <span class="pilsu">*</span></label></th>
			<td class="nopd">
				<form:textarea path="bbsIntrcn" title="${title} ${inputTxt}" cols="300" rows="20"/>
				<div><form:errors path="bbsIntrcn" cssClass="error" /></div>  
			</td>
		</tr>
		
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.updt.bbsTyCode"/> </c:set>
		<tr style="display: none;">
			<th><label for="bbsTyCode">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="bbsTyCode" title="${title} ${inputTxt}" cssClass="txt">
					<form:option value='' label="--선택하세요--" />
				   <form:options items="${bbsTyCode}" itemValue="code" itemLabel="codeNm" />
				</form:select>
				<div><form:errors path="bbsTyCode" cssClass="error" /></div>       
			</td>
		</tr>
		
		
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.updt.fileAtchPosblAt"/> </c:set>
		<tr>
			<th><label for="fileAtchPosblAt">${title}<span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="fileAtchPosblAt" title="${title} ${inputTxt}" cssClass="txt">
					<form:option value='' label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="fileAtchPosblAt" cssClass="error" /></div>       
			</td>
		</tr>
		
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.updt.atchPosblFileNumber"/> </c:set>
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
		
		<%-- <tr>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.option" /></th>
			<td class="left">
				<select name="option" class="select" <c:if test="${boardMasterVO.option != 'na'}">disabled="disabled"</c:if> title="">
					<option value='na' <c:if test="${boardMasterVO.option == 'na'}">selected="selected"</c:if>>---<spring:message code="input.select" />--</option>
					<option value='' <c:if test="${boardMasterVO.option == ''}">selected="selected"</c:if>><spring:message code="comCopBbs.boardMasterVO.detail.option1" /></option>
					<c:if test="${useComment == 'true' }">
						<option value='comment' <c:if test="${boardMasterVO.option == 'comment'}">selected="selected"</c:if>><spring:message code="comCopBbs.boardMasterVO.detail.option2" /></option>
					</c:if>
					<c:if test="${useSatisfaction == 'true' }">
						<option value='stsfdg' <c:if test="${boardMasterVO.option == 'stsfdg'}">selected="selected"</c:if>><spring:message code="comCopBbs.boardMasterVO.detail.option3" /></option>
					</c:if>
				</select>
				<spring:message code="comCopBbs.boardMasterVO.detail.option.unabledToModify" />
			</td>
		</tr> --%>

		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.updt.useAt"/> </c:set>
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

	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
		<span class="btn_s" style="background: none !important;"><a href="<c:url value='/cop/bbs/selectBBSMasterInfs.do' /><c:if test='${boardMasterVO.cmmntyId != null}'>?cmmntyId=${boardMasterVO.cmmntyId}</c:if>"  title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
	 
</div>

<!-- validator ê° ì²´í¬ì© -->
<input name="replyPosblAt" type="hidden" value="<c:out value='${boardMasterVO.replyPosblAt}'/>">
<input name="cmmntyId" type="hidden" value="<c:out value='${boardMasterVO.cmmntyId}'/>">
<input name="bbsId" type="hidden" value="<c:out value='${boardMasterVO.bbsId}'/>">
</form:form>


</div><!-- end content -->
</div><!-- end wrap -->


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
