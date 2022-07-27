<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">


<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_cpyrhtprtcpolicylist() {

	document.CpyrhtPrtcPolicyForm.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>";
	document.CpyrhtPrtcPolicyForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_cpyrhtprtcpolicycn(cpyrhtId){

	// Update하기 위한 키값을 셋팅
	document.CpyrhtPrtcPolicyForm.cpyrhtId.value = cpyrhtId;	
	document.CpyrhtPrtcPolicyForm.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnUpdtView.do'/>";
	document.CpyrhtPrtcPolicyForm.submit();	
	
}

/**********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_cpyrhtprtcpolicycn(cpyrhtId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{	

		// Delete하기 위한 키값을 셋팅
		document.CpyrhtPrtcPolicyForm.cpyrhtId.value = cpyrhtId;	
		document.CpyrhtPrtcPolicyForm.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnDelete.do'/>";
		document.CpyrhtPrtcPolicyForm.submit();
			
	}	
	
}

</script>
</head>

<body>

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="ussSamCpy.cpyrhtPrtcPolicyDetailInqire.cpyrhtPrtcPolicyDetailInqire"/></h2><!-- 저작권보호정책 상세보기 -->

<form name="CpyrhtPrtcPolicyForm" action="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyDetailInqire.do'/>" method="post">
<div class="wTableFrm">
	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:20%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="ussSamCpy.cpyrhtPrtcPolicyDetailInqire.cpyrhtPrtcPolicyCn"/></th><!-- 저작권보호정책내용 -->
			<td class="left">
			   <textarea class="textarea" name="cpyrhtPrtcPolicyCn" cols="70" rows="25" readonly="readonly" title="저작권보호정책내용" style="height:300px"><c:out value="${result.cpyrhtPrtcPolicyCn}"/></textarea> 
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussSamCpy.cpyrhtPrtcPolicyDetailInqire.lastUpdtPnttm"/></th><!-- 등록일자 -->
			<td class="left">
				<c:out value="${result.lastUpdusrPnttm}"/>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value='<spring:message code="button.update" />' onclick="fn_egov_updt_cpyrhtprtcpolicycn('<c:out value="${result.cpyrhtId}"/>'); return false;" />
		<span class="btn_s"><a style="background: #efb98d!important;" href="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnDelete.do'/>?cpyrhtId=<c:out value='${result.cpyrhtId}'/>" onclick="fn_egov_delete_cpyrhtprtcpolicycn('<c:out value="${result.cpyrhtId}"/>'); return false;"><spring:message code="button.delete" /></a></span>
		<span class="btn_s"><a href="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>" onclick="fn_egov_inqire_cpyrhtprtcpolicylist(); return false;"><spring:message code="button.list" /></a></span>
	</div>
	<div style="clear:both;"></div>
	<input name="cpyrhtId" type="hidden" value="">
	
</div>

</form>


</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>


