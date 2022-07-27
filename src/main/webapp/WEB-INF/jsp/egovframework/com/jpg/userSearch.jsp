<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

    <style>
        
        #subWrap #container { padding-bottom: 0; height: auto; min-height: auto;}
        
        /*style.css 맨아래쪽에 추가해주세요*/
        .two-line{ overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; width: 96%; }
        
        .theme-key-color {color:#a38c47 !important;}
        .theme-sub-color {color:#5bb7dc !important;}
        .theme-key-bg-color {background-color:#a38c47 !important;}
        .theme-sub-bg-color {background-color:#5bb7dc !important;}
        .theme-key-border-color {border-color:#a38c47 !important;}
        .theme-sub-border-color {border-color:#5bb7dc !important;}
        
        .total_search { background: #ebebeb;}
        .total_search #container { margin-bottom: 0 !important;}
        .total_search + .footer { margin-top: 0 !important;}
        /*검색결과*/
        div.search-result-wrap { background: #fff; padding-bottom: 8%;}
        div.search-result-wrap div.search-form-wrap {padding: 5% 0;}
        div.search-result-wrap div.search-form-wrap form { max-width: 700px; width: 100%; margin: auto;}
        div.search-result-wrap div.search-form-wrap input[type=text] {width: calc(100% - 89px); height: 40px; line-height: 40px; padding-left: 10px; font-size:1rem; color:#888; font-weight:bold; border:1px solid #d2d2d2; display: inline-block; margin-top: -3px;}
        div.search-result-wrap div.search-form-wrap div.btn-common-arrow-hor { display: inline-block; height: 40px; line-height: 40px; background-color:#404040; width:75px; text-align: center; color: #fff; font-size: .9rem; margin-left: 5px;}

        /* 검색 페이지 직원검색 결과 */
        div.search-result-member { position:relative; padding:30px 20px 25px; margin-bottom:30px; border-top:1px solid #f3f3f3; border-bottom:1px solid #f3f3f3; background:#f9f9f9;  }
        div.search-result-member div.total-reault { margin-bottom:13px; }
        div.search-result-member div.total-reault strong { display:block; font-size:14px; }
        div.search-result-member div.total-reault a.btn-animate.btn-common-arrow-hor { position:absolute; right:15px; bottom:25px; }
        div.search-result-member ul { padding:0; margin:0; list-style-type:none; }
        div.search-result-member ul li { margin-top:5px; font-size: .9rem; }
        div.search-result-member ul li::before { content: '·'; font-size: 14px; color: #666; display: inline-block; width: 14px;}
        div.search-result-member ul li:first-child { margin-top:0; }
        div.search-result-member div.button-area { margin-top:15px; text-align:right; }
        div.search-result-member img { width:16px; margin-left:5px;}


        div.search-result-wrap div.result-view-wrap {  padding:30px 0 20px 0;border-bottom:1px solid #f3f3f3;}
        div.search-result-wrap div.result-view-wrap div.view-title {font-size:.95rem; padding:0 20px 10px 20px; font-weight:bold;}
        div.search-result-wrap div.result-view-wrap div.view-title a {text-decoration:none;color:#555;}/*color:#d91400;*/
        div.search-result-wrap div.result-view-wrap div.view-title a strong {}/*color:#d91400;*/
        div.search-result-wrap div.result-view-wrap div.date {color:#888;padding:0 20px 10px 20px; font-size: .85rem;}
        div.search-result-wrap div.result-view-wrap div.result_txt {padding:0 20px; font-size: .9rem;}
        div.search-result-wrap div.result-view-wrap div.result_txt a {text-decoration:none;color:#555;}
        div.search-result-wrap div.result-view-wrap.first {padding-top:0;}
        div.result-view-wrap.has-thumb { position:relative; zoom:1; }
        div.result-view-wrap.has-thumb:after { content:''; clear:both; display:block; overflow:hidden; height:0; font-size:0; line-height:0; }

        div.search-result-wrap div.result-view-wrap.has-thumb div.thumbnail { float:left; width:230px; padding-left:20px; }
        div.search-result-wrap div.result-view-wrap.has-thumb div.right_group { float: left; width: calc(100% - 230px); }
        /*div.search-result-wrap div.result-view-wrap.has-thumb div.program-info { float:left; width:475px; }*/
        /*div.search-result-wrap div.result-view-wrap.has-thumb div.view-title { float:right; width:435px; }
        div.search-result-wrap div.result-view-wrap.has-thumb div.date { float:right; width:435px; }
        div.search-result-wrap div.result-view-wrap.has-thumb div.content { float:right; width:435px; }*/
        
        /*더보기버튼*/
        div.search-result-member div.button-area { margin-top:15px; text-align:right; }
        a.btn-common-arrow-hor {position:relative; text-decoration:none; margin:0 5px 0 0; width: 60px; text-align: center; height:30px; line-height: 30px; color:#fff;font-weight:normal;font-size:14px;background:#8f8f8f; display:inline-block; transition: all .2s;}
        a.btn-common-arrow-hor:hover {background: rgb(163, 140, 71);}



        div.navigation { clear:both; text-align: center; margin-top:20px; }
        div.navigation ol.wp-paginate li { list-style-type: none; display:inline; padding:0;}
        div.navigation ol.wp-paginate li *{ color:#333;padding:4px 10px; text-decoration: none; }
        div.navigation ol.wp-paginate li .title { display: none; }
        div.navigation ol.wp-paginate li .prev,
        div.navigation ol.wp-paginate li .next { font-size: 16px; }
        div.navigation ol.wp-paginate li .current { font-weight:bold; color:#fff; }
        /* 게시물 리스트 페이지 네이션 */
        div.navigation ol.wp-paginate li .current {background:#a38c47;}

        
        @media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
            .two-line { display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical; height:40px; line-height:20px; overflow:hidden; text-overflow:ellipsis; width: 96%; position: relative;}
        }
        
    </style>
</head>
        
        <div id="subWrap" class="total_search sub05">
            <div class="sub_visual" >
                <h2>통합검색</h2></div>
            <div id="container">
                <div class="inner">
                    <div class="schWrap">
                        <div class="archive-content">
                            <div class="search-result-wrap">
                                <div class="search-form-wrap">
                                    <form method="post" name="userSearchVO" action="/search.do">
                                        <label style="display: none;" for="content-search"></label>
                                        <input id="content-search" type="text" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword }'/>">
                                        <div class="btn-common-arrow-hor btn-animate" data-type="arrow-hor" onclick="jQuery(this.parentNode).trigger('submit');" style="background-color: rgb(64, 64, 64);"> 검색</div>
                                    </form>
                                    <form id="subForm" name="BoardVO" method="post" action="/cop/bbs/selectArticleDetail.do" style="display: hidden">
				                		<input class="nttIdVal" name="nttId" type="hidden" value="">
									    <input class="bbsIdVal" name="bbsId" type="hidden" value="">
									    <input class="pageIndexVal" name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex }'/>"/>
									    <input class="skinVal" name="bbsTyCode" type="hidden" value="SKIN01"/>
									    <input class="skinVal" name="skin" type="hidden" value="SKIN01"/>
				                	</form>
                                </div>
<!--                                 <div class="search-result-member">
                                    <div class="total-reault"> <strong class="theme-key-color">직원검색 결과: 13건</strong> </div>
                                    <ul>
                                        <li><span class="name">정성희</span><span class="blongs">(실학박물관 학예팀)</span> <span class="contact">031-579-6014 <img class="organization-user-email" src="https://silhak.ggcf.kr/wp-content/themes/ggcf-default/images/common/btn_email.gif" title="이메일 보이기" alt="이메일 보이기" data-name="정성희" data-uid="933" style="cursor: pointer;"></span></li>
                                        <li><span class="name">방문식</span><span class="blongs">(실학박물관 학예팀)</span> <span class="contact">031-579-6011 <img class="organization-user-email" src="https://silhak.ggcf.kr/wp-content/themes/ggcf-default/images/common/btn_email.gif" title="이메일 보이기" alt="이메일 보이기" data-name="방문식" data-uid="934" style="cursor: pointer;"></span></li>
                                        <li><span class="name">이성연</span><span class="blongs">(실학박물관 학예팀)</span> <span class="contact">031-579-6015 <img class="organization-user-email" src="https://silhak.ggcf.kr/wp-content/themes/ggcf-default/images/common/btn_email.gif" title="이메일 보이기" alt="이메일 보이기" data-name="이성연" data-uid="1701" style="cursor: pointer;"></span></li>
                                        <li><span class="name">정춘옥</span><span class="blongs">(실학박물관 학예팀)</span> <span class="contact">031-579-6026 <img class="organization-user-email" src="https://silhak.ggcf.kr/wp-content/themes/ggcf-default/images/common/btn_email.gif" title="이메일 보이기" alt="이메일 보이기" data-name="정춘옥" data-uid="1492" style="cursor: pointer;"></span></li>
                                        <li><span class="name">김홍기</span><span class="blongs">(실학박물관 행정팀)</span> <span class="contact">031-579-6030 <img class="organization-user-email" src="https://silhak.ggcf.kr/wp-content/themes/ggcf-default/images/common/btn_email.gif" title="이메일 보이기" alt="이메일 보이기" data-name="김홍기" data-uid="1611" style="cursor: pointer;"></span></li>
                                    </ul>
                                    <div class="button-area"> <a class="btn-animate btn-common-arrow-hor" data-type="arrow-hor" href="">더보기</a> </div>

                                </div> -->
<!--                                 <div class="result-view-wrap has-thumb first">
                                    <div class="thumbnail">
                                        <a href="https://silhak.ggcf.kr/archives/exhibit/calligraphy"><img src="https://silhak.ggcf.kr/wp-content/uploads/sites/9/2017/12/꿈이즈커밍쑨_전시_홍보포스터-300x495.jpg" width="230" alt="2017 실학예술소풍 손글씨 전시회 《꿈 이즈 커밍 쑨》"></a>
                                    </div>
                                    <div class="right_group">
                                        <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/exhibit/calligraphy">2017 실학예술소풍 손글씨 <strong class="theme-key-color">전시</strong>회 《꿈 이즈 커밍 쑨》</a> </div>
                                        <div class="date"> 2017.12.06 </div>
                                        <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/exhibit/calligraphy">2017년 학교연계프로그램 실학예술소풍은 실학 속의 회화를 배워보고, 현대의 실용미술 중 ‘캘리그라피 Calligraphy, 손글씨)를 체험하는 프로그램입니다. 1년동안 20개학교, 700여명의 학생들이 참여하였는데 그중 140여점의 작품을 선정하여 <strong>전시</strong>하게 되었습니다. 수업시간에 청소년들에게 자신의 꿈을 손글씨로 자유롭게 써보라는 과제를 제시하였습니다. 미래에 대한 희망이 뚜렷한 친구들도 있었지만 한편으로는 무엇을 하고 싶고, 무엇이 되고 싶은지 아직 생각하지 못한 친구들도 많있습니다. 그래서 현재 […]</a> </div>
                                    </div>
                                    end right_group
                                </div> -->
                                <c:forEach var="item" items="${searchList}">
	                                <div class="result-view-wrap">
	                                    <div class="view-title"> 
	                                    	<a href="javascript:goBoard('<c:out value="${item.nttId }"/>','<c:out value="${item.bbsId }"/>','<c:out value="${item.bbsTyCode }"/>')">
	                                    		<c:out value="${item.nttSj }"/>
	                                    	</a> 
	                                    </div>
	                                    <div class="date"><c:out value="${item.frstRegisterPnttm}"/></div>
	                                    <div class="result_txt two-line"> 
	                                    	<a href="https://silhak.ggcf.kr/archives/17186">
	                                    		<%-- <c:out value="${item.nttCn }" escapeXml="false"/> --%>
	                                    	</a> 
	                                  	</div>
	                                </div>
                                </c:forEach>
                                <!-- 
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/17051">실학박물관 <strong class="theme-key-color">전시</strong>해설자원봉사자 모집 공고문(안)</a> </div>
                                    <div class="date"> 2017.08.17 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/17051">실학박물관 <strong>전시</strong>해설자원봉사자 모집 공고문(안) 박물관 <strong>전시</strong> 유물을 관람객들에게 쉽고 재미있게 설명할 수 있는 자원봉사자를 모집하여 전문 인력으로 양성함으로써 실학과 실학자의 삶 및 학문정신을 널리 알리고자 합니다. 뜻있는 분들의 많은 참여를 바랍니다. 1 모집인원 : 5명(토요일 2명/ 일요일 3명) 2. 자격요건 : 실학박물관 <strong>전시</strong>해설자원봉사에 뜻있는 모든 사람(성인) 3. 우대조건 – 외국어(영어·중국어·일어 등) 가능하거나 실학 및 우리 […]</a> </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/16548">상설<strong class="theme-key-color">전시</strong>실 활동지_ 청소년용</a> </div>
                                    <div class="date"> 2017.03.24 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/16548">상설<strong>전시</strong>실 활동지_ 청소년용입니다</a> </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/16546">상설<strong class="theme-key-color">전시</strong>실 활동지_ 초등 고학년용</a> </div>
                                    <div class="date"> 2017.03.24 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/16546">상설<strong>전시</strong>실 활동지_ 초등 고학년용입니다</a> </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/16544">상설<strong class="theme-key-color">전시</strong>실 활동지_ 초등 저학년용</a> </div>
                                    <div class="date"> 2017.03.24 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/16544">상설<strong>전시</strong>실 활동지_ 초등 저학년용입니다</a> </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/16538">상설<strong class="theme-key-color">전시</strong>실 활동지_ 유아용</a> </div>
                                    <div class="date"> 2017.03.24 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/16538">상설<strong>전시</strong>실 활동지_ 유아용입니다</a> </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/16357">‘상설<strong class="theme-key-color">전시</strong>실 모바일 <strong class="theme-key-color">전시</strong> 안내 서비스’</a> </div>
                                    <div class="date"> 2017.02.03 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/16357">2017년 실학박물관 상설<strong>전시</strong>실 모바일 <strong>전시</strong> 안내 서비스가 시작됩니다 . 모바일 <strong>전시</strong> 안내 시스템은 기존의 QR코드 또는 새로운 어플을 추가로 다운로드 하는 방식에서 벗어나, 설치로 인한 번거로움을 없애고, 모바일웹(모바일용 홈페이지 : silhak.ggcf.kr) 형식을 도입함으로써, 스마트폰으로 실학박물관 홈페이지 접속하기만 하면 간편하게 이용할 수 있는 셀프 <strong>전시</strong> 안내 서비스입니다. 본 서비스는 <strong>전시</strong>실안의 유물에 대한 패널 내용 이외에도 추가적인 […]</a> </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/openapi/events">공연, <strong class="theme-key-color">전시</strong>, 교육, 공고/소식 API</a> </div>
                                    <div class="date"> 2016.12.01 </div>
                                    <div class="result_txt two-line">
                                        <a href="https://silhak.ggcf.kr/openapi/events"></a>
                                    </div>
                                </div>
                                <div class="result-view-wrap">
                                    <div class="view-title"> <a href="https://silhak.ggcf.kr/archives/14714"><strong class="theme-key-color">전시</strong>보조물 교체작업 안내</a> </div>
                                    <div class="date"> 2016.11.22 </div>
                                    <div class="result_txt two-line"> <a href="https://silhak.ggcf.kr/archives/14714">2016.11.29(화)는 더 좋은 관람 서비스를 위하여 <strong>전시</strong>보조물 교체작업이 이루어집니다. 이로 인하여 관람에 불편을 드릴 수 있으니, 양해 바랍니다.</a> </div>
                                </div>
                                 -->
<!--                                 <div class="navigation">
                                    <ol class="wp-paginate">
                                        <li><span class="title">Pages:</span></li>
                                        <li><a href="https://silhak.ggcf.kr/?s=%EC%A0%84%EC%8B%9C" class="prev">«</a></li>
                                        <li><span class="page current">1</span></li>
                                        <li><a href="#" title="2" class="page">2</a></li>
                                        <li><a href="#" title="3" class="page">3</a></li>
                                        <li><a href="#" title="4" class="page">4</a></li>
                                        <li><a href="#" title="5" class="page">5</a></li>
                                        <li><a href="#" title="6" class="page">6</a></li>
                                        <li><a href="#" title="7" class="page">7</a></li>
                                        <li><span class="gap">...</span></li>
                                        <li><a href="#" title="28" class="page">28</a></li>
                                        <li><a href="#" class="next">»</a></li>
                                    </ol>
                                </div> -->
                            </div>
                        </div>
                    </div>
                    <!--end schWrap-->
                </div>
                <!--end inner-->
            </div>
            <!--end container-->
        </div>
        <!--end subWrap-->
<script>
function goBoard(nttId,bbsId,skin){
	var form = document.BoardVO;
	form.nttId.value = nttId;
	form.bbsId.value = bbsId;
	form.skin.value = skin;
	form.bbsTyCode.value = skin;
	
	form.action = '/cop/bbs/selectArticleDetail.do';
	form.submit();
	
}
	

</script>
        
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>