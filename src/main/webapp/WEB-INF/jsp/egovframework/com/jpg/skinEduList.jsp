<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<script>
$(function(){
    $('html > head > title').text('교육/체험 신청');
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

.esBtn1{background:#ffa0a0; padding:2px 10px; color:#333;}
.esBtn2{background:#ffc851; padding:2px 10px; color:#333;}
.esBtn3{background:#7ed3ff; padding:2px 10px; color:#333;}
.esBtn4{background:#91e463; padding:2px 10px; color:#333;}

</style>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">


<div id="subWrap" class="sub0<c:out value='${fn:substring(meCode,0,1) }'/> pro">
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

<%-- 
	            <form method="post" class="schForm" action="/cop/bbs/selectArticleList.do" name="BoardVO">
	                <div class="select_box">
				    	<select name="searchCnd">
                            <option value="1">제목</option>
                            <option value="2">내용</option>
                            <option value="3">제목+내용</option>
                        </select>
                    </div>
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
	        <h3 class="page_title">교육/체험 신청</h3>
	        
	        <div class="con01">
	            <div class="inner">
	            
	                <div id="bo_btn_top">
	                    <div id="bo_list_total">
	                        <span> <c:out value="${paginationInfo.currentPageNo }"/> /</span>
	                        <c:out value="${paginationInfo.totalPageCount }"/> 페이지
	                    </div>
	                </div>
	                <!--end bo_btn_top-->
	            
	                <!-- <p>교육 : 설명문구가 들어갑니다 체험: 설명문구가 들어갑니다 교육 : 설명문구가 들어갑니다 체험: 설명문구가 들어갑니다 </p> -->
	                <div class="ntc_table type2">
	                    <table>
	                        <legned class="gc_yn_title">교육&nbsp;/&nbsp;체험 안내</legned>
	                        <div class="line godo_non_line"></div>
	                        <tbody>
	                        	<c:forEach items="${noticeEduList}" var="noticeEduList" varStatus="status">
	                        	<tr>
	                        		<c:if test="${noticeEduList.eduVal == '1'}">	
		                   				<td class="txtBlue">교육</td>
	                   				</c:if>
	                   				<c:if test="${noticeEduList.eduVal == '2'}">	
		                   				<td class="txtGreen">체험</td>
		                   			</c:if>
		                   			<td class="articleSub">
		                   			<form name="subForm" method="get" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
									    <input name="nttId" type="hidden" value="<c:out value="${noticeEduList.nttId}"/>">
									    <input name="bbsId" type="hidden" value="<c:out value="${noticeEduList.bbsId}"/>">
									    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
									    <input name="skin" type="hidden" value="<c:out value='${noticeEduList.bbsTyCode}'/>"/>
										<input type="submit" value='<c:out value="${noticeEduList.nttSj}"/>'/>
									</form> 
									</td>
	                                <td class="txtPink"><c:out value='${noticeEduList.frstRegisterNm}'/></td>
	                                <td class="td_datetime"><c:out value='${noticeEduList.frstRegisterPnttm}'/></td>
	                            </tr>
	                        	</c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	                <!--end ntc_table-->
	                <a class="more_btn" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000046">공지사항 더보기&nbsp;<span class="plus">+</span><!-- &#8594; --></a>
	            </div>
	            <!--end inner-->
	        </div>
	        <!--end con01-->
	        
	        <!--start con02-->
	        <div class="con02">
	            <div class="inner">
	                <div id="bo_btn_top">
	                    <div id="bo_list_total">
	                        <span> <c:out value="${paginationInfo.currentPageNo }"/> /</span>
	                        <c:out value="${paginationInfo.totalPageCount }"/> 페이지
	                    </div>
	                    
	                    <form method="post" class="schForm" action="/cop/bbs/selectArticleList.do" name="BoardVO">
	                        <div class="select_box">
		        		    	<select name="searchCnd" title="분류">
                                    <option value="1">제목</option>
                                    <option value="2">내용</option>
                                    <option value="3">제목+내용</option>
                                </select>
                            </div>
	        	            <input type="text" id="searchWrd" name="searchWrd" placeholder="검색어를 입력하세요" value="${articleVO.searchWrd }" title="검색어 입력">
	        	            
	        	            <input class="bbsIdVal" name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId }"/>">
	        	            <!-- <input class="skinVal" name="skin" type="hidden" value=""/> -->
	        	            <button type="submit">검색</button>
	                    </form>
	                <!--end search-->
   	                </div>
	                <!--end bo_btn_top-->
	
	                <div class="ntc_table">
	                    <table>
	                    	<caption class="sound_only">교육/체험 신청 목록</caption>
							<thead>
								<tr style="border-bottom:2px solid #333">
									<th scope="col">구분</th>
									<th scope="col" class="c_name">강좌명</th>
									<!--<th scope="col" class="rcp_status"></th>-->
									<th scope="col" class="app_date vhksd_s2">신청기간</th>
									<th scope="col" class="edu_date vhksd_s2">교육기간</th>
									<th scope="col" class="price">수강료</th>
									<th scope="col" class="rcp_status">수강상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
								<tr>
									<c:if test="${resultInfo.eduVal == '1'}">	
										<td class="txtBlue">교육</td>
									</c:if>
									<c:if test="${resultInfo.eduVal == '2'}">	
										<td class="txtGreen">체험</td>
									</c:if>
									<td class="c_name">
									<form name="subForm" method="get" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
										<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
										<input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
										<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
										<input name="skin" type="hidden" value="<c:out value='${resultInfo.bbsTyCode}'/>"/>
										<input type="submit" id="subject" value='<c:out value="${resultInfo.eduSubTitle} | ${resultInfo.nttSj}"/>'/>
									</form>
									</td>
									<!--<td class="price pay">
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
									<td class="app_date"><c:out value="${fn:substring(resultInfo.applySdate,0,10)}"/> ~ <br><c:out value="${fn:substring(resultInfo.applyEdate,0,10)}"/></td>
									<td class="edu_date"><c:out value="${fn:substring(resultInfo.eduSdate,0,10)}"/> ~ <br><c:out value="${fn:substring(resultInfo.eduEdate,0,10)}"/></td>
									<td class="price pay">
									<c:if test="${resultInfo.eduPrice == '2'}">
										유료
									</c:if>
									<c:if test="${resultInfo.eduPrice == '1'}">
										무료
									</c:if>
									</td>
									
									<c:if test="${resultInfo.eduPrice == '1'}">
										<td class="rcp_status ing"><a href='<c:out value="${resultInfo.eduUrl}" />' target="_blank"><span>영상보기</span></a></td>
									</c:if>
									
									<c:if test="${resultInfo.eduPrice == '2'}">
									
									<c:choose>
										<c:when test="${Today < fn:substring(resultInfo.applySdate,0,10) }">
											<td class="rcp_status before"><span>접수 전</span></td>
										</c:when>
										<c:when test="${Today > fn:substring(resultInfo.applyEdate ,0,10) }">
											<td class="rcp_status end"><span>접수마감</span></td>
										</c:when>
										<c:otherwise>
											<td class="rcp_status ing"><span>접수 중</span></td>
										</c:otherwise>
									</c:choose>
									
									</c:if>
								</tr>
								</c:forEach>
							</tbody>
	                    </table>
	                </div>
	            </div>
	            <!--end inner-->
	        </div>
	        <!--end con02-->
	        
	        <div class="btn">
	        	<form id="writeForm" name="writeForm" method="post" action="<c:url value='/cop/bbs/insertArticleView.do'/>">
	        		<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}"/>">
	        		<c:if test="${user.id =='webmaster' }"> 
	            		<input type="button" class="s_submit" id="writeBtn" value="글쓰기" title="글쓰기 버튼">
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

		</div>
		<!--end contentWrap-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->

<script>

$(function(){
	$('#gnb > ul > li:nth-of-type(3)').addClass('on2');
	
});


$("#writeBtn").on("click", function() {
	$("#writeForm").submit();
});
</script>
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>