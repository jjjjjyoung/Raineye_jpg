<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/menu.do"/>
<script src="/js/egovframework/com/cmm/jquery-ui_1.12.1.js"></script>
<link rel="stylesheet" href="/css/egovframework/com/cmm/jquery-ui_1.12.1.css">
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

                <form method="post" class="schForm">
                    <input type="text" id="search" placeholder="검색어를 입력하세요">

                    <button type="submit">검색</button>
                </form>
                <!--end search-->
            </div>
            <!--end inner-->
        </div>
        <!--end sub_top-->

        <div class="page_title">사진 등록</div>

        <!--start con01-->
        <div class="con01">
            <div class="inner">
                <form id="articleVO" action="/cop/bbs/insertArticle.do" method="post" onsubmit="fn_egov_regist_article(); return false;" enctype="multipart/form-data">
                    <div class="wTableFrm">
                        <h2 class="sound_only">게시글 등록</h2>
                        <table class="wTable" summary="게시글의 내역에 대한 목록을 출력합니다." cellpadding="0" cellspacing="0">
                            <caption class="sound_only">게시글 등록</caption>
                            <tbody>
                                <tr>
                                    <th><label for="nttSj">제목 <span class="pilsu">*</span></label></th>
                                    <td class="left">
                                        <input id="nttSj" name="nttSj" title="제목 입력" type="text" value="" size="70" maxlength="70">
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="nttCn">공연명 <span class="pilsu">*</span></label></th>
                                    <td class="left">
                                        <input id="nttCn" name="nttCn" title="공연명 입력" type="text" value="" size="70" maxlength="70">
                                    </td>
                                </tr>
                             	<tr>
									<th><label for="ntceBgnde">날짜 </label><span class="pilsu">*</span></th>
									<td class="left" colspan="3">
										<input id="ntceBgnde" name="ntceBgnde" title="시작날짜" size="70" maxlength="70"  style="width:70px;" readonly="true" />
										&nbsp;~&nbsp;<input id="ntceEndde" name="ntceEndde" title="끝날짜" size="70" maxlength="70" style="width:70px;" readonly="true" />
									</td>
								</tr>
                                <c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
                                <tr>
                                    <th><label for="file_1">첨부파일</label><span class="pilsu">*</span> </th>
                                    <td class="nopd" colspan="3">
                                        <input name="file_0" id="egovfile_0" type="file" title="첨부파일">
                                        <div id="egovComFileList"></div>
                                    </td>
                                </tr>
                                </c:if>
                            </tbody>
                        </table>
                        
                        <input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
						<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
						<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
						<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
						<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
						<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
						<input type="hidden" name="blogId" value="<c:out value='${searchVO.blogId}'/>" />
						<input type="hidden" name="blogAt" value="<c:out value='${articleVO.blogAt}'/>"/>
						<input type="hidden" name="cmd" value="<c:out value='save'/>">
						<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
                        
                        <div class="btn">
                            <input type="submit" class="s_submit" value="등록" title="등록 버튼" onClick="fn_egov_regist_article(); return false;">
                            <a class="btn_s" href="/cop/bbs/selectArticleList.do?bbsId=<c:out value='${boardMasterVO.bbsId }'/>" title="목록  버튼">목록</a>
                        </div>
                    </div>
                </form>
            </div>
            <!--end inner-->
        </div>
        <!--end con01-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->
<script>
$(function() {
	$("#ntceBgnde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true 
	         , changeYear: true  
	         , showButtonPanel: true 
	});
	$("#ntceEndde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true 
	         , changeYear: true  
	         , showButtonPanel: true 
	});
});

function fn_egov_regist_article() {

	//input item Client-Side validate
	var validateForm = document.getElementById("articleVO");
	var varFileNm = $(".egovfile_0").val();
	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp|docx|doc|xlsx|xls|pptx|ppt|hwp)$/i;
	/*
	if (validateForm.secretAt.checked) {
		if (validateForm.sjBoldAt.checked) {
			alert("<spring:message code="comCopBbs.articleVO.secretBold" />");
			return;
		}
		if (validateForm.anonymousAt.checked) {
			alert("<spring:message code="comCopBbs.articleVO.secretAnonymous" />");
			return;
		}
		if (validateForm.noticeAt.checked) {
			alert("<spring:message code="comCopBbs.articleVO.secretNotice" />");
			return;
		}
	}
	
	if (validateForm.anonymousAt.checked) {
		if (validateForm.noticeAt.checked) {
			alert("<spring:message code="comCopBbs.articleVO.anonymousNotice" />");
			return;
		}
	}

	 
	var ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
	var ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

	if (ntceBgnde == '' && ntceEndde != '') {
		validateForm.ntceBgnde.value = '1900-01-01';
	}
	if (ntceBgnde != '' && ntceEndde == '') {
		validateForm.ntceEndde.value = '9999-12-31';
	}
	if (ntceBgnde == '' && ntceEndde == '') {
		validateForm.ntceBgnde.value = '1900-01-01';
		validateForm.ntceEndde.value = '9999-12-31';
	}
	*/
	if(validateForm.nttSj.value == ''){
		alert("제목을 입력해주세요.");
		return;
	}
	
	if(validateForm.nttCn.value == ''){
		alert("공연명을 입력해주세요.");
		return;
	}
		
	if(validateForm.ntceBgnde.value == '' || validateForm.ntceEndde.value == ''){
		alert("날짜를 입력해주세요.");
		return;
	}
	
	if(validateForm.file_0.value == ''){
		alert("첨부파일을 입력해주세요.");
		return;
	}

	if (confirm("<spring:message code="common.regist.msg" />")) {
		validateForm.action="/cop/bbs/insertArticle.do";
		validateForm.submit();
	}
}
</script>

	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>