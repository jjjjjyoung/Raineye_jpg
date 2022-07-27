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

    <div id="container" id="go_direct">
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

					<form method="post" class="schForm"
						action="/cop/bbs/selectYoutubeList.do" name="BoardVO">
						<div class="select_box">
							<select name="searchCnd" title="분류">
								<option value="1">제목</option>
								<!--                         	<option value="2">내용</option>
                        	<option value="3">제목+내용</option> -->
							</select>
						</div>
						<input type="text" id="searchWrd" name="searchWrd"
							placeholder="공연명을 입력하세요" value="${articleVO.searchWrd }"
							title="공연명 입력"> <input class="bbsIdVal" name="bbsId"
							type="hidden" value="<c:out value="${boardMasterVO.bbsId }"/>">
						<c:choose>
							<c:when test="${kid == 'Y' }">
								<input class="skin" name="type" type="hidden" value='k' />
							</c:when>
							<c:otherwise>
								<input class="skin" name="type" type="hidden" value='' />
							</c:otherwise>
						</c:choose>
						<button type="submit">검색</button>
					</form>

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

					<!--end search-->

					<!--                 <form method="post" class="schForm">
                    <input type="text" id="search" placeholder="공연명을 입력하세요">

                    <button type="submit">검색</button>
                </form> -->
					<!--end search-->

			</div>
			<!--end inner-->
        </div>
        <!--end sub_top-->

        <!--start content-->
        <div class="contentWrap">

	        <h3 class="page_title">갤러리</h3>
	
	        <!--start con01-->
	        <div class="con01">
	            <div class="inner">
	            <div class="inner_under_div">
	                <div class="gall_hd">
	                    <div class="gall_links">
	                    	<c:choose>
								<c:when test="${kid == 'Y' }">
									  <h3><a href="<c:url value="/cop/bbs/selectArticleList.do?bbsId=${boardMasterVO.bbsId }&type=k"/>">사진보기</a></h3>
	                       			  <h3><a class="on" href="<c:url value="/cop/bbs/selectYoutubeList.do?bbsId=${boardMasterVO.bbsId }&type=k"/>">영상보기</a></h3>
								</c:when>
								<c:otherwise>
									<h3><a href="<c:url value="/cop/bbs/selectArticleList.do?bbsId=${boardMasterVO.bbsId }"/>">사진보기</a></h3>
	                       			<h3><a class="on" href="<c:url value="/cop/bbs/selectYoutubeList.do?bbsId=${boardMasterVO.bbsId }"/>">영상보기</a></h3>
								</c:otherwise>
							</c:choose>
	                    </div>
	                </div>
	                <div class="gallery" style="position: relative;">
	                	<c:if test="${user.id =='webmaster' }">
							<a href="<c:url value="/cop/bbs/insertYoutubeView.do?bbsId=${boardMasterVO.bbsId }"/>">등록</a>
						</c:if>
	                	
	                    <div class="slider-for merge_burfitz">
	                    	<c:forEach end="0" items="${resultList }" var="result">
	                        	<div id="youplayer" class="positive_heig masiti_boldive">
	                        		<iframe title="유튜브 동영상 플레이"  width="100%" height="700" src="https://www.youtube.com/embed/${result.youtube }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	                        	</div>
	
	                    	</c:forEach>
	                    </div>
	                    <div class="gall_list">
	                        <div class="slider-nav" style="position: relative;">
	                    	<c:forEach items="${resultList }" var="result">
		                            <div><img class="img_youtube" src="http://img.youtube.com/vi/${result.youtube }/0.jpg" alt="${result.nttSj }" data-img="${result.youtube }"></img>
		                            <p>${result.nttSj }</p>
		                        	<c:if test="${user.id =='webmaster' }">
										<a href="<c:url value="/cop/bbs/deleteArticle.do?nttId=${result.nttId }&bbsId=${boardMasterVO.bbsId }"/>">삭제</a>
				 		            	<a href="<c:url value="/cop/bbs/updateYoutubeView.do?nttId=${result.nttId }&bbsId=${boardMasterVO.bbsId }"/>">수정</a>
				 		            </c:if>
		                            </div>
	                    	</c:forEach>
	                        </div>
	                    </div> 
	                    <!--end gall_nav-->
	
	                </div>
	                <!--end gallery-->
	            </div>
	            </div>
	            <!--end inner-->
	        </div>
	        <!--end con01-->
	
	        <script>
	        
		       	$(document).ready(function(){
		           	$('.slick-next').click(function(){
			           	var slick_number = $('.slider-nav').slick('slickCurrentSlide');	
			           	var slick_youtube_key = $( '.slick-center div div img' ).attr("src").substring(26,37);;
			           	console.log(slick_number);
			           	$('#youplayer').html('<iframe title="유튜브 동영상 플레이"  width="100%" height="700" src="https://www.youtube.com/embed/'+slick_youtube_key+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			           	$('.slick-slide').css("opacity", "1");
		           	});	 
		           	
		           	$('.slick-prev').click(function(){
			           	var slick_number = $('.slider-nav').slick('slickCurrentSlide');	
			           	console.log(slick_number);
			           	var slick_youtube_key = $( '.slick-center div div img' ).attr("src").substring(26,37);;
			           	$('#youplayer').html('<iframe title="유튜브 동영상 플레이"  width="100%" height="700" src="https://www.youtube.com/embed/'+slick_youtube_key+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			           	$('.slick-slide').css("opacity", "1");
		           	});	  
		           	
		        	$('.img_youtube').click(function(){
		        		var key =$(this).attr("src").substring(26,37);
		        		//alert($(this).data("img"));
		        		$('#youplayer').html('<iframe title="유튜브 동영상 플레이"  width="100%" height="700" src="https://www.youtube.com/embed/'+$(this).data("img")+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
		        		$('.slick-slide').css("opacity", "1");
		        	});
		        	
		        });	        
	        	
	        	 $('.slider-for').slick({
	                 slidesToShow: 1,
	                 slidesToScroll: 1,
	                 fade: true,
	                 arrows: false,
	                 asNavFor: '.slider-nav'
	             });
	             
	             $('.slider-nav').slick({
	                 slidesToShow: 5,
	                 slidesToScroll: 1,
	                 asNavFor: '.slider-for',
	                 dots: false,
	                 centerMode: true,
	                 focusOnSelect: true,
	                 arrows: true, 
	                 /* prevArrow:$('.prev'),
	                 nextArrow:$('.next'), */
	                 responsive: [
	                     {
	                       breakpoint: 1200,
	                       settings: {
	                         slidesToShow: 4,
	                         slidesToScroll: 1
	                       }
	                     },
	                     {
	                         breakpoint: 768,
	                         settings: {
	                           slidesToShow: 3,
	                           slidesToScroll: 1
	                         }
	                       },
	                       {
	                           breakpoint: 414,
	                           settings: {
	                             slidesToShow: 2,
	                             slidesToScroll: 1
	                           }
	                         }
	                   ]
	             });
	
	        </script>
		</div>
		<!--end contentWrap-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>