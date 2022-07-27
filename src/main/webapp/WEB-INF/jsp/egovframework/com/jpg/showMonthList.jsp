<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="sub02">
    <div class="sub_visual">
        <h2>공&nbsp;연</h2>
    </div>

    <div id="container">
        <div class="sub_top">
            <div class="inner">
                <div class="page_navi">
                    <div class="first_mn">
                        <strong class="mn_tit" tabindex="0">소개</strong>
                        <div class="mn_2nd">
                            <a href="/contents.do?id=greetings">소개</a>
                            <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055">공연</a>
                            <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000051">교육/체험</a>
                            <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000041">알림/참여</a>
                            <a href="/kidHome.do">어린이국악단</a>
                        </div>
                    </div>
                    <!--end first_mn 대메뉴-->
                    <div class="second_mn">
                        <strong class="mn_tit" tabindex="0">인사말</strong>
                        <div class="mn_2nd">
                            <a href="/contents.do?id=greetings">인사말</a>
                            <a href="/contents.do?id=history">연혁</a>
                            <a href="/contents.do?id=organization">조직 및 업무</a>
                            <a href="/publeView.do?id=skinProfileList">예술단원 소개</a>
                            <a href="/contents.do?id=location">오시는 길</a>
                        </div>
                    </div>
                    <!--end second_mn 중메뉴-->
                </div>
                <!--end sub_navi-->
                
                <form method="post" class="schForm">
                    <input type="text" id="search" placeholder="공연명을 입력하세요" title="공연명 입력">

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

        <h3 class="page_title">월간공연일정</h3>

        <!--start con01-->
        <div class="con01">
            <div class="link_tab">
                <div class="inner">                    
                    <div class="selected"><a href="/publeView.do?id=showMonthList" title="현재페이지">월간공연일정</a></div>
                    <div><a href="/publeView.do?id=showDayList">일간공연일정</a></div>
                    <div><a href="/publeView.do?id=showYearList">연간공연일정</a></div>
                </div>
            </div>
            <div class="inner">
                <div class="day month">
                    <div class="day_hd">
                        <h4><span>2019. 9</span></h4>
                        <div class="sub2-1_link">
                        	<a class="on" href="/publeView.do?id=showMonthList">리스트보기</a>
                            <a href="/publeView.do?id=showMonthCld">달력보기</a>
                        </div>
                        <div>
                            <a href="#" class="prev">이전</a>
                            <ul>
                                <li><a href="#">1월</a></li>
                                <li><a href="#">2월</a></li>
                                <li><a href="#">3월</a></li>
                                <li><a href="#">4월</a></li>
                                <li><a href="#">5월</a></li>
                                <li><a href="#">6월</a></li>
                                <li><a href="#">7월</a></li>
                                <li><a href="#">8월</a></li>
                                <li class="on"><a href="#">9월</a></li>
                                <li><a href="#">10월</a></li>
                                <li><a href="#">11월</a></li>
                                <li><a href="#">12월</a></li>
                            </ul>
                            <a href="#" class="next">다음</a>
                        </div>
                    </div>
                    <div class="mon_tb">

                                <div class="list">
                                    <div class="mon_tb_list_item">
                                        <div class="left"><img src="/images/egovframework/com/jpg/poster2.jpg" alt=""></div>
                                        <div class="right">
                                            <ul>
                                                <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                <li class="bold">흐엉의 희망일기</li>
                                                <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                            </ul>
                                            <div class="btn_area2">
                                                <a href="/publeView.do?id=showView" class="dt_btn">상세보기</a>
                                                <a href="#" class="tk_link">예매하기</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end right-->
                                </div>
                                <!--end list 1-->

                                <div class="list">
                                    <div class="mon_tb_list_item">
                                        <div class="left"><img src="/images/egovframework/com/jpg/poster3.jpg" alt=""></div>
                                        <div class="right">
                                            <ul>
                                                <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                <li class="bold">흐엉의 희망일기</li>
                                                <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                            </ul>
                                            <div class="btn_area2">
                                                <a href="/publeView.do?id=showView" class="dt_btn">상세보기</a>
                                                <a href="#" class="tk_link">예매하기</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end right-->
                                </div>
                                <!--end list 2-->

                                 <div class="list">
                                     <div class="mon_tb_list_item">
                                         <div class="left"><img src="/images/egovframework/com/jpg/poster.jpg" alt=""></div>
                                         <div class="right">
                                             <ul>
                                                 <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                 <li class="bold">흐엉의 희망일기</li>
                                                 <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                 <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                             </ul>
                                             <div class="btn_area2">
                                                 <a href="/publeView.do?id=showView" class="dt_btn">상세보기</a>
                                                 <a href="#" class="tk_link">예매하기</a>
                                             </div>
                                         </div>
                                     </div>
                                     <!--end right-->
                                 </div>
                                <!--end list 3-->

                                 <div class="list">
                                     <div class="mon_tb_list_item">
                                         <div class="left"><img src="/images/egovframework/com/jpg/poster3.jpg" alt=""></div>
                                         <div class="right">
                                             <ul>
                                                 <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                 <li class="bold">흐엉의 희망일기</li>
                                                 <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                 <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                             </ul>
                                             <div class="btn_area2">
                                                 <a href="/publeView.do?id=showView" class="dt_btn">상세보기</a>
                                                 <a href="#" class="tk_link">예매하기</a>
                                             </div>
                                         </div>
                                     </div>
                                     <!--end right-->
                                 </div>
                                <!--end list 4-->

                            </div>
                </div>
            </div>
            <!--end inner-->
        </div>
        <!--end con01-->

        <div class="con02">
                    <div class="inner">
                        <span class="endlist_tit">지난 공연 리스트</span>
                        <div class="day month">
                            <div class="mon_tb">

                                <div class="list">
                                    <div class="mon_tb_list_item">
                                        <div class="left"><img src="/images/egovframework/com/jpg/poster3.jpg" alt=""></div>
                                        <div class="right">
                                            <ul>
                                                <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                <li class="bold">흐엉의 희망일기</li>
                                                <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                            </ul>
                                            <div class="btn_area2">
                                                <a href="#" class="end">종료됨</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end right-->
                                </div>
                                <!--end list 1-->

                                <div class="list">
                                    <div class="mon_tb_list_item">
                                        <div class="left"><img src="/images/egovframework/com/jpg/poster3.jpg" alt=""></div>
                                        <div class="right">
                                            <ul>
                                                <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                <li class="bold">흐엉의 희망일기</li>
                                                <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                            </ul>
                                            <div class="btn_area2">
                                                <a href="#" class="end">종료됨</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end right-->
                                </div>
                                <!--end list 2-->

                                <div class="list">
                                    <div class="mon_tb_list_item">
                                        <div class="left"><img src="/images/egovframework/com/jpg/poster3.jpg" alt=""></div>
                                        <div class="right">
                                            <ul>
                                                <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                <li class="bold">흐엉의 희망일기</li>
                                                <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                            </ul>
                                            <div class="btn_area2">
                                                <a href="#" class="end">종료됨</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end right-->
                                </div>
                                <!--end list 3-->

                                <div class="list">
                                    <div class="mon_tb_list_item">
                                        <div class="left"><img src="/images/egovframework/com/jpg/poster3.jpg" alt=""></div>
                                        <div class="right">
                                            <ul>
                                                <li class="txtGray"><span class="bedge pink bedge2">정기</span>전남도립국악단 특별순회공연 시대창극</li>
                                                <li class="bold">흐엉의 희망일기</li>
                                                <li class="day txtGray">2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00</li>
                                                <li class="where txtGray txtBold">남도소리울림터 공연장</li>
                                            </ul>
                                            <div class="btn_area2">
                                                <a href="#" class="end">종료됨</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end right-->
                                </div>
                                <!--end list 4-->

                            </div>
                        </div>
                    </div>
                    <!--end inner-->
                </div>
        <!--end con02-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>