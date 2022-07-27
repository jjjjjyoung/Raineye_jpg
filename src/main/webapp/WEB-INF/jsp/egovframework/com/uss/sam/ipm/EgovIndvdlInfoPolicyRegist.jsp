<%--
  Class Name : EgovIndvdlInfoPolicyRegist.jsp
  Description : 개인정보보호정책 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -----------    -------------    ---------------------------
     2008.03.09    장동한                      최초 생성
     2014.12.08    표준프레임워크          웹에디터(WYSIWYG) 적용
     2018.09.03    이정은                      공통컴포넌트 3.8 개선  

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/sam/ipm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/sam/ipm/"/>
<!DOCTYPE html>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<validator:javascript formName="indvdlInfoPolicy" staticJavascript="false" xhtml="true" cdata="false"/>
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
function fn_egov_save_IndvdlInfoPolicy(){
	var varFrom = document.indvdlInfoPolicy;
	varFrom.onsubmit();
	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/sam/ipm/registIndvdlInfoPolicy.do' />";
		if(!validateIndvdlInfoPolicy(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}


</script>
<style>
div.btn {
    margin-left: 45%;
}
.wTableFrm table th, .wTable th {
	width: 25%;
}
.wTableFrm table td, .wTable td {
	width:75%;
}

</style>
</head>
<body onLoad="fn_egov_init_IndvdlInfoPolicy();">

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="ussSamIpm.indvdlInfoPolicyRegist.indvdlInfoPolicyRegist"/></h2><!-- 개인정보보호정책 등록 -->

<form:form commandName="indvdlInfoPolicy" name="indvdlInfoPolicy" action="${pageContext.request.contextPath}/uss/sam/ipm/registIndvdlInfoPolicy.do" method="post" enctype="multipart/form-data" >

<div class="wTableFrm">
	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:25%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyRegist.indvdlInfoNm"/> <span class="pilsu">*</span></th><!-- 개인정보보호정책 명 -->
			<td class="left">
			    <form:input path="indvdlInfoNm" size="73" cssClass="txaIpt" maxlength="255"/>
				<form:errors path="indvdlInfoNm" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyRegist.indvdlInfoYn"/> <span class="pilsu">*</span></th><!-- 동의여부 -->
			<td class="left">
			    <select title="<spring:message code="ussSamIpm.indvdlInfoPolicyRegist.indvdlInfoYn"/>" name="indvdlInfoYn" id="indvdlInfoYn">
					<option value="Y"><spring:message code="input.yes"/></option><!-- 예 -->
					<option value="N"><spring:message code="input.no"/></option><!-- 아니오 -->
				</select>
			</td>
		</tr>
		<tr style="width:100%!important;clear:both;">
			<th><spring:message code="ussSamIpm.indvdlInfoPolicyRegist.indvdlInfoDc"/> <span class="pilsu">*</span></th><!-- 개인정보보호정책 내용 -->
			<td class="left" style="width:100%!important;">
			    <form:textarea path="indvdlInfoDc" rows="10" cols="14" cssClass="txaClass2"/>
				<form:errors path="indvdlInfoDc" cssClass="error"/>
			</td>
		</tr>
	</table>
	
	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_IndvdlInfoPolicy(); return false;" />
		<span class="btn_s"><a href="<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do' />"><spring:message code="button.list" /></a></span>
	</div>
</div>




<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>



</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

