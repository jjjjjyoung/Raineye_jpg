<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<c:choose>
	<c:when test="${kid == 'Y' }">
		<c:import url="/kidMenu.do"/>
	</c:when>
	<c:otherwise>
		<c:import url="/menu.do"/>
	</c:otherwise>
</c:choose>

<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
<style>
.esBtn1{background:#ffa0a0; padding:2px 10px; color:#333;}
.esBtn2{background:#ffc851; padding:2px 10px; color:#333;}
.esBtn3{background:#7ed3ff; padding:2px 10px; color:#333;}
.esBtn4{background:#91e463; padding:2px 10px; color:#333;}
</style>

<script>
$(function(){
	$('.kidGnb .kid_mn5').addClass('on');		
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
                    <input type="text" id="search" placeholder="검색어를 입력하세요">

                    <button type="submit">검색</button>
                </form>
                -->
                <!--end search-->
            </div>
            <!--end inner-->
        </div>
        <!--end sub_top-->

        <h3 class="page_title">글쓰기</h3>

        <!--start con01-->
        <div class="con01">
            <div class="inner">
                <form id="articleVO" action="/cop/bbs/updateArticle.do" method="post" onSubmit="fn_egov_regist_article(); return false;" enctype="multipart/form-data">
                	<c:set var="onVar" value="on"/>
                    <div class="wTableFrm">
                        <h2 class="sound_only">게시글 수정</h2>
                        <table class="wTable" summary="게시글의 내역에 대한 목록을 출력합니다." cellpadding="0" cellspacing="0">
                            <caption class="sound_only">게시글 수정</caption>
                            <tbody>
                                <tr>
                                    <th><label for="nttSj">제목 <span class="pilsu">*</span></label></th>
                                    <td class="left">
                                        <input id="nttSj" name="nttSj" title="제목 입력" type="text" value="<c:out value='${articleVO.nttSj}'  escapeXml = "false" />" size="70" maxlength="70">
                                    </td>
                                </tr>
                                
                                <c:choose>
		                   			<c:when test="${articleVO.bbsId == 'BBSMSTR_000000000043' }">
			                   			<tr>
	                                    <th><label for="nttCn">링크 <span class="pilsu">*</span></label></th>
	                                    <td class="left">
											<input id="nttCn" name="nttCn" title="제목 입력" type="text" value="<c:out value='${articleVO.nttCn}'/>" >
	                                    </td>
									                      </tr>
		                   			</c:when>
		                   			<c:otherwise>
		                   			<tr class="text">
	                                    <th><label for="nttCn">내용 <span class="pilsu">*</span></label></th>
	                                    <td class="nopd" colspan="3">
	                                        <textarea class="ckeditor txaClass2" id="nttCn" name="nttCn" rows="10" cols="14" placeholder="내용을 입력하세요.">
												<c:out value="${articleVO.nttCn }" escapeXml="false"/>
											</textarea>
	                                        
	                                    </td>
									</tr>			                              
									</c:otherwise>
								</c:choose>
								
								<!-- 
                                <tr class="text">
                                    <th><label for="nttCn">내용 <span class="pilsu">*</span></label></th>
                                    <td class="nopd" colspan="3">

                                        <textarea class="ckeditor txaClass2" id="nttCn" name="ctsCn" rows="10" cols="14" placeholder="내용을 입력하세요.">
											<c:out value="${articleVO.nttCn }" escapeXml="false"/>
										</textarea>
                                        
                                    </td>
                                </tr>
                                 -->
                                <tr>
                                    <th><label for="noticeAt">공지등록</label></th>
                                    <td class="left" colspan="3">
                                        <input id="noticeAt" name="noticeAt" type="checkbox" value="Y" <c:if test="${articleVO.noticeAt == 'Y'}">checked</c:if>><input type="hidden" name="_noticeAt" value="on">
                                    </td>
                                </tr>
                                <c:if test="${articleVO.bbsId != 'BBSMSTR_000000000041'}">
                                <tr>
                                    <th><label for="secretAt">비밀글</label></th>
                                    <td class="left" colspan="3">
                                        <input id="secretAt" name="secretAt" type="checkbox" value="Y" <c:if test="${articleVO.secretAt == 'Y'}">checked</c:if>><input type="hidden" name="_secretAt" value="on">
                                    </td>
                                </tr>
                                </c:if>
                                <c:if test="${articleVO.bbsId != 'BBSMSTR_000000000042' && articleVO.bbsId != 'BBSMSTR_000000000043' && articleVO.bbsId != 'BBSMSTR_000000000044' && articleVO.bbsId != 'BBSMSTR_000000000045' && articleVO.bbsId != 'BBSMSTR_000000000061'}">
                                <tr>
                                    <th><label for="eduVal">분류</label></th>
                                    <td class="left" colspan="3">
                                    	<select id="eduVal" name="eduVal" title="분류">
                                    		<c:if test="${articleVO.bbsId == 'BBSMSTR_000000000046'}">
											<option value="1" <c:if test="${articleVO.eduVal == '1'}">selected</c:if>>교육</option>
											<option value="2" <c:if test="${articleVO.eduVal == '2'}">selected</c:if>>체험</option>
											</c:if>
											<c:if test="${articleVO.bbsId == 'BBSMSTR_000000000041'}">
											<option value="3" <c:if test="${articleVO.eduVal == '3'}">selected</c:if>>입찰</option>
											<option value="4" <c:if test="${articleVO.eduVal == '4'}">selected</c:if>>공지</option>
											</c:if>
										</select>
                                    </td>
                                </tr>
                                </c:if>
                                <c:if test="${meCode == '3020'}">
                                <!--<tr>
                                	<th><label for="eduStyle">강좌유형</label></th>
                                	<td class="left">
                                		<input type="radio" name="eduStyle" value="1" <c:if test="${articleVO.eduStyle == 1}"> checked</c:if>> 히트 <span class="esBtn1">히트</span>
                                    	<input type="radio" name="eduStyle" value="2" <c:if test="${articleVO.eduStyle == 2}"> checked</c:if>> 신규 <span class="esBtn2">신규</span>
                                    	<input type="radio" name="eduStyle" value="3" <c:if test="${articleVO.eduStyle == 3}"> checked</c:if>> 인기 <span class="esBtn3">인기</span>
                                    	<input type="radio" name="eduStyle" value="4" <c:if test="${articleVO.eduStyle == 4}"> checked</c:if>> 할인 <span class="esBtn4">할인</span>
                                	</td>
                                </tr>-->
                                </c:if>
                                
                                <tr style="display: none;">
                                    <th><label for="anonymousAt">익명등록</label></th>
                                    <td class="left" colspan="3">
                                        <input id="anonymousAt" name="anonymousAt" type="checkbox" value="Y" <c:if test="${articleVO.anonymousAt == 'Y'}">checked</c:if>><input type="hidden" name="_anonymousAt" value="on">
                                    </td>
                                </tr>
                                <%-- <c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
                                <tr>
                                    <th><label for="file_1">첨부파일</label> </th>
                                    <td class="nopd" colspan="3">
                                        <input name="file_0" id="egovfile_0" type="file" title="첨부파일">
                                        <div id="egovComFileList"></div>
                                    </td>
                                </tr>
                                </c:if> --%>
                                <c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
									<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.atchFile"/></c:set>
									<tr>
										<th>${title}</th>
										<td class="nopd" colspan="3">
											<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
												<c:param name="param_atchFileId" value="${articleVO.atchFileId}" />
											</c:import>
										</td>
									</tr>
			
									<c:set var="title"><spring:message code="comCopBbs.articleVO.updt.atchFileAdd"/></c:set>
									<tr>
										<th><label for="file_1">${title}</label> </th>
										<td class="nopd" colspan="3">
											<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comCopBbs.articleVO.updt.atchFile"/>"/>
										    <div id="egovComFileList"></div>
										</td>
									</tr>
			
								</c:if>
                            </tbody>
                        </table>
                        
                        <input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/updateArticleView.do'/>"/>
                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
						<input type="hidden" name="replyPosblAt"	value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
						<input type="hidden" name="fileAtchPosblAt"	value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
						<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
						<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
						<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
						<input name="nttId" type="hidden" value="${articleVO.nttId}">
						<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
                        
                        <div class="btn">
                            <input type="submit" class="s_submit" value="등록" title="등록 버튼">
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
function fn_egov_regist_article() {

	//input item Client-Side validate
	var validateForm = document.getElementById("articleVO");
	var varFileNm = $(".file_add span").text();
	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp|docx|doc|xlsx|xls|pptx|ppt|hwp)$/i;
	

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

	ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
	ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);
	
	if(validateForm.nttSj.value == ''){
		alert("제목을 입력해주세요.");
		return;
	}
	
	if(validateForm.nttCn.value == ''){
		alert("내용을 입력해주세요.");
		return;
	}

	if (ntceBgnde > ntceEndde) {
		alert("<spring:message code="comCopBbs.articleVO.ntceDeError" />");
		return;
	}
	
	if (!(reg.test(varFileNm)) && varFileNm != "") {
		alert("첨부할 수 없는 파일입니다.");
		return;
	}

	if (confirm("<spring:message code="common.regist.msg" />")) {
		validateForm.action="/cop/bbs/updateArticle.do";
		validateForm.submit();
	}
}
</script>
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>