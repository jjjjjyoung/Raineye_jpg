<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>


<c:import url="/menu.do" />

<%-- <script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script> --%>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<style>
.cursor {
	width: 20px;
}
</style>


<script type="text/javascript">


	function fn_egov_init(){
		
		//filebrowserUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImage.do', 
		var ckeditor_config = {
			//filebrowserImageUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImageCk.do', 
			filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckUploadImage', 
		};
		//CKEDITOR.replace('nttCn',ckeditor_config);
		//document.getElementById("articleVO").nttSj.focus();
	}
	fn_egov_init();
	
	function fn_egov_updt_article(form) {
		
		//CKEDITOR.instances.nttCn.updateElement();
		/*
		if (!validateArticleVO(form)) {
			return false;
		} else {
			*/
			var validateForm = document.getElementById("articleVO");
			
			/*
			var sjBoldAtMain =validateForm.sjBoldAtMain.value;
			var addressDetail =validateForm.addressDetail.value;
			var host =validateForm.host.value;
			var charge =validateForm.charge.value;
			var tell =validateForm.tell.value;
			var startDate =validateForm.startDate.value;
			var endDate =validateForm.endDate.value;
			var takeTime =validateForm.takeTime.value;
			var startTime =validateForm.startTime.value;
			var endTime =validateForm.endTime.value;
			var ticketLink =validateForm.ticketLink.value;
			*/
			if(validateForm.sjBoldAtMain.value == ''){
				alert("메인 공연명을 입력해주세요.");
				return;
			}
						
			if(validateForm.nttSj.value == ''){
				alert("공연명을 입력해주세요.");
				return;
			}
			
			if(validateForm.nttCn.value == ''){
				alert("공연소개를 입력해주세요.");
				return;
			}
			
			if(validateForm.addressDetail.value == ''){
				alert("공연장소를 입력해주세요.");
				return;
			}
			
			if(validateForm.host.value == ''){
				alert("주최를 입력해주세요.");
				return;
			}
			
			if(validateForm.subhost.value == ''){
				alert("주관을 입력해주세요.");
				return;
			}
			
			if(validateForm.charge.value == ''){
				alert("관람료를 입력해주세요.");
				return;
			}
			
			if(validateForm.ageLimit.value == ''){
				alert("관람연력을 입력해주세요.");
				return;
			}			
			
			if(validateForm.tell.value == ''){
				alert("문의전화를 입력해주세요.");
				return;
			}
			
			if(validateForm.file_1.value == '' && validateForm.atchFileId.value == ''){
				alert("공연 이미지를 입력해주세요.");
				return;
			}
						
			if(validateForm.startDate.value == ''){
				alert("공연 시작일을 입력해주세요.");
				return;
			}
			
			if(validateForm.endDate.value == ''){
				alert("공연 마감일을 입력해주세요.");
				return;
			}
			
			if(validateForm.takeTime.value == ''){
				alert("공연 소요 시간을  입력해주세요.");
				return;
			}
			
			if(validateForm.startTime.value == ''){
				alert("공연 시작 시간을 입력해주세요.");
				return;
			}
			
			if(validateForm.endTime.value == ''){
				alert("공연 마감 시간을 입력해주세요.");
				return;
			}
			
			/**
			if(validateForm.ticketLink.value == ''){
				alert("티켓링크를 입력해주세요.");
				return;
			}
			**/
			
			
			
			if (confirm("<spring:message code="common.update.msg" />")) {
				validateForm.action="/cop/bbs/updateArticle.do";
				validateForm.submit();
			}
		/*}*/
	}
	/* ********************************************************
	 ******************************************************** */
	function fn_egov_inqire_articlelist() {
		articleVO.action = "<c:url value='/cop/bbs/selectArticleList.do'/>";
		articleVO.submit();
	}

</script>

<script>
$(function(){
	$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
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

				<div class="btn_area3" style="margin-top: 13px;">
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

<%-- 				<form method="post" class="schForm">
					<input type="text" id="search" placeholder="검색어를 입력하세요">

					<button type="submit">검색</button>
				</form> --%>
				<!--end search-->
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->

		<div class="page_title">공연 수정하기</div>

		<div class="con01">
			<div class="inner">
				<form:form commandName="articleVO"
					action="${pageContext.request.contextPath}/cop/bbs/updateArticle.do" method="post"
					onSubmit="fn_egov_updt_article(document.forms[0]); return false;"
					enctype="multipart/form-data">
					<div class="wTableFrm">
						<table class="wTable" summary="게시글의 내역에 대한 목록을 출력합니다." cellpadding="0" cellspacing="0">
							<caption class="sound_only">공연 등록하기</caption>
							<tbody>
								<tr>
									<th><label for="nttSj">공연종류 <span class="pilsu">*</span></label></th>
									<td class="left"><select name="type" title="공연종류" value="" style="margin-top: -5px;">			
											<option <c:if test="${result.type eq '정기'}">selected</c:if>>정기</option>
											<option <c:if test="${result.type eq '토요'}">selected</c:if>>토요</option>
											<option <c:if test="${result.type eq '기획'}">selected</c:if>>기획</option>
									</select></td>
								</tr>
								<tr>
									<th><label for="sjBoldAtMain">메인공연명 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="sjBoldAtMain" name="sjBoldAtMain" title="제목 입력" type="text"
										value="<c:out value="${result.sjBoldAtMain}"/>" size="70" maxlength="70"></td>
								</tr>
								<tr>
									<th><label for="nttSj">공연명 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="nttSj" name="nttSj" title="제목 입력" type="text"
										value="<c:out value="${result.nttSj}"/>" size="70" maxlength="70"></td>
								</tr>
								<tr class="text">
									<th><label for="nttCn">공연 소개 <span class="pilsu">*</span></label></th>
									<td class="nopd" colspan="3">
										<textarea id="nttCn" name="nttCn" title="내용 입력" escapexml="false" rows="20" cols="300"><c:out value="${result.nttCn}" /></textarea>
										<ckeditor:replace replace="nttCn" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor/" />
										<div><form:errors path="nttCn" cssClass="error" /></div>  
									</td>
								</tr>
								<tr>
									<th><label for="sample4_detailAddress">공연장소 <span class="pilsu">*</span></label></th>
									<td class="left">
										<input type="text" id="sample4_detailAddress" name="addressDetail" placeholder="공연장소" value='<c:out value="${result.addressDetail }"/>'	> 
									</td>
								</tr>
								<tr>
									<th><label for="host">주최 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="host" name="host" title="주최" type="text"
										value="<c:out value="${result.host}"/>" size="70" maxlength="70"></td>
								</tr>
								<tr>
									<th><label for="host">주관 <span class="pilsu">*</span></label></th>
									<td class="left">
										<input id="subhost" name="subhost" title="주관" type="text" value="<c:out value="${result.subhost}"/>" size="70" maxlength="70">
									</td>
								</tr>
								<tr>
									<th><label for="ageLimit">관람연력2 <span class="pilsu">*</span></label></th>
									<td class="left">
										<input type="text" id="ageLimit" name="ageLimit" value="<c:out value="${result.ageLimit}"/>" style="width: 126px;" placeholder="전연령, 12세 등">
									</td>
								</tr>
								<tr>
									<th><label for="charge">관람료 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="charge" name="charge" title="관람료" type="text"
										value="<c:out value="${result.charge}"/>" size="70" maxlength="70"></td>
								</tr>
								<tr>
									<th><label for="tell">공연문의 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="tell" name="tell" title="문의전화" type="text"
										value="<c:out value="${result.tell}"/>" size="70" maxlength="70"></td>
								</tr>
								<tr>
									<th><label for="startDat">공연 시작일 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="startDat" name="startDate" title="공연시작일" type="date"
										value="<c:out value="${fn:substring(result.ntceBgnde,0,10)}"/>" size="70" maxlength="70" style="margin-top: 1%;"></td>
								</tr>
								<tr>
									<th><label for="endDate">공연 마감일 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="endDate" name="endDate" title="공연마감일" type="date"
										value="<c:out value="${fn:substring(result.ntceEndde,0,10)}"/>" size="70" maxlength="70" style="margin-top: 1%;"></td>
								</tr>
								<tr>
									<th><label for="takeTime">공연 소요 시간 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="takeTime" name="takeTime"
										value="<c:out value="${result.takeTime}"/>" onKeyup="inputTimeColon(this);" maxlength="5"
										style="width: 126px;" placeholder="00:00" /></td>
								</tr>
								<tr>
									<th><label for="startTime">공연 시작 시간 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="startTime" name="startTime"
										value="<c:out value="${result.startTime}"/>" onKeyup="inputTimeColon(this);"
										maxlength="5" style="width: 126px;" placeholder="00:00" /></td>
								</tr>
								<tr>
									<th><label for="endTime">공연 마감 시간 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="endTime" name="endTime"
										value="<c:out value="${result.endTime}"/>" onKeyup="inputTimeColon(this);" maxlength="5"
										style="width: 126px;" placeholder="00:00" /></td>
									</td>
								</tr>
								<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
									<tr>
										<th>첨부파일</th>
										<td class="nopd" colspan="3">
											<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
												<c:param name="param_atchFileId" value="${articleVO.atchFileId}" />
											</c:import>
										</td>
									</tr>
									<tr>
										<th><label for="file_1">첨부파일 추가</label> </th>
										<td class="nopd" colspan="3">
											<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comCopBbs.articleVO.updt.atchFile"/>"/>
										    <div id="egovComFileList"></div>
										</td>
									</tr>
			
								</c:if>
								<tr>
									<th><label for="ticketLink">티켓 링크<!--<span class="pilsu">*</span>--></label></th>
									<td class="left">
										<input id="ticketLink" name="ticketLink" title="티켓링크" type="text"
										value="<c:out value="${result.ticketLink}"/>" size="70" maxlength="70">
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn">
							<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
							<span class="btn_s">
								<a href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}" title="<spring:message code="button.list" /> <spring:message code="input.button" />">
									<spring:message code="button.list" />
								</a>
							</span>
						</div>
						<div style="clear: both;"></div>

					</div>
					<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/updateArticleView.do'/>"/>
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
					<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
					<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
					<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
					<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
					<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
					<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
					<input name="nttId" type="hidden" value="${articleVO.nttId}">
					<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
				</form:form>


				<script type="text/javascript">
					/* var maxFileNum = document.getElementById('atchPosblFileNumber').value;
					if(maxFileNum==null || maxFileNum==""){
						maxFileNum = 3;
					}
					var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
					multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) ); */
					
					var fileListCnt = document.getElementById('fileListCnt').value;
					var atchPosblFileNumber = document.getElementById('atchPosblFileNumber').value;
					if(fileListCnt >= atchPosblFileNumber){
						document.getElementById('egovComFileUploader').disabled = true;
					}
					
				</script>


			</div>
			<!-- end content -->
		</div>
		<!-- end wrap -->
	</div>
</div>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>