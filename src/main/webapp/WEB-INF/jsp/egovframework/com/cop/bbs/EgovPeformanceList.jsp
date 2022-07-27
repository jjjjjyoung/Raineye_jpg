<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<c:set var="dateCheak" value="${dateCheak}" />
<c:set var="yearCheak" value="${yearCheak}" />
<c:set var="dayCheak" value="${dayCheak}" />
<%


String daySerach="";
String dateCheak=String.valueOf(pageContext.getAttribute("dateCheak")) ;
int dateCount = Integer.parseInt(dateCheak);

String nowDate = String.valueOf(pageContext.getAttribute("yearCheak"))+String.valueOf(pageContext.getAttribute("dateCheak"))+String.valueOf(pageContext.getAttribute("dayCheak"));

%>
<c:import url="/menu.do" />

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<style>
.date${dateCheak} a {
	background: #333;
	color: #fff;
}
</style>

<script>
$(function(){
	$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
	$('.date${dateCheak} a').attr('title','현재페이지');
	$(document).attr("title","공연-공연정보-월간공연일정"); 
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

				<form method="post" class="schForm" action="/cop/bbs/selectArticleList.do" name="BoardVO">
				    <div class="select_box">
				    	<select name="searchCnd" title="공연 검색 분류">
                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >제목</option>
                            <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >내용</option>
                            <option value="3" <c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if> >제목+내용</option>
                        </select>
                    </div>
                    <input type="text" id="searchWrd" name="searchWrd" placeholder="공연명을 입력하세요" value="${articleVO.searchWrd }" title="공연명 입력" >
					<!-- <input type="hidden" id="searchCnd" name="searchCnd" value="1" /> -->
					<!-- <input class="skinVal" name="skin" type="hidden" value=""/> -->
					<input class="bbsIdVal" name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId }"/>">
					<input class="skin" name="skin" type="hidden" value="M"/> 
                    <button type="submit">검색</button>
                </form>
                
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
                
				<!--end search-->
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->
		
        <!--start content-->
        <div class="contentWrap" id="go_direct">
			
			<h3 class="page_title">월간공연일정</h3>
	
			<div class="con01">
				<div class="link_tab">
					<div class="inner">
						<div class="selected">
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M" title="현재페이지">월간공연일정</a>
						</div>
						<div>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=D">일간공연일정</a>
						</div>
						<div>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=Y">연간공연일정</a>
						</div>
					</div>
				</div>
				<div class="inner">
					<div class="day month">
						<div class="day_hd">
							<span style="margin-bottom:20px;">${yearCheak}.${dateCheak}.</span>
							<div class="sub2-1_link">
								<a class="on" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M&ca=L">리스트보기</a> 
								<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M&ca=C">달력보기</a>
							</div>
							<div>
								<%if(dateCount==1){ %>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${12}&year=${yearCheak-1}"
									class="prev">이전</a>
								<%}else{ %>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak-1}&year=${yearCheak}"
									class="prev">이전</a>
								<%} %>
								<ul>
									<%for(int i=1;i<13;i++){ 
	                                 if(i<10){
	                            	  daySerach="0"+i;                          
	                                 }else{
	                                   daySerach=""+i; 
	                                 }
	                              %>
									<li class="date<%=daySerach%>"><a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=<%=daySerach%>&year=${yearCheak}"><%=i%>월</a></li>
									<%} %>
								</ul>
								<%if(dateCount==12){ %>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${1}&year=${yearCheak+1}"
									class="next">다음</a>
								<%}else{ %>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak+1}&year=${yearCheak}"
									class="next">다음</a>
								<%}%>
							</div>
						</div>
						<div class="content">
	
							<div class="mon_tb">
								<jsp:useBean id="todayTmp1" class="java.util.Date" />
								<%
									int cNum = 0;
								%>
								<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
									
									<c:set var="msrtDtm" value="${resultInfo.ntceBgnde}"></c:set>
									<c:set var="msrtCtm" value="${resultInfo.ntceEndde}"></c:set>
									<%
									String msrtDtm = (String)pageContext.getAttribute("msrtDtm");
									String msrtCtm = (String)pageContext.getAttribute("msrtCtm");
									String dateC= msrtDtm.replace("-", "");
									String dateB= msrtCtm.replace("-", "");
									%>
									
									<c:set var="nowTmp111" value="<%=nowDate%>" />
									<c:set var="startDateTmp"><c:out value="${fn:replace(resultInfo.ntceBgnde,'-','')}"/></c:set>
									<c:set var="endDateTmp"><c:out value="${fn:replace(resultInfo.ntceEndde,'-','')}"/></c:set>									

									<fmt:parseDate var="nowTmpdd" value="${nowDate}" pattern="yyyyMMdd" />
									<fmt:parseDate var="startDate" value="<%=dateC%>" pattern="yyyyMMdd" />
									<fmt:parseDate var="endDate" value="<%=dateB%>" pattern="yyyyMMdd" />									

									<fmt:formatDate value="${nowTmpdd}" pattern="yyyyMMdd" var="nowDate" />
									<fmt:formatDate value="${todayTmp1}" pattern="yyyyMMdd" var="today1" />
									<fmt:formatDate value="${startDate}" pattern="yyyyMMdd" var="openDate"/>       
									<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/>									
									

									<c:if test="${closeDate >= today1 && dateCheak == fn:substring(resultInfo.ntceBgnde,5,7)}">
										<% cNum++; %>
										<div class="list">
											<form id="" name="subForm" method="post"
												action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
												<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>"> <input
													name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>"> <input
													name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
												<div class="left">
													<img src="/cmm/fms/getImage.do?atchFileId=${resultInfo.atchFileId}" alt="${resultInfo.nttSj}">
												</div>
												<div class="right">
													<ul>
														<li class="txtGray"><c:choose>
																<c:when test="${resultInfo.type =='토요'}">
																	<span class="bedge blue">
																</c:when>
																<c:when test="${resultInfo.type =='정기'}">
																	<span class="bedge pink">
																</c:when>
																<c:when test="${resultInfo.type =='기획'}">
																	<span class="bedge green">
																</c:when>
															</c:choose> ${resultInfo.type}</span> ${resultInfo.sjBoldAtMain}</li>
														<li class="bold">${resultInfo.nttSj}</li>
														<%                            
						                                   String inputDate =dateC;
						                                   DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
						                                   Date date = dateFormat.parse(inputDate);
						                                   Calendar calendar = Calendar.getInstance();
						                                   calendar.setTime(date);
						                                   int day_of_week=calendar.get(Calendar.DAY_OF_WEEK);
						                                   String day= null;
						                                   switch(day_of_week){
						                                   case 1:
						                                	   day = "일요일";
						                                	   break;
						                                   case 2:
						                                	   day = "월요일";
						                                	   break;
						                                   case 3:
						                                	   day = "화요일";
						                                	   break;
						                                   case 4:
						                                	   day = "수요일";
						                                	   break;
						                                   case 5:
						                                	   day = "목요일";
						                                	   break;
						                                   case 6:
						                                	   day = "금요일";
						                                	   break;
						                                   case 7:
						                                	   day = "토요일";
						                                	   break;	   
						                                   }
						                                   
						                                   String inputDateB =dateB;
						                                   DateFormat dateFormatB = new SimpleDateFormat("yyyyMMdd");
						                                   Date dateSecond = dateFormatB.parse(inputDateB);
						                                   Calendar calendarB = Calendar.getInstance();
						                                   calendarB.setTime(dateSecond);
						                                   int day_of_weekSecond=calendarB.get(Calendar.DAY_OF_WEEK);
						                                   String dayB=null;
						                                   switch(day_of_weekSecond){
						                                   case 1:
						                                	   dayB = "일요일";
						                                	   break;
						                                   case 2:
						                                	   dayB = "월요일";
						                                	   break;
						                                   case 3:
						                                	   dayB = "화요일";
						                                	   break;
						                                   case 4:
						                                	   dayB = "수요일";
						                                	   break;
						                                   case 5:
						                                	   dayB = "목요일";
						                                	   break;
						                                   case 6:
						                                	   dayB = "금요일";
						                                	   break;
						                                   case 7:
						                                	   dayB = "토요일";
						                                	   break;	   
						                                   }
					                                
					                                   %>
		
														<li class="day txtGray">${fn:substring(resultInfo.ntceBgnde,0,10)}.(<%=day.charAt(0)%>)
															${resultInfo.startTime} ~<br> ${fn:substring(resultInfo.ntceEndde,0,10) }.(<%=dayB.charAt(0)%>)
															${resultInfo.endTime}
														</li>
														<li class="where txtGray">${resultInfo.addressDetail}</li>
													</ul>
													<div class="btn_area2">
														
														
																<a href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=D" class="dt_btn" style="cursor: pointer">상세보기</a> 
																<a href="${resultInfo.ticketLink}" class="tk_link">예매하기</a>	
															
														<!-- 
														<a href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=M"class="dt_btn" style="cursor: pointer">상세보기</a> 
														<a href="<c:out value='${resultInfo.ticketLink}'/>" target="_blank" class="tk_link">예매하기</a>
														-->
													</div>
												</div>
											</form>
											<!--end right-->
		
		
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<% if(cNum == 0){ %>

							<div>
								<div style="border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:20px 0; text-align:center;">진행 중인 공연이 없습니다.<!--spring:message code="common.nodata.msg" /--></div>
							</div>
						<% } %>
						
						</tbody>
						</table>
	
						<c:if test="${user.id == 'webmaster'}">
							<span class="btn_b"> <a
								href="<c:url value='/cop/bbs/insertArticleView.do?bbsId=${boardMasterVO.bbsId}' />"
								title="<spring:message code="button.create" /> <spring:message code="input.button" />">
									<spring:message code="button.create" />
							</a>
							</span>
						</c:if>
					</div>
				</div>
			</div>
			<div class="con02">
		        <div class="inner">
		            <span class="endlist_tit">지난 공연 리스트</span>
		            <div class="day month">
		                <div class="mon_tb">
							<% int nNum = 0; %>
		                    <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
								<c:set var="msrtDtm" value="${resultInfo.ntceBgnde}"></c:set>
								<c:set var="msrtCtm" value="${resultInfo.ntceEndde}"></c:set>
								<%
								String msrtDtm = (String)pageContext.getAttribute("msrtDtm");
								String msrtCtm = (String)pageContext.getAttribute("msrtCtm");
								String dateC= msrtDtm.replace("-", "");
								String dateB= msrtCtm.replace("-", "");
								
								%>
								<jsp:useBean id="todayTmp2" class="java.util.Date" />
								<c:set var="nowTmp"><c:out value="${yearCheak}"/><c:out value="${dateCheak}"/><c:out value="${dayCheak}"/></c:set>
								<c:set var="startDateTmp"><c:out value="${fn:replace(resultInfo.ntceBgnde,'-','')}"/></c:set>
								<c:set var="endDateTmp"><c:out value="${fn:replace(resultInfo.ntceEndde,'-','')}"/></c:set>
								
								

								<fmt:parseDate var="nowTmpdd" value="${nowDate}" pattern="yyyyMMdd" />
								<fmt:parseDate var="startDate" value="<%=dateC%>" pattern="yyyyMMdd" />
								<fmt:parseDate var="endDate" value="<%=dateB%>" pattern="yyyyMMdd" />
								
								
								
								<fmt:formatDate value="${todayTmp2}" pattern="yyyyMMdd" var="today2" />								
								<fmt:formatDate value="${nowTmpdd}" pattern="yyyyMMdd" var="nowDate" />             
								<fmt:formatDate value="${startDate}" pattern="yyyyMMdd" var="openDate"/>       
								<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/>

								
								

								<c:if test="${closeDate < today2 && dateCheak >= fn:substring(resultInfo.ntceBgnde,5,7) && dateCheak <= fn:substring(resultInfo.ntceEndde,5,7)}">
									<% nNum++; %>
									<div class="list">
										<form id="" name="subForm" method="post"
											action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
											<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>"> <input
												name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>"> <input
												name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
											<div class="left doisso_c1">
												<img src="/cmm/fms/getImage.do?atchFileId=${resultInfo.atchFileId}" alt="${resultInfo.nttSj}">
											</div>
											<div class="right doisso_c2 refresure_j3">
												<ul>
													<li class="txtGray"><c:choose>
															<c:when test="${resultInfo.type =='토요'}">
																<span class="bedge blue">
															</c:when>
															<c:when test="${resultInfo.type =='정기'}">
																<span class="bedge pink">
															</c:when>
															<c:when test="${resultInfo.type =='기획'}">
																<span class="bedge green">
															</c:when>
														</c:choose> ${resultInfo.type}</span> ${resultInfo.sjBoldAtMain}</li>
													<li class="bold">${resultInfo.nttSj}</li>
													<%                            
					                                   String inputDate =dateC;
					                                   DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					                                   Date date = dateFormat.parse(inputDate);
					                                   Calendar calendar = Calendar.getInstance();
					                                   calendar.setTime(date);
					                                   int day_of_week=calendar.get(Calendar.DAY_OF_WEEK);
					                                   String day= null;
					                                   switch(day_of_week){
					                                   case 1:
					                                	   day = "일요일";
					                                	   break;
					                                   case 2:
					                                	   day = "월요일";
					                                	   break;
					                                   case 3:
					                                	   day = "화요일";
					                                	   break;
					                                   case 4:
					                                	   day = "수요일";
					                                	   break;
					                                   case 5:
					                                	   day = "목요일";
					                                	   break;
					                                   case 6:
					                                	   day = "금요일";
					                                	   break;
					                                   case 7:
					                                	   day = "토요일";
					                                	   break;	   
					                                   }
					                                   
					                                   String inputDateB =dateB;
					                                   DateFormat dateFormatB = new SimpleDateFormat("yyyyMMdd");
					                                   Date dateSecond = dateFormatB.parse(inputDateB);
					                                   Calendar calendarB = Calendar.getInstance();
					                                   calendarB.setTime(dateSecond);
					                                   int day_of_weekSecond=calendarB.get(Calendar.DAY_OF_WEEK);
					                                   String dayB=null;
					                                   switch(day_of_weekSecond){
					                                   case 1:
					                                	   dayB = "일요일";
					                                	   break;
					                                   case 2:
					                                	   dayB = "월요일";
					                                	   break;
					                                   case 3:
					                                	   dayB = "화요일";
					                                	   break;
					                                   case 4:
					                                	   dayB = "수요일";
					                                	   break;
					                                   case 5:
					                                	   dayB = "목요일";
					                                	   break;
					                                   case 6:
					                                	   dayB = "금요일";
					                                	   break;
					                                   case 7:
					                                	   dayB = "토요일";
					                                	   break;	   
					                                   }
				                                
				                                   %>
	
													<li class="day txtGray">${fn:substring(resultInfo.ntceBgnde,0,10)}.(<%=day.charAt(0)%>)
														${resultInfo.startTime} ~<br> ${fn:substring(resultInfo.ntceEndde,0,10) }.(<%=dayB.charAt(0)%>)
														${resultInfo.endTime}
													</li>
													<li class="where txtGray">${resultInfo.addressDetail}</li>
												</ul>
												<div class="btn_area2">
													<a href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=D" class="dt_btn" style="cursor: pointer">종료됨</a>
													
												</div>
											</div>
										</form>
										<!--end right-->
									</div>
								</c:if>
							</c:forEach>
							<% if(nNum == 0){ %>

								<div>
									<div style="border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:20px 0; text-align:center;"><spring:message code="common.nodata.msg" /></div>
								</div>
							<% } %>
		                </div>
		            </div>
		        </div>
		        <!--end inner-->
	    	</div>
	    	<!--end con02-->
		</div>
		<!--end contentWrap-->
	</div>
</div>
<script>
	$(function (){
		$(".sub2-1_link a.on").attr('title','현재페이지');
	});
</script>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>