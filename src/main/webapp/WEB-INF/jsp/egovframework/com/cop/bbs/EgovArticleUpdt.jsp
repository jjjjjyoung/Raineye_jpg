<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<c:set var="pageTitle">
	<spring:message code="comCopBbs.articleVO.title" />
</c:set>

<title>CMS CO</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<validator:javascript formName="articleVO" staticJavascript="false"	xhtml="true" cdata="false" />


<c:import url="/sym/mnu/mpm/EgovMainCustomHead.do" />


dddd

<script type="text/javascript">
$(function() {
	$("#ntceBgnde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true 
	         , changeYear: true 
	         , showButtonPanel: true
	});
	$("#ntceEndde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true 
	         , changeYear: true 
	         , showButtonPanel: true 
	});
});



/* ********************************************************
 
 ******************************************************** */
function fn_egov_init() {
	
	var ckeditor_config = {
			filebrowserImageUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImageCk.do', // íì¼ ì
		};

	CKEDITOR.replace('nttCn',ckeditor_config);

	document.getElementById("articleVO").nttSj.focus();
	
}
/* ********************************************************
 
 ******************************************************** */
function fn_egov_updt_article(form) {
	
	//CKEDITOR.instances.nttCn.updateElement();
	/*
	if (!validateArticleVO(form)) {
		return false;
	} else {
		*/
		var validateForm = document.getElementById("articleVO");
		
		
		if(validateForm.secretAt.checked) {
			if(validateForm.sjBoldAt.checked) {
				alert("<spring:message code="comCopBbs.articleVO.secretBold" />");
				return;
			}
			if(validateForm.noticeAt.checked) {
				alert("<spring:message code="comCopBbs.articleVO.secretNotice" />");
				return;
			}
		}
		
		
		var ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
		var ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

		if(ntceBgnde == '' && ntceEndde != '') {
			validateForm.ntceBgnde.value = '1900-01-01';
		}
		if(ntceBgnde != '' && ntceEndde == '') {
			validateForm.ntceEndde.value = '9999-12-31';
		}
		if(ntceBgnde == '' && ntceEndde == '') {
			validateForm.ntceBgnde.value = '1900-01-01';
			validateForm.ntceEndde.value = '9999-12-31';
		}

		ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
		ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);
		
		if(ntceBgnde > ntceEndde){
			alert("<spring:message code="comCopBbs.articleVO.ntceDeError" />");
			return;
		}
		
		if(validateForm.nttSj.value == ''){
			alert("제목을 입력해주세요.");
			return;
		}
		
		if(validateForm.nttCn.value == ''){
			alert("내용을 입력해주세요.");
			return;
		}
		
		
		if (confirm("<spring:message code="common.update.msg" />")) {
			validateForm.action="/cop/bbs/updateArticle.do";
			validateForm.submit();
		}
	/*}*/
}
/* ********************************************************
 
 ******************************************************** */
function fn_egov_inqire_articlelist() {
	articleVO.action = "<c:url value='/cop/bbs/selectArticleList.do'/>";
	articleVO.submit();
}

</script>
</head>
<body onLoad="fn_egov_init();">

	<!-- javascript warning tag  -->
	<noscript class="noScriptTitle">	<spring:message code="common.noScriptTitle.msg" />	</noscript>

<div id="wrap">
    <div class="content">
    
	
	<form:form commandName="articleVO" action="${pageContext.request.contextPath}/cop/bbs/updateArticle.do" method="post" onSubmit="fn_egov_updt_article(document.forms[0]); return false;" enctype="multipart/form-data">
		<div class="wTableFrm">
			<h2>${pageTitle} <spring:message code="title.update" /></h2>


			<table class="wTable" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />">
				<caption>${pageTitle} <spring:message code="title.update" /></caption>
				<colgroup>
					<col style="width: 20%;">
					<col style="width:;">
					<col style="width:;">
					<col style="width:;">
				</colgroup>
				<tbody>
					
					<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
					
					<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.nttSj" /></c:set>
					<tr>
						<th><label for="nttSj">${title}<span class="pilsu">*</span></label></th>
						<td class="left">
							<form:input path="nttSj" title="${title} ${inputTxt }" size="70" maxlength="70" />
							<div>	<form:errors path="nttSj" cssClass="error" /></div>
						</td>
						<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.sjBoldAt" /></c:set>
						<th><label for="sjBoldAt">${title}</label></th>
						<td class="left">
							<form:checkbox path="sjBoldAt" value="Y" />
							<div>	<form:errors path="sjBoldAt" cssClass="error" /></div>
						</td>
					</tr>

					
					<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.nttCn" /></c:set>
					<tr>
						<th><label for="nttCn">${title}<span class="pilsu">*</span></label></th>
						<td class="nopd" colspan="3">
							<textarea name="nttCn" title="${title} ${inputTxt}" cols="300" rows="20" /><c:out value="${articleVO.nttCn}"/></textarea>
							<ckeditor:replace replace="nttCn" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor/" />
							
						</td>
					</tr>

					
					<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.noticeAt" /></c:set>
					<tr>
						<th><label for="noticeAt">${title}</label></th>
						<td class="left" colspan="3">
							<form:checkbox path="noticeAt"	value="Y" />
							<div>	<form:errors path="noticeAt" cssClass="error" /></div>
						</td>
					</tr>

					
					<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.secretAt" /></c:set>
					<tr>
						<th><label for="secretAt">${title}</label></th>
						<td class="left" colspan="3">
							<form:checkbox path="secretAt"	value="Y" />
							<div>	<form:errors path="secretAt" cssClass="error" /></div>
						</td>
					</tr>

					
					<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.ntceDe"/> </c:set>
					<tr>
						<th><label for="ntceBgnde">${title}</label></th>
						<td class="left" colspan="3">
							<form:input path="ntceBgnde" title="${title} ${inputTxt}" size="70" maxlength="70"  style="width:70px;" readonly="true" />
							&nbsp;~&nbsp;<form:input path="ntceEndde" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:70px;" readonly="true" />
							<div><form:errors path="ntceBgnde" cssClass="error" /></div>       
							<div><form:errors path="ntceEndde" cssClass="error" /></div>       
						</td>
					</tr>
					
					<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
						<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.atchFile"/></c:set>
						<tr>
							<th>${title}</th>
							<td class="nopd" colspan="3">
								<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${articleVO.atchFileId}" />
								</c:import>
							</td>
						</tr>

						<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.atchFileAdd"/></c:set>
						<tr>
							<th><label for="file_1">${title}</label> </th>
							<td class="nopd" colspan="3">
								<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comCopBbs.articleVO.updt.atchFile"/>"/>
							    <div id="egovComFileList"></div>
							</td>
						</tr>

					</c:if>

				</tbody>
			</table>


			<div class="btn">
				<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
				<span class="btn_s"><a href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
			</div>
			<div style="clear: both;"></div>

		</div>
		<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/updateArticleView.do'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
		<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
		<input type="hidden" name="replyPosblAt"	value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
		<input type="hidden" name="fileAtchPosblAt"	value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
		<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
		<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
		<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
		<input name="nttId" type="hidden" value="${articleVO.nttId}">
		<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
	</form:form>


<script type="text/javascript">
var maxFileNum = document.getElementById('atchPosblFileNumber').value;
if(maxFileNum==null || maxFileNum==""){
	maxFileNum = 3;
}
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 


</div><!-- end content -->
</div><!-- end wrap -->


<%@include file="/WEB-INF/jsp/egovframework/com/main_bottom.jsp"%>