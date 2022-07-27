<%--
/**
 * @Class Name  : EgovBannerView.jsp
 * @Description : EgovBannerView.jsp
 * @Modification Information
 * @
 * @  수정일        수정자          수정내용
 * @ ----------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 * @ 2014.03.31    유지보수         fileSn=0 삭제(파일 수정시 오류)
 * @ 2018.08.30    이정은               공통컴포넌트 3.8 개선 
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!-- 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 세로배열 -->
<c:if test="${resultType == 'vertical'}">
<ul  class="vertical slick-slider">
    <c:forEach var="fileVO" items="${fileList}" varStatus="status">
	<li>
		<a href="<c:out value="${fileVO.linkUrl}"/>" target="_blank"  title="새 창으로 이동" ><img alt="배너 이미지" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>'></a>
    </li>
	<li>
		<a href="<c:out value="${fileVO.linkUrl}"/>" target="_blank"  title="새 창으로 이동" ><img alt="배너 이미지" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>'></a>
    </li>
	<li>
		<a href="<c:out value="${fileVO.linkUrl}"/>" target="_blank"  title="새 창으로 이동" ><img alt="배너 이미지" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>'></a>
    </li>
    </c:forEach>
</ul>
</c:if>

<!-- 가로배열 -->
<c:if test="${resultType == 'horizontal'}">
<ul class="regular">
    <c:forEach var="fileVO" items="${fileList}" varStatus="status">
	<li>
		<a href="<c:out value="${fileVO.linkUrl}"/>" target="_blank"  title="<c:out value="${fileVO.bannerNm}"/>" ><img alt="<c:out value="${fileVO.bannerDc}"/>" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>' ></a>
    </li>
    </c:forEach>
</ul>
</c:if>

<%
	String ip = request.getHeader("X-Forwarded-For");
%>

<!-- 커스텀 -->
<div id="go_direct" style="position:absolute; top:0; left:0; height:0.5px"></div>
<c:if test="${resultType == 'custom'}">
<div class="cont01 pannel" id="panel-1" style="width:1426px;">
    <div  class="visual" >
    <c:forEach var="fileVO" items="${fileList}" varStatus="status">
    <div  class="slick-slide" >
    	<c:choose>
    		<c:when test="${fileVO.linkUrl != null}">
				<a class="tabindex_slick" href="<c:out value="${fileVO.linkUrl}"/>" target="_blank" ><img alt="<c:out value="${fileVO.bannerDc}"/>" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>'></a>    		
    		</c:when>
    		<c:otherwise>
				<img alt="<c:out value="${fileVO.bannerDc}"/>" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>'>    		
    		</c:otherwise>
    	</c:choose>        
    </div>
    </c:forEach>
	</div>
	<% //if(ip.equals("221.144.12.3")) { %>
	<div class="slick_nav">
		<div class="slick_btn">
			<button type="button" class="prev" title="이전"><i class="material-icons">arrow_back_ios</i></button>
			<button type="button" class="play" style="display: none;" title="재생"><i class="material-icons">play_arrow</i></button>
			<button type="button" class="pause" title="정지"><i class="material-icons">pause</i></button>
			<button type="button" class="next" title="다음"><i class="material-icons">arrow_forward_ios</i></button>
		</div>
	</div>
	<% //} %>
</div>
</c:if>

