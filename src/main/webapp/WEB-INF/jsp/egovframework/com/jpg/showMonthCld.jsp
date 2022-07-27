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
                    <div class="selected"><a href="/publeView.do?id=showMonthList">월간공연일정</a></div>
                    <div><a href="/publeView.do?id=showDayList">일간공연일정</a></div>
                    <div><a href="/publeView.do?id=showYearList">연간공연일정</a></div>
                </div>
            </div>
            <div class="inner">
                <div class="day month">
                    <div class="day_hd">
                        <h4><span>2019. 9</span></h4>
                        <div class="sub2-1_link">
                            <a href="/publeView.do?id=showMonthList">리스트보기</a>
                            <a class="on" href="/publeView.do?id=showMonthCld">달력보기</a>
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
                <table class="calender_t">
                    <thead>
                        <tr>
                            <th class="sunday">일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th class="satday">토</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="not_day"></td>
                            <td class="not_day"></td>
                            <td class="not_day"></td>
                            <td class="not_day"></td>
                            <td class="not_day"></td>
                            <td class="start_day">
                                <p>1 </p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p class="satday">
                                    2
                                </p>
                                <div class="schedule_inner">
                                    <ul>
                                        <li><a href="/publeView.do?id=showView"><span class="bedge pink">정기</span>목민심서</a></li>
                                        <li><a href="/publeView.do?id=showView"><span class="bedge blue">토요</span>목민심서</a></li>
                                        <li><a href="/publeView.do?id=showView"><span class="bedge green">기획</span>목민심서</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="sunday">3</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>4</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>5</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>6</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>7</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>8</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p class="satday">9</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="sunday">10</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>11</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>12</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>13</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>14</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>15</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p class="satday">16</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="sunday">17</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>18</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>19</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>20</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>21</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>22</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p class="satday">23</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="sunday">24</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>25</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>26</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>27</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>28</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p>29</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                            <td>
                                <p class="satday">30</p>
                                <div class="schedule_inner">
                                </div>
                            </td>
                        </tr>
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