<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>


<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javaScript" language="javascript">

function fncSelectLoginScrinImageList() {
    var varFrom = document.getElementById("loginScrinImage");
    varFrom.action = "<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>";
    varFrom.submit();
}

function fncLoginScrinImageInsert() {

    var varFrom = document.getElementById("loginScrinImage");
    varFrom.action = "<c:url value='/uss/ion/lsi/addLoginScrinImage.do'/>";

    if(confirm("<spring:message code="ussIonLsi.loginScrinImageUpdt.saveImage"/>")){/* 저장 하시겠습니까? */
        if(!validateLoginScrinImage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncLoginScrinImageUpdate() {
    var varFrom = document.getElementById("loginScrinImage");
    varFrom.action = "<c:url value='/uss/ion/lsi/updtLoginScrinImage.do'/>";

    if(confirm("<spring:message code="ussIonLsi.loginScrinImageUpdt.saveImage"/>")){/* 저장 하시겠습니까? */
        if(!validateLoginScrinImage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncLoginScrinImageDelete() {
    var varFrom = document.getElementById("loginScrinImage");
    varFrom.action = "<c:url value='/uss/ion/lsi/removeLoginScrinImage.do'/>";
    if(confirm("<spring:message code="ussIonLsi.loginScrinImageUpdt.deleteImage"/>")){/* 삭제 하시겠습니까? */
        varFrom.submit();
    }
}

function fncOnChangeImage() {
	var varFrom = document.getElementById("loginScrinImage");
	varFrom.mainImage.value = varFrom.file_1.value;
	console.log(varFrom.mainImage.value);
}

</script>
<style>
.layout-container form {
    width: 100% !important;
}
div.btn {
	margin-left: 37%;
}
</style>
</head>

<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg"/></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="ussIonLsi.loginScrinImageUpdt.loginScrinImageUpdt"/></h2><!-- 로그인화면이미지 수정 -->

<div class="wTableFrm">
	<!-- 등록폼 -->
<form:form commandName="loginScrinImage" method="post" action="${pageContext.request.contextPath}/uss/ion/lsi/updtLoginScrinImage.do' />" enctype="multipart/form-data">
<input type="hidden" name="posblAtchFileNumber" value="1" >
	<table class="wTable">
		<tr>
			<th><spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageId"/> <span class="pilsu">*</span></th><!-- 이미지ID -->
			<td class="left">
			    <input name="imageId" id="imageId" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageId"/>" type="text" value="<c:out value='${loginScrinImage.imageId}'/>" readonly="readonly" style="width:188px" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageNm"/> <span class="pilsu">*</span></th><!-- 이미지명 -->
			<td class="left">
			    <input name="imageNm" id="imageNm" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageNm"/>" type="text" value="<c:out value='${loginScrinImage.imageNm}'/>" maxLength="10" style="width:188px" />&nbsp;<form:errors path="imageNm" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonLsi.loginScrinImageUpdt.mainImage"/> <span class="pilsu">*</span></th><!-- 이미지 -->
			<td class="left">
			    <div class="egov_file_box" style="display:inline-block; margin-bottom: 5px;">
				<label for="egovfile_0" id="file_label"><spring:message code="title.attachedFileSelect"/></label> <!-- 파일선택 -->
				<input style="border: 0;" type="file" name="file_1" id="egovfile_0" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImage"/>" onchange="fncOnChangeImage();" /><!-- 파일선택 -->
				</div><input name="mainImage" id="mainImage" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImage"/>" type="text" value='<c:out value="${loginScrinImage.image}"/>' maxLength="30" readonly="readonly" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageDc"/></th><!-- 이미지설명 -->
			<td class="left">
			    <input name="imageDc" id="imageDc" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageDc"/>" type="text" value="<c:out value='${loginScrinImage.imageDc}'/>" maxLength="100" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageReflctAt"/> <span class="pilsu">*</span></th><!-- 반영여부 -->
			<td class="left">
			    <select name="reflctAt" id="reflctAt" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageReflctAt"/>">
					<option value="Y" <c:if test="${loginScrinImage.reflctAt == 'Y'}">selected</c:if> >Y</option>
					<option value="N" <c:if test="${loginScrinImage.reflctAt == 'N'}">selected</c:if> >N</option>
				</select>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageregDate"/> <span class="pilsu">*</span></th><!-- 등록일시 -->
			<td class="left">
			    <input name="regDate" id="regDate" title="<spring:message code="ussIonLsi.loginScrinImageUpdt.mainImageregDate"/>" type="text" value="<c:out value="${fn:substring(loginScrinImage.regDate,0,19)}"/>" readonly="readonly" style="width:188px" />
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input style="background:#75c4e6!important;" class="s_submit" type="submit" value='<spring:message code="button.save" />' onclick="fncLoginScrinImageUpdate(); return false;" />
		<span class="btn_s"><a style="background:#efb98d!important;" href="<c:url value='/uss/ion/lsi/removeLoginScrinImage.do'/>?imageId=<c:out value='${loginScrinImageVO.imageId}'/>" onclick="fncLoginScrinImageDelete(); return false;"><spring:message code="button.delete" /></a></span>
		<span class="btn_s"><a style="background:#6bc3b0!important;" href="<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>?pageIndex=<c:out value='${loginScrinImageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${loginScrinImageVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectLoginScrinImageList(); return false;"><spring:message code="button.list" /></a></span>
	</div>
	<div style="clear:both;"></div>
</div>

<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${loginScrinImageVO.searchCondition}'/>">
<input type="hidden" name="searchKeyword" value="<c:out value='${loginScrinImageVO.searchKeyword}'/>">
<input type="hidden" name="pageIndex" value="<c:out value='${loginScrinImageVO.pageIndex}'/>">
</form:form>

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

