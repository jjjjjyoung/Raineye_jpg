<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.util.EgovUserDetailsHelper" %>
<script language="text/javascript" src="<c:url value='/js/egovframework/com/cmm/jquery-1.4.2.min.js' />"></script>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/main_portal.css' />"> --%>

<header>
<form id="selectOne" name="selectOne" method="post" action="<c:url value='/uat/uia/actionLogin.do'/>">
				
	<input name="userSe" type="hidden" value="GNR"/>
	<input name="menuNo" type="hidden" />
	<input name="chkURL" type="hidden" />
	<div id="tnb">
	    <div class="hdInner">
	        <div id="use_descri">
	            <ul>	            	
	            	<c:choose>
	            		<c:when test="${ user == null }">
			                <!-- <li><a href="javascript:actionLogin()">로그인</a></li> -->
			                <!-- <li class="join_btn"><input type="button" onclick="javascript:actionJoin()" value="회원가입"/></li> -->
			                <li><input type="button" onclick="javascript:actionLogin()" value="로그인 / 회원가입"/></li>
		                </c:when>
		                <c:otherwise>
			                <!-- <li><a href="javascript:actionLogout()">로그아웃</a></li> -->
			                <li><input type="button" onclick="javascript:actionLogout()" value="로그아웃"/></li>
		                </c:otherwise>
	                </c:choose>
	            </ul>
	        </div>
	    </div>
	</div>
	<!-- end tnb -->
	
    <div id="gnb"> 
        <div class="hdInner">
            <div id="top_logo"><a href="<c:url value='/sym/mnu/mpm/EgovMainMenuHome.do' />" target=_top><img width="236px" height="65px" src="<c:url value='/images/egovframework/com/cmm/main/lob_logo.png'/>" alt="egovframe" /></a></div>
        </div>
    </div>
    <!-- end gnb -->
    
    <c:set var="cnt1d" value="0" />
    <c:set var="menuOC" value="false" />
    <c:set var="menu1d" value="false" />
	<c:set var="menu2d" value="false" />
    
	<div id="new_topnavi">
        <div class="hdInner">
	        <div class="sub_menu">
				<c:forEach var="item" items="${list_headmenu}">
				
					<c:if test="${item.upperMenuId == 0 }">				
	      				<c:if test="${menu2d || ( menu2d == false && menu1d == true ) }">
	      					<c:if test="${menuOC }">	      						
	       						</ul>
	       						<c:set var="menuOC" value="false" />
       						</c:if>
	       					</span>
	           				<c:set var="menu2d" value="false" />
	           			</c:if>
						<span>
							<a href="<c:out value='${item.linkUrl }' />"><c:out value="${item.menuNm }" /></a>
						<c:set var="cnt1d" value="${cnt1d+1 }" />
						<c:set var="menu1d" value="true" />
					</c:if>
				
					<c:if test="${item.upperMenuId != 0 && menu1d }">
						<c:if test="${!menuOC }">
							<ul>
							<c:set var="menuOC" value="true" />
						</c:if>
						
	                    <li><a href="<c:out value='${item.linkUrl }' />"><c:out value="${item.menuNm }" /></a></li>
	                    <c:set var="menu2d" value="true" />
	                    
	               	</c:if>
	               	
               	</c:forEach>
			</div>
        </div>
    </div>
    <!-- end new_topnavi -->
    
</form>
</header>

<script>
	$(document).ready(function() {
		var cnt1d = $(".sub_menu span").size();
		var targetWidth = ( Math.floor(100/parseInt(cnt1d) - 1 ) + "%" );
		
		$(".sub_menu span").css("width", targetWidth);
	});

	function fn_main_headPageMove(menuNo, url){
		document.selectOne.menuNo.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mnu/mpm/EgovMainMenuIndex.do'/>";
	    document.selectOne.submit();
	}

	function actionLogout()
	{
		document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
		document.selectOne.submit();
		//top.document.location.href = "<c:url value='/j_spring_security_logout'/>";
	}
	
	function actionLogin()
	{
		document.selectOne.action = "<c:url value='/uat/uia/egovLoginUsr.do'/>";
		document.selectOne.submit();
	}
	
	function actionJoin()
	{
	    document.selectOne.action = "<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
	    document.selectOne.submit();
	}
	

</script>
