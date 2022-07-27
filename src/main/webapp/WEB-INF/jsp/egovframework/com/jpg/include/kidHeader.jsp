<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width" />
    <title>전라남도도립어린이국악단에 오신것을 환영합니다</title>
    <meta name="description" content="전라남도도립어린이국악단에 오신것을 환영합니다::">
    <meta name="author" content="전라남도도립어린이국악단">
    <meta name="keywords" content="전라남도도립어린이국악단">
    <meta property="og:type" content="website">
    <meta property="og:title" content="전라남도도립어린이국악단">
    <meta property="og:url" content="http://www.jpg.or.kr/noimage.jpg">

    <link rel="stylesheet" href="/css/egovframework/com/jpg/reset.css?ver=1.3">
    <link rel="stylesheet" href="/css/egovframework/com/jpg/style.css?ver=1.3">
    <link rel="stylesheet" href="/css/egovframework/com/jpg/common.css?ver=1.3">
    <link rel="stylesheet" href="/assets/lib/slick/slick.css?ver=1.3">
    <link rel="stylesheet" href="/assets/lib/slick/slick-theme.css?ver=1.3">
    <link rel="stylesheet" href="/css/egovframework/com/jpg/style2.css">
    
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap?ver=1.3" rel="stylesheet">

    <script src="/js/egovframework/com/jpg/jquery-3.3.1.min.js?ver=1.3"></script>
    <script src="/js/egovframework/com/jpg/sub.js?ver=1.3"></script>
    <script src="/js/egovframework/com/jpg/common.js?ver=1.3"></script>
    <script src="/assets/lib/slick/slick.js?ver=1.3"></script>

</head>

<!--어린이 국악단 메인페이지-->

<body>
<script>
function goRegiUsrheader() {
	 
	var useMemberManage = '${useMemberManage}';

	<%-- if(useMemberManage != 'true'){
		사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요.
		alert("<spring:message code="comUatUia.validate.userManagmentCheck" />");
		return false;
	} --%>

    document.headerloginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
    document.headerloginForm.submit();
    

}
</script>
<form name="headerloginForm" id="headerloginForm" action="/uat/uia/actionLogin.do" method="post" style="display:none">
	<input name="userSe" type="hidden" value='GNR'/>
</form>
    <div id="wrap" class="kidWrap">
        <!--start header-->
        <div id="header">
            <!--start tnb-->
            <div class="tnb">
                <div class="inner">
                    <div class="left">
                    	<a href="/home.do">전남도립국악단</a>
                    	<a href="/kidHome.do" class="atv">어린이국악단</a>
                    </div>
                    <div class="right">
	                    <c:choose>
	                    	<c:when test="${loginVO != null && loginVO.id != null }">
	                        	<a href="<%=request.getContextPath() %>/mypage.do">MYPAGE</a>
	                        	<a href="<%=request.getContextPath() %>/uat/uia/actionLogout.do">로그아웃</a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="/uat/uia/egovLoginUsr.do">로그인</a>
			                    <a href="javascript:goRegiUsrheader();">회원가입</a>
	                    	</c:otherwise>
	                    </c:choose>           
                        <c:if test='${audio.atchFileId!=null and !audio.atchFileId.equals("")}'>
		                    <div class="speaker">국악 라디오</div>
							<audio id="player">
	        				<source src="/upload/${audio.streFileNm }" type="audio/mpeg">
	        			</audio>
        			</c:if>
                    </div>
                </div>
            </div>
            <!--end tnb-->

            <!--start nav-->
            <div id="nav">
                <div class="inner">
                    <div class="stMap"><a href="#">사이트 맵</a></div>
                    <div class="siteMap">
                        <div class="mapInner">
                            <div class="mn mn1">
	                            <span tabindex="0">소개</span>
	                            <div>
	                                <a id="stMap_item1" href="/contents.do?id=greetings">인사말</a>
	                                <a href="/contents.do?id=history">연혁</a>
	                                <a href="/contents.do?id=organization">조직 및 업무</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000049">예술단원 소개</a>
	                                <a href="/contents.do?id=location">오시는 길</a>
	                            </div>
	                        </div>
	                        <div class="mn mn2">
	                            <span tabindex="0">공연</span>
	                            <div>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M">공연정보</a>
	                                <a href="/contents.do?id=ticketing">공연예매</a>
	                                <a href="/contents.do?id=guid">관람안내</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000047">갤러리</a>
	                            </div>
	                        </div>
	                        <div class="mn mn3">
	                            <span tabindex="0">교육&nbsp;/&nbsp;체험</span>
	                            <div>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000051">교육/체험 신청</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000046">교육/체험 안내</a>
	                            </div>
	                        </div>
	                        <div class="mn mn4">
	                            <span tabindex="0">알림&nbsp;/&nbsp;참여</span>
	                            <div>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000041">공지사항</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000042">채용공고</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000043">언론보도</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000044">뉴스레터</a>
	                                <a href="/contents.do?id=faq">FAQ</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000045">관람후기</a>
	                            </div>
	                        </div>
	                        <div class="mn mn5">
	                            <span tabindex="0">어린이국악단</span>
	                            <div>
	                                <a href="/contents.do?id=kidinfo&kidId=Y&type=k">소개</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000050&type=k">어린이단원 소개</a>
	                                <a href="/publeView.do?id=skinBbsList&type=k">모집안내</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000048&type=k">갤러리</a>
	                                <a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000061&type=k">공지사항</a>
	                            </div>
	                        </div>
                        </div>
                        <!--mapInner-->
                    </div>
                    <!--end siteMap-->
                    <div class="gnb_menu_btn"><a href="#">모바일 메뉴 버튼</a></div>
                    <h1 class="logo kid_logo_area" title="전라남도도립어린이국악단">
                        <a href="/kidHome.do"><img src="/images/egovframework/com/jpg/kidLogo.png" alt="전라남도도립어린이국악단"></a>
                    </h1> 
                    <div id="gnb">
                        <div class="kidGnb">
                        	<c:forEach var="item" items="${mobile_headmenu}" varStatus="index">
	                			<c:if test="${fn:length(item.meCode) ==4 }">
	                				<div class="kid_mn<c:out value='${index.index }'/>"><a href="<c:out value='${item.meLink }'/>"><c:out value="${item.meName}"/></a></div>
	                			</c:if>
	                		</c:forEach>
                        </div>

		                <form method="post" class="schForm" name="userSearchVO" action="/search.do">
		                    <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요" title="검색어 입력">
		                    <button type="submit">검색</button>
		                </form>
                    </div>
                </div>
            </div>
            <!--end nav-->

            <div class="overlayer"></div>
            <div class="mbNav">
                <div class="top">
                    <div class="logo"><a href="/home.do"><img src="/images/egovframework/com/jpg/MainLogo.png" alt="전라남도립국악단"></a></div>
                	<div class="gnb_close_btn"><a href="#">닫기</a></div>
                </div>
                <div class="formBox">
	                <form method="post" class="schForm" name="userSearchVO" action="/search.do">
	                    <input type="text" id="searchKeywordMobile" name="searchKeyword" placeholder="검색어를 입력하세요" title="검색어 입력">
	                    <button type="submit">검색</button>
	                </form>
                </div>
                <ul id="accordion_navi">
                    <c:forEach var="item" items="${list_sitemenu}" varStatus="status">
	                   	<c:if test="${fn:length(item.meCode) == 2 && item.meCode != '10'}">
	                   			</ul>
	                   		</li>
	                    <li>
	                    	<button><c:out value="${item.meName }"/></button>
	                    	<ul>
	                    </c:if>
	                    <c:if test="${fn:length(item.meCode) ==4 }">
	                     	   <li><a href="<c:out value='${item.meLink }'/>"><c:out value="${item.meName}"/></a></li>
	                    </c:if>
	                    <c:if test="${item.meCode == '10'}">
	                    	<li>
	                    		<button><c:out value="${item.meName }"/></button>
	                    		<ul>
	                    </c:if>
	                    <c:if test="${status.last}">
							</ul>
						</li>
						</c:if>
	                </c:forEach>
	                <c:forEach var="item" items="${mobile_headmenu}" varStatus="status">
	                    <c:if test="${item.meCode == '50' && fn:length(item.meCode) == 2}">
	                    	<li>
	                    		<button><c:out value="${item.meName }"/></button>
	                    		<ul>
	                    </c:if>
	                    <c:if test="${fn:length(item.meCode) ==4 }">
	                     	   <li><a href="<c:out value='${item.meLink }'/>"><c:out value="${item.meName}"/></a></li>
	                    </c:if>
	                    <c:if test="${status.last}">
							</ul>
						</li>
						</c:if>
	                </c:forEach>
	                
	                
	                
                </ul>
                
                
                
                
                
                
                
                <div class="ins_you_box_fo">
            	<ul>
            		<li>
            			<a href="https://www.instagram.com/jeonnam_gugak/">
            				<img src="../../../../images/egovframework/com/jpg/icon/insta.png" alt="">
            			</a>
            		</li>
            		<li>
            			<a href="https://www.youtube.com/channel/UCwZHHFSbD15bnhBDBV01oBQ/featured">
            				<img src="../../../../images/egovframework/com/jpg/icon/youtube.png" alt="">
            			</a>
            		</li>
            	</ul>
            	
            	<!--
                <a href="https://www.youtube.com/channel/UCwZHHFSbD15bnhBDBV01oBQ/featured" class="youtube">전라남도 도립 국악단 유투브</a>
                <a href="https://www.instagram.com/jeonnam_gugak/" class="insta">전라남도 도립 국악단 인스타그램</a>
                -->
            </div>
            
            <div class="member">
                    <c:choose>
                    	<c:when test="${loginVO != null && loginVO.id != null }">
                			<a class="login" href="<%=request.getContextPath() %>/uat/uia/actionLogout.do">로그아웃</a>
                        	<a class="join" href="<%=request.getContextPath() %>/mypage.do">MYPAGE</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a class="login" href="/uat/uia/egovLoginUsr.do">로그인</a>
                			<a class="join" href="javascript:goRegiUsrheader();">회원가입</a>
                    	</c:otherwise>
                    </c:choose>
                </div>
                
                
                
                
                
                
                
                <div class="nav_foot">copyright&copy; 2019 전라남도립국악단 All Rights Reserved.
                </div>
            </div>
            <!--end mobile nav-->
        </div>
        <!--end header-->