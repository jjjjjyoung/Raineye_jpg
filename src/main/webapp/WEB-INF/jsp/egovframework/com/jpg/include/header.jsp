<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="title" value="${meName}" />


<%
String title=String.valueOf(pageContext.getAttribute("title")) ;
String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
String uri = (String)request.getAttribute( "javax.servlet.forward.request_uri" );
String[] root=uri.split("/");
uri=root[root.length - 1];
if(title.equals("null") && uri.equals("home.do") ){
	title="전라남도립국악단에 오신것을 환영합니다";
}else if(uri.equals("EgovStplatCnfirmMber.do")){
	title="가입약관 - 회원가입";
}else if(uri.equals("egovLoginUsr.do")){
	title="로그인";
}else if(uri.equals("egovIdPasswordSearch.do")){
	title="아이디 비밀번호 찾기";
}else if(uri.equals("userPaidJoinAgree.do")){
	title="유료회원 - 마이페이지";
}else if(uri.equals("mypage.do")){
	title="회원정보수정 - 마이페이지";
}else if(uri.equals("userHistory.do")){
	title="신청내역 - 마이페이지";
}else if(uri.equals("userOut.do")){
	title="회원탈퇴 - 마이페이지";
}else if(uri.equals("EgovRlnmCnfirm.do")){
	title="정보입력 - 회원가입";
}else if(uri.equals("EgovMberSbscrb.do")){
	title="가입완료 - 정보입력 - 회원가입";
}else if(uri.equals("selectArticleDetail.do")){
	title="상세페이지 - 게시판";
}else if(uri.equals("userPaidJoinProc.do")){
	title="유료회원가입 - 유료회원 - 마이페이지 - 도립국악단";
}else if(uri.equals("searchId.do")){
	title="아이디를 발송하였습니다 - 아이디 비밀번호 찾기";
	
	
	
	
	
	
	
	
	
	
	
}else{
	title=title.replaceAll(match, "");
}
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="initial-scale=1, width=device-width" />
     <title><%= title %></title>
    <meta name="description" content="전남 무안군 삼향읍 남악로 위치. 전남도립국악단 소개. 공연정보. 교육정보. 어린이국악단. 티켓예매 등 안내.">
    <meta name="author" content="전라남도립국악단">
    <meta name="keywords" content="전라남도립국악단">
    <meta property="og:type" content="website">
    <meta property="og:title" content="전라남도립국악단">
    <meta property="og:description" content="전남 무안군 삼향읍 남악로 위치. 전남도립국악단 소개. 공연정보. 교육정보. 어린이국악단. 티켓예매 등 안내.">
	<meta property="og:image" content="/images/egovframework/com/jpg/favicon_link_img.jpg">
    <meta property="og:url" content="http://www.jpg.or.kr/noimage.jpg">
    <link rel="stylesheet" href="/css/egovframework/com/jpg/reset.css?ver=1.3">
    <link rel="stylesheet" href="/css/egovframework/com/jpg/common.css?ver=1.3">
    <link rel="stylesheet" href="/assets/lib/slick/slick.css?ver=1.3">
    <link rel="stylesheet" href="/assets/lib/slick/slick-theme.css?ver=1.3">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/main_portal.css' />"> 
	<link rel="icon" href="/images/egovframework/com/jpg/favicon.png">
	<link rel="shortcut icon" href="/images/egovframework/com/jpg/favicon.ico">
    <script src="/js/egovframework/com/jpg/jquery-3.3.1.min.js"></script>
    <script src="/js/egovframework/com/jpg/sub.js?ver=1.3"></script>
    <script src="/js/egovframework/com/jpg/common.js?ver=1.3"></script>
    <script src="/assets/lib/slick/slick.js?ver=1.3"></script>

</head>
<body>

<script type="application/ld+json">
{
 "@context": "http://schema.org",
 "@type": "Person",
 "name": "전남도립국악단",
 "url": "http://jpg.or.kr",
 "sameAs": [
   "https://www.instagram.com/jeonnam_gugak/?igshid=YmMyMTA2M2Y=",
   "https://tv.naver.com/jeonnamgugak",
   "https://youtube.com/c/jeonnamgugak"
 ]
}
</script>

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
$(function (){
	$(".num.on > a").attr('title','현재페이지');
});

</script>

<style>
.circle {
       font-size:40px;
       color:#ff0000;
       text-weight:bold;
       position:absolute;
       right:25px;
    }
</style>


<form name="headerloginForm" id="headerloginForm" action="/uat/uia/actionLogin.do" method="post" style="display:none">
	<input name="userSe" type="hidden" value='GNR'/>
</form>
<div id="wrap">
	<!--start header-->
    <div id="header">
        <!--start tnb-->
        <div class="tnb">
            <div class="inner">
                <div class="left">
                	<a tabindex = "1" href="#go_direct" id="go_di_all2">본문 바로가기</a>
                    <a tabindex = "1" href="/home.do" class="atv">전남도립국악단</a>
                    <a tabindex = "1" href="/kidHome.do" class="jpgfSe02">
                    	<img src="/images/egovframework/com/jpg/icon/kid_btn_icon.png" alt="">
                    	어린이국악단
                    </a>
                </div>
                <div class="right">
	                <c:choose>
                    	<c:when test="${loginVO != null && loginVO.id != null }">
                        	<a tabindex = "1" href="<%=request.getContextPath() %>/mypage.do">MYPAGE</a>
                        	<a tabindex = "1" href="<%=request.getContextPath() %>/uat/uia/actionLogout.do">로그아웃</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a tabindex = "1" href="/uat/uia/egovLoginUsr.do">로그인</a>
		                    <a tabindex = "1" href="javascript:goRegiUsrheader();">회원가입</a>
                    	</c:otherwise>
                    </c:choose>
                    <!-- <a href="#none" class="bgm_btn">국악 라디오</a> -->
                    <c:if test='${!audio.atchFileId.equals("")}'>
	                    <!-- div class="speaker">국악 라디오</div-->
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
                <div class="stMap"><a tabindex = "1" href="#">사이트 맵</a></div>
                <div class="siteMap">
                    <div class="mapInner">
                        <div class="mn mn1">
                            <span tabindex="1">소개</span>
                            <div>
                                <a tabindex = "1" href="/contents.do?id=greetings">인사말</a>
                                <a tabindex = "1" href="/contents.do?id=history">연혁</a>
                                <a tabindex = "1" href="/contents.do?id=organization">조직 및 업무</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000049">예술단원소개</a>
                                <a tabindex = "1" href="/contents.do?id=location">오시는 길</a>
                            </div>
                        </div>
                        <div class="mn mn2">
                        	
                            <span tabindex = "1" >공연</span>
                            <div>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M">공연정보</a>
                                <a tabindex = "1" href="/contents.do?id=ticketing">공연예매</a>
                                <a tabindex = "1" href="/contents.do?id=guid">관람안내</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000047">갤러리</a>
                            </div>
                        </div>
                        <div class="mn mn3">
                            <span tabindex="0">교육&nbsp;/&nbsp;체험</span>
                            <div>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000051">교육/체험 신청</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000046">교육/체험 안내</a>
                            </div>
                        </div>
                        <div class="mn mn4">
                            <span tabindex="0">알림&nbsp;/&nbsp;참여</span>
                            <div>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000041">공지사항</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000042">채용공고</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000043">언론보도</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000044">뉴스레터</a>
                                <a tabindex = "1" href="/contents.do?id=faq">FAQ</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000045">관람후기</a>
                            </div>
                        </div>
                        <div class="mn mn5">
                            <span tabindex = "1" >어린이국악단</span>
                            <div>
                                <a tabindex = "1" href="/contents.do?id=kidinfo&kidId=Y&type=k">소개</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000050&type=k">어린이단원 소개</a>
                                <a tabindex = "1" href="/publeView.do?id=skinBbsList&type=k">모집안내</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000048&type=k">갤러리</a>
                                <a tabindex = "1" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000061&type=k">공지사항</a>
                            </div>
                        </div>
                    </div>
                    <!--mapInner-->
                </div>
                <!--end siteMap-->
                
                <div class="gnb_menu_btn"><a href="#">모바일 메뉴 버튼</a></div>
                <h1 class="logo" title="전라남도립국악단">
                    <a tabindex = "1" href="/home.do"><img src="/images/egovframework/com/jpg/MainLogo.svg" alt="전라남도립국악단"></a>
                </h1>
                <div id="gnb">
                	<ul>
                	
                		<c:forEach var="item" items="${list_headmenu}" varStatus="index">
                    		
		                    <c:if test="${fn:length(item.meCode) == 2 && item.meCode != '10'}">
		                   			</ul>
		                   		</li>
		                    <li>
		                    	
		                    	<button tabindex = "2" onclick="javascript:window.location.href='<c:out value="${item.meLink }"/>'"><c:out value="${xi}"/><c:out value="${item.meName }"/></button>
		                    	<c:if test="${index.count == 7 && m2 > 0}"><span><img src="/images/egovframework/com/jpg/new.gif" style="width:15px;"></span></c:if>
		                    	<c:if test="${index.count == 12 && m3 > 0}"><span><img src="/images/egovframework/com/jpg/new.gif" style="width:15px;"></span></c:if>
		                    	<c:if test="${index.count == 15 && m4 > 0}"><span><img src="/images/egovframework/com/jpg/new.gif" style="width:15px;"></span></c:if>
		                    	<ul class="navi_sec">

		                    </c:if>
		                    <c:if test="${fn:length(item.meCode) ==4 }">
		                     	   <li>
		                     	   		<a tabindex = "2" href="<c:out value='${item.meLink }'/>">
		                     	   			<c:out value="${item.meName}"/>
		                     	   			<c:if test="${item.meNewCount > 0}"><span class="circle">ㆍ</span></c:if>
		                     	   		</a>
		                     	   		
		                     	   </li>
		                    </c:if>
		                    <c:if test="${item.meCode == '10'}">
		                    	<li>
		                    		<button tabindex = "2" onclick="javascript:window.location.href='<c:out value="${item.meLink }"/>'"><c:out value="${item.meName}"/></button>
		                    		<ul class="navi_sec">
		                    </c:if>
		                    <c:if test="${index.last}">
		                		</ul>
		                	</li>    	
		                    </c:if>
		                    
	                    </c:forEach>
                    </ul>
                    
                    <form method="post" class="schForm" name="userSearchVO" action="/search.do">
                        <input tabindex = "2" type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요" title="검색어 입력">
                        <button tabindex = "2" type="submit">검색</button>
                    </form>
                    
                </div>
            </div>
        </div>
        <!--end nav-->

        <div class="overlayer"></div>
        <div class="mbNav wj_mbNav">
            <div class="top">
                <div class="logo"><a tabindex = "1" href="/home.do"><img src="/images/egovframework/com/jpg/MainLogo.svg" alt="전라남도립국악단"></a></div>
                <div class="gnb_close_btn"><a href="#">닫기</a></div>
            </div>
            <div class="formBox">
                <form method="post" class="schForm" name="userSearchVO" action="/search.do">
                    <input tabindex = "2" type="text" id="searchKeywordMobile" name="searchKeyword" placeholder="검색어를 입력하세요" title="검색어 입력">
                    <button tabindex = "2" type="submit">검색</button>
                </form>
            </div>
            <ul id="accordion_navi">
            	
               <c:forEach var="item" items="${list_headmenu}" varStatus="status">
                   	<c:if test="${fn:length(item.meCode) == 2 && item.meCode != '10'}">
                   			</ul>
                   		</li>
                    <li>
                    	<button><c:out value="${item.meName }"/></button>
                    	<ul>
                    </c:if>
                    <c:if test="${fn:length(item.meCode) ==4 }">
                     	   <li><a tabindex = "2" href="<c:out value='${item.meLink }'/>"><c:out value="${item.meName}"/></a></li>
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
        <!--end siteMap-->
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        