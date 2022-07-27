<%
 /**
  * @Class Name : EgovBBSMasterDetail.jsp
  * @Description : EgovBBSMasterDetail íë©´
  * @Modification Information
  * @
  * @  ìì ì¼             ìì ì                   ìì ë´ì©
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   ë°ì ê·              ìµì´ ìì±
  *   2016.06.13   ê¹ì°í¸              íì¤íë ììí¬ v3.6 ê°ì 
  *  @author ê³µíµìë¹ì¤í 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comCopBbs.boardMasterVO.title"/></c:set>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javascript">
/* ********************************************************
 ******************************************************** */
 function fn_egov_delete_bbs(bbsId){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Deleteíê¸° ìí í¤ê°ì ìí
		document.BBSMasterForm.bbsId.value = bbsId;	
		document.BBSMasterForm.action = "<c:url value='/cop/bbs/deleteBBSMaster.do'/>";
		document.BBSMasterForm.submit();	
	}	
}	
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div id="wrap">
    <div class="content">
    
<form name="BBSMasterForm" action="<c:url value='/cop/bbs/updateBBSMasterView.do'/>" method="post">
<div class="wTableFrm">
	<h2>${pageTitle} <spring:message code="title.detail" /></h2>

	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width: ;">
		<col style="width: ;">
		<col style="width: ;">
		<col style="width: ;">
		<col style="width: ;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<tr>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.bbsNm" /></th>
			<td colspan="3" class="left"><c:out value="${result.bbsNm}"/></td>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.bbsTyCode" /></th>
			<td class="left"><c:out value="${result.bbsTyCodeNm}"/></td>
		</tr>
		<tr>
			<th><spring:message code="table.reger" /></th>
			<td class="left"><c:out value="${result.frstRegisterNm}"/></td>
			<th><spring:message code="table.regdate" /></th>
			<td class="left"><c:out value="${result.frstRegisterPnttm}"/></td>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.useAt" /></th>
			<td class="left"><c:out value="${result.useAt}"/></td>
		</tr>
		<tr>
<%-- 			<th><spring:message code="comCopBbs.boardMasterVO.detail.replyPosblAt" /></th>
			<td class="left"><c:out value="${result.replyPosblAt}"/></td> --%>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.fileAtchPosblAt" /></th>
			<td colspan="3" class="left"><c:out value="${result.fileAtchPosblAt}"/></td>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.atchPosblFileNumber" /></th>
			<td class="left"><c:out value="${result.atchPosblFileNumber}"/></td>
		</tr>
		<tr>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.bbsIntrcn" /></th>
			<td colspan="5" class="cnt">
				<c:out value="${fn:replace(result.bbsIntrcn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		
		<c:if test="${result.useAt == 'Y' }">
			<tr>
				<th><spring:message code="comCopBbs.boardMasterVO.detail.bbsAdres" /></th>
				<td colspan="5" class="cnt">
				<a href="<c:url value='/cop/bbs/selectArticleList.do?bbsId=${result.bbsId}' />">/cop/bbs/selectArticleList.do?bbsId=${result.bbsId }</a>	
				</td>
			</tr>
		</c:if>
<%-- 		<tr>
			<th><spring:message code="comCopBbs.boardMasterVO.detail.option" /></th>
			<td colspan="5" class="cnt">
				<c:if test="${result.option == ''}"><spring:message code="comCopBbs.boardMasterVO.detail.option1" /></c:if>
				<c:if test="${result.option == 'comment'}"><spring:message code="comCopBbs.boardMasterVO.detail.option2" /></c:if>
				<c:if test="${result.option == 'stsfdg'}"><spring:message code="comCopBbs.boardMasterVO.detail.option3" /></c:if>
			</td>
		</tr> --%>
	</tbody>
	</table>
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
		<span class="btn_s" style="background: none !important;"><a href="<c:url value='/cop/bbs/selectBBSMasterInfs.do' /><c:if test='${result.cmmntyId != null}'>?cmmntyId=${result.cmmntyId}</c:if>"  title="<spring:message code="title.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
	
</div>

<input name="cmmntyId" type="hidden" value="<c:out value="${result.cmmntyId}" />">
<input name="bbsId" type="hidden" value="<c:out value="${result.bbsId}" />">
<input name="cmd" type="hidden" value="">
</form>

</div><!-- end content -->
</div><!-- end wrap -->


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
