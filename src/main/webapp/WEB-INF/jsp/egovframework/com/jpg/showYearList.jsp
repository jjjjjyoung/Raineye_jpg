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

        <h3 class="page_title">연간공연일정</h3>

        <!--start con01-->
        <div class="con01">
            <div class="link_tab">
                <div class="inner">
                    <div><a href="/publeView.do?id=showMonthList">월간공연일정</a></div>
                    <div><a href="/publeView.do?id=showDayList">일간공연일정</a></div>
                    <div class="selected"><a href="/publeView.do?id=showYearList">연간공연일정</a></div>
                </div>
            </div>
            <div class="inner">
                <div class="year">
                    <div class="year_hd">
                        <a href="#" class="prev">이전 해</a>
                        <span>2019</span>
                        <a href="#" class="next">다음 해</a>
                    </div>
                    <!--end year_hd-->
                    
                    <div class="year_tb">
                        <ul>
                            <li class="mon">월</li>
                            <li class="div">구분</li>
                            <li class="name">공연명</li>
                            <li class="day">공연일자</li>
                        </ul>
                        <div class="list">
                            <div class="left">
                                <div>
                                    <div class="posA">
                                        <span>1월</span>
                                        <small>january</small>
                                    </div>
                                </div>
                            </div>
                            <ul class="right">
                                <li>
                                    <div class="div txtBlue">토요공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtPink2">정기공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtBlue">토요공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtGreen">기획공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!--end list 1-->
                        <div class="list">
                            <div class="left">
                                <div>
                                    <div class="posA">
                                        <span>2월</span>
                                        <small>Feburary</small>
                                    </div>
                                </div>
                            </div>
                            <ul class="right">
                                <li>
                                    <div class="div txtBlue">토요공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtPink2">정기공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtBlue">토요공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtGreen">기획공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!--end list 2-->
                        <div class="list">
                            <div class="left">
                                <div>
                                    <div class="posA">
                                        <span>3월</span>
                                        <small>March</small>
                                    </div>
                                </div>
                            </div>
                            <ul class="right">
                                <li>
                                    <div class="div txtBlue">토요공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtPink2">정기공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtBlue">토요공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                                <li>
                                    <div class="div txtGreen">기획공연</div>
                                    <div class="name"><a href="/publeView.do?id=showView">희엉의 희망일기</a></div>
                                    <div class="day txtSky">
                                        2018.10.26.(금) 19:30 ~<br> 2018.10.27.(토) 17:00
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!--end list 3-->
                    </div>
                    <!--end year_tb-->
                </div>
                <!--end year-->
            </div>
            <!--end inner-->
        </div>
        <!--end con01-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>