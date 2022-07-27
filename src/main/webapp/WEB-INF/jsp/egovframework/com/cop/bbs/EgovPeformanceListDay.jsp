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
<c:set var="dayCheak" value="${dayCheak}" />

<%
	String dateFiste = String.valueOf(pageContext.getAttribute("yearCheak"));
	String daySerach = "";
	String dateCount = String.valueOf(pageContext.getAttribute("dateCount"));
	dateFiste += String.valueOf(pageContext.getAttribute("dateCheak"));
	int int_val = Integer.parseInt(dateCount);
	int dateCountN = Integer.parseInt(String.valueOf(pageContext.getAttribute("dateCheak")));
	String Today = String.valueOf(pageContext.getAttribute("dayCheak"));
	String dateComplete = "";

	String nowDate = dateFiste+dateCount;

	pageContext.setAttribute("int_val", int_val);
%>

<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<style>
.date
 
${
dateCheak

	

}
a {
	background: #333;
	color: #fff;
}

.sub02 .day .day_tb table td.choose::before {
	border-radius: 100px;
	background: #ff1717;
	content: '';
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	top: 8px;
	width: 25px;
	height: 25px;
	z-index: -1;
}

.sub02 .day .day_tb .atv::after {
	content: '';
	position: absolute;
	left: 50%;
	top: 70%;
	transform: translateX(-50%);
	width: 6px;
	height: 6px;
	border-radius: 6px;
	background: #f00;
}

.date${dateCheak} a {
	background: #333;
	color: #fff;
}

.btn_b a {
	margin-top: 0;
}
</style>
<script>
$(function(){
	$('#gnb > ul > li:nth-of-type(2)').addClass('on2');
	$('.date${dateCheak} a').attr('title','현재페이지');
	$(document).attr("title","공연-공연정보-일간공연일정"); 
});
</script>

<div id="subWrap"
	class="sub0<c:out value='${fn:substring(meCode,0,1) }'/>">
	<div class="sub_visual">
		<c:choose>
			<c:when test='${fn:substring(meCode,0,1).equals("5") }'>
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
					<button class="print" onclick="window.print();">
						<img alt="프린트하기 버튼"
							src="/images/egovframework/com/jpg/icon/print.png">
					</button>
				</div>
				<form method="post" class="schForm"
					action="/cop/bbs/selectArticleList.do" name="BoardVO">
					<div class="select_box">
						<select name="searchCnd" title="공연 검색 분류">
							<option value="1"
								<c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>제목</option>
							<option value="2"
								<c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>>내용</option>
							<option value="3"
								<c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if>>제목+내용</option>
						</select>
					</div>
					<input type="text" id="searchWrd" name="searchWrd"
						placeholder="공연명을 입력하세요" value="${articleVO.searchWrd }"
						title="공연명 입력">
					<!-- <input type="hidden" id="searchCnd" name="searchCnd" value="1" /> -->
					<!-- <input class="skinVal" name="skin" type="hidden" value=""/> -->
					<input class="bbsIdVal" name="bbsId" type="hidden"
						value="<c:out value="${boardMasterVO.bbsId }"/>"> <input
						class="skin" name="skin" type="hidden" value="D" />
					<button type="submit">검색</button>
				</form>
				<!--end search-->
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->
		<!--start content-->
		<div class="contentWrap" id="go_direct">
			<h3 class="page_title">일간공연일정</h3>

			<div class="con01">
				<div class="link_tab">
					<div class="inner">
						<div>
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M">월간공연일정</a>
						</div>
						<div class="selected">
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=D" title="현재페이지">일간공연일정</a>
						</div>
						<div>
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=Y">연간공연일정</a>
						</div>
					</div>
				</div>
				<div class="inner">
					<div class="day month">
						<div class="day_hd">
							<div class="cal_tit">
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&amp;date=${dateCheak-1}&amp;year=${yearCheak}&skin=D"
									class="prev">이전</a>
								<h4>
									<span>${yearCheak}.${dateCheak}.</span>
								</h4>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&amp;date=${dateCheak+1}&amp;year=${yearCheak}&skin=D"
									class="next">다음</a>
							</div>

							<div class="mb">
								<form>
									<div class="year_sel sel">
										<select name="select" id="yearSelect"
											onchange="changeDate('Y');" title="년도선택">
											<option value="2020"
												<c:if test="${yearCheak == '2020'}"> selected </c:if>>2020</option>
											<option value="2019"
												<c:if test="${yearCheak == '2019'}"> selected </c:if>>2019</option>
											<option value="2018"
												<c:if test="${yearCheak == '2018'}"> selected </c:if>>2018</option>
											<option value="2017"
												<c:if test="${yearCheak == '2017'}"> selected </c:if>>2017</option>
											<option value="2016"
												<c:if test="${yearCheak == '2016'}"> selected </c:if>>2016</option>
											<option value="2015"
												<c:if test="${yearCheak == '2015'}"> selected </c:if>>2015</option>
										</select>
									</div>
									<div class="month_sel sel">
										<select name="select" id="monthSelect"
											onchange="changeDate('M');" title="월 선택">
											<option value="01"
												<c:if test="${dateCheak == '01'}"> selected </c:if>>1</option>
											<option value="02"
												<c:if test="${dateCheak == '02'}"> selected </c:if>>2</option>
											<option value="03"
												<c:if test="${dateCheak == '03'}"> selected </c:if>>3</option>
											<option value="04"
												<c:if test="${dateCheak == '04'}"> selected </c:if>>4</option>
											<option value="05"
												<c:if test="${dateCheak == '05'}"> selected </c:if>>5</option>
											<option value="06"
												<c:if test="${dateCheak == '06'}"> selected </c:if>>6</option>
											<option value="07"
												<c:if test="${dateCheak == '07'}"> selected </c:if>>7</option>
											<option value="08"
												<c:if test="${dateCheak == '08'}"> selected </c:if>>8</option>
											<option value="09"
												<c:if test="${dateCheak == '09'}"> selected </c:if>>9</option>
											<option value="10"
												<c:if test="${dateCheak == '10'}"> selected </c:if>>10</option>
											<option value="11"
												<c:if test="${dateCheak == '11'}"> selected </c:if>>11</option>
											<option value="12"
												<c:if test="${dateCheak == '12'}"> selected </c:if>>12</option>
										</select>
									</div>
									<div class="day_sel sel">
										<select name="select" id="dateSelect"
											onchange="changeDate('D');" title="날짜 선택">
											<c:forEach var="i" begin="1" end="31">
												<c:choose>
													<c:when test="${i < 10 }">
														<option value="0${i}"
															<c:if test="${dayCheak == '0'+i}">selected </c:if>>0
															<c:out value="${i}" /></option>
													</c:when>
													<c:otherwise>
														<option value="${i}"
															<c:if test="${dayCheak == '0'+i}">selected </c:if>><c:out
																value="${i}" /></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</form>
							</div>
							<div class="pc">
								<%
									if (dateCountN == 1) {
								%>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${12}&year=${yearCheak-1}&skin=D"
									class="prev">이전</a>
								<%
									} else {
								%>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak-1}&year=${yearCheak}&skin=D"
									class="prev">이전</a>
								<%
									}
								%>
								<ul>
									<%
										for (int i = 1; i < 13; i++) {
											if (i < 10) {
												daySerach = "0" + i;
											} else {
												daySerach = "" + i;
											}
									%>
									<li class="date<%=daySerach%>"><a
										href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=<%=daySerach%>&year=${yearCheak}&skin=D"><%=i%>월</a>
									</li>
									<%
										}
									%>
								</ul>
								<%
									if (dateCountN == 12) {
								%>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${1}&year=${yearCheak+1}&skin=D"
									class="next">다음</a>
								<%
									} else {
								%>
								<a
									href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak+1}&year=${yearCheak}&skin=D"
									class="next">다음</a>
								<%
									}
								%>
							</div>
						</div>
						<!--end day_hd-->
						<div class="day_tb pc">
							<div class="ex_txt">
								<span class="txtRed">&#8226;&nbsp;:&nbsp;</span>공연 있는 날
							</div>
							<table>
								<!--<caption style="visibility: visible; height: 0; position:relative; width:100px; margin:0 auto; top:-10px">일간공연일정</caption>-->
								<tbody>
									<tr>
										<%
											for (int i = 1; i < int_val + 1; i++) {
												if (i < 10) {
													dateComplete = dateFiste + "0" + i;
												} else {
													dateComplete = dateFiste + i;
												}
												String inputDate = dateComplete;
												DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
												Date date = dateFormat.parse(inputDate);
												Calendar calendar = Calendar.getInstance();
												calendar.setTime(date);
												int day_of_week = calendar.get(Calendar.DAY_OF_WEEK);
												String day = "";
												switch (day_of_week) {
													case 1 :
														day = "일";
														break;
													case 2 :
														day = "월";
														break;
													case 3 :
														day = "화";
														break;
													case 4 :
														day = "수";
														break;
													case 5 :
														day = "목";
														break;
													case 6 :
														day = "금";
														break;
													case 7 :
														day = "토";
														break;
												}
												if (day.equals("토")) {
										%>
										<th class="txtSky2 weekend"><%=day%></th>
										<%
											} else if (day.equals("일")) {
										%>
										<th class="txtRed weekend"><%=day%></th>
										<%
											} else {
										%>
										<th><a href="#"><%=day%></a></th>
										<%
											}
											}
										%>
									</tr>
									<tr>
										<%
											for (int i = 1; i < int_val + 1; i++) {
												if (i < 10) {
													daySerach = "0" + i;
												} else {
													daySerach = "" + i;
												}
										%>
										<%
											if (Today.equals(daySerach)) {
										%>
										<td class="days<%=daySerach%> choose"><a
											href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak}&day=<%=daySerach%>&skin=D"><%=i%></a>
										</td>
										<%
											} else {
										%>

										<td class="days<%=daySerach%>"><a
											href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak}&day=<%=daySerach%>&skin=D"><%=i%></a>
										</td>
										<%
											}
										%>
										<%
											}
										%>
									</tr>
								</tbody>
							</table>
							<c:forEach items="${resultList}" var="resultInfo"
								varStatus="status">
								<c:set var="msrtDtm" value="${resultInfo.ntceBgnde}"></c:set>
								<c:set var="msrtCtm" value="${resultInfo.ntceEndde}"></c:set>
								<%
									String msrtDtm = (String) pageContext.getAttribute("msrtDtm");
										String msrtCtm = (String) pageContext.getAttribute("msrtCtm");
										String dateC = msrtDtm.replace("-", "");
										String dateB = msrtCtm.replace("-", "");
								%>
								<jsp:useBean id="todayTmp" class="java.util.Date" />
								<c:set var="nowTmp">
									<c:out value="${Pastday_temp}" />
								</c:set>
								<c:set var="startDateTmp">
									<c:out value="${fn:replace(resultInfo.ntceBgnde,'-','')}" />
								</c:set>
								<c:set var="endDateTmp">
									<c:out value="${fn:replace(resultInfo.ntceEndde,'-','')}" />
								</c:set>


								<fmt:parseDate var="now" value="${nowDate}" pattern="yyyyMMdd" />
								<fmt:parseDate var="startDate" value="<%=dateC%>" pattern="yyyyMMdd" />
								<fmt:parseDate var="endDate" value="<%=dateB%>" pattern="yyyyMMdd" />

								<fmt:formatDate value="${todayTmp}" pattern="yyyyMMdd" var="today" />
								<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
								<fmt:formatDate value="${startDate}" pattern="yyyyMMdd"	var="openDate" />
								<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate" />


								<c:if test="${openDate <=  nowDate &&  closeDate >= nowDate}">


									<c:set value="true" var="daycnt" />
									<div class="list">
										<form id="" name="subForm" method="post"
											action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
											<input name="nttId" type="hidden"
												value="<c:out value="${resultInfo.nttId}"/>"> <input
												name="bbsId" type="hidden"
												value="<c:out value="${resultInfo.bbsId}"/>"> <input
												name="pageIndex" type="hidden"
												value="<c:out value='${searchVO.pageIndex}'/>" />
											<div class="left">
												<img
													src="/cmm/fms/getImage.do?atchFileId=${resultInfo.atchFileId}"
													alt="${resultInfo.nttSj}">
											</div>
											<div class="right">
												<ul>
													<li class="txtGray dda_fast_u2"><c:choose>
															<c:when test="${resultInfo.type =='토요'}">
																<span class="bedge blue">
															</c:when>
															<c:when test="${resultInfo.type =='정기'}">
																<span class="bedge pink">
															</c:when>
															<c:when test="${resultInfo.type =='기획'}">
																<span class="bedge green">
															</c:when>
														</c:choose> ${resultInfo.type}</span>${resultInfo.sjBoldAtMain}</li>
													<li class="bold">${resultInfo.nttSj}</li>
													<%
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
													<li class="day txtGray">${fn:substring(resultInfo.ntceBgnde,0,10)}.(<%=day.charAt(0)%>)
														${resultInfo.startTime} ~<br>
														${fn:substring(resultInfo.ntceEndde,0,10)}.(<%=dayB.charAt(0)%>)
														${resultInfo.endTime}
													</li>
													<li class="where txtGray">${resultInfo.addressDetail}</li>
												</ul>
												<div class="btn_area2">
													<c:choose>
														<c:when test="${closeDate >= today}">
															<a
																href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=D"
																class="dt_btn" style="cursor: pointer">상세보기</a>
															<a href="${resultInfo.ticketLink}" class="tk_link jpgf01">예매하기</a>
														</c:when>
														<c:otherwise>
															<a
																href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=D"
																class="dt_btn" style="cursor: pointer">종료됨</a>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</form>
										<!--end right-->
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!--end day_tb pc-->
						<%-- 						<c:if test="${fn:length(resultList) == 0}">
							<tr>
								<td colspan="5"><spring:message code="common.nodata.msg" /></td>
							</tr>
						</c:if> --%>
						<span class="btn_b"> <c:if test="${user.id == 'webmaster'}">
								<a
									href="<c:url value='/cop/bbs/insertArticleView.do?bbsId=${boardMasterVO.bbsId}' />"
									title="<spring:message code="button.create" /> <spring:message code="input.button" />">
									<spring:message code="button.create" />
								</a>
							</c:if>
						</span>
					</div>
				</div>
				<!--end inner-->
			</div>
			<!--end con01-->
		</div>
		<!--end contentWrap-->
	</div>
	<!--end container-->
</div>
<!--end subWrap-->
<script>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		var days = "<c:out value='${fn:substring(resultInfo.ntceBgnde,8,10)}'/>";
		var days2 = "<c:out value='${fn:substring(resultInfo.ntceEndde,8,10)}'/>";

		var month = "<c:out value='${fn:substring(resultInfo.ntceBgnde,5,7)}'/>";
		var month2= "<c:out value='${fn:substring(resultInfo.ntceEndde,5,7)}'/>";

		var dateCheck = "<c:out value='${dateCheak}'/>";

		var i = days;
			i++;
			i--;
		if(dateCheck == month) {
			for(i; i <= days2; i++) {
				if(i < 10) {
					$(".days0"+i).addClass("atv");
				} else {
					$(".days"+i).addClass("atv");
				}
			}
		} else {
			if(month < month2 && dateCheck == month2) {
				for(i = 0; i <= days2; i++) {
					if(i < 10) {
						$(".days0"+i).addClass("atv");
					} else {
						$(".days"+i).addClass("atv");
					}
				}
			}
		}
		
		
		
			<%-- if(month < month2) {
				if(dateCheck == month2) {
					i = 0;
					for(i; i < days2 + 1; i++) {
						if(i < 10) {
							$(".days0"+i).addClass("atv");
						} else {
							$(".days"+i).addClass("atv");
						}
					}			
				} else {
					days2 = "<c:out value='${int_val}'/>";
					for(i;i<days2;i++) {
						if(i<10) {
							$(".days0"+i).addClass("atv");
						} else {
							$(".days"+i).addClass("atv");
						}
					}
				}
			} else {
				if(dateCheck == month2) {
					for(i = days; i < days2; i++){
						if(i < 10) {
							$(".days0"+i).addClass("atv");
						} else {
							$(".days"+i).addClass("atv");
						}
					}
				}
			} --%>
	</c:forEach>
</script>
<script>
function changeDate(type){
	var year = document.getElementById('yearSelect').value;
	var month = document.getElementById('monthSelect').value;
	var date = document.getElementById('dateSelect').value;
	
	if(type == "Y" || type == "M"){
		window.location.href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date="+month+"&year="+year+"&skin=D";
	}else{
		window.location.href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date="+month+"&day="+date+"&skin=D";
	}
}
</script>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>