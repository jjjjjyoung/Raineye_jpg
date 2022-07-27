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
        <h2>공 연</h2>
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
                    <input type="text" id="search" placeholder="검색어를 입력하세요" title="검색어 입력">

                    <button type="submit">검색</button>
                </form>
                <!--end search-->
            </div>
            <!--end inner-->
        </div>
        <!--end sub_top-->


        <!--공연 제목-->
        <h3 class="page_title tit2 tl">
            <div class="inner">'청춘 樂'</div>
        </h3>

        <div class="view_table2">
            <!--start con01-->
            <div class="con01">
                <div class="inner">
                    <div class="vw_head">
                        <div class="left">
                            <div class="vw_img">
                                <img src="/images/egovframework/com/jpg/poster2.jpg" alt="">
                            </div>
                        </div>
                        <div class="right">
                            <div class="title">
                                <span class="txtGray">전라남도립국악단 교육/체험 프로그램</span>
                                <strong>우리가락 우리춤 배우기 수강생 모집</strong>
                            </div>
                            <table>
                                <tr>
                                    <th>공연일시</th>
                                    <td>2018.10.26.(금) 19:30 ~ 2018.10.27.(토) 17:00</td>
                                </tr>
                                <tr>
                                    <th>공연장소</th>
                                    <td>남도소리울림터 공연장</td>
                                </tr>
                                <tr>
                                    <th>주최</th>
                                    <td>전라남도 문화관광재단</td>
                                    <td>전라남도 도립국악단</td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <th>관람연력</th>
                                    <td>전연력</td>
                                </tr>
                                <tr>
                                    <th>소요시간</th>
                                    <td>2:35</td>
                                </tr>
                                <tr class="posR">
                                    <th>관람료</th>
                                    <td>22(금) 전석무료</td>
                                    <td>23(토) 일반 10,000원</td>
                                    <td class="sale">
                                        <button href="#">할인정보</button>
                                        <div class="sale_pop">
                                          <h2>할인정보</h2>
                                          <p><span class="txtPink2">30%</span>대학생 및 단체(10인 이상)</p>
                                          <p><span class="txtPink2">50%</span>학생 및 유료회원(남도2매, 풍류4매)</p>
                                          <p>무료 경로·미취학아동(본인)</p>
                                          <p>국가유공자·장애인(동반1인)</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>문의전화</th>
                                    <td><span>전남도립국악단</span><span>061-285-6928</span></td>
                                </tr>
                                <tr class="share">
                                    <th>공유하기</th>
                                    <td><a href="#" class="kakao" title="새창 열림" >카카오톡</a><a href="#" class="insta">인스타그램</a><a href="#" class="blog" title="새창 열림">네이버블로그</a></td>
                                </tr>
                            </table>
                        </div>
                        <div class="btn_area5">
                            <a href="#">예매하기</a>
                        </div>
                    </div>
                    <!--end vw_head-->

                    <div class="vw_con">

                        <table>
                            <tr>
                                <th>교육소개</th>
                                <td>
                                    재단법인 전라남도문화관광재단 공고 제2019-86호
                                    <br>
                                    <br>
                                    전라남도립국악단
                                    <br>
                                    <br>
                                    직원(육아휴직 대체인력) 채용 공고
                                    <br>
                                    <br>
                                    <br>
                                    (재)전라남도문화관광재단(전라남도립국악단)에서는 다음과 같이 직원을 공개모집하오니 참신하고 유능한 인재의 많은 응모 바랍니다.
                                    <br>
                                    <br>
                                    <br>
                                    2019년 9월 19일
                                    <br>
                                    <br>
                                    <br>
                                    (재)전라남도문화관광재단 대표이사
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--end vw_con-->

                    <div class="btn_area4">
                        <div class="list"><a href="/publeView.do?id=showMonthList">목록보기</a></div>
                    </div>
                </div>
                <!--end inner-->
            </div>
            <!--end con01-->
        </div>
        <!--end bo_v bo_v_ntc-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>