
<%

%>
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
<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<link rel="stylesheet" href="/css/egovframework/com/jpg/style2.css">
<meta property="og:image" content="http://irin2000.cafe24.com/cmm/fms/getImage.do?atchFileId=${result.atchFileId}"/>



<script>
function fn_egov_delete_article(form){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		form.submit();	
	}	
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
				</form>
				end search -->
			</div>
			<!--end inner-->
		</div>
		<!--end sub_top-->


        <!--start content-->
        <div class="contentWrap" id="go_direct">

			<!--공연 제목 ㅎㅎ-->
			<h3 class="page_title tit2 tl">
				<div class="inner">${result.nttSj}</div>
			</h3>
	
			<div class="view_table2">
					<div class="con01">
						<c:set var="msrtDtm" value="${result.ntceBgnde}"></c:set>
						<c:set var="msrtCtm" value="${result.ntceEndde}"></c:set>
						<c:set var="msrTell" value="${result.tell}"></c:set>
						<%
							String msrtDtm = (String)pageContext.getAttribute("msrtDtm");
							String msrtCtm = (String)pageContext.getAttribute("msrtCtm");
							String dateC= msrtDtm.replace("-", "");
							String dateB= msrtCtm.replace("-", "");
							String msrTell= (String)pageContext.getAttribute("msrTell"); 
							String tell="";
						    String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
						    tell= msrTell.replaceAll(regEx, "$1-$2-$3");
						%>
						<%
                             
	                       String inputDate =dateC;
                              DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
                                 Date date = dateFormat.parse(inputDate);
                                 Calendar calendar = Calendar.getInstance();
                                 calendar.setTime(date);
                                 int day_of_week=calendar.get(Calendar.DAY_OF_WEEK);
                                 String day="";
                                 switch(day_of_week){
                                  case 1:
                               	   day = "일";
                               	   break;
                                  case 2:
                               	   day = "월";
                               	   break;
                                  case 3:
                               	   day = "화";
                               	   break;
                                  case 4:
                               	   day = "수";
                               	   break;
                                  case 5:
                               	   day = "목";
                               	   break;
                                  case 6:
                               	   day = "금";
                               	   break;
                                  case 7:
                               	   day = "토";
                               	   break;	   
                              }
                                 
                                 String inputDateB =dateB;
                                 DateFormat dateFormatB = new SimpleDateFormat("yyyyMMdd");
                                 Date dateSecond = dateFormatB.parse(inputDateB);
                                 Calendar calendarB = Calendar.getInstance();
                                 calendarB.setTime(dateSecond);
                                 int day_of_weekSecond=calendarB.get(Calendar.DAY_OF_WEEK);
                                 String dayB="";
                                 switch(day_of_weekSecond){
                                  case 1:
                               	   dayB = "일";
                               	   break;
                                  case 2:
                               	   dayB = "월";
                               	   break;
                                  case 3:
                               	   dayB = "화";
                               	   break;
                                  case 4:
                               	   dayB = "수";
                               	   break;
                                  case 5:
                               	   dayB = "목";
                               	   break;
                                  case 6:
                               	   dayB = "금";
                               	   break;
                                  case 7:
                               	   dayB = "토";
                               	   break;	   
                              }
                              
                                %>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
						<div class="inner">
							<div class="vw_head">
								<div class="left ygBc">
									<div class="vw_img">
									<img src="/cmm/fms/getImage.do?atchFileId=${result.atchFileId}" alt="프로그램  ${fn:substring(result.ntceBgnde,0,7)}.PROGRAM 공연명 ${result.nttSj} 공연일시 ${fn:substring(result.ntceBgnde,0,10)} (<%=day%>) ${result.startTime} ~ ${fn:substring(result.ntceEndde,0,10)}.(<%=dayB%>)${result.endTime} 공연장소 ${result.addressDetail} 주최  ${result.host} 주관 ${result.subhost} 소요시간 ${result.takeTime} 관람료 ${result.charge} 공연문의  <%=tell%> 매주 토요일 오후 5시 남도소리울림터 공연장">
									</div>
									
									
									
									
									
									
									
									
									
									
									<div class="fsea_card_com">
					    				<div class="btn_area5">
					    					<a href="<c:out value='${result.ticketLink}'/>" target="_blank" title="예매하기(새창)">예매하기</a>
					    				</div>
										<div class="sale">
											<button href="#" style="">할인정보</button>
												<div class="sale_pop mjm_pbc_box">
													<h2>할인정보</h2>
													<p><span class="txtPink2">30%</span> 전남도민, 대학생, 단체(10인 이상)</p>
													<p style="margin-left:30px">군인(장교)·경찰·소방공무원</p>
													<p><span class="txtPink2">50%</span> 학생 및 유료회원(남도 2매, 풍류 4매)</p> 
													<p><span class="txtPink2">무료</span> 경로·미취학아동·문화누리카드 소지자(본인),</p>
													<p style="margin-left:27px">국가유공자·장애인(동반 1인)</p>
												</div>
										</div>
									</div>
									
									
									
									
									
									
									
									
									
									
									
									
							    	<c:if test="${result.ticketLink != '' }"></c:if>
							    	</div>
								<div class="right hmg_partx2">
									<table class="title wj_table">
										<td class="pf_name wj_td nijas_acenz2">공연명</td>
										<td class="wj_td02 nijas_acenz2"><span class="txtGray">${result.sjBoldAtMain}</span> <strong>${result.nttSj}</strong></td>
									</table>
									<table>
							
										<tr class="wj_table">
											<td class="wj_td nijas_acenz2">공연일시</td>
											<td class="wj_td02 nijas_acenz2">${fn:substring(result.ntceBgnde,0,10)}(<%=day%>) ${result.startTime}
												~ ${fn:substring(result.ntceEndde,0,10)}(<%=dayB%>)${result.endTime}
											</td>
										</tr>
										<tr class="wj_table not_float_led">
											<td class="wj_td">공연장소</td>
											<td class="wj_td02">${result.addressDetail}</td>
										</tr>
										<tr class="wj_table not_float_led">
											<td class="wj_td">주최</td>
											<td class="wj_td02">${result.host}</td>
										</tr>
										<tr class="wj_table not_float_led">
											<td class="wj_td">주관</td>
											<td class="wj_td02">${result.subhost}</td>
										</tr>
									</table>
									<table>
										<tr class="wj_table not_float_led">
											<td class="wj_td">연령</td>
											<td class="wj_td02">${result.ageLimit}</td>
										</tr>
										<tr class="wj_table not_float_led">
											<td class="wj_td">소요시간</td>
											<td class="wj_td02">${result.takeTime}</td>
										</tr>
										<tr class="posR wj_table not_float_led">
											<td class="wj_td">관람료</td>
											<td class="wj_td02"><c:out value="${result.charge}" /> </td>
											<!-- <td class="sale">
												<button href="#" style="">할인정보</button>
												<div class="sale_pop">
													일반 1만원<br> 대학생 및 단체 (10인 이상) 7천원<br> 학생 및 유료회원(풍류 4매, 남도 2매) 5천원<br> 경로
													(65세 이상) 및 미취학아동 무료<br> 국가유공자 및 장애인 무료 (동반1인)<br>
													<p class="txtPink2">* 할인 적용은 신분증, 등록증 등을 소지한 분에 한함</p>
												</div>
											</td> -->
										</tr>
										<tr class="wj_table not_float_led">
											<td class="wj_td">공연문의</td>
											<td class="wj_td02"><%=tell%></td>
										</tr>
										
 		                                <tr class="share wj_table not_float_led">
		                                    <td class="wj_td">공유하기</td>
		                                    <td class="wj_td02">
		                                    
		                                    	<!-- <a href="javascript:alert('준비중입니다.')" class="kakao">카카오톡</a> -->
		                                    	<a id="kakaoLink" href="javascript:kakaolink_send();" class="kakao" title="새창열기">카카오톡</a> 
		                                    	<!-- <a href="javascript:alert('준비중입니다.')" class="insta">인스타그램</a> -->
		                                    	<!-- <a href="#" class="blog">네이버블로그</a> -->
		                                    	<a title="새창열기" href="javascript:naverShare('<c:out value="${result.sjBoldAtMain }"/>','<c:out value="${result.nttId }"/>');" class="blog" alt="Share on Naver" >네이버 블러그</a>
		                                    	
		                                    </td>
		                                </tr>  
		                                
									</table>
								</div>
								
								<div class="vw_con" style="width: 100%;">
									
									<table>
										<tr>
											<td class="intro_show_text_z2"><h3>공연소개</h3></td>
											<td class="intro_show_text_z2">
												<c:out value="${result.nttCn}" escapeXml="false"></c:out>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						</div>
						<!-- end inner -->
						<div class="btn ex_list_vi">
							<c:if test="${user.id == 'webmaster' }">
								<form name="articleForm" action="<c:url value='/cop/bbs/updateArticleView.do'/>" method="post" style="float: left;">
									<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
									<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>"> 
									<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>"> 
									<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>"> 
									<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>"> 
									<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />"> 
									<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
								</form>
								<form name="formDelete" action="<c:url value='/cop/bbs/deleteArticle.do'/>" method="post" style="float: left; margin: 0 0 0 3px;">
									<input type="submit" class="s_submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" onclick="fn_egov_delete_article(this.form); return false;"> 
									<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />"> <input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
								</form>
							</c:if>
							<a href="<c:url value='/cop/bbs/selectArticleList.do'/>?bbsId=<c:out value='${boardMasterVO.bbsId}'/>&skin=<c:out value='${skin}'/>">목록보기</a>
							<!-- 
							<form name="formList" action="<c:url value='/cop/bbs/selectArticleList.do'/>?bbsId=<c:out value=''/>&skin=<c:out value=''/>" method="post"
								style="float: left; margin: 0 0 0 3px;">
								<input type="hidden" class="skin" value="<c:out value="${skin}"/>">
								<input type="submit" class="s_submit" value="<spring:message code="button.list" />">
								<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
							</form>
							 -->
	
						</div>
						<!-- end btn -->
						<div style="clear: both;"></div>
	
					</div>
					<!-- end con01 -->
	
					<c:if test="${useComment == 'true'}">
						<c:import url="/cop/cmt/selectArticleCommentList.do" charEncoding="utf-8">
						</c:import>
					</c:if>
	
					<c:if test="${useSatisfaction == 'true'}">
						<form name="frm" method="post" action="">
							<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />"> 
							<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
							
							<c:import url="/cop/stf${prefix}/selectSatisfactionList.do" charEncoding="utf-8">
								<c:param name="type" value="body" />
							</c:import>
						</form>
					</c:if>
	
	
				</div>
				<!-- end view_table2 -->
			</div>
			<!--end contentWrap-->
		</div>
		<!-- end container -->
</div>
<!-- end subWrap -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init("ebc5124cdc1c4494299e0307e336a8ba");
</script>
<script>

 
function kakaolink_send(){
	
	var url = document.URL;
	
	Kakao.Link.sendDefault({
		objectType: 'feed',
		content: {
			title: '<c:out value="${result.sjBoldAtMain}"/>',
			description: '<c:out value="${result.sjBoldAtMain}"/>',
			imageUrl: '/cmm/fms/getImage.do?atchFileId=<c:out value="${result.atchFileId}"/>',
			link: {
				mobileWebUrl: url,
				webUrl: url
			}
		},
		buttons: [
			{
				title: '자세히 보기',
				link: {
					mobileWebUrl: url,
					webUrl: url
				}
			}
		]
	});
	
	/*
	Kakao.Link.createTalkLinkButton({
	  container: '#kakaoLink',
	  label: '<c:out value="${result.sjBoldAtMain}"/>',
	  image: {
	    src: '/cmm/fms/getImage.do?atchFileId=<c:out value="${result.atchFileId}"/>',
	    width: '300',
	    height: '450'
	  },
	  webButton: {
	    text: '링크이동',
	    url: url
	  }
	
	});
	*/
}

//
/*   
function kakaolink_send(text)
{
    
    // 카카오톡 링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.sendTalkLink({
      webLink : {
        text: String(text),
        url: "http://localhost:8080"
      }
    });
}
    */
    
    function naverShare(title,id){
    	
    	var link ="http://irin2000.cafe24.com/cop/bbs/selectArticleDetail.do?bbsId=BBSMSTR_000000000055&nttId="+id;
    	
    	window.open('http://share.naver.com/web/shareView.nhn?url='+encodeURI(encodeURIComponent(link))+'&title='+encodeURIComponent(title) , 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
    }
</script>
		<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>