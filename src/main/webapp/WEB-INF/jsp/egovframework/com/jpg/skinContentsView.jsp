<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:choose>
	<c:when test="${kid == 'Y' }">
		<c:import url="/kidMenu.do" />
	</c:when>
	<c:otherwise>
		<c:import url="/menu.do" />
	</c:otherwise>
</c:choose>
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<link rel="stylesheet" href="/css/egovframework/com/jpg/style2.css">

<script>
	$(function(){
		var category=$('.page_title').text();
		if(category.trim()=="공연예매" || category.trim()=="관람안내"){
			$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
		}else{
			$('.kidGnb .kid_mn1').addClass('on');		
		   	$('#gnb > ul > li:first-of-type').addClass('on2');		
		   	$('.sub04').siblings('#header').find($('#gnb > ul > li:nth-of-type(1)')).removeClass('on2');
			$('.sub04').siblings('#header').find($('#gnb > ul > li:nth-of-type(4)')).addClass('on2');
		}
	});
	
	/* $(function(){
		$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
	}); */
</script>


<style>
.text_area img {width:100% !important}
</style>



<div id="subWrap" class="sub0<c:out value='${fn:substring(meCode,0,1) }'/>">
    <div class="sub_visual">
    	<c:choose>
	    	<c:when test='${fn:substring(meCode,0,1).equals("5") }'>
	    		<h2><c:out value="${meName}"/></h2>
	    	</c:when>
	    	<c:otherwise>
	    		<h2><c:out value="${parentName}"/></h2>
	    	</c:otherwise>
    	</c:choose>
    </div>
	<div id="container" <c:if test="${vo.ctsId.equals('faq')}">class="faq"</c:if> <c:if test="${vo.ctsId.equals('location')}">class="location"</c:if>>
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
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->

        <!--start content-->
        <div class="contentWrap" id="go_direct">
			<h3 class="page_title"><c:out value="${vo.ctsNm}"/> </h3>
			<!--start con01-->
			<c:choose>
				<c:when test="${vo.ctsId.equals('location')}">
					<div class="inner">
						<c:out value="${vo.ctsCn}" escapeXml="false"/>
					</div>
				</c:when>
				<c:otherwise>
					<div class="con01">
						<div class="inner">
							<div class="text_area">
								<c:out value="${vo.ctsCn}" escapeXml="false"/>
							</div>	
						</div>
						<!--end inner-->
					</div>
				
				</c:otherwise>
			
			</c:choose>
			<!--end con01-->
		</div>
		
		<!--end contentWrap-->
	</div>
	<!--end container-->
</div>
<!--end subWrap-->

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>