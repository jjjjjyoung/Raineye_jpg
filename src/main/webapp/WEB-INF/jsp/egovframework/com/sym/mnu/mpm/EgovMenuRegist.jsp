<!DOCTYPE html>
<%--
 /**
  * @Class Name : EgovMenuRegist.jsp
  * @Description : 메뉴정보 등록 화면
  * @Modification Information
  * @
  * @ 수정일               수정자             수정내용
  * @ ----------   --------   ---------------------------
  * @ 2009.03.10   이용               최초 생성
  *   2018.09.10   신용호            표준프레임워크 v3.8 개선
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="ImgUrl"
	value="${pageContext.request.contextPath}/images/egovframework/com/sym/mnu/mpm/" />

<%@include
	file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script language="javascript1.2" type="text/javaScript">

/* ********************************************************
 * 메뉴이동 화면 호출 함수
 ******************************************************** */
function mvmnMenuList() {
	window.open("<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />",'Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

/* ********************************************************
* 입력값 validator 함수
******************************************************** */
function fn_validatorMenuList() {

	if(document.menuManageVO.menuNo.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuNo.notNull" />"); return false;} //메뉴번호는 핍수입력 항목입니다.
	if(!checkNumber(document.menuManageVO.menuNo.value)){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuNo.onlyNumber" />"); return false;} //메뉴번호는 숫자만 입력 가능합니다.

	if(document.menuManageVO.menuOrdr.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuOrdr.notNull" />"); return false;} //메뉴순서는 핍수입력 항목입니다.
	if(!checkNumber(document.menuManageVO.menuOrdr.value)){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuOrdr.onlyNumber" />"); return false;} //메뉴순서는 숫자만 입력 가능합니다.

	if(document.menuManageVO.upperMenuId.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.upperMenuId.notNull" />"); return false;} //상위메뉴번호는 핍수입력 항목입니다.
	if(!checkNumber(document.menuManageVO.upperMenuId.value)){alert("<spring:message code="comSymMnuMpm.menuList.validate.upperMenuId.onlyNumber" />"); return false;} //상위메뉴번호는 숫자만 입력 가능합니다.

	if(document.menuManageVO.progrmFileNm.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.progrmFileNm.notNull" />"); return false;} //프로그램파일명은 핍수입력 항목입니다.
	if(document.menuManageVO.menuNm.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuNm.notNull" />"); return false;} //메뉴명은 핍수입력 항목입니다.

   return true;
}

/* ********************************************************
* 필드값 Number 체크 함수
******************************************************** */
function checkNumber(str) {
   var flag=true;
   if (str.length > 0) {
       for (i = 0; i < str.length; i++) {
           if (str.charAt(i) < '0' || str.charAt(i) > '9') {
               flag=false;
           }
       }
   }
   return flag;
}

/* ********************************************************
 * 입력처리 함수
 ******************************************************** */
function insertMenuManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){

		var meName = document.menuManageNewVO.meName.value;
		var meLink = document.menuManageNewVO.meLink.value;
		var meOrder = document.menuManageNewVO.meOrder.value;
		
		if(meOrder == ''){
			document.menuManageNewVO.meOrder.value = '0';
		}
		
		if(meName == ''){
			alert('메뉴명을 입력하세요.');
			return;
		}

		if(meLink == ''){
			alert('메뉴링크를 입력하세요.');
			return;
		}

		document.menuManageNewVO.submit();
	}
}

/* ********************************************************
 * 파일목록조회  함수
 ******************************************************** */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'Pop_progrmFileNm','width=500,height=600');
}

/* ********************************************************
 * 목록조회  함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />";
}
/* ********************************************************
 * 파일명 엔터key 목록조회  함수
 ******************************************************** */
function press() {
    if (event.keyCode==13) {
    	searchFileNm();    // 원래 검색 function 호출
    }
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>

</script>


<style>
table.wTableFrm table th, table.wTable th {
    width: 20%; 
}
table.wTableFrm table td, table.wTable td {
    width: 30%;
}
div.btn {
	margin-left: 42%;
}
.btn input.s_submit {
	margin-right:0;
}
</style>
</head>
<body>

	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>
	<!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

	<div class="layout-container">

		<!-- 타이틀 -->
		<h2>
			<spring:message code="comSymMnuMpm.menuRegist.pageTop.title" />
		</h2>
		<!-- 메뉴 등록 -->

		<form id="menuManageNewVO" name="menuManageNewVO" method="post" action="${pageContext.request.contextPath}/sym/mnu/mpm/EgovMenuRegistInsert.do">
			<input type="hidden" name="meCode" value="<c:out value='${meCode}'/>" />
			<div class="wTableFrm">

				<!-- 등록폼 -->
				<table class="wTable">
					<colgroup>
						<col style="width: 30%" />
						<col style="width: 70%" />
					</colgroup>
					<tr>
						<th>메뉴명<span class="pilsu">*</span></th><!-- 메뉴No -->
						<td class="left">
						    <input type="text" name="meName" value=""/>
						</td>
					</tr>
					<tr>
						<th>메뉴링크 <span class="pilsu">*</span></th><!-- 메뉴순서 -->
						<td class="left">
						 <input type="text" name="meLink" value=""/>
						</td>
					</tr>
					<tr>
						<th>새창열기 <span class="pilsu">*</span></th><!-- 메뉴명 -->
						<td class="left">
						    <select name="meTarget">
						    	<option value="self">사용안함</option>
						    	<option value="blank">사용함</option>
						    </select>
						</td>
					</tr>
					<tr>
						<th>매뉴위치 <span class="pilsu">*</span></th><!-- 메뉴명 -->
						<td class="left">
						    <select name="mePlace">
						    	<option value="0">전남도립국악단</option>
						    	<option value="1">어린이국악단</option>
						    </select>
						</td>
					</tr>
					<tr>
						<th>메뉴순서 </th><!-- 메뉴명 -->
						<td class="left">
						    <input type="text" name="meOrder" value=""/>
						</td>
					</tr>
					<tr>
						<th>사용여부 <span class="pilsu">*</span></th><!-- 메뉴명 -->
						<td class="left">
						     <select name="meUse">
						    	<option value="1">사용함</option>
						    	<option value="0">사용안함</option>
						    </select>
						</td>
					</tr>
				</table>

				<!-- 하단 버튼 -->
				<div class="btn" style="padding: .438rem 0 0 0">
					<input class="s_submit" type="submit" value='<spring:message code="button.create" />' onclick="insertMenuManage(document.forms[0]); return false;" />
					<!-- 등록 -->
					<span class="btn_s">
						<a href="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" onclick="selectList(); return false;">
							<spring:message	code="button.list" />
						</a>
					</span>
					<!-- 목록 -->
				</div>
				<div style="clear: both;"></div>
			</div>

			<input name="cmd" type="hidden" value="<c:out value='insert'/>">

		</form>

	</div>
	<!-- end layout-container -->

	<%@include
		file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>