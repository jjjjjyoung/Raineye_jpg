<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="login join sub01">
    <div class="sub_visual">
        <h2>회원가입</h2>
    </div>

    <div id="container">
        <!--start content-->
        <div class="contentWrap">
	        <div class="inner">
	            <div class="leftMenu2">
	                <strong>회원가입</strong>
	                <ul>
	                    <li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
	                    <li><a href="/publeView.do?id=userForget">아이디/비밀번호 찾기</a></li>
	                    <li class="on"><a href="/publeView.do?id=userJoinAgree">회원가입</a></li>
	                    <li><a href="/publeView.do?id=userPaidJoinAgree">유료회원</a></li>
	                </ul>
	            </div>
	            <!--end leftMenu2-->
	
	            <div class="last" id="go_direct">
	                <div class="text_area">
	                    <p class="hmgo_lob">
	                        <!-- <span>가입완료</span> -->
							환영합니다. 전라남도립국악단에 회원 가입되셨습니다.
	                    </p>
	                </div>
	
	                <div class="join_box">
	                    <a href="/uat/uia/egovLoginUsr.do">로그인</a>
	                </div>
	                <!--end join_box-->
	            </div>
	            <!--end con01-->
	        </div>
	        <!--end inner-->
		</div>
		<!--end contentWrap-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>