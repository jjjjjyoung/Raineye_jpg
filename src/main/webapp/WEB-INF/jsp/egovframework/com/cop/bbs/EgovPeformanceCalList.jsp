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

<%
String daySerach="";
String dateCheak=String.valueOf(pageContext.getAttribute("dateCheak")) ;
String yearCheak=String.valueOf(pageContext.getAttribute("yearCheak")) ;

int dateCount = Integer.parseInt(dateCheak);

String yyear =  String.valueOf(pageContext.getAttribute("yearCheak")) ;//원하는 년도 세팅
String mmonth = String.valueOf(pageContext.getAttribute("dateCheak")) ;
int year = 0, month = 0;
year = Integer.parseInt(yyear); //int로 형변환
month = Integer.parseInt(mmonth); //int로 형변환
%>  
<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<style>
.date${dateCheak} a {
	background: #333;
	color: #fff;
}
</style>
<script>
	$(function(){
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
                    <input type="text" id="search" placeholder="공연명을 입력하세요" title="공연명 입력">

                    <button type="submit">검색</button>
                </form>
                <!--end search-->
            </div>
            <!--end inner-->
        </div>
        <!--end sub_top-->

        <h3><div class="page_title" title="월간공연일정">월간공연일정</div></h3>

        <!--start con01-->
        <div class="con01">
            <div class="link_tab">
				<div class="inner">
					<div class="selected">
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M" title="월간공연일정">월간공연일정</a>
					</div>
					<div>
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=D" title="일간공연일정">일간공연일정</a>
					</div>
					<div>
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=Y" title="연간공연일정">연간공연일정</a>
					</div>
				</div>
            </div>
            <div class="inner">
                <div class="day month">
                    <div class="day_hd">
                        <h4><span>${yearCheak}.${dateCheak}.</span></h4>
						<div class="sub2-1_link jpgfSe03">
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M&ca=L" title="리스트보기">리스트보기</a>
							<a class="on" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M&ca=C" title="달력보기 선택됨">달력보기</a>
						</div>
                        <div>
                            <%if(dateCount==1){ %>
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${12}&year=${yearCheak-1}&ca=C"
								class="prev">이전</a>
							<%}else{ %>
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak-1}&year=${yearCheak}&ca=C"
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
								<li class="date<%=daySerach%>"><a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=<%=daySerach%>&year=${yearCheak}&ca=C"><%=i%>월</a></li>
								<%} %>
							</ul>
							<%if(dateCount==12){ %>
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${1}&year=${yearCheak+1}&ca=C"
								class="next">다음</a>
							<%}else{ %>
							<a
								href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&date=${dateCheak+1}&year=${yearCheak}&ca=C"
								class="next">다음</a>
							<%}%>
                        </div>
                    </div>
                </div>
            </div>
            <!--end inner-->
        </div>
        <!--end con01-->


        <!--
            .sunday 일요일 텍스트 빨간색
            .satday 토요일 텍스트 파란색
            .not_day 날짜없는부분
            .start_day 1일 ( 768이하 border-top설정 )
        -->
        <div class="con02">
            <div class="inner">
    
				   <%
			        Calendar cal = Calendar.getInstance(); //Calendar 객체 호출
			        cal.set(Calendar.YEAR, year);
			        cal.set(Calendar.MONTH, month-1); //0월 ~11월 컴퓨터는 한달 빠르므로 -1을 해야 원하는 달을 얻을 수 있다.
			        cal.set(Calendar.DATE, 1);
			        int statOfDay = cal.get(Calendar.DAY_OF_WEEK); //1일이 어떤 요일
			        int endOfDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 월의 마지막 날짜
			        %>

				
                <table class="calender_t" title="공연 일정 달력">
                	<caption style="
					    caption-side: top;
					    float: left;
					    text-indent: -9999%;
					">공연 일정 달력</caption>
                    <tbody>
                    	 <tr>
                            <th class="sunday">일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th class="satday">토</th>
                        </tr>
                        <tr>
                        	<%
                        	    for(int i=1;i< statOfDay;i++) { //해당 월의 1일의 요일값 만큼 공백 세팅
			           		%>
			           			<td class="not_day"></td>
			           		<%
			           			}
                        	%>

                        	<%
                        		String fc;
                        	   for(int i=1;i<=endOfDay;i++) {
                        		   fc = statOfDay%7==1?"sunday":(statOfDay%7==0?"satday":"");
					               
					        %>
						        <td>
	                                <p class="<%=fc%>">
	                                <%=i%>
	                                </p>
	                                <div class="schedule_inner">
	                                	<ul>

	                                	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	                                		<c:set var="msrtDtm" value="${resultInfo.ntceBgnde}"></c:set>
											<c:set var="msrtCtm" value="${resultInfo.ntceEndde}"></c:set>
											<%
												String msrtDtm = (String) pageContext.getAttribute("msrtDtm");
												String msrtCtm = (String) pageContext.getAttribute("msrtCtm");
												
												String startDate = msrtDtm;
												String endDate = msrtCtm;
												DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

												
												
												msrtDtm = msrtDtm.substring(8,10);
												msrtCtm = msrtCtm.substring(8,10);
												//String loopdate = yearCheak+"-"+dateCheak+"-"+daySerach;
												String loopdate = yearCheak+"-"+dateCheak+"-"+i;
												
												Date nowDate = dateFormat.parse(loopdate);
												Date beforeDate = dateFormat.parse(startDate);
												Date afterDate = dateFormat.parse(endDate);
											
												long nowDateTime = nowDate.getTime();
												long beforeDateTime = beforeDate.getTime();
												long afterDateTime = afterDate.getTime();
												
											%>
												
											<% if(msrtDtm.equals(daySerach) || msrtCtm.equals(daySerach) || (nowDateTime >= beforeDateTime && nowDateTime <= afterDateTime) ) {%>
												<li>
													<a href="/cop/bbs/selectArticleDetail.do?bbsId=${resultInfo.bbsId}&nttId=${resultInfo.nttId}&pageIndex=${searchVO.pageIndex}&skin=D&ca=C">
														<c:choose>
															<c:when test="${resultInfo.type =='토요'}">
																<span class="bedge blue"><c:out value="${resultInfo.type}"/></span>
															</c:when>
															<c:when test="${resultInfo.type =='정기'}">
																<span class="bedge pink"><c:out value="${resultInfo.type}"/></span>
															</c:when>
															<c:when test="${resultInfo.type =='기획'}">
																<span class="bedge green"><c:out value="${resultInfo.type}"/></span>
															</c:when>
														</c:choose>
														<c:out value="${resultInfo.nttSj}" escapeXml="false"/>
													</a>
												</li>
											<% } %>
	                                	</c:forEach>
	                                	</ul>	    
	                                </div>
	                            </td>
	                       	<%
	                       			statOfDay++;
	                       			if(statOfDay%7==1 && i != endOfDay){
					        %>
					        		</tr><tr>
					        <%
	                       			}
				               		
					            }
                        	   
                        	   if(statOfDay%7!=1){

                        			if(statOfDay%7==0){
							%>
                        				<td class="not_day"></td>
							<%
                        			}else{

                        				for(int i=statOfDay%7; i<=7; i++){
                        	%>
                        				<td class="not_day"></td>
							<%
                        				}
                        			}
							%>
                        			</tr>
                        			
							<%
                        		}
                        	   
                        	%>

                    </tbody>
                </table>
            </div>
            <!--end inner-->
        </div>
        <!--end con02-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>