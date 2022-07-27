<%
 /**
  * @Class Name : EgovArticleDetail.jsp
  * @Description : EgovArticleDetail íë©´
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>CMS CO</title><!-- ê²ìê¸ ìì¸ì¡°í -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

<!-- header -->
<c:import url="/sym/mnu/mpm/EgovMainCustomHead.do" />


<script type="text/javascript">
/* ********************************************************
 * ì­ì ì²ë¦¬
 ******************************************************** */
 function fn_egov_delete_article(form){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Deleteíê¸° ìí í¤ê°ì ìí
		form.submit();	
	}	
}	

/* ********************************************************
 * ëµê¸ìì±
 ******************************************************** */
 function fn_egov_reply_article() {
		document.articleForm.action = "<c:url value='/cop/bbs/replyArticleView.do'/>";
		document.articleForm.submit();
	}
	
</script>
<!-- ëê¸ ìì± ì¤í¬ë¦½í¸  -->
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleComment" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
function fn_egov_insert_commentList() {
	
	var form = document.getElementById("articleCommentVO");

	if (!validateArticleComment(form)){
		return;
	}
	if (confirm('<spring:message code="common.regist.msg" />')) {
		form.submit();
	}
}

function fn_egov_updt_commentList() {
	
	var form = document.getElementById("articleCommentVO");
	
	if (!validateArticleComment(form)){
		return;
	}

	if (confirm('<spring:message code="common.update.msg" />')) {
		form.modified.value = "true";
		form.action = "<c:url value='/cop/cmt/updateArticleComment.do'/>";
		form.submit();
	}
}

function fn_egov_selectCommentForupdt(commentNo) {
	
	var form = document.getElementById("articleCommentVO");
	
	form.commentNo.value = commentNo;
	form.action = "<c:url value='/cop/bbs/selectArticleDetail.do'/>";
	form.submit();
}

function fn_egov_deleteCommentList(commentNo) {

	var form = document.getElementById("articleCommentVO");
	
	if (confirm('<spring:message code="common.delete.msg" />')) {
		form.modified.value = "true";
		form.commentNo.value = commentNo;
		form.action = "<c:url value='/cop/cmt/deleteArticleComment.do'/>";
		form.submit();
	}
}

/* ëê¸íì´ì§ */
function fn_egov_select_commentList(pageNo) {
	
	var form = document.getElementById("articleCommentVO");
	
	form.subPageIndex.value = pageNo;
	form.commentNo.value = '';
	form.action = "<c:url value='/cop/bbs/selectArticleDetail.do'/>";
	form.submit();
}

</script>

<!-- 2009.06.29 : 2ë¨ê³ ê¸°ë¥ ì¶ê°  -->
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>

</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div id="wrap">
    <div class="content">
     
		<div class="wTableFrm">
			<!-- íì´í -->
			<h2>${pageTitle} <spring:message code="title.detail" /></h2><!-- ê²ìê¸ ìì¸ì¡°í -->
			<!-- ìì¸ì¡°í -->
			<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />" style="border-top: 3px solid #6bc3b0;">
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
				<!-- ê¸ ì ëª© -->
				<tr>
					<th><spring:message code="comCopBbs.articleVO.detail.nttSj" /></th>
					<td colspan="5" class="left"><c:out value="${result.nttSj}"/></td>
				</tr>
				<!-- ìì±ì, ìì±ìê°, ì¡°íì -->
				<tr>
					<th><spring:message code="table.reger" /></th>
					<td class="left"><c:out value="${result.frstRegisterNm}"/></td>
					<th><spring:message code="table.regdate" /></th>
					<td class="left"><c:out value="${result.frstRegisterPnttm}"/></td>
					<th><spring:message code="comCopBbs.articleVO.detail.inqireCo" /></th>
					<td class="left"><c:out value="${result.inqireCo}"/></td>
				</tr>
				<!-- ê¸ ë´ì© -->
				<tr>
					<th class="vtop"><spring:message code="comCopBbs.articleVO.detail.nttCn" /></th>
					<td colspan="5" class="cnt">
						<c:out value="${fn:replace(result.nttCn , crlf , '<br/>')}" escapeXml="false" />
					</td>
				</tr>
				<!-- ê²ìì¼ì -->
				<tr>
					<th class="vtop"><spring:message code="comCopBbs.articleVO.detail.ntceDe" /></th>
					<td colspan="5" class="left">
						<c:out value="${result.ntceBgnde} ~ ${result.ntceEndde}" escapeXml="false" />
					</td>
				</tr>
				<!-- ì²¨ë¶íì¼  -->
				<c:if test="${not empty result.atchFileId}">
				<tr>
					<th><spring:message code="comCopBbs.articleVO.detail.atchFile" /></th>
					<td colspan="5">
						<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
						<c:param name="param_atchFileId" value="${result.atchFileId}" />
					</c:import>
					</td>
				</tr>
			  	</c:if>
				
			</tbody>
			</table>
			<!-- íë¨ ë²í¼ -->
			<div class="btn">
				<c:if test="${user != null }">
				<!-- ìµëªê¸ ìì /ì­ì  ë¶ê°  -->
				<form name="articleForm" action="<c:url value='/cop/bbs/updateArticleView.do'/>" method="post" style="float:left;">
					<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" /><!-- ìì  -->
					<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
					<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
					<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
					<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
					<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
					<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
				</form>
				<form name="formDelete" action="<c:url value='/cop/bbs/deleteArticle.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
					<input type="submit" class="s_submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" onclick="fn_egov_delete_article(this.form); return false;"><!-- ì­ì  -->
					<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
					<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
				</form>
				
					<c:if test="${boardMasterVO.replyPosblAt == 'Y' }">
					<form name="formReply" action="<c:url value='/cop/bbs/replyArticleView.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
						<input type="submit" class="s_submit" value="<spring:message code="button.reply" />"><!-- ëµê¸ -->
						<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
						<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
					</form>
					</c:if>
				</c:if>
				<form name="formList" action="<c:url value='/cop/bbs/selectArticleList.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
					<input type="submit" class="s_submit" value="<spring:message code="button.list" />"><!-- ëª©ë¡ -->
					<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
				</form>
				
			</div><div style="clear:both;"></div>
			
		</div>
		
		<!-- ëê¸ -->
		<c:if test="${useComment == 'true'}">
			<c:import url="/cop/cmt/selectArticleCommentList.do" charEncoding="utf-8">
			</c:import>
		</c:if>
		
		<c:if test="${useSatisfaction == 'true'}">
			<form name="frm" method="post" action="">
			<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
			<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
			<c:import url="/cop/stf${prefix}/selectSatisfactionList.do" charEncoding="utf-8">
				<c:param name="type" value="body" />
			</c:import>
			</form>
		</c:if>
		
		
	</div><!-- end content -->
</div><!-- end wrap -->


<%@include file="/WEB-INF/jsp/egovframework/com/main_bottom.jsp"%>