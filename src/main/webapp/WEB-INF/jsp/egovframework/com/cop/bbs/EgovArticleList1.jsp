

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>

<title>CMS CO</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">


<c:import url="/sym/mnu/mpm/EgovMainCustomHead.do" />



<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
/*********************************************************
 ™”
 ******************************************************** */
function fn_egov_init(){

	document.articleForm.searchCnd.focus();
}

/*********************************************************

 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
}
/*********************************************************

 ******************************************************** */
function fn_egov_search_article(){
}
/* ********************************************************
 ˆ˜
 ******************************************************** */
function fn_egov_inquire_articledetail(bbsId, nttId) {
	alert('test');
	return true;
}
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
/*********************************************************
 ™”
 ******************************************************** */
function fn_egov_init(){
	
	document.articleForm.searchCnd.focus();
}

/*********************************************************
 
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	document.articleForm.pageIndex.value = pageNo;
	document.articleForm.action = "<c:url value='/cop/bbs/selectArticleList.do'/>";
   	document.articleForm.submit();
}
/*********************************************************
 
 ******************************************************** */
function fn_egov_search_article(){
	document.articleForm.pageIndex.value = 1;
	document.articleForm.submit();
}
/* ********************************************************
 ˆ˜
 ******************************************************** */
function fn_egov_inquire_articledetail(bbsId, nttId) {
	
	document.articleForm.bbsId.bbsId.value = bbsId;
	document.articleForm.nttId.value = nttId;
  	document.articleForm.action = "<c:url value='/cop/bbs/selectArticleDetail.do'/>";
  	document.articleForm.submit();
}
</script>
</c:otherwise>
</c:choose>
</head>
<body onload="fn_egov_init()">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div id="wrap">
    <div class="content">
    
	<form name="articleForm" action="<c:url value='/cop/bbs/selectArticleList.do'/>" method="post" onSubmit="fn_egov_search_article(); return false;"> 
	<div class="board">
		<h2>${pageTitle} <spring:message code="title.list" /> (<c:out value="${boardMasterVO.bbsNm}"/>)</h2>
		<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
			<ul>
				<li>
					<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
						<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.nttSj" /></option>
						<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.nttCn" /></option>
						<option value="2"  <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> ><spring:message code="table.reger" /></option>
					</select>
				</li>
				
				<li>
					<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
					<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
					<c:if test="${user != null }">
						<span class="btn_b">
							<a href="<c:url value='/cop/bbs/insertArticleView.do?bbsId=${boardMasterVO.bbsId}' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />">
								<spring:message code="button.create" />
							</a>
						</span>
					</c:if>
				</li>
			</ul>
		</div>
		
		<input name="nttId" type="hidden" value="0">
		<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		</form>
		
	<table class="board_list board_list2" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 9%;">
		<col style="width: 40%;">
		<col style="width: 13%;">
		<col style="width: 13%;">
		<col style="width: 13%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th>
		<th class="board_th_link"><spring:message code="comCopBbs.articleVO.list.nttSj" /></th>
		<th><spring:message code="table.reger" /></th>
		<th><spring:message code="table.regdate" /></th>
		<th><spring:message code="comCopBbs.articleVO.list.inqireCo" /></th>
	</tr>
	</thead>
	<tbody class="ov">
	
	
	<c:forEach items="${noticeList}" var="noticeInfo" varStatus="status">
	<tr>
		<td><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_notice.png'/>" alt="notice"></td>
		<td class="bold">
			<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
			    <input name="nttId" type="hidden" value="<c:out value="${noticeInfo.nttId}"/>">
			    <input name="bbsId" type="hidden" value="<c:out value="${noticeInfo.bbsId}"/>">
			    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			    <span class="link"><input type="submit" value="<c:out value='${fn:substring(noticeInfo.nttSj, 0, 40)}'/><c:if test="${noticeInfo.commentCo != ''}">	<c:out value='[${noticeInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0; <c:if test="${noticeInfo.sjBoldAt == 'Y'}">font-weight : bold;</c:if>">
			    </span>
			</form>
		</td>
		<td><c:out value='${noticeInfo.frstRegisterNm}'/></td>
		<td><c:out value='${noticeInfo.frstRegisterPnttm}'/></td>
		<td><c:out value='${noticeInfo.inqireCo}'/></td>		
	</tr>
	</c:forEach>
	
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		
	<c:choose>
		<c:when test="${resultInfo.sjBoldAt == 'Y'}">
		
		<td class="bold">
		<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
			    <input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
			    <input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
			    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			    <span class="link">
			    	<c:if test="${resultInfo.replyLc!=0}">
			    		<c:forEach begin="0" end="${resultInfo.replyLc}" step="1">&nbsp;	</c:forEach>
			    		<img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt="secret">
			    	</c:if>
			    	
			    <input type="submit" value="<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}"><c:out value='[${resultInfo.commentCo}]'/></c:if>" 
			    style="border:0px solid #e0e0e0; <c:if test="${resultInfo.sjBoldAt == 'Y'}">font-weight : bold;</c:if>"></span>
		</form>
		</td>
		</c:when>	
		<c:when test="${resultInfo.secretAt == 'Y' && sessionUniqId != resultInfo.frstRegisterId}">
		
		<td class="left">
		<c:if test="${resultInfo.replyLc!=0}">
    		<c:forEach begin="0" end="${resultInfo.replyLc}" step="1">
    			&nbsp;
    		</c:forEach>
    	</c:if>
		<img src="<c:url value='/images/egovframework/com/cop/bbs/icon_lock.png'/>" alt="secret">&nbsp;<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/>
		<c:if test="${resultInfo.commentCo != ''}">
			<c:out value='[${resultInfo.commentCo}]'/>
		</c:if>
		</td>
		</c:when>
		<c:otherwise>
		
		<td class="left">
			<c:choose>
			<c:when test="${preview == 'true'}">
				    <input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
				    <input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
				    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				    <span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1">&nbsp;	</c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt="secret"></c:if><input type="submit" value="<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}">	<c:out value='[${resultInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;"></span>
			</c:when>
			<c:otherwise>
		    	<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
					    <input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
					    <input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
					    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
					    <span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1">&nbsp;	</c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt="secret"></c:if><input type="submit" value="<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}">	<c:out value='[${resultInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;"></span>
				</form>
			</c:otherwise>
			</c:choose>
		</td>
		</c:otherwise>
	</c:choose>
		<td><c:out value='${resultInfo.frstRegisterNm}'/></td>
		<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
		<td><c:out value='${resultInfo.inqireCo}'/></td>		
	</tr>
	</c:forEach>

	<c:if test="${fn:length(resultList) == 0}">
	
	<tr>
		<td colspan="5"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div>
	
	
	<!-- 
	<div class="btn">
		<span class="btn_s"><a href="<c:url value='/cop/bbs/insertBBSMasterView.do' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span>
	</div>
	-->



    </div>
</div>

<%@include file="/WEB-INF/jsp/egovframework/com/main_bottom.jsp"%>