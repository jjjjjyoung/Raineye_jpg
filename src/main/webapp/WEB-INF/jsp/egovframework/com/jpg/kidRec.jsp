<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/kidMenu.do"/>

<script>
	$(function(){
		$('.kid_mn3').addClass('on');		
	});
</script>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<link rel="stylesheet" href="/css/egovframework/com/jpg/style2.css">

<div id="subWrap" class="sub05 kid_sub">
	<div class="sub_visual">
		<h2>모집안내</h2>
	</div>

     <div id="container">
         <div class="sub_top">
             <div class="inner">
                 <div class="page_navi">
					<div class="first_mn">
						<strong class="mn_tit" tabindex="0">어린이국악단 </strong>
						<div class="mn_2nd">
							<a href="/contents.do?id=greetings">소개 </a> 
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055">공연 </a> 
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000051">교육 / 체험 </a> 
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000061">알림 / 참여 </a> 
							<a href="/kidHome.do">어린이국악단 </a> 
						</div>
					</div>   	
					<!--end first_mn 대메뉴-->
					<div class="second_mn">
						<strong class="mn_tit" tabindex="0">모집안내</strong>
						<div class="mn_2nd">
							<a href="/contents.do?id=kidinfo&amp;kidId=Y&amp;type=k">소개 </a>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000050&amp;type=k">어린이단원 소개 </a>
							<a href="/publeView.do?id=kidRec&amp;type=k">모집안내 </a>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000048&amp;type=k">갤러리 </a>
							<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000061&amp;type=k">공지사항 </a>
						</div>
					</div>
					<!--end second_mn 중메뉴-->
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
                     <input type="text" id="search" placeholder="검색어를 입력하세요" title="검색어 입력" >

                     <button type="submit">검색</button>
                 </form>
                 -->
                 
                 
                 
                 <!--end search-->
             </div>
             <!--end inner-->
         </div>
         <!--end sub_top-->


        <!--start content-->
        <div class="contentWrap">

	         <div class="page_title">모집안내</div>
	
	         <div class="view_table2">
	             <!--start con01-->
	             <div class="con01">
	                 <div class="inner">
	                     <div class="overH kid_hm_ze">
		                     <div class="left show">
				<!--
		                         <img class="bsc" src="/images/egovframework/com/jpg/who_hide.jpg" alt="WHO's NEXT? 전남도립어린이국악단과 함께 다음 무대의 주인공이 되어보세요!">
		                         <img class="man" src="/images/egovframework/com/jpg/who.jpg" alt="WHO's NEXT? 전남도립어린이국악단과 함께 다음 무대의 주인공이 되어보세요!">
		                         <img class="mb" src="/images/egovframework/com/jpg/who_hide2.jpg" alt="WHO's NEXT? 전남도립어린이국악단과 함께 다음 무대의 주인공이 되어보세요!">
				-->
								<img src="/images/egovframework/com/jpg/kidz_jinp_pc.jpg" alt="전남도립어린이국악단과 함께 다음 무대의 주인공이 되어보세요!" class="kids_join_pc_m">
		                        <img src="/images/egovframework/com/jpg/kidz_jinp_mob.jpg" alt="전남도립어린이국악단과 함께 다음 무대의 주인공이 되어보세요!" class="kids_join_mob_m">



		                         <button class="show_btn wht_t2bs" href="#">상세보기</button>
		                     </div>
		                     <!--end left-->
				<!----
		                     <div class="right kid_sub3_2">
		                         <div class="title">
		                             <strong>어린이국악단 모집안내</strong>
		                         </div>
		                         <table>
		                          	<caption style="visibility: visible; height: 0;">어린이국악단 모집안내</caption>
		                             <tr>
		                                 <th>단원모집</th>
		                                 <td>매년 상반기</td>
		                             </tr>
		                             <tr>
		                                 <th>모집분야</th>
		                                 <td>창악부 무용부 기악부 사물부</td>
		                             </tr>
		                             <tr>
		                                 <th>활동기간</th>
		                                 <td>1년</td>
		                             </tr>
		                             <tr>
		                                 <th>활동내용</th>
		                                 <td>주말교육 및 합동연습 참여</td>
		                                 <td>정기공연 및 각종 초청공연 참여</td>
		                             </tr>
		                         </table>
		                         <span class="line"></span>
		                         <table>
		                         	<caption style="visibility: visible; height: 0;">관련문의</caption>
		                             <tr>
		                                 <th>관련문의</th>
		                                 <td>061)285-6928</td>
		                             </tr>
		                         </table>
		                     </div>
				---->
		                     <!--end right-->
	                     </div>
	                     <!--end overH-->
	                 </div>
	                 <!--end inner-->
	             </div>
	             <!--end con01-->
	         </div>
	         <!--end view_table2-->
		</div>
		<!--end contentWrap-->
     </div>
     <!--end container-->
 </div>
 <!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>