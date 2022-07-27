<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/phone_body.css' />"	type="text/css">
<script src="<c:url value='/js/egovframework/com/cms/msg.js' />" type="text/javascript"></script>



<body onload="setDate();">

	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>
	<!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

	<div class="layout-container">

		<!-- 타이틀 -->
		<h2>문자메시지 발송</h2>
		<!-- 문자메시지 전송 -->

		<form:form commandName="sms" name="sms" method="post" action="/sms.do" onSubmit="return varcheck();">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input name="chkSendFlag" type="hidden" value="0" />
			<input type="hidden" name="strTelList">

			<div class="wTableFrm">
				<table class="wTable">
					<colgroup>
						<col style="width: 16%" />
						<col style="" />
					</colgroup>
					<tr>
						<th><spring:message code="cop.sms.trnsmitTelno" /> <span class="pilsu">*</span></th>
						<td class="left"><input type="text" name="strCallBack"></td>
					</tr>
					<tr>
						<th><spring:message code="cop.sms.trnsmitCn" /> <span class="pilsu">*</span></th>
						<td class="left"><textarea name="strData" class="sendsms" onchange="ChkLen()" onkeyup="ChkLen()" rows="2" cols="75"></textarea> 
						<input type="text" name="strDataCount" size="3" style="border-color: #000000; border: solid 0; height: 14px; width: 18px; background-color: #5d5d5d; FONT-SIZE: 8pt; color: white" maxlength="3" value="0" readonly> /
						<div id="maxLength" style="display: inline;">90</div>
						<div id="msgType" style="display: inline;" class="blue ar b">SMS</div></td>
					</tr>
					<tr>
						<th><spring:message code="cop.sms.recptnTelno" /> <span class="pilsu">*</span></th>
						<td class="left">
							<div class="Numb">
								받는번호 <input type="text" name="addCallNum"><br />
								<div class="btnarea2">
									<span class="button1"><a href="javascript:addItem()">추가</a></span> <span class="button2">
									<a href="javascript:delItem()">삭제</a></span>
								</div>
								<select name="strDest" size="10" multiple class="sendNumb">
									<option value="0">--수신자 리스트--</option>
								</select>
							</div> 
						</td>
					</tr>
				</table>

				<!-- 하단 버튼 -->
				<div class="btn">
					<input class="s_submit" type="button" value='발송' onclick="varcheck();" />
				</div>
				<div style="clear: both;"></div>
			</div>
			<div ID="sDest" class="Rn" STYLE="display: none">
				<table style="width: 100%; border-top: dotted 1px">
					<tr>
						<td style="padding-top: 4px">
							<input type="text" name="R_YEAR" size="4" maxlength="4" style="width: 40px">년 
							<input type="text" name="R_MONTH" size="2" maxlength="2" style="width: 30px">월 
							<input type="text" name="R_DAY" size="2" maxlength="2" style="width: 30px">일
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="R_HOUR" size="2" maxlength="2" style="width: 30px">시
							<input type="text" name="R_MIN" size="2" maxlength="2" style="width: 30px">분
						</td>
					</tr>
				</table>
			</div>
			<div class="text" id="divLmsTitle" style="display: none;">
				<input type="text" name="strSubject" onchange="chkTitle()" value="제목을 입력하세요" />
			</div>
		</form:form>

	</div>
	<!-- end layout-container -->

	<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>