<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
	<c:when test="${kid == 'Y' }">
		<c:import url="/kidMenu.do"/>
	</c:when>
	<c:otherwise>
		<c:import url="/menu.do"/>
	</c:otherwise>
</c:choose>

<script>
$(function(){
	$('.kidGnb .kid_mn5').addClass('on');		
});

var bbsId = "${boardMasterVO.bbsId}";

$(function(){
	if (bbsId == "BBSMSTR_000000000046"){
    	$('html > head > title').text('상세페이지 - 교육/체험 안내');
	}	else if (bbsId == "BBSMSTR_000000000041")	{
		$('html > head > title').text('상세페이지 - 공지사항');
		
	}	else if (bbsId == "BBSMSTR_000000000042")	{
		$('html > head > title').text('상세페이지 - 채용공고');
		
	}	else if (bbsId == "BBSMSTR_000000000044")	{
		$('html > head > title').text('상세페이지 - 뉴스레터');
		
	}	else if (bbsId == "BBSMSTR_000000000045")	{
		$('html > head > title').text('상세페이지 - 관람후기');
		
	}	
});
</script>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
	<!--
	<link type="text/css" rel="stylesheet" href="/html/egovframework/com/cmm/utl/ckeditor/contents.css?t=I3I82">
	<link type="text/css" rel="stylesheet" href="/html/egovframework/com/cmm/utl/ckeditor/plugins/copyformatting/styles/copyformatting.css">
	<link type="text/css" rel="stylesheet" href="/html/egovframework/com/cmm/utl/ckeditor/plugins/tableselection/styles/tableselection.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssreset-context/cssreset-context-min.css">

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
    <div id="container">
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
				<!-- 
                <form method="post" class="schForm">
                    <input type="text" id="search" placeholder="공연명을 입력하세요" title="공연명 입력">

                    <button type="submit">검색</button>
                </form>
                -->
                <!--end search-->
            </div>
            <!--end inner-->
        </div>
        <!--end sub_top-->

        <!--start content-->
        <div class="contentWrap" id="go_direct">
			
	        <h3 class="page_title"><c:out value="${boardMasterVO.bbsIntrcn }"/></h3>	
	        <div class="view_table">
	            <!--start con01-->
	            <div class="con01">
	                <div class="inner">
	                    <div class="vw_head">
	                        <ul class="top">
	                            <li class="title jana_jcs01">
	                            	<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000046'}">	
										<c:if test="${result.eduVal == '1'}">	
			                   				<strong class="txtBlue">[교육]</strong>
		                   				</c:if>
		                   				<c:if test="${result.eduVal == '2'}">	
			                   				<strong class="txtGreen">[체험]</strong>
			                   			</c:if>
		                   			</c:if>
		                   			<c:if test="${boardMasterVO.bbsId == 'BBSMSTR_000000000041'}">
										<c:if test="${result.eduVal == '3'}">	
			                   				<strong class="txtPup">[입찰]</strong>
		                   				</c:if>
		                   				<c:if test="${result.eduVal == '4'}">	
			                   				<strong class="txtSky2">[공지]</strong>
			                   			</c:if>
		                   			</c:if>
	                            	&nbsp;<c:out value="${result.nttSj}"  escapeXml = "false" />
	                            </li>
	                            <li class="date txtGray2 marfi2t jana_jcs02"><c:out value='${result.frstRegisterPnttm}'/></li>
	                            <li class="views txtGray2 marfi2t jana_jcs02 carry_nomargs">조회수 <c:out value='${result.inqireCo}'/></li>
	                        </ul>
	                        <ul class="bt vlxnl_4">
	                        	<li class="file file_fxeto">
									<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${result.atchFileId}" />
									</c:import>
								</li>
	                            <li class="user_name file_fxeto">작성자<span class="txtPink"><c:out value='${result.frstRegisterNm}'/></span></li>
	                        </ul>
	                    </div>
	                    <!--end vw_head-->
						
						<div class="yui3-cssreset">
	                    <div class="vw_con yui3-cssreset cke_editable cke_editable_themed cke_contents_ltr cke_show_borders clip_edit_boxo">
	                        <c:out value='${result.nttCn}' escapeXml="false"/>
	                    </div>
	                    </div>
	                    <!--end vw_con-->
	
	                    <div class="btn_area4">
	                        <div>
	                        	<!-- 
	                            <a class="prev_pg" href="#">다음글</a>
	                            <a class="next_pg" href="#">이전글</a>
	                            -->
	                            <c:if test="${user.id == 'webmaster' || (user.id == result.ntcrId && boardMasterVO.bbsId == 'BBSMSTR_000000000045')}">
	                            <form id="formDelete" name="formDelete" action="" method="post" style="float:right; margin:0 0 0 3px;">
									<input type="button" class="s_submit" id="uptBtn" value="수정" title="수정 버튼" style="width: 100px;height: 30px;line-height: 28px;text-align: center;border: 1px solid #999;color: #666;font-size: 15px;transition: all .2s;">
									<input type="button" class="s_submit" id="dltBtn" value="삭제" title="삭제 버튼" style="width: 100px;height: 30px;line-height: 28px;text-align: center;border: 1px solid #999;color: #666;font-size: 15px;transition: all .2s;">
									<input name="nttId" type="hidden" value="<c:out value='${result.nttId}'/>">
									<input name="bbsId" type="hidden" value="<c:out value='${result.bbsId}'/>">
								</form>
								</c:if>
	                        </div>
	                        <div class="list">
	                        	<c:choose>
		                        	<c:when test="${kid == 'Y' }">
										<a href="/cop/bbs/selectArticleList.do?bbsId=<c:out value='${result.bbsId }'/>&type=k">목록</a>
									</c:when>
									<c:otherwise>
										<a href="/cop/bbs/selectArticleList.do?bbsId=<c:out value='${result.bbsId }'/>">목록</a>
									</c:otherwise>
								</c:choose>
	                        </div>
	                    </div>
	                </div>
	                <!--end inner-->
	            </div>
	            <!--end con01-->
	        </div>
	        <!--end bo_v bo_v_ntc-->
		</div>
		<!--end contentWrap-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->

<script>
$("#dltBtn").on("click", function() {
	if(confirm("<spring:message code="common.delete.msg" />")){	
		$("#formDelete").attr("action", "/cop/bbs/deleteArticle.do");
		$("#formDelete").submit();
	}		
});

$("#uptBtn").on("click", function() {
	$("#formDelete").attr("action", "/cop/bbs/updateArticleView.do");
	$("#formDelete").submit();
});
</script>

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>