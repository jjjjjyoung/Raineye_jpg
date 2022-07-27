
<%
	/**
	 * @Class Name : EgovArticleList.jsp
	 * @Description : EgovArticleList íë©´
	 * @Modification Information
	 * @
	 * @  ìì ì¼             ìì ì                   ìì ë´ì©
	 * @ -------    --------    ---------------------------
	 * @ 2009.02.01   ë°ì ê·              ìµì´ ìì±
	 *   2016.06.13   ê¹ì°í¸              íì¤íë ììí¬ v3.6 ê°ì 
	 *   2018.06.15   ì ì©í¸              íì´ì§ ì²ë¦¬ ì¤ë¥ ê°ì 
	 *  @author ê³µíµìë¹ì¤í
	 *  @since 2009.02.01
	 *  @version 1.0
	 *  @see
	 *
	 */
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle">
	<spring:message code="comCopBbs.articleVO.title" />
</c:set>

<title>${pageTitle}<spring:message code="title.detail" /></title>
<!-- ê²ìê¸ ìì¸ì¡°í -->
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet"
	type="text/css">


<c:import url="/sym/mnu/mpm/EgovMainCustomHead.do" />



<c:choose>
	<c:when test="${preview == 'true'}">
		<script type="text/javascript">
			/*********************************************************
			 * ì´ê¸°í
			 ******************************************************** */
			function fn_egov_init() {
				// ì²« ìë ¥ëì í¬ì»¤ì¤..
				document.articleForm.searchCnd.focus();
			}

			/*********************************************************
			 * íì´ì§ ì²ë¦¬ í¨ì
			 ******************************************************** */
			function fn_egov_select_linkPage(pageNo) {
			}
			/*********************************************************
			 * ì¡°í ì²ë¦¬ í¨ì
			 ******************************************************** */
			function fn_egov_search_article() {
			}
			/* ********************************************************
			 * ìì¸íë©´ ì²ë¦¬ í¨ì
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
			 * ì´ê¸°í
			 ******************************************************** */
			function fn_egov_init() {
				// ì²« ìë ¥ëì í¬ì»¤ì¤..
				document.articleForm.searchCnd.focus();
			}

			/*********************************************************
			 * íì´ì§ ì²ë¦¬ í¨ì
			 ******************************************************** */
			function fn_egov_select_linkPage(pageNo) {
				document.articleForm.pageIndex.value = pageNo;
				document.articleForm.action = "<c:url value='/cop/bbs/selectArticleList.do'/>";
				document.articleForm.submit();
			}
			/*********************************************************
			 * ì¡°í ì²ë¦¬ í¨ì
			 ******************************************************** */
			function fn_egov_search_article() {
				document.articleForm.pageIndex.value = 1;
				document.articleForm.submit();
			}
			/* ********************************************************
			 * ìì¸íë©´ ì²ë¦¬ í¨ì
			 ******************************************************** */
			function fn_egov_inquire_articledetail(bbsId, nttId) {
				// ì¬ì´í¸ í¤ê°(siteId) ìí.
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
	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>
	<div class="hide">저작권</div>
	<div id="wrap">
		<div class="content">
			<div class="policy">
			<%-- <h2>${pageTitle} <spring:message code="title.list" /> (<c:out value="${boardMasterVO.bbsNm}"/>)</h2> --%><!-- ê²ìê¸ ëª©ë¡ -->
			<h2>저작권보호정책</h2>
					<div class="text-area">
					<c:out value="${cpyrhtPrtc.cpyrhtPrtcPolicyCn}" escapeXml="false" />
					</div>
			</div><!-- end policy -->
		</div>
		<!-- end content -->
	</div>
	<!-- end wrap -->

	<%@include file="/WEB-INF/jsp/egovframework/com/main_bottom.jsp"%>