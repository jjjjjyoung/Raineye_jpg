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
	
	            <div id="go_direct">
	                <div class="text_area">
	                    <p>
	                        전라남도립국악원의 회원이 되시면 수준 높은 남도국악의 흥과 감동이 담긴 공연과<br>
	                        국악과 함께 삶을 풍요롭게 할 다양한 프로그램을 만나실 수 있습니다.<br>
	                        <span>일반회원(무료)</span>과 <span>유료회원(유료)</span>을 선택하여 회원가입 해 주세요.
	                    </p>
	                    <div class="paid_mem">
	                        <a href="/publeView.do?id=userPaidJoinAgree">&#91;유료회원 혜택보기&#93;</a>
	                    </div>
	                    <span class="txtRed">회원가입 약관 및 개인정보 이용약관에 동의하셔야 회원가입 하실 수 있습니다.</span>
	                </div>
	
	                <div class="join_box">
	                    <label for="term_all" class="chk_all">전체 선택<input type="checkbox" name="term_all" id="term_all"></label>
	                    <div class="terms mem_form">
	                        <div class="tit">
	                            <span>운영약관</span>
	                            <label for="term1">운영약관 내용에 동의합니다.
	                                <input type="checkbox" name="term" id="term1">
	                            </label>
	                        </div>
	                        <div class="text_area"><textarea name="terms1" id="terms1" cols="30" rows="10" readonly>전라남도립국악단 운영약관 입니다.</textarea></div>
	                    </div>
	                    <!--end terms 운영약관-->
	                    <div class="terms mem_form">
	                        <div class="tit">
	                            <span>개인정보 이용약관</span>
	                            <label for="term2">개인정보 이용약관 내용에 동의합니다.
	                                <input type="checkbox" name="term" id="term2">
	                            </label>
	                        </div>
	                        <div class="text_area"><textarea name="terms2" id="terms2" cols="30" rows="10" readonly>전라남도립국악단 개인정보 이용약관 입니다.</textarea></div>
	                    </div>
	                    <!--end terms 개인정보 이용약관-->
	
	                    <a href="/publeView.do?id=userJoinProc">회원가입</a>
	                </div>
	                <!--end join_box-->
	            </div>
	        </div>
	        <!--end inner-->
		</div>
		<!--end contentWrap-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>