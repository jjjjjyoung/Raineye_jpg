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
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
<validator:javascript formName="indvdlInfoPolicy" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_IndvdlInfoPolicy() {
		location.href = "<c:url value='/contentsManage.do' />";
	}

	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_upt_contents() {
		var varFrom = document.getElementById("htmlEditorVO");
		if (confirm("저장하시겠습니까 ?")) {
			varFrom.action = "<c:url value='/contentsUpdt.do' />";
			varFrom.submit();
		}
	}
	/* ********************************************************
	 * 삭제처리화면
	 ******************************************************** */
	function fn_del_contents() {
		var varFrom = document.getElementById("htmlEditorVO");
		if (confirm("식제하시겠습니까 ?")) {
			varFrom.action = "<c:url value='/contentsDel.do' />";
			varFrom.submit();
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
		width: 75%;
	}
	
	#delBtn { margin-left: 5px; }

</style>
</head>
<body>

<div class="layout-container">

	<!-- 타이틀 -->
	<h2>컨텐츠 수정</h2>

	<form id="htmlEditorVO" name="htmlEditorVO" action="/contentsUpdt.do" method="post" enctype="multipart/form-data">
		<input type="hidden" id="ctsIdx" name="ctsIdx" value="<c:out value='${vo.ctsIdx}'/>"/>
		<div class="wTableFrm">
			<!-- 등록폼 -->
			<table class="wTable">
				<colgroup>
					<col style="width:25%"/>
					<col style=""/>
				</colgroup>
				<tr>
					<th>컨텐츠ID
						<span class="pilsu">*</span></th>
					<td class="left">
						<input type="text" id="ctsId" name="ctsId" value="<c:out value='${vo.ctsId}'/>" readonly/>
					</td>
				</tr>
				<tr>
					<th>
						컨텐츠명
						<span class="pilsu">*</span></th>
					<td class="left">
						<input type="text" id="ctsNm" name="ctsNm" value='<c:out value='${vo.ctsNm}'/>'/>
					</td>
				</tr>
				<tr>
					<th>
						대메뉴
						<span class="pilsu">*</span></th>
					<td class="left">
						<input type="text" id="ctsTi" name="ctsTi" value='<c:out value='${vo.ctsTi}'/>'/>
					</td>
				</tr>
				<tr style="width:100%!important;clear:both;">
					<th>
						컨텐츠내용
						<span class="pilsu">*</span></th>
					<td class="left" style="width:100%!important;">
						<textarea class="ckeditor txaClass2" id="ctsCn" name="ctsCn" rows="10" cols="14" placeholder="내용을 입력하세요.">
						<c:out value="${vo.ctsCn }" escapeXml="false"/>
						</textarea>
					</td>
				</tr>
			</table>

			<!-- 하단 버튼 -->
			<div class="btn">
				<input class="s_submit" type="button" id="uptBtn" value="수정" onclick="javascript: fn_upt_contents();"/>
				<input class="s_submit" type="button" id="delBtn" value="삭제" onclick="javascript: fn_del_contents();"/>
				<span class="btn_s"><a href="<c:url value='/contentsManage.do' />">목록</a></span>
			</div>
		</div>


		<input name="cmd" type="hidden" value="<c:out value='updt'/>">
	</form>


</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

