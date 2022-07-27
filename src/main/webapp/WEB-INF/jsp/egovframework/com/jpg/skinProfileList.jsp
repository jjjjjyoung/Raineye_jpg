<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
	<c:when test="${kid == 'Y' }">
		<c:import url="/kidMenu.do"/>
	</c:when>
	<c:otherwise>
		<c:import url="/menu.do"/>
	</c:otherwise>
</c:choose>

<script>

$(function(){
	$('.kidGnb .kid_mn2').addClass('on');	
	
   	$('#gnb > ul > li:first-of-type').addClass('on2');	
   	//$('.tab .inner .selected a').attr('title','현재페이지');
   	//어린이단원소개 첫번째 탭 텍스트 변경
 	//$('.kidWrap').find('.tab .inner > div:first-child').html('<a href="#">객원예술감독</a>');
});


/***
.inv_art_direc01 
***/



</script>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="sub0<c:out value='${fn:substring(meCode,0,1) }'/>">
    <div class="sub_visual">
    	<c:choose>
	    	<c:when test="${fn:substring(meCode,0,1).equals('5') }">
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
	            <!-- 
	            <form method="post" class="schForm">
	                <input type="text" id="search" placeholder="검색어를 입력하세요">
	
	                <button type="submit">검색</button>
	            </form>
	             -->
	            <!--end search-->
	        </div>
	        <!--end inner-->
	    </div>
	    <!--end sub_top-->

        <!--start content-->
        <div class="contentWrap" id="go_direct">
	
			<c:choose>
				<c:when test="${kid == 'Y' }">
					<h3 class="page_title">어린이단원 소개</h3>
				</c:when>
				<c:otherwise>
					<h3 class="page_title">예술단원소개</h3>
				</c:otherwise>
			</c:choose>
		

		    <!--start con01-->
		    <!-- <h3 style="position:relative; width:500px; margin:0.5vw auto; text-align:center">분야별 전라남도국악단 예술단원 소개</h3> -->
		    <div class="con01">
		        <div class="tab">		        	
		            <div class="inner name_class_box09">
		                
		                <c:if test="${param.bbsId != 'BBSMSTR_000000000050'}">
		                <div class="selected" id="article1">
		                	<a href="#" title="현재페이지"><span>예술감독</span></a>
		                </div>
		                </c:if>
		                
		                <c:if test="${param.bbsId == 'BBSMSTR_000000000050'}">
		                <div class="selected" id="article1">
		                	<a href="#" class="inv_art_direc01"><span>객원예술감독</span></a>
		                	<a href="#" class="inv_art_direc02"><span>예술감독</span></a>
		                </div>
		                </c:if>
		                
		                <c:if test="${param.bbsId == 'BBSMSTR_000000000050'}">
		                <div id="article6"><a href="#" ><span>지도교사</span></a></div>
		                </c:if>
		                <div id="article2"><a href="#" ><span>창악부</span></a></div>
		                <div id="article3"><a href="#" ><span>기악부</span></a></div>
		                <div id="article4"><a href="#" ><span>무용부</span></a></div>
		                <div id="article5"><a href="#" ><span>사물부</span></a></div>
		            </div>
		      	<script>
				    	$("#article1").click(function(){
				      		$('#article_h4').empty();
		    				$('#article_h4').html('예술감독 상세정보');
				      	});
				    	$("#article6").click(function(){
				      		$('#article_h4').empty();
		    				$('#article_h4').html('지도교사 상세정보');
				      	});
				      	$("#article2").click(function(){
				      		$('#article_h4').empty();
            				$('#article_h4').html('창악부단원 상세정보');
				      	});
				    	$("#article3").click(function(){
				      		$('#article_h4').empty();
            				$('#article_h4').html('기악부단원 상세정보');
				      	});
				    	$("#article4").click(function(){
				      		$('#article_h4').empty();
            				$('#article_h4').html('무용부단원 상세정보');
				      	});
				    	$("#article5").click(function(){
				      		$('#article_h4').empty();
            				$('#article_h4').html('사물부단원 상세정보');
				      	});
		      	</script>
		        </div>
		        <!--end tab-->
		        
		        <div class="inner">
		            <div class="tab_body" style="position:relative">		            
		        	<%--  	<c:if varStatus="status" test="${status.index==0}">
		            				 	<h4 style="margin-bottom: 0.5vw; display:none;" id="h4_article1">예술감독</h4>	   
		            				 		 <script>
					                	$('#h4_article2').css('display', 'inline');					     
					                </script> 
		            	 <c:if/>
		            	 <c:if varStatus="status" test="${status.index==1}">
		            	 	<h4 style="margin-bottom: 0.5vw;">창악부</h4>
		            	 <c:if/>
	 		             <c:if varStatus="status" test="${status.index==2}">
		            	 	<h4 style="margin-bottom: 0.5vw;">무용부</h4>
		            	 <c:if/>
		            	 <c:if varStatus="status" test="${status.index==3}">
		            	 	<h4 style="margin-bottom: 0.5vw;">기악부</h4>
		            	 <c:if/>
		            	 <c:if varStatus="status" test="${status.index==4}">
		            	 	<h4 style="margin-bottom: 0.5vw;">사물부</h4>
		            	 <c:if/> --%>
		            	
		            	 <!--<h3 style="position:relative; top:-65px; left:50%; width:200px; text-align:center; margin-left:-100px" id="article_h4">예술단원 상제정보</h3>-->
						<style>
						.list .detail {
							margin-bottom:25px;
						}
						.list .detail .inner .manager_button {
							width:100%;
							margin:10px auto;
							text-align:left;
						}
						.list .detail .inner .manager_button a {
							width: 100px;
							height: 30px;
							line-height: 28px;
							text-align: center;
							display: inline-block;
							background: #fff;
							color: #555;
							font-size: .9rem;
							cursor: pointer;
							border: 1px solid #666;
							border-radius:4px;
							transform: translateX(-50%);
							transition: all .2s;
							margin-left:20px;
						}
						.list .detail .inner .manager_button a:first-child {
							margin-left:55px;
						}
						</style>
		            	 <c:forEach begin="0" end="6" varStatus="status"> 
		            	<c:choose>
		            		<c:when test="${param.bbsId == 'BBSMSTR_000000000050'}">
			            		<c:choose>
			            			<c:when test="${status.index==0 }">
					   	            	<c:set var="dept" value="객원예술감독"/>
			            			</c:when>
			            			<c:when test="${status.index==1 }">
					   	            	<c:set var="dept" value="지도교사"/>
			            			</c:when>
			            			<c:when test="${status.index==2 }">
					   	            	<c:set var="dept" value="창악부"/>
			            			</c:when>
			            			<c:when test="${status.index==3 }">
					   	            	<c:set var="dept" value="기악부"/>
			            			</c:when>
			            			<c:when test="${status.index==4 }">
					   	            	<c:set var="dept" value="무용부"/>
			            			</c:when>
			            			<c:when test="${status.index==5 }">
					   	            	<c:set var="dept" value="사물부"/>
			            			</c:when>
			            		</c:choose>
		            		</c:when>
		            		<c:otherwise>
			            		<c:choose>
			            			<c:when test="${status.index==0 }">
					   	            	<c:set var="dept" value="예술감독"/>
			            			</c:when>
			            			<c:when test="${status.index==1 }">
					   	            	<c:set var="dept" value="창악부"/>
			            			</c:when>
			            			<c:when test="${status.index==2 }">
					   	            	<c:set var="dept" value="기악부"/>
			            			</c:when>
			            			<c:when test="${status.index==3 }">
					   	            	<c:set var="dept" value="무용부"/>
			            			</c:when>
			            			<c:when test="${status.index==4 }">
					   	            	<c:set var="dept" value="사물부"/>
			            			</c:when>
			            		</c:choose>
		            		</c:otherwise>
		            		</c:choose>
			                <div class="list">
								<h4 class="sound_only"><c:out value="${dept}"/></h4>
			   	                <c:forEach var="item" items="${resultList }" >
				   	                <c:if test="${item.empDept==dept }">
				   	                	<c:choose>
				   	                		<c:when test="${dept == '예술감독' or dept == '객원예술감독'}">
				   	                			<div class="con01 detail">
				                                    <div class="inner">
				                                        <div>
				                                            <div class="left">
				                                            	<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${item.atchFileId}"/>" alt="<c:out value="${item.empNm}"/>">
			                                            	</div>
				                                            <div class="right">
				                                                <dl>
				                                                    <dt>&nbsp<c:out value="${item.empPosi}"/></dt>
				                                                    <dd class="member_name"><c:out value="${item.empNm}"/></dd>
				                                                </dl>
				                                                <!--
				                                                <dl>
				                                                    <dt>한줄소개</dt>
				                                                    <dd>
				                                                    
				                                             			<c:out value="${item.empIntro}"/>
				                                                    </dd>
				                                                </dl>
				                                                -->
				                                                <dl>
				                                                    <dt>학력</dt>
				                                                    <dd>
				                                                    	<c:out value="${item.empEdu}" escapeXml="false"/>
				                                                    </dd>
				                                                </dl>
				                                                <dl>
				                                                    <dt>주요경력</dt>
				                                                    <dd>
				                                                    
				                                             			<c:out value="${item.empCareer}" escapeXml="false"/>
				                                                    </dd>
				                                                </dl>
				                                            </div>
						                                </div>
						                                <c:if test="${user.id == 'webmaster'}">
	                        								<div class="manager_button">
																<a href="<c:url value='/cop/bbs/updateArticleView.do' />?nttId=${item.nttId}&bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.update" />  <spring:message code="input.button" />"><spring:message code="button.update" /></a>
																<a href="<c:url value='/cop/bbs/deleteArticle.do' />?nttId=${item.nttId}&bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.delete" />  <spring:message code="input.button" />"><spring:message code="button.delete" /></a>
															</div>
														</c:if>
			                                        </div>
		                                    	</div>
<%-- 												<c:if test="${user.id == 'webmaster'}">
											        <div class="" style="margin-top: 30px;margin-left: 54px;">
														<span class="btn_b" style="float: left;">
															<a style="position: relative;" href="<c:url value='/cop/bbs/updateArticleView.do' />?nttId=${item.nttId}&bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.update" />  <spring:message code="input.button" />"><spring:message code="button.update" /></a>
														</span>
														
														<span class="btn_b" style="float: left;">
															<a style="position: relative;" href="<c:url value='/cop/bbs/deleteArticle.do' />?nttId=${item.nttId}&bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.delete" />  <spring:message code="input.button" />"><spring:message code="button.delete" /></a>
														</span>								
													</div>
													<br/><br/>
												</c:if>				                                
				                                </div> --%>
									            
				   	                		</c:when>
				   	                		<c:otherwise>		
				   	                				   	                			
				   	                			<div>
				   	                				<c:if test="${articleVO.bbsId == 'BBSMSTR_000000000049' or dept == '지도교사' or user.id == 'webmaster'}"> 	
							                        	<a href="/cop/bbs/selectArticleDetail.do?nttId=${item.nttId}&bbsId=${item.bbsId}">
						                        	</c:if>
							                            <img class="profileImg" src="/cmm/fms/getImage.do?atchFileId=${item.atchFileId}" alt="${item.empNm}">
							                            	<span class="peo_intro_name2">
							                            		<c:if test="${item.empPosi !='' && item.empPosi != null}">
							                            			${item.empPosi} 
							                            		</c:if>${item.empNm}
							                            	</span>
							                            <div class="<c:if test="${articleVO.bbsId == 'BBSMSTR_000000000049'}">over1</c:if>">
							                                <div class="fsd_p_box">
						                                		<!-- <p>한줄소개</p> -->
							                                    <p class="gear_sj3E"><c:out value='${item.empIntro }' /></p>
							                                    <hr/>
							                                </div>
							                            </div>
						                            <c:if test="${articleVO.bbsId == 'BBSMSTR_000000000049' or dept == '지도교사' or user.id == 'webmaster'}">
							                        	</a>
						                        	</c:if>
							                    </div>
				   	                		</c:otherwise>
				   	                	</c:choose>
				                    </c:if>
		   	                    </c:forEach>
			                </div>
		             </c:forEach>
			            <c:if test="${user.id == 'webmaster'}">
					        <div class="btn" style="margin-top: 30px;">
								<span class="btn_b">
									<a href="<c:url value='/cop/bbs/insertArticleView.do?bbsId=${boardMasterVO.bbsId}' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />">
										<spring:message code="button.create" />
									</a>
								</span>
							</div>
						</c:if>
		            </div>
		            <!--end tab_body-->
		        </div>
			</div>
		        <!--end inner-->
		    </div>
		    <!--end con01-->
		</div>
		<!--end contentWrap-->

	</div>
	 
	<!--end container-->
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>