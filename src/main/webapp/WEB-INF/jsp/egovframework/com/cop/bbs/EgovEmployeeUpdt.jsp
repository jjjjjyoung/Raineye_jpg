<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- <script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script> --%>

<c:choose>
	<c:when test="${kid == 'Y' }">
		<c:import url="/kidMenu.do" />
	</c:when>
	<c:otherwise>
		<c:import url="/menu.do" />
	</c:otherwise>
</c:choose>

<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>"></script>




<script type="text/javascript">


/* ********************************************************
 ******************************************************** */
	function fn_egov_init(){
	

	}
	
	/* ********************************************************
	 ******************************************************** */
	function fn_egov_regist_article(form) {

		//CKEDITOR.instances.nttCn.updateElement();

		//input item Client-Side validate
		/*
		if (!validateArticleVO(form)) {
			return false;
		} else {
		*/
			var validateForm = document.getElementById("articleVO");



			if (confirm("<spring:message code="common.regist.msg" />")) {
				validateForm.action="/cop/bbs/updateArticle.do";
				validateForm.submit();
			}
	/*	}*/
	}
</script>

</head>
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
							<strong class="mn_tit"  tabindex="0"><c:out value="${parentName}" /> </strong>
							<div class="mn_2nd">
								<c:forEach var="item" items="${list_menumanage}" varStatus="index">
									<c:if test="${fn:length(item.meCode) == 2 }">
										<a href="<c:out value="${item.meLink}"/>"><c:out value="${item.meName}" /> </a>
									</c:if>
								</c:forEach>
							</div>
						</div>

						<!--end first_mn 대메뉴-->
						<div class="second_mn">
							<strong class="mn_tit"  tabindex="0"><c:out value="${meName}" /></strong>
							<div class="mn_2nd">
								<c:forEach var="item" items="${list_menumanage}" varStatus="index">
									<c:if test="${fn:length(item.meCode) == 4 }">

										<c:if test="${fn:substring(item.meCode,0,2) == parentCode}">
											<a href="<c:out value="${item.meLink}"/>"><c:out value="${item.meName}" /> </a>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<!--end second_mn 중메뉴-->
					</div>
					<!--end sub_navi-->

					<div class="btn_area3">
						<button class="font_resize" href="#">
							<img alt="폰트사이즈 조절 버튼" src="/images/egovframework/com/jpg/icon/font.png">
						</button>
						<div class="font_pop">
							<div>
								<span>크기:</span>
								<button class="big" title="크게">
									<img alt="폰트사이즈 크게 버튼" src="/images/egovframework/com/jpg/icon/big.png">
								</button>
								<button class="small" title="작게">
									<img alt="폰트사이즈 작게 버튼" src="/images/egovframework/com/jpg/icon/small.png">
								</button>
							</div>
						</div>
						<button class="print" onclick="window.print();">
							<img alt="프린트하기 버튼" src="/images/egovframework/com/jpg/icon/print.png">
						</button>
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
			<div class="page_title">단원 정보 수정</div>
			<!--start con01  -->
			<div id="con01">
				<div class="inner">
					<form:form id="articleVO" action="/cop/bbs/updateArticle.do" method="post" onSubmit="fn_egov_regist_article(); return false;" enctype="multipart/form-data">
						<div class="wTableFrm">
							<h2 class="sound_only">
								<c:if test="${articleVO.bbsId =='BBSMSTR_000000000050'}">어린이 </c:if>
								예술단원 등록
							</h2>
							<table class="wTable" summary="게시글의 내역에 대한 목록을 출력합니다." cellpadding="0" cellspacing="0">
								<caption class="sound_only">게시글 등록</caption>
								<tbody>
									<tr>
										<th><label for="empNm">이름 <span class="pilsu">*</span></label></th>
										<td class="left"><input id="empNm" name="empNm" title="이름 입력" type="text"
											value="${articleVO.empNm }" size="70" maxlength="70"></td>
									</tr>
									<tr>
										<th><label for="empDept">소속 <span class="pilsu">*</span></label></th>
										<td class="left"><select id="empDept" name="empDept">
												<option value="">부서 선택</option>
												<option value="예술감독"
													<c:if test="${articleVO.empDept=='예술감독' }">selected="selected"</c:if>>예술감독</option>
												<option value="객원예술감독"
													<c:if test="${articleVO.empDept=='객원예술감독' }">selected="selected"</c:if>>객원예술감독</option>
												<option value="지도교사"
													<c:if test="${articleVO.empDept=='지도교사' }">selected="selected"</c:if>>지도교사</option>
												<option value="창악부"
													<c:if test="${articleVO.empDept=='창악부' }">selected="selected"</c:if>>창악부</option>																										
												<option value="무용부"
													<c:if test="${articleVO.empDept=='무용부' }">selected="selected"</c:if>>무용부</option>
												<option value="기악부"
													<c:if test="${articleVO.empDept=='기악부' }">selected="selected"</c:if>>기악부</option>
												<option value="사물부"
													<c:if test="${articleVO.empDept=='사물부' }">selected="selected"</c:if>>사물부</option>
										</select></td>
									</tr>
									<tr>
										<th style="height: 70px;"><label for="empNo">순서<span class="pilsu">*</span></label></th>
										<td style="height: 70px;" class="left"><input id="empNo" name="empNo" title="순서 입력" type="text"
											value="${articleVO.empNo }" size="70" maxlength="70">
											<span style="position:relative;top: -25px;font-size:12px;">*순서가 낮을수록 먼저 출력됩니다.</span>
										</td>
									</tr>
									<tr>
										<th><label for="empPosi">직책 <span class="pilsu">*</span></label></th>
										<td class="left"><input id="empPosi" name="empPosi" title="직책 입력" type="text"
											value="${articleVO.empPosi }" size="70" maxlength="70"></td>
									</tr>
									<tr>
										<th><label for="empIntro">직책 <span class="pilsu">*</span></label></th>
										<td class="left"><input id="empIntro" name="empIntro" title="직책 입력" type="text"
											value="${articleVO.empIntro }" size="70" maxlength="70"></td>
									</tr>
									<tr class="text">
										<th><label for="empEdu">학력 <span class="pilsu">*</span></label></th>
										<td class="nopd" colspan="3"><textarea id="empEdu" name="empEdu" title="내용 입력"
												escapexml="false" rows="20" cols="300">${articleVO.empEdu }</textarea></td>
									</tr>
									<tr class="text">
										<th><label for="empCarrer">경력 <span class="pilsu">*</span></label></th>
										<td class="nopd" colspan="3"><textarea id="empCareer" name="empCareer" title="내용 입력"
												escapexml="false" rows="20" cols="300">${articleVO.empCareer }</textarea></td>
									</tr>

									<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
										<tr>
											<th>프로필 이미지</th>
											<td class="nopd" colspan="3"><c:import url="/cmm/fms/selectFileInfsForUpdate.do"
													charEncoding="utf-8">
													<c:param name="param_atchFileId" value="${articleVO.atchFileId}" />
												</c:import></td>
										</tr>
										<tr>
											<th>프로필 이미지 업로드</th>
											<td class="nopd" colspan="3"><input name="file_1" id="egovComFileUploader"
												type="file" title="<spring:message code="comCopBbs.articleVO.updt.atchFile"/>" />
												<div id="egovComFileList"></div></td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<div class="btn">
								<input type="submit" class="s_submit" value="<spring:message code="button.create" />"
									title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
								<span class="btn_s">
								<a href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}" title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message
											code="button.list" /></a></span>
							</div>
							<div style="clear: both;"></div>
						</div>
				</div>
				<c:if test="${articleVO.bbsId=='BBSMSTR_000000000050'}">
					<input type="hidden" name="empKidAt" value="Y">
				</c:if>
				<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/updateArticleView.do'/>"/>
				<input type="hidden" name="nttId" value="<c:out value='${articleVO.nttId}'/>" /> 
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" /> 
				<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" /> 
				<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" /> 
				<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
				<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" /> 
				<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" /> 
				<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" /> 
				<input type="hidden" name="blogId" value="<c:out value='${searchVO.blogId}'/>" /> 
				<input type="hidden" name="blogAt" value="<c:out value='${articleVO.blogAt}'/>" /> 
				<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>"> 
				<input type="hidden" name="empAt" value="Y">
				</form:form>




			</div>
			<!-- end content -->
		</div>
		<!-- end wrap -->

<script type="text/javascript">
/* var maxFileNum = document.getElementById('atchPosblFileNumber').value;
if(maxFileNum==null || maxFileNum==""){
	maxFileNum = 3;
}
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
 */
var fileListCnt = document.getElementById('fileListCnt').value;
var atchPosblFileNumber = document.getElementById('atchPosblFileNumber').value;
if(fileListCnt >= atchPosblFileNumber){
	document.getElementById('egovComFileUploader').disabled = true;
}

</script> 
		<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>
		
		
		
		
		