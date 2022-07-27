<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<script>
$(function(){
    $('html > head > title').text('교육프로그램 - 교육/체험 신청');
});

$(document).ready(function(){
	$('.submit_art_sele06').click(function(){
		$('.joygrason_pop_cisses').fadeIn('slow')
	})
	$('.fgesd_close').click(function(){
		$('.joygrason_pop_cisses').fadeOut('slow')
	})
})

</script>

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

<!--                 <form method="post" class="schForm">
                    <input type="text" id="search" placeholder="검색어를 입력하세요">

                    <button type="submit">검색</button>
                </form> -->
                <!--end search-->
            </div>
            <!--end inner-->
        </div>
        <!--end sub_top-->


        <!--start content-->
        <div class="contentWrap" id="go_direct">

	        <!--list 페이지에서 앞에 '교육'이라고 쓰여있는 글 클릭하면 '교육프로그램'
	            '체험'이라고 쓰여있는 글 클릭하면 '체험프로그램' 바뀌게-->
	        <h3 class="page_title">교육프로그램</h3>
	
	        <div class="view_table2">
	            <!--start con01-->
	            <div class="con01">
	                <div class="inner">
	                    <div class="vw_head">
	                        <div class="left">
	                            <div class="vw_img">
	                                <!-- <img src="/images/egovframework/com/jpg/poster.jpg" alt=""> -->
	                                <img src="/cmm/fms/getImage.do?atchFileId=${result.atchFileId}" alt="${result.eduSubTitle}, ${result.nttSj}">
	                            </div>
	                            
							<div class="jpg_applyClass<c:if test='${result.eduPrice == 1}'>xxx</c:if>">
	                            <div class="btn_area5">
								<%--
 	                        	<c:if test="${Today < fn:substring(result.applySdate,0,10) }">
	                            	<a href="javascript:alert('접수기간이 아닙니다.');">접수하기</a>
	                            </c:if>
	                            <c:if test="${Today > fn:substring(result.applySdate,0,10) && Today < fn:substring(result.applyEdate,0,10)}">
	                            	<a href="/eduRegist.do?nttId=<c:out value='${result.nttId}'/>&bbsId=<c:out value='${boardMasterVO.bbsId}'/>">접수하기</a>
	                            </c:if>
	                            <c:if test="${Today > fn:substring(result.applyEdate ,0,10) }">
	                            	<a href="javascript:alert('접수기간이 아닙니다.');">접수마감</a>
	                            </c:if>
	                             --%>

								<c:if test="${result.eduPrice == 2}">
	                            <c:choose>
		                           	<c:when test="${Today < fn:substring(result.applySdate,0,10) }">
		                            	<a href="javascript:alert('접수기간이 아닙니다.');">접수하기</a>
		                            </c:when>
		                            <c:when test="${Today > fn:substring(result.applyEdate ,0,10) }">
		                            	<a href="javascript:alert('접수기간이 아닙니다.');" class="fin_enter_btn">접수마감</a>
		                            </c:when>
		                            
		                            <c:when test="${ user == null }">
                           				<a href="javascript:alert('로그인 해주세요.');" class="vsdf_btn">접수하기</a>
                           			</c:when>
                           			
                           			<c:otherwise>
		                            	<a class="submit_art_sele06" style="cursor:pointer">접수하기</a>
		                            </c:otherwise>
		                            
	                            </c:choose>
								</c:if>
								<c:if test="${result.eduPrice == 1}">
									<a href="${result.eduUrl}" target="_blank" class="vsdf_btn">영상보기</a>
								</c:if>
	                        </div>
							<c:if test="${result.eduPrice == 2 && result.eduFee > '0'}">
	                        <div class="sale">
								
								<button class="whatApplySalexe">할인정보</button>
								
								<div class="sale_pop mjm_pbc_box sig_fopdZe" style="display:none; bottom: 45px; height: 95px;">
									<h2>할인정보</h2>
									<p style="margin-left:30px"><span class="txtPink2" style="font-weight: 500;">남도</span>회원 10,000원 할인 (본인)</p>
									<p style="margin-left:30px"><span style="color:#006935; font-weight: 500;">풍류</span>회원 20,000원 할인 (본인 포함 2인)</p>
								</div>
							</div>
							</c:if>
							</div>
							
							
							<script>
							$(document).ready(function(){
								$('.whatApplySalexe').click(function(){
									$('.sig_fopdZe').fadeToggle('fast')
								})
							})
							</script>
	                            
	                            
	                        </div>
	                        <div class="right ojfas_fast">
	                            <div class="title">
	                                <span class="txtGray"><c:out value="${result.eduSubTitle}"/></span>
	                                <strong><c:out value="${result.nttSj}"/></strong>
	                            </div>
	                            <table>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">구분</td>
	                                    <c:if test="${result.eduVal == '1'}">
	                                    <td>교육</td>
	                                    </c:if>
	                                    <c:if test="${result.eduVal == '2'}">
	                                    <td>체험</td>
	                                    </c:if>
	                                </tr>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">교육명</td>
	                                    <td><c:out value="${result.nttSj}"/></td>
	                                </tr>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">접수기간</td>
	                                    <td><c:out value="${fn:substring(result.applySdate,0,10)}"/> ~ <c:out value="${fn:substring(result.applyEdate,0,10)}"/></td>
	                                </tr>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">교육기간</td>
	                                    <td><c:out value="${fn:substring(result.eduSdate,0,10)}"/> ~ <c:out value="${fn:substring(result.eduEdate,0,10)}"/></td>
	                                </tr>
	                            </table>
	                            <table>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">교육대상</td>
	                                    <td><c:out value="${result.eduOb}"/></td>
	                                </tr>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">교육장소</td>
	                                    <td><c:out value="${result.eduLocation}"/></td>
	                                </tr>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">운영강좌</td>
	                                    <td>
	                                    <c:if test ="${result.eduTypeA != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_01" value="${result.eduTypeA}" checked="checked">&nbsp;<label for="edutype_01">${result.eduTypeA}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeB != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_02" value="${result.eduTypeB}">&nbsp;<label for="edutype_02">${result.eduTypeB}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeC != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_03" value="${result.eduTypeC}">&nbsp;<label for="edutype_03">${result.eduTypeC}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeD != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_04" value="${result.eduTypeD}">&nbsp;<label for="edutype_04">${result.eduTypeD}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeE != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_05" value="${result.eduTypeE}">&nbsp;<label for="edutype_05">${result.eduTypeE}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeF != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_06" value="${result.eduTypeF}">&nbsp;<label for="edutype_06">${result.eduTypeF}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeG != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_07" value="${result.eduTypeG}">&nbsp;<label for="edutype_07">${result.eduTypeG}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeH != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_08" value="${result.eduTypeH}">&nbsp;<label for="edutype_08">${result.eduTypeH}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeI != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_08" value="${result.eduTypeI}">&nbsp;<label for="edutype_09">${result.eduTypeI}</label>&nbsp;
	                                    </c:if>
	                                    <c:if test ="${result.eduTypeJ != ''}">
	                                    	<input type="radio" name="edutype" id="edutype_10" value="${result.eduTypeJ}">&nbsp;<label for="edutype_10">${result.eduTypeJ}</label>&nbsp;
	                                    </c:if>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">수강료</td>
	                                    <td>
	                                    <c:if test="${result.eduPrice == 2}">
											<c:out value="${result.eduFee}"/>
										</c:if>
										<c:if test="${result.eduPrice == 1}">
											무료
										</c:if>
	                                    </td>
	                                </tr>
	                                <c:if test="${result.eduPrice == 2}">
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">입금계좌</td>
	                                    <td><c:out value="${result.eduAcc}"/></td>
	                                </tr>
	                                </c:if>
	                                <tr>
	                                    <td style="color:#222; font-size:16px; width:100px; font-weight:bold">담당자</td>
	                                    <td><span><c:out value="${result.eduManagerNm}"/></span><span class="blank">&nbsp;|&nbsp;</span><span><c:out value="${result.eduManagerTel}"/></span></td>
	                                </tr>
	                            </table>
	                        </div>
	                        
	                        
	                        
	                        
	                        
	                        <section class="joygrason_pop_cisses" style ="display:none">
								<p>신청자의 성함(실명)과 연락 가능한 연락처를 기입해주시기 바랍니다.</p>
								<div>
									<ul>
										<li><p>성함</p></li>
										<li><input type="text" id="eduApplyName"></li>
									</ul>
									<ul>
										<li><p>연락처</p></li>
										<li>
											<ul>
												<li><input id="eduApplyTel1" type="text" size="10" maxlength="3"></li>
												<li>-</li>
												<li><input id="eduApplyTel2" type="text" size="10" maxlength="4"></li>
												<li>-</li>
												<li><input id="eduApplyTel3" type="text" size="10" maxlength="4"></li>
											</ul>
										</li>
									</ul>
								</div>
								<ul class="enter_box_list">
									<li><a onclick="applyUser(<c:out value='${result.nttId}'/>)" style="cursor:pointer">접수하기</a></li>
									<li><p class="fgesd_close">닫기</p></li>
								</ul>
							</section>
	                        
	                        
	                        
	                        
	                    </div>
	                    <!--end vw_head-->
	
	                    <div class="vw_con">
	
	                        <table width="100%">
	                            <tr>
	                                <td style="color:#222; text-align:center; font-size:24px; width:80px; padding-bottom:30px; font-weight:bold">교육소개</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <c:out value="${result.nttCn}" escapeXml="false"/>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <!--end vw_con-->
	
	                    <div class="btn_area4">
	                    	<div>
	                        	<!-- 
	                            <a class="prev_pg" href="#">다음글</a>
	                            <a class="next_pg" href="#">이전글</a>
	                            -->
	                            <c:if test="${user.id == 'webmaster'}">
	                            <form id="formDelete" name="formDelete" action="" method="post" style="float:right; margin:0 0 0 3px;">
									<input type="button" class="s_submit" id="uptBtn" value="수정" title="수정 버튼" style="width: 100px;height: 30px;line-height: 28px;text-align: center;border: 1px solid #999;color: #666;font-size: 15px;transition: all .2s;">
									<input type="button" class="s_submit" id="dltBtn" value="삭제" title="삭제 버튼" style="width: 100px;height: 30px;line-height: 28px;text-align: center;border: 1px solid #999;color: #666;font-size: 15px;transition: all .2s;">
									<input name="nttId" type="hidden" value="<c:out value='${result.nttId}'/>">
									<input name="bbsId" type="hidden" value="<c:out value='${result.bbsId }'/>">
								</form>
								</c:if>
	                        </div>
	                    
	                        <div class="list"><a href="/cop/bbs/selectArticleList.do?bbsId=<c:out value='${boardMasterVO.bbsId }'/>">목록보기</a></div>
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


function applyUser(nttId) {

	if ($('#eduApplyName').val() == "") {
		alert("신청자 이름을 입력해주세요");
		$('#eduApplyName').focus();
		return false;
	}
	
	if ($('#eduApplyTel1').val() == "" || $('#eduApplyTel2').val() == "" || $('#eduApplyTel3').val() == "") {
		alert("신청자 전화번호를 입력해주세요");
		$('#eduApplyTel').focus();
		return false;
	}

	var eduApplyName = $('#eduApplyName').val();
	
	var eduApplyTel = 
	$('#eduApplyTel1').val() + '-' +
	$('#eduApplyTel2').val() + '-' +
	$('#eduApplyTel3').val()
	
	var edutype = document.getElementsByName('edutype');
	var edutype_value; 
	for(var i=0; i<edutype.length; i++) {
	    if(edutype[i].checked) {
	    	edutype_value = edutype[i].value;
	    }
	}
	location.href="/eduRegist.do?nttId=" + nttId + "&bbsId=BBSMSTR_000000000051&eduType=" + edutype_value + "&eduApplyTel=" + eduApplyTel + "&eduApplyName=" + eduApplyName  ;
}

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