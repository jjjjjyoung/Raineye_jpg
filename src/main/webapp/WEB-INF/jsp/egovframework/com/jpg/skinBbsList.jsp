<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script>
$(function(){
	$('.kidGnb .kid_mn5').addClass('on');		
});


</script>

<style>
#writeBtn {
	float: right;
	width: 100px;
	margin-left: 10px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	display: block;
	background: #666;
	color: #fff;
	font-size: .9rem;
	cursor: pointer;
}

.s_submit {
	float: right;
	width: 100px;
	margin-left: 10px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	display: block;
	background: #666;
	color: #fff;
	font-size: .9rem;
	cursor: pointer;
}

.esBtn1{background:#ffa0a0; padding:2px 10px; color:#333;}
.esBtn2{background:#ffc851; padding:2px 10px; color:#333;}
.esBtn3{background:#7ed3ff; padding:2px 10px; color:#333;}
.esBtn4{background:#91e463; padding:2px 10px; color:#333;}
</style>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">



<div id="subWrap"
	class="sub0<c:out value='${fn:substring(meCode,0,1) }'/> ntc">
	<div class="sub_visual sv<c:out value='${fn:substring(meCode,0,1) }'/>">
		<c:choose>
			<c:when test="${fn:substring(meCode,0,1).equals('5') }">
				<h2>
					<c:out value="${meName}" />
				</h2>
			</c:when>
			<c:otherwise>
				<h2>
					<c:out value="${parentName}" />
				</h2>
			</c:otherwise>
		</c:choose>
	</div>

	<div id="container">
		<div class="sub_top">
			<div class="inner">
				<div class="page_navi">
					<div class="first_mn">
						<strong class="mn_tit" tabindex="0"><c:out
								value="${parentName}" /> </strong>
						<div class="mn_2nd">
							<c:forEach var="item" items="${list_menumanage}"
								varStatus="index">
								<c:if test="${fn:length(item.meCode) == 2 }">
									<a href="<c:out value="${item.meLink}"/>"><c:out
											value="${item.meName}" /> </a>
								</c:if>
							</c:forEach>
						</div>
					</div>

					<!--end first_mn 대메뉴-->
					<div class="second_mn">
						<strong class="mn_tit" tabindex="0"><c:out
								value="${meName}" /></strong>
						<div class="mn_2nd">
							<c:forEach var="item" items="${list_menumanage}"
								varStatus="index">
								<c:if test="${fn:length(item.meCode) == 4 }">

									<c:if test="${fn:substring(item.meCode,0,2) == parentCode}">
										<a href="<c:out value="${item.meLink}"/>"><c:out
												value="${item.meName}" /> </a>
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
						<img alt="폰트사이즈 조절 버튼"
							src="/images/egovframework/com/jpg/icon/font.png">
					</button>
					<div class="font_pop">
						<div>
							<span>크기:</span>
							<button class="big" title="크게">
								<img alt="폰트사이즈 크게 버튼"
									src="/images/egovframework/com/jpg/icon/big.png">
							</button>
							<button class="small" title="작게">
								<img alt="폰트사이즈 작게 버튼"
									src="/images/egovframework/com/jpg/icon/small.png">
							</button>
						</div>
					</div>
					<butto class="print" onclick="window.print();">
						<img alt="프린트하기 버튼"
							src="/images/egovframework/com/jpg/icon/print.png">
					</button>
				</div>

				<%-- 
                <form method="post" class="schForm" action="/cop/bbs/selectArticleList.do" name="BoardVO">
                    <input type="text" id="searchWrd" name="searchWrd" placeholder="검색어를 입력하세요" value="${articleVO.searchWrd }">
					<input type="hidden" id="searchCnd" name="searchCnd" value="0" />
					<input class="bbsIdVal" name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId }"/>">
					<!-- <input class="skinVal" name="skin" type="hidden" value=""/> -->
                    <button type="submit">검색</button>
                </form>
                <!--end search--> --%>
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->


		<!--start content-->
		<div class="contentWrap" id="go_direct">
			<h3 class="page_title">
				<c:out value="${boardMasterVO.bbsIntrcn }" />
			</h3>

			<!--start con01-->
			<div class="con01">
				<div class="inner">
					<div id="bo_btn_top">
						<div id="bo_list_total">
							<span> <c:out value="${paginationInfo.currentPageNo }" />
								/
							</span>
							<c:out value="${paginationInfo.totalPageCount }" />
							페이지
						</div>

						<form method="post" class="schForm"
							action="/cop/bbs/selectArticleList.do" name="BoardVO">
							<div class="select_box">
								<select name="searchCnd" title="분류">
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">제목+내용</option>
								</select>
							</div>
							<input type="text" id="searchWrd" name="searchWrd"
								placeholder="검색어를 입력하세요" value="${articleVO.searchWrd }"
								title="검색어 입력"> <input class="bbsIdVal" name="bbsId"
								type="hidden" value="<c:out value="${boardMasterVO.bbsId }"/>">
							<!-- <input class="skinVal" name="skin" type="hidden" value=""/> -->
							<button type="submit">검색</button>
						</form>
						<!--end search-->
					</div>
					<!--end bo_btn_top-->

					<div class="ntc_table">
						<form id="subForm" name="BoardVO" method="get"
							action="/cop/bbs/selectArticleDetail.do" style="display: hidden">
							<input class="nttIdVal" name="nttId" type="hidden" value="">
							<input class="bbsIdVal" name="bbsId" type="hidden"
								value="<c:out value="${boardMasterVO.bbsId }"/>"> <input
								class="pageIndexVal" name="pageIndex" type="hidden" value="" />
							<input class="skinVal" name="skin" type="hidden"
								value="<c:out value="${boardMasterVO.bbsTyCode }"/>" />
						</form>
						<form id="pageNation" name="BoardVO" method="post"
							action="/cop/bbs/selectArticleList.do" style="display: hidden">
							<input class="bbsIdVal" name="bbsId" type="hidden"
								value="<c:out value="${boardMasterVO.bbsId }"/>"> <input
								class="pageIndexVal" name="pageIndex" type="hidden" value="" />
							<input class="skinVal" name="skin" type="hidden"
								value="<c:out value="${boardMasterVO.bbsTyCode }"/>" />
						</form>
						<table>
							<caption style="text-indent:-9999%; height: 0; display:block !important;" class="jpg_li_caption">
								<c:out value="${boardMasterVO.bbsIntrcn }" />
							</caption>
							<thead style="border-top:2px solid #333;">
								<tr style="line-height: 58px; border-bottom: 1px solid #333;">
									<th style="width: 7%;">분류</th>
									<th style="width: 42%;">제목</th>
									<!--<th style="width: 6%;" class="disap_68"></th>-->
									<th style="width: 20%;" class="disap_68">작성자</th>
									<th style="width: 5%; visibility: visible;" class="disap_68">파일</th>
									<th style="width: 18%; text-align: center;">작성일</th>
									<th style="width: 6%;" class="disap_68">조회수</th>
								</tr>
							</thead>
							<tbody>

							<c:forEach items="${noticeList}" var="noticeInfo"
								varStatus="status">
								<tr class="bo_notice">
									<td class="txtBlue"><img style="width: 16px;"
										src="<c:url value='/images/egovframework/com/jpg/icon/notice.png'/>"
										alt="notice"></td>
									<td class="articleSub"
										data-nttid="<c:out value="${noticeInfo.nttId}"/>"
										data-bbsid="<c:out value="${noticeInfo.bbsId}"/>"
										data-pageindex="<c:out value='${searchVO.pageIndex}'/>"
										data-skin="<c:out value='${noticeInfo.bbsTyCode}'/>"><input
										type="button" class="goBtn"
										value='<c:out value="${noticeInfo.nttSj}"/>'
										style="background: #f8f8f8" /></td>
									<!--<td>
										<c:choose>
											<c:when test="${noticeInfo.eduStyle == 1}">
												<span class="esBtn<c:out value="${noticeInfo.eduStyle}"/>">히트</span>
											</c:when>
											<c:when test="${noticeInfo.eduStyle == 2}">
												<span class="esBtn<c:out value="${noticeInfo.eduStyle}"/>">신규</span>
											</c:when>
											<c:when test="${noticeInfo.eduStyle == 3}">
												<span class="esBtn<c:out value="${noticeInfo.eduStyle}"/>">인기</span>
											</c:when>
											<c:when test="${noticeInfo.eduStyle == 4}">
												<span class="esBtn<c:out value="${noticeInfo.eduStyle}"/>">할인</span>
											</c:when>
											<c:otherwise>
												<span></span>
											</c:otherwise>
										</c:choose>
									</td>-->
									<td class="txtPink"><c:out
											value='${noticeInfo.frstRegisterNm}' /></td>
									<td class="file"><c:if
											test="${noticeInfo.atchFileId != ''}">
											<img src="/images/egovframework/com/jpg/icon/file.png"
												alt="파일첨부">
										</c:if></td>
									<td class="td_datetime"><c:out
											value='${noticeInfo.frstRegisterPnttm}' /></td>
									<td class="td_num"><c:out value='${noticeInfo.inqireCo}' /></td>
								</tr>
							</c:forEach>
							
							<c:forEach items="${resultList}" var="resultInfo"
								varStatus="status">
								<tr>
									<c:if test="${resultInfo.bbsId == 'BBSMSTR_000000000046'}">
										<c:if test="${resultInfo.eduVal == '1'}">
											<td class="txtBlue">교육</td>
										</c:if>
										<c:if test="${resultInfo.eduVal == '2'}">
											<td class="txtGreen">체험</td>
										</c:if>
									</c:if>
									<c:if test="${resultInfo.bbsId == 'BBSMSTR_000000000041'}">
										<c:if test="${resultInfo.eduVal == '3'}">
											<td class="txtPup">입찰</td>
										</c:if>
										<c:if test="${resultInfo.eduVal == '4'}">
											<td class="txtSky2">공지</td>
										</c:if>
									</c:if>
									<c:if
										test="${resultInfo.bbsId == 'BBSMSTR_000000000042' || resultInfo.bbsId == 'BBSMSTR_000000000043' || resultInfo.bbsId == 'BBSMSTR_000000000044' || resultInfo.bbsId == 'BBSMSTR_000000000045' || resultInfo.bbsId == 'BBSMSTR_000000000061'}">
										<td class="td_num2"><c:out
												value="${paginationInfo.totalRecordCount-articleVO.firstIndex-status.count+1}" /></td>
									</c:if>
									<c:choose>
										<c:when test="${resultInfo.bbsId == 'BBSMSTR_000000000043'}">
											<td class="articleSub"
												data-nttid="<c:out value="${resultInfo.nttId}"/>"
												data-bbsid="<c:out value="${resultInfo.bbsId}"/>"
												data-pageindex="<c:out value='${searchVO.pageIndex}'/>">
												<a href="<c:url value='${resultInfo.nttCn}'/>"
												target="_blank"
												title="<c:out value="${resultInfo.nttSj }"
														escapeXml="false" />(새창)">
													<c:out value="${resultInfo.nttSj }" escapeXml="false" />
											</a> <c:if test="${user.id == 'webmaster' }">
													<input type="button" class="goBtn" value='수정'
														style="display: inline-block; width: 46px; line-height: 30px;" />
												</c:if>
											</td>
										</c:when>
										<c:otherwise>
											<td class="articleSub"
												data-nttid="<c:out value="${resultInfo.nttId}"/>"
												data-bbsid="<c:out value="${resultInfo.bbsId}"/>"
												data-pageindex="<c:out value='${searchVO.pageIndex}'/>">
												<input type="button" class="goBtn"
												value='<c:out value="${resultInfo.nttSj }" escapeXml = "false" />'
												style="background: #fff" />
											</td>
										</c:otherwise>
									</c:choose>
									<!--<td>
										<c:choose>
											<c:when test="${resultInfo.eduStyle == 1}">
												<span class="esBtn<c:out value="${resultInfo.eduStyle}"/>">히트</span>
											</c:when>
											<c:when test="${resultInfo.eduStyle == 2}">
												<span class="esBtn<c:out value="${resultInfo.eduStyle}"/>">신규</span>
											</c:when>
											<c:when test="${resultInfo.eduStyle == 3}">
												<span class="esBtn<c:out value="${resultInfo.eduStyle}"/>">인기</span>
											</c:when>
											<c:when test="${resultInfo.eduStyle == 4}">
												<span class="esBtn<c:out value="${resultInfo.eduStyle}"/>">할인</span>
											</c:when>
											<c:otherwise>
												<span></span>
											</c:otherwise>
										</c:choose>
									</td>-->
									<td class="txtPink"><c:out
											value='${resultInfo.frstRegisterNm}' /></td>
									<td class="file"><c:if
											test="${resultInfo.atchFileId != ''}">
											<img src="/images/egovframework/com/jpg/icon/file.png"
												alt="파일첨부">
										</c:if></td>
									<td class="td_datetime"><c:out
											value='${resultInfo.frstRegisterPnttm}' /></td>
									<td class="td_num"><c:out value='${resultInfo.inqireCo}' /></td>
								</tr>
							</c:forEach>

							<c:if test="${fn:length(resultList) == 0}">
								<tr>
									<td colspan="6" style="text-align:center ;">자료가 없습니다.</td> <!-- 다른 검색 조건 텍스트 수정 위치 -->
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<!--end inner-->
			</div>
			<!--end con01-->

			<div class="btn">
				<form id="writeForm" name="writeForm" method="post"
					action="<c:url value='/cop/bbs/insertArticleView.do'/>">
					<input name="bbsId" type="hidden"
						value="<c:out value="${boardMasterVO.bbsId}"/>">
					<c:if
						test="${user.id == 'webmaster' && boardMasterVO.bbsId != 'BBSMSTR_000000000045'}">
						<input type="button" class="s_submit" id="writeBtn" value="글쓰기"
							title="글쓰기 버튼1">
					</c:if>
					<c:if
						test="${user.id != null && boardMasterVO.bbsId == 'BBSMSTR_000000000045'}">
						<input type="button" class="s_submit" id="writeBtn" value="글쓰기"
							title="글쓰기 버튼2">
					</c:if>
					<c:if
						test="${user == null && boardMasterVO.bbsId == 'BBSMSTR_000000000045'}">
						<input type="button" class="s_submit"
							onclick="javascript:alert('로그인 후 글쓰기가 가능합니다.');" value="글쓰기"
							title="글쓰기 버튼3">
					</c:if>

				</form>
			</div>

			<!-- <div class="pageindex">
	            <div class="inner">
	                <div class="prev"><a href="#">이전</a></div>
	                <div class="num on"><a href="#">1</a></div>
	                <div class="num"><a href="#">2</a></div>
	                <div class="num"><a href="#">3</a></div>
	                <div class="num"><a href="#">4</a></div>
	                <div class="num"><a href="#">5</a></div>
	                <div class="num"><a href="#">6</a></div>
	                <div class="num"><a href="#">7</a></div>
	                <div class="num"><a href="#">8</a></div>
	                <div class="num"><a href="#">9</a></div>
	                <div class="next"><a href="#">다음</a></div>
	            </div>
	            end inner
	        </div> -->

			<!-- paging navigation -->
			<div class="pageindex">
				<div class="inner">
					<ui:pagination paginationInfo="${paginationInfo}" type="image"
						jsFunction="fn_egov_select_linkPage"/>
				</div>
				<!-- end inner -->
			</div>
			<!-- end paging navigation -->
		</div>
		<!--end contentWrap-->
	</div>
	<!--end container-->
</div>
<!--end subWrap-->
<script>

$(function(){
	$('#gnb > ul > li:nth-of-type(3)').addClass('on2');
	$('.sub04').siblings('#header').find($('#gnb > ul > li:nth-of-type(3)')).removeClass('on2');
	$('.sub04').siblings('#header').find($('#gnb > ul > li:nth-of-type(4)')).addClass('on2');
});

$("#writeBtn").on("click", function() {
	$("#writeForm").submit();
});

$(".goBtn").on("click", function() {
	var baseDom = $(this).parent();
	
	$("#subForm .nttIdVal").val(baseDom.data("nttid"));
	$("#subForm .bbsIdVal").val(baseDom.data("bbsid"));
	$("#subForm .pageIndexVal").val(baseDom.data("pageindex"));	
	$("#subForm .skinVal").val(baseDom.data("skin"));	
	$("#subForm").submit();
});

function fn_egov_select_linkPage(pageNo){
	$("#pageNation .pageIndexVal").val(pageNo);
	$("#pageNation").submit();
}

function fnInit() {

    var message = '<c:out value="${message}"/>';
    
    
    if (message) {
    	alert(message);
    }
    
}
<c:if test="${not empty fn:trim(message) &&  message ne ''}">alert("${message}");</c:if>

</script>

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>