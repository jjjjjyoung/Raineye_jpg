
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/sam/ipm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/sam/ipm/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<title><spring:message code="ussSamIpm.indvdlInfoPolicyDetail.indvdlInfoPolicyDetail"/></title><!-- 개인정보보호정책 상세보기 -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

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
function fn_egov_modify_IndvdlInfoPolicy(){
	var vFrom = document.formUpdt;
	vFrom.action = "<c:url value='/uss/sam/ipm/updtIndvdlInfoPolicy.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_IndvdlInfoPolicy(){
	var vFrom = document.formDelete;
	if(confirm("<spring:message code="common.delete.msg"/>")){/* 삭제 하시겠습니까? */
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>

<style>
.layout-container > .wTableFrm > form { width: 450px !important; border-bottom:0 !important; }
div.btn { margin: 0 !important; padding: 0 !important; border-top: 0 !important; background: #fff; border-bottom: 1px solid #6bc3b0; box-shadow: 3px 4px 6px #dbdbdb;}
div.btn form { border: 0 !important; width: auto !important; box-shadow: none; padding: 0 !important; margin-right: 10px; margin-bottom: 10px;}
div.btn form:first-child { margin-left: 33%;}
div.btn form:last-child { margin-right:0;}
</style>
</head>
<body onLoad="fn_egov_init_IndvdlInfoPolicy();">

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="ussSamIpm.indvdlInfoPolicyDetail.indvdlInfoPolicyDetail"/></h2><!-- 개인정보보호정책 상세보기 -->

<div class="wTableFrm">
<form name="IndvdlInfoPolicyForm" action="<c:url value=''/>" method="post">
	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col width="50%">
			<col width="50%">
		</colgroup>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyDetail.indvdlInfoNm"/> <span class="pilsu">*</span></th><!-- 개인정보보호정책 명 -->
			<td class="left">
			    <c:out value="${indvdlInfoPolicy.indvdlInfoNm}" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyDetail.indvdlInfoYn"/> <span class="pilsu">*</span></th><!-- 동의여부 -->
			<td class="left">
			    <c:if test="${indvdlInfoPolicy.indvdlInfoYn == 'Y'}"><spring:message code="input.yes"/></c:if>
				<c:if test="${indvdlInfoPolicy.indvdlInfoYn == 'N'}"><spring:message code="input.no"/></c:if>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyDetail.indvdlInfoDc"/> <span class="pilsu">*</span></th><!-- 개인정보보호정책 내용 -->
			<td class="left">
			    <c:out value="${indvdlInfoPolicy.indvdlInfoDc}" escapeXml="false" />
			</td>
		</tr>
	</table>
</form>
	<!-- 하단 버튼 -->
	<div class="btn">		
		<form name="formUpdt" action="<c:url value='/uss/sam/ipm/updtIndvdlInfoPolicy.do'/>" method="post" style="display:inline"> 
		<input class="s_submit" type="submit" value='<spring:message code="button.update" />' onclick="fn_egov_modify_IndvdlInfoPolicy(); return false;" />
		<input name="indvdlInfoId" type="hidden" value="${indvdlInfoPolicy.indvdlInfoId}">
		</form>
	
		<form name="formDelete" action="<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do'/>" method="post" style="display:inline">
		<input style="background: #efb98d!important;" class="s_submit" type="submit" value='<spring:message code="button.delete" />' onclick="fn_egov_delete_IndvdlInfoPolicy(); return false;" />
		<input name="indvdlInfoId" type="hidden" value="${indvdlInfoPolicy.indvdlInfoId}">
		<input name="cmd" type="hidden" value="<c:out value='del'/>">
		</form> 
	
		<form name="formList" action="<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do'/>" method="post" style="display:inline">
		<input style="background: #6bc3b0!important;" class="s_submit" type="submit" value='<spring:message code="button.list" />' onclick="fn_egov_list_IndvdlInfoPolicy(); return false;" />
		</form>
	</div>
	<div style="clear:both;"></div>
</div>


</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
