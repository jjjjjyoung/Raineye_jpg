<%@ page contentType="text/html; charset=utf-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovFacebookHome.jsp
 * @Description : EgovFacebookHome.jsp
 * @Modification Information
 * @
 * @  수정일             수정자              수정내용
 * @ ---------     -----------------    -------------------------
 * @ 2014.11.10    표준프레임워크센터        최초생성
 * @ 2018.10.29    최 두 영                        3.8개선        
 *
 *  @author 표준프레임워크센터
 *  @since 2014.11.10
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2014 by MOGAHA  All right reserved.
 */

%>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>Facebook <spring:message code="comUssIonFbk.facebookHome.title"/></title><!-- 기능목록 -->

<style>
body {
	margin:0;
}

.wTableFrm {
	padding:0 !important;
    min-width: 300px;
}
.wTable {
	padding: 0 !important;
	background: #fff;
	border-bottom: 1px solid #4688d2;
}
.wTable>tbody>tr>th {
background:#fff;
border-right: 1px solid #99bde6;
}
table.wTable tbody tr th, table.wTable tbody tr td {
	width: auto;
	padding: 0.5rem!important;
}

.wTable>tbody>tr>th {
    width: 30%!important;
}

.wTable>tbody>tr>td {
    width: 70%!important;
}
</style>
</head>
<body>

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="comUssIonFbk.facebookHome.subject"/></h2><!-- 페이스북 연동 -->

<div class="wTableFrm">
	<figure style="margin:0 0 .5rem;">
		<img src="/images/egovframework/com/uss/ion/fbk/facebook.png" alt="facebook" style="width:160px;height:29px;">
	</figure>
	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:16%">
			<col style="width:auto">
		</colgroup>
		<tbody>
			<colgroup>
				<col style="width: 16%">
				<col style="width:auto">
			</colgroup>
			<tr>
				<th>Feed</th>
				<td class="left"><a href="<c:url value="/uss/ion/fbk/feed.do" />"><button class="btn_01" type="submit"><spring:message code="comUssIonFbk.facebookHome.viewFeed"/></button></a></td><!-- 담벼락 보기 -->
			</tr>
			<tr>
				<th>Albums</th>
				<td class="left"><a href="<c:url value="/uss/ion/fbk/albums.do" />"><button class="btn_01" type="submit"><spring:message code="comUssIonFbk.facebookHome.viewDetailAlbum"/></button></a></td><!-- 사진앨범 상세보기 -->
			</tr>
			<tr>
				<th>Profile</th>
				<td class="left"><a href="<c:url value="/uss/ion/fbk/profile.do" />"><button class="btn_01" type="submit"><spring:message code="comUssIonFbk.facebookHome.viewProfile"/></button></a></td><!-- 프로필 정보보기 -->
			</tr>
			<tr>
				<th>Sign Out</th>
				<td class="left"><a href="<c:url value="/uss/ion/fbk/facebookSignout.do" />"><button class="btn_01" type="submit"><spring:message code="comUssIonFbk.facebookHome.signOutFacebook"/></button></a></td><!-- 페이스북 로그아웃 -->
			</tr>
		</tbody>
	</table>
</div>

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
