
<%
	/**
	 * @Class Name : EgovIndvdlYrycRegist.java
	 * @Description : EgovIndvdlYrycRegist.jsp
	 * @Modification Information
	 * @
	 * @  수정일        수정자                수정내용
	 * @ ---------     --------    ---------------------------
	 * @ 2014.11.14    표준프레임워크         최초 생성
	 * @ 2018.09.13    최두영                     퍼블리싱점검&다국어처리
	 *
	 *  @author 표준프레임워크
	 *  @since 2014.11.14
	 *  @version 1.0
	 *  @see
	 *  
	 *  Copyright (C) 2014 by MOPAS  All right reserved.
	 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<script type="text/javaScript" language="javascript">
	function fnIndvdYrycMangeList() {
		location.href = "<c:url value='/uss/ion/yrc/EgovIndvdlYrycManageList.do'/>";
	}

	function fnRegistIndvdYrycMange() {
		var varForm = document.getElementById("indvdlYrycManage");

		var occrncYrycCo = varForm.occrncYrycCo.value;
		var useYrycCo = varForm.useYrycCo.value;
		var diffValue = occrncYrycCo - useYrycCo;
		if (diffValue < 0) {
			alert("<spring:message code="comUssIonYrc.indvdlYrycRegist.diffValue" />"); //잔여연차가 음수일 수 없습니다.
			return;
		}

		if (!validateIndvdlYrycManage(varForm)) {
			return;
		} else {
			varForm.action = "<c:url value='/uss/ion/yrc/EgovIndvdlYrycRegist.do'/>";
			varForm.submit();
		}
	}

	function fnDeleteIndvdYrycMange() {
		var varForm = document.getElementById("indvdlYrycManage");
		varForm.action = "<c:url value='/uss/ion/yrc/deleteIndvdlYryc.do'/>";
		if (confirm("<spring:message code='common.delete.msg' />")) {
			varForm.submit();
		}
	}
</script>

<style>
.search_box form{
    background-color: #f1f8ee!important;
}
.search_box ul li input.s_btn:last-child {
	background-color: #75c4e6;
}
</style>
</head>
<body>
	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>

<div class="layout-container">

		<h1>
			<spring:message code="comUssIonYrc.indvdlYrycRegist.title" />
		</h1>
		<!-- 개인연차 등록 -->


	<div class="board">
		<form:form commandName="indvdlYrycManage" action="">
			<form:hidden path="occrrncYear"
				value="${indvdlYrycManage.occrrncYear}" />

			<div class="search_box"
				title="<spring:message code="common.searchCondition.msg" />">
				<ul>
					<li><input class="s_btn" type="submit"
						value='<spring:message code="button.list" />'
						title='<spring:message code="button.list" />'
						onclick="fnIndvdYrycMangeList(); return false;" /> <c:choose>
							<c:when test="${totCnt <= 0}">
								<input class="s_btn" type="submit"
									value='<spring:message code="button.create" />'
									title='<spring:message code="button.create" />'
									onclick="fnRegistIndvdYrycMange(); return false;" />
							</c:when>
							<c:otherwise>
								<input class="s_btn" type="submit"
									value='<spring:message code="button.delete" />'
									title='<spring:message code="button.delete" />'
									onclick="fnDeleteIndvdYrycMange(); return false;" />
								<input class="s_btn" type="submit"
									value='<spring:message code="button.update" />'
									title='<spring:message code="button.update" />'
									onclick="fnRegistIndvdYrycMange(); return false;" />
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>

			<table class="datatables-demo table table-striped table-bordered dataTable no-footer">
				<caption></caption>
				<colgroup>
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 30%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><spring:message
								code="comUssIonYrc.indvdlYrycManageList.occrrncYear" /></th>
						<!-- 발생연도 -->
						<th scope="col"><spring:message
								code="comUssIonYrc.indvdlYrycManageList.occrncYrycCo" /></th>
						<!-- 발생연차 -->
						<th scope="col"><spring:message
								code="comUssIonYrc.indvdlYrycManageList.useYrycCo" /></th>
						<!-- 사용연차 -->
						<th scope="col"><spring:message
								code="comUssIonYrc.indvdlYrycManageList.remndrYrycCo" /></th>
						<!-- 잔여연차 -->
						<th scope="col"><spring:message
								code="comUssIonYrc.indvdlYrycManageList.mberNm" /></th>
						<!-- 사용자 -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="resultInfo"
						varStatus="status">
						<tr>
							<td><c:out value="${indvdlYrycManage.occrrncYear}" /></td>
							<td><input name="occrncYrycCo" type="text" size="10"
								value='<c:out value="${resultInfo.occrncYrycCo}"/>'
								maxlength="10"
								title="<spring:message code="comUssIonYrc.indvdlYrycRegist.occrncYrycCo" />"></td>
							<!-- 연차등록 -->
							<td><input name="useYrycCo" type="text" size="10"
								value='<c:out value="${resultInfo.useYrycCo}"/>' maxlength="10"
								title="<spring:message code="comUssIonYrc.indvdlYrycRegist.useYrycCo" />"></td>
							<!-- 사용연차등록 -->
							<td><c:out value="${resultInfo.remndrYrycCo}" /></td>
							<td><c:out value="${resultInfo.mberNm}" /></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(resultList) == 0}">
						<tr>
							<td><c:out value="${indvdlYrycManage.occrrncYear}" /></td>
							<td><input name="occrncYrycCo" type="text" size="10"
								value="" maxlength="10"
								title="<spring:message code="comUssIonYrc.indvdlYrycRegist.occrncYrycCo" />"></td>
							<!-- 연차등록 -->
							<td><input name="useYrycCo" type="text" size="10" value=""
								maxlength="10"
								title="<spring:message code="comUssIonYrc.indvdlYrycRegist.useYrycCo" />"></td>
							<!-- 사용연차등록 -->
							<td>-</td>
							<td><c:out value="${indvdlYrycManage.mberNm}" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</form:form>
		<p class="cmt01 pt5">
			*
			<spring:message code="comUssIonYrc.indvdlYrycRegist.change" />
		</p>
		<!-- 개인연차 등록/수정시 발생연도는 해당연도로 변경되어 저장됨 -->
	</div>

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
