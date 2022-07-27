<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>
<script type="text/javascript">
	$('.btn_d a').on('click', function(){
		if(!confirm('정말 삭제하시겠습니까?')){
			return false;
		}
	});
</script>
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="sub0<c:out value='${fn:substring(meCode,0,1) }'/>">
    <div class="sub_visual">
    	<c:choose>
	    	<c:when test="${fn:substring(meCode,0,1).equals('5') }">
	    		<h2><c:out value="${meName}"/></h2>
	    	</c:when>
	    	<c:otherwise>
	    		<h2><c:out value="${parentName}"/></h2>
	    	</c:otherwise>
    	</c:choose>
    </div>
	
	<div id="container" id="go_direct">
	    <div class="sub_top">
	        <div class="inner">
	            <div class="page_navi">
                    <div class="first_mn">
						<strong class="mn_tit" tabindex="0"><c:out value="${parentName}"/> </strong>
						<div class="mn_2nd">
							<c:forEach var="item" items="${list_menumanage}" varStatus="index">
								<c:if test="${fn:length(item.meCode) == 2 }">
									<a href="<c:out value="${item.meLink}"/>"><c:out value="${item.meName}"/> </a> 
							    </c:if>
                			</c:forEach>
						</div>
					</div>   	
					
					<!--end first_mn 대메뉴-->
					<div class="second_mn">
						<strong class="mn_tit" tabindex="0"><c:out value="${meName}"/></strong>
						<div class="mn_2nd">
							<c:forEach var="item" items="${list_menumanage}" varStatus="index">
								<c:if test="${fn:length(item.meCode) == 4 }">

									<c:if test="${fn:substring(item.meCode,0,2) == parentCode}">
										<a href="<c:out value="${item.meLink}"/>"><c:out value="${item.meName}"/> </a>
									</c:if> 
							    </c:if>
                			</c:forEach>
						</div>
					</div>
	                <!--end second_mn 중메뉴-->
	            </div>
	            <!--end sub_navi-->
	            
				<div class="btn_area3">
					<button class="font_resize" href="#"><img alt="폰트사이즈 조절 버튼" src="/images/egovframework/com/jpg/icon/font.png"></button> 
					<div class="font_pop">
						<div>
						    <span>크기:</span>
						    <button class="big" title="크게"><img alt="폰트사이즈 크게 버튼" src="/images/egovframework/com/jpg/icon/big.png"></button>
						    <button class="small" title="작게"><img alt="폰트사이즈 작게 버튼" src="/images/egovframework/com/jpg/icon/small.png"></button>
					    </div>
					</div>
					<button class="print" onclick="window.print();"><img alt="프린트하기 버튼" src="/images/egovframework/com/jpg/icon/print.png"></button>
				</div>
	            
<!-- 	            <form method="post" class="schForm">
	                <input type="text" id="search" placeholder="검색어를 입력하세요">
	
	                <button type="submit">검색</button>
	            </form> -->
	            <!--end search-->
	        </div>
	        <!--end inner-->
	    </div>
	    <!--end sub_top-->

        <!--start content-->
        <div class="contentWrap">
	
		    <h3 class="page_title">예술단원소개</h3>
		
		    <!--start con01-->
		    <div class="con01 detail">
		        <div class="inner">
		            <div>
		                <div class="left"><img src="/cmm/fms/getImage.do?atchFileId=${result.atchFileId}" alt="${result.empNm}"></div>
		                <div class="right">
		                    <dl>
		                        <dt>${result.empDept }</dt>
		                        <dd class="member_name"><h4>${result.empNm }</h4></dd>
		                    </dl>
		                    <c:if test="${result.empDept != '지도교사'}">
		                    <dl>
		                        <dt><p style="visibility:hidden">한줄소개</p></dt>
		                        <dd>${result.empIntro }</dd>
		                    </dl>
		                    </c:if>
		                    <dl>
		                        <dt>학력</dt>
		                        <dd>${result.empEdu }</dd>
		                    </dl>
		                    <dl>
		                        <dt>주요경력</dt>
		                        <dd>${result.empCareer }</dd>
		                    </dl>
		                </div>
		            </div>
	           	<c:if test="${user.id == 'webmaster'}">
	       		<div class="btn">
		       		<span class="btn_b" style="float:right;">
						<a style="float:none;position: inherit;" href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a>
						<a style="float:none;position: inherit;" href="<c:url value='/cop/bbs/updateArticleView.do' />?nttId=${result.nttId}&bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.update" />  <spring:message code="input.button" />"><spring:message code="button.update" /></a>
						<a style="float:none;position: inherit;" href="<c:url value='/cop/bbs/deleteArticle.do' />?nttId=${result.nttId}&bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.delete" />  <spring:message code="input.button" />"><spring:message code="button.delete" /></a>
					</span>
				</div>
				</c:if>
		        </div>
		        <!--end inner-->
		    </div>
		    <!--end con01-->
		</div>
		<!--end contentWrap-->
	</div>
	<!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>