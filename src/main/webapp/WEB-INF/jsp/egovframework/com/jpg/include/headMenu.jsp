<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
		<span> <a tabindex = "2" href="<c:out value='${item.linkUrl }' />" title="<c:out value="${item.menuNm }" />"><c:out value="${item.menuNm }" /></a>
			<c:set var="cnt1d" value="${cnt1d+1 }" /> <c:set var="menu1d" value="true" />
	</c:if>

	<c:if test="${item.upperMenuId != 0 && menu1d }">
		<c:if test="${!menuOC }">
			<ul>
				<c:set var="menuOC" value="true" />
		</c:if>

		<li><a tabindex = "2" href="<c:out value='${item.linkUrl }' />" title="<c:out value="${item.menuNm }" />"><c:out value="${item.menuNm }" /></a></li>
		<c:set var="menu2d" value="true" />

	</c:if>

</c:forEach>

