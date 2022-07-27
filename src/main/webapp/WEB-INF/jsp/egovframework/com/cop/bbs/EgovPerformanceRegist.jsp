<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>



<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<script>

	function fn_egov_init(){
		
		var ckeditor_config = {
			filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckUploadImage', 
		};
	}
	
	fn_egov_init();
	
	function fn_egov_regi_article(form) {
		
		//CKEDITOR.instances.nttCn.updateElement();
		/*
		if (!validateArticleVO(form)) {
			return false;
		} else {
			*/
			var validateForm = document.getElementById("articleVO");
			
			
/* 			if(validateForm.secretAt.checked) {
				if(validateForm.sjBoldAt.checked) {
					alert("<spring:message code="comCopBbs.articleVO.secretBold" />");
					return;
				}
				if(validateForm.noticeAt.checked) {
					alert("<spring:message code="comCopBbs.articleVO.secretNotice" />");
					return;
				}
			} */
			
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

			if(validateForm.ageLimit.value == ''){
				alert("관람연력을 입력해주세요.");
				return;
			}
			
			if(validateForm.charge.value == ''){
				alert("관람료를 입력해주세요.");
				return;
			}
			
			if(validateForm.tell.value == ''){
				alert("문의전화를 입력해주세요.");
				return;
			}
			
			if(validateForm.file_1.value == ''){
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
			
			
			if (confirm("<spring:message code="common.regist.msg" />")) {
				validateForm.action="/cop/bbs/insertArticle.do";
				validateForm.submit();
			}
		/*}*/
	}

</script>

<script>
$(function(){
	$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
});
</script>


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

<!-- 				<form method="post" class="schForm">
					<input type="text" id="search" placeholder="검색어를 입력하세요">

					<button type="submit">검색</button>
				</form> -->
				<!--end search-->
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->

		<div class="page_title">공연 등록하기</div>

		<!--start con01-->
		<div class="con01">
			<div class="inner">
				<form id="articleVO" action="/cop/bbs/insertArticle.do" onSubmit="fn_egov_regi_article(document.forms[0]); return false;" method="post" onSubmit="" enctype="multipart/form-data">
					<div class="wTableFrm">
						<h2 class="sound_only">공연 등록하기</h2>
						<table class="wTable" summary="게시글의 내역에 대한 목록을 출력합니다." cellpadding="0" cellspacing="0">
							<caption class="sound_only">공연 등록하기</caption>
							<tbody>
								<tr>
									<th><label for="type">공연종류 <span class="pilsu">*</span></label></th>
									<td class="left">
										<select name="type" id="type" title="공연종류" value="" style="margin-top: -5px;">
												<option>정기</option>
												<option>토요</option>
												<option>기획</option>
										</select>
									</td>
								</tr>
								<tr>
									<th><label for="sjBoldAtMain">메인공연명 <span class="pilsu">*</span></label></th>
									<td class="left">
										<input id="sjBoldAtMain" name="sjBoldAtMain" title="제목 입력" type="text" value="<c:out value="${result.sjBoldAtMain}"/>" size="70" maxlength="70">
									</td>
								</tr>
								<tr>
									<th><label for="nttSj">공연명 <span class="pilsu">*</span></label></th>
									<td class="left">
										<input id="nttSj" name="nttSj" title="제목 입력" type="text" value="<c:out value="${result.nttSj}"/>" size="70" maxlength="70">
									</td>
								</tr>
								<tr class="text">
									<th><label for="nttCn">공연 소개 <span class="pilsu">*</span></label></th>
									<td class="nopd" colspan="3">
										<textarea id="nttCn" name="nttCn" title="내용 입력" escapexml="false" rows="20" cols="300"><c:out value="${result.nttCn}" /></textarea>
										<%-- <form:textarea path="nttCn" title="${title} ${inputTxt}" cols="300" rows="20" escapeXml="false"/> --%>
										<ckeditor:replace replace="nttCn" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor/" />
										<div><form:errors path="nttCn" cssClass="error" /></div>  
									</td>
								</tr>
								<tr>
									<th><label for="sample4_postcode">공연장소 <span class="pilsu">*</span></label></th>
									<td class="left">
<!-- 										<input type="text" id="sample4_postcode" placeholder="우편번호"> 
										<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> 
										<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="margin-top: 5px;">
										<input type="text" id="sample4_jibunAddress" name="address" placeholder="지번주소" style="margin-top: -25px;"> 
										<span id="guide" style="color: #999; display: none"></span>
										<input type="text" id="sample4_detailAddress" name="addressDetail" placeholder="상세주소" >  -->
										<input type="text" id="sample4_detailAddress" name="addressDetail" placeholder="공연장소" >
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
									<th><label for="ageLimit">관람연력 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="ageLimit" name="ageLimit"
										value="<c:out value="${result.ageLimit}"/>" style="width: 126px;" placeholder="전연령, 12세 등" /></td>
								</tr>
								<tr>
									<th><label for="charge">관람료 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="charge" name="charge" title="관람료" type="text"
										value="<c:out value="${result.charge}"/>" size="70" maxlength="70"></td>
								</tr>
								<tr>
									<th><label for="tell">문의전화 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="tell" name="tell" title="문의전화" type="text"
										value="<c:out value="${result.tell}"/>" size="70" maxlength="70"></td>
								</tr>
								<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
									<tr>
										<th><label for="file_1">공연 이미지 <span class="pilsu">*</span></label> </th>
										<td class="nopd" colspan="3">
											<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comCopBbs.articleVO.regist.atchFile"/>"/>
										    <div id="egovComFileList"></div>
										</td>
									</tr>
							  	</c:if>
								<tr>
									<th><label for="startDate">공연 시작일 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="startDate" name="startDate" title="공연시작일" type="date"
										value="" size="70" maxlength="70"></td>
								</tr>
								<tr>
									<th><label for="endDate">공연 마감일 <span class="pilsu">*</span></label></th>
									<td class="left"><input id="endDate" name="endDate" title="공연마감일" type="date"
										value="" size="70" maxlength="70"></td>
								</tr>
								

								<tr>
									<th><label for="takeTime">공연 소요 시간 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="takeTime" name="takeTime"
										value="" onKeyup="inputTimeColon(this);" maxlength="5"
										style="width: 126px;" placeholder="00:00" /></td>
								</tr>
								<tr>
									<th><label for="startTime">공연 시작 시간 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="startTime" name="startTime"
										value="" onKeyup="inputTimeColon(this);"
										maxlength="5" style="width: 126px;" placeholder="00:00" /></td>
								</tr>
								<tr>
									<th><label for="endTime">공연 마감 시간 <span class="pilsu">*</span></label></th>
									<td class="left"><input type="text" id="endTime" name="endTime"
										value="" onKeyup="inputTimeColon(this);" maxlength="5"
										style="width: 126px;" placeholder="00:00" /></td>
									</td>
								</tr>
								<tr>
									<th><label for="endTime">티켓 링크<!--<span class="pilsu">*</span>--></label></th>
									<td class="left">
										<input id="ticketLink" name="ticketLink" title="티켓링크" type="text"
										value="<c:out value="${result.ticketLink}"/>" size="70" maxlength="70">
									</td>
								</tr>

							
							</tbody>
						</table>
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" /> 
						<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" /> 
						<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
						<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" /> 
						<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" /> 
						<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" /> 
						<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" /> 
						<input type="hidden" name="blogId" value="<c:out value='${searchVO.blogId}'/>" /> 
						<input type="hidden" name="blogAt" value="<c:out value='${articleVO.blogAt}'/>" /> 
						<input type="hidden" name="cmd" value="<c:out value='save'/>"> 
						<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
						<div class="btn">
							<input type="submit" class="s_submit" value="등록" title="등록 버튼"> 
							<a class="btn_s" href="#" title="목록  버튼">목록</a>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function inputTimeColon(time) {
	
	    // 먼저 기존에 들어가 있을 수 있는 콜론(:)기호를 제거한다.
	    var replaceTime = time.value.replace(/\:/g, "");
	    // 글자수가 4 ~ 5개 사이일때만 동작하게 고정한다.
	    if(replaceTime.length >= 4 && replaceTime.length < 5) {
	        // 시간을 추출
	        var hours = replaceTime.substring(0, 2);
	        // 분을 추출
	        var minute = replaceTime.substring(2, 4);
	        // 시간은 24:00를 넘길 수 없게 세팅
	        if(hours + minute > 2400) {
	            alert("시간은 24시를 넘길 수 없습니다.");
	            time.value = "24:00";
	            return false;
	        }
	        // 분은 60분을 넘길 수 없게 세팅
	        if(minute > 60) {
	            alert("분은 60분을 넘길 수 없습니다.");
	            time.value = hours + ":00";
	            return false;
	        }
	        // 콜론을 넣어 시간을 완성하고 반환한다.
	        time.value = hours + ":" + minute;
	    }
	}


    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                /*
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                */
            }
        }).open();
    }
</script>

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>