<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/main_portal.css' />"> --%>
<title><spring:message
		code="comSymMnuMpm.main_bottom.mainBottomTitle" /></title>
<!-- 아래메인 -->
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<div id="new_footer">
		<div class="ft_inner">
			<div style="float: left">
				<img style="width: 100px;"
					src="<c:url value='/images/egovframework/com/cmm/main/lob_logo.png'/>"
					alt="주식회사 로브" />
			</div>
			<div style="float: left">
				<ul class="policy">
					<li><a href="/CpyrhtPrtcPolicyInqire.do">저작권보호정책</a></li>
					<li><a href="/listIndvdlInfoPolicy.do">개인정보보호정책</a></li>
				</ul>
				<ul>
					<li
						style="font-size: 14px; float: left; color: #999;">경기 안양시 동안구 엘에스로116번길 25-32 sk v1 618호 
						</p> © Ministry of the Interior and Safety. All rights reserved.</li>
				</ul>
			</div>
		</div><!-- end ft_inner -->
	</div><!-- end new_footer -->
</body>
</html>
