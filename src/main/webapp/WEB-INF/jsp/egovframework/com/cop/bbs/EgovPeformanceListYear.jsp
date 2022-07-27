<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<c:set var="dateCount" value="${daysOfMonth}" />
<c:set var="dateCheak" value="${dateCheak}" />
<c:set var="yearCheak" value="${yearCheak}" />
<%
	String dateFiste = String.valueOf(pageContext.getAttribute("yearCheak"));
	String daySerach = "";
	String dateCount = String.valueOf(pageContext.getAttribute("dateCount"));
	dateFiste += String.valueOf(pageContext.getAttribute("dateCheak"));
	int int_val = Integer.parseInt(dateCount);
	String dateComplete = "";

	String nowDate = dateFiste+dateCount;
	

%>
<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<!-- <style>
.date${dateCheak} a {
	background: #333;
	color: #fff;
}

.days${dayCheak} a {
	border-radius: 100px;
	background: #ff1717;
	color: #fff;
	content: '';
	left: 50%;
	transform: translateX(-50%);
	top: 8px;
	width: 25px;
	height: 25px;
	z-index: -1;
}
</style> -->

<script>
$(function(){
	$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
	$(document).attr("title","공연-공연정보-연간공연일정"); 
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
						<strong class="mn_tit" tabindex="0"><c:out value="${parentName}" /> </strong>
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
						<strong class="mn_tit" tabindex="0"><c:out value="${meName}" /></strong>
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
					<button class="print" onclick="window.print();">
						<img alt="프린트하기 버튼"
							src="/images/egovframework/com/jpg/icon/print.png">
					</button>
				</div>

				<form method="post" class="schForm" action="/cop/bbs/selectArticleList.do" name="BoardVO">
				    <div class="select_box">
				    	<select name="searchCnd"  title="공연 검색 분류">
                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >제목</option>
                            <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >내용</option>
                            <option value="3" <c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if> >제목+내용</option>
                        </select>
                    </div>
                    <input type="text" id="searchWrd" name="searchWrd" placeholder="공연명을 입력하세요" value="${articleVO.searchWrd }" title="공연명 입력" >
					<!-- <input type="hidden" id="searchCnd" name="searchCnd" value="1" /> -->
					<!-- <input class="skinVal" name="skin" type="hidden" value=""/> -->
					<input class="bbsIdVal" name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId }"/>">
					<input class="skin" name="skin" type="hidden" value="Y"/> 
                    <button type="submit">검색</button>
                </form>
				<!--end search-->
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->


		<!--start content-->
		<div class="contentWrap" id="go_direct">
			<h3 class="page_title">연간공연일정</h3>

			<div class="con01">
				<div class="link_tab">
					<div class="inner">
						<div>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M">월간공연일정</a>
						</div>
						<div>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=D">일간공연일정</a>
						</div>
						<div class="selected">
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=Y" title="현재페이지">연간공연일정</a>
						</div>
					</div>
				</div>
				<div class="inner">
					<div class="year">
						<div class="year_hd">
						
						<ul class="fad_spG05">
							<li>
								<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&year=${yearCheak-1}&skin=Y" class="prev">
									이전 해
								</a>
							</li>
							<li>
								<span>${yearCheak}</span>
							</li>
							<li>
								<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&year=${yearCheak+1}&skin=Y" class="next">
									다음 해
								</a>
							</li>
						</ul>
						
						
						</div>
						<p title="연간공연일정" style="display:none">연간공연일정</p>
						<div class="year_tb">
							<ul>
								<li class="mon">월</li>
								<li class="div">구분</li>
								<li class="name">공연명</li>
								<li class="day">공연일자</li>
							</ul>
							
							<%
								String array[] = {"","January","February","March","April","May","June","July","August","September","October","November","December"};
								for (int i = 1; i < 13; i++) {
							%>
							<div class="list">
								<form id="" name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
									<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>"> 
									<input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>"> 
									<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />

									<div class="left">
										<div>
											<div class="posA">
												<span><%=i%>월</span>
												<span class="m_en"><%=array[i]%></span>
											</div>
										</div>
									</div>

									<ul class="right">
										<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
											<c:set var="msrtDtm" value="${resultInfo.ntceBgnde}"></c:set>
											<c:set var="msrtCtm" value="${resultInfo.ntceEndde}"></c:set>
											<%
												SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd" );
												String msrtDtm = (String) pageContext.getAttribute("msrtDtm");
												String msrtCtm = (String) pageContext.getAttribute("msrtCtm");
												
												String dateC = msrtDtm.replace("-", "");
												String dateB = msrtCtm.replace("-", "");
												String[] dateNume = msrtDtm.split("-");
												String inputDate = dateC;
												DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
												Date date = dateFormat.parse(inputDate);
												
												
												
												Calendar calendar = Calendar.getInstance();
												calendar.setTime(date);
												int day_of_week = calendar.get(Calendar.DAY_OF_WEEK);
												String day = "";
												switch (day_of_week) {
													case 1 :
														day = "일요일";
														break;
													case 2 :
														day = "월요일";
														break;
													case 3 :
														day = "화요일";
														break;
													case 4 :
														day = "수요일";
														break;
													case 5 :
														day = "목요일";
														break;
													case 6 :
														day = "금요일";
														break;
													case 7 :
														day = "토요일";
														break;
												}
												String inputDateB = dateB;
												DateFormat dateFormatB = new SimpleDateFormat("yyyyMMdd");
												Date dateSecond = dateFormatB.parse(inputDateB);
												Calendar calendarB = Calendar.getInstance();
												calendarB.setTime(dateSecond);
												int day_of_weekSecond = calendarB.get(Calendar.DAY_OF_WEEK);
												String dayB = "";
												switch (day_of_weekSecond) {
													case 1 :
														dayB = "일요일";
														break;
													case 2 :
														dayB = "월요일";
														break;
													case 3 :
														dayB = "화요일";
														break;
													case 4 :
														dayB = "수요일";
														break;
													case 5 :
														dayB = "목요일";
														break;
													case 6 :
														dayB = "금요일";
														break;
													case 7 :
														dayB = "토요일";
														break;
												}
											%>
											<c:set var="nowTmp"><c:out value="${yearCheak}"/><c:out value="${dateCheak}"/><c:out value="${dayCheak}"/></c:set>
											<c:set var="startDateTmp"><c:out value="${fn:replace(resultInfo.ntceBgnde,'-','')}"/></c:set>
											<c:set var="endDateTmp"><c:out value="${fn:replace(resultInfo.ntceEndde,'-','')}"/></c:set>
											
											<fmt:parseDate var="now" value="${nowDate}" pattern="yyyyMMdd" />
											<fmt:parseDate var="startDate" value="<%=dateC%>" pattern="yyyyMMdd" />
											<fmt:parseDate var="endDate" value="<%=dateB%>" pattern="yyyyMMdd" />
			
											<fmt:formatDate value="${todayTmp1}" pattern="yyyyMMdd" var="today1" />
											<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />             
											<fmt:formatDate value="${startDate}" pattern="yyyyMMdd" var="openDate"/>       
											<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/> 
			
												
											<%
											 String monthTmp = "";
											 if(i < 10){
												 monthTmp = "0"+i;
											 }else{
												 monthTmp = ""+i;
											 }
											 pageContext.setAttribute("month", monthTmp) ;
											%>
											<%-- <c:out value="${fn:substring(resultInfo.ntceBgnde,5,7) }"/><br>
											<c:out value="${month}"/><br>
											<c:out value="${fn:substring(resultInfo.ntceEndde,5,7) }"/><br><br> --%>
											
											
											<c:if test="${fn:substring(resultInfo.ntceBgnde,5,7) <= month && fn:substring(resultInfo.ntceEndde,5,7) >= month}">
												<li>
													<c:choose>
														<c:when test="${resultInfo.type =='토요'}">
															<div class="div">
																<span class="bedge blue">
														</c:when>
														<c:when test="${resultInfo.type =='정기'}">
															<div class="div">
																<span class="bedge pink">
														</c:when>
														<c:when test="${resultInfo.type =='기획'}">
															<div class="div">
																<span class="bedge green">
														</c:when>
													</c:choose>${resultInfo.type}</span>
															</div>
					
													<div class="name">
														<a class="ellipsis" href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=Y" class="dt_btn" style="cursor: pointer">
															${resultInfo.sjBoldAtMain}<div class="line"></div>${resultInfo.nttSj}
														</a>
													</div>
						
													<div class="day txtSky">
														${resultInfo.ntceBgnde}.(<%=day.charAt(0)%>)
														${resultInfo.startTime} ~
														${resultInfo.ntceEndde}.(<%=dayB.charAt(0)%>)
														${resultInfo.endTime}
													</div>
						
												</li>
											</c:if>
										</c:forEach>
									</ul>
							</form>
							<!--end right-->
						</div>

						<%
							}
						%>
					</div>

					<c:if test="${fn:length(resultList) == 0}">

						<tr>
							<td colspan="5"><spring:message code="common.nodata.msg" /></td>
						</tr>
					</c:if>

					<!-- paging navigation -->
					<%-- <div class="pagination">
		<ul>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div>
	 --%>

					<!-- 
	<div class="btn">
		<span class="btn_s"><a href="<c:url value='/cop/bbs/insertBBSMasterView.do' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span>
	</div>
	-->
					<span class="btn_b"> <c:if test="${user.id == 'webmaster'}">
							<a
								href="<c:url value='/cop/bbs/insertArticleView.do?bbsId=${boardMasterVO.bbsId}' />"
								title="<spring:message code="button.create" /> <spring:message code="input.button" />">
								<spring:message code="button.create" />
							</a>
						</c:if>
					</span>
				</div>
				<!--end inner-->
			</div>
			<!-- end con01 -->
		</div>
		<!-- end contentWrap -->
	</div>
	<!-- end container -->
</div>
<!-- end subWrap -->
<script>
	
</script>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>