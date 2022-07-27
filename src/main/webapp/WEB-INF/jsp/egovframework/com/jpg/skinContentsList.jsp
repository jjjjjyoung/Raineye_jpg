<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fn_egov_detail_IndvdlInfoPolicy(indvdlInfoPolicyId) {
		var vFrom = document.listForm;
		vFrom.indvdlInfoId.value = indvdlInfoPolicyId;
		vFrom.action = "<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do' />";
		vFrom.submit();
	}
</script>

</head>
<body>
<div class="layout-container">
	<h2>컨텐츠 관리 목록</h2>

	<div id="content" style="width:712px">
		<%-- noscript 테그 --%>
		<noscript class="noScriptTitle">
			자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.
		</noscript>

		<div class="board">

			<form name="listForm" action="<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do'/>" method="post">

				<div class="search_box" title="이 레이아웃은 하단 정보를 대한 검색 정보로 구성되어 있습니다">
				<ul>
					<li>
						<span class="btn_b"><a href="/contentsRegist.do">등록</a></span>
					</li>
				</ul>
		</div>
		</form>

		<table class="datatables-demo table table-striped table-bordered dataTable no-footer">

			<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="50%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">
						No.
					</th>
					<th scope="col">
						컨텐츠ID
					</th>
					<th scope="col">
						컨텐츠명
					</th>
					<th scope="col">
						링크
					</th>
				</tr>
			</thead>
			<tbody>
			<%-- 데이터를 화면에 출력해준다 --%>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td>
						<c:out value='${resultInfo.ctsIdx}'/>
					</td>
					<td>
						<a href="/contentsUpdt.do?id=<c:out value='${resultInfo.ctsId}'/>">
						<c:out value='${resultInfo.ctsId}'/>
						</a>
					</td>
					<td>
						<c:out value="${resultInfo.ctsNm}"/>
					</td>
					<td>
						/contents.do?id=<c:out value="${resultInfo.ctsId}"/>
					</td>
				</tr>
			</c:forEach>

			<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td class="lt_text3" colspan="5">
						<spring:message code="common.nodata.msg"/>
					</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>

</div>

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>