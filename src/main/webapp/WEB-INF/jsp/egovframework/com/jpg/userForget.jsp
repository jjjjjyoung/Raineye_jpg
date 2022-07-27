<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="login forget">
    <div class="sub_visual">
        <h2>로그인</h2>
    </div>

    <div id="container">
        <!--start con01-->
        <div class="con01">
            <div class="inner">
            	<div class="leftMenu2">
                    <strong>회원가입</strong>
                    <ul>
                        <li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
                        <li class="on"><a href="/publeView.do?id=userForget">아이디/비밀번호 찾기</a></li>
                        <li><a href="/publeView.do?id=userJoinAgree">회원가입</a></li>
                        <li><a href="/publeView.do?id=userPaidJoinAgree">유료회원</a></li>
                    </ul>
                </div>
                <!--end leftMenu2-->
                <div id="go_direct">
	                <div class="mem_form" >
	                    <!-- <form id="frmNIDLogin" name="frmNIDLogin" target="_self" method="POST"> -->
	                    <form name="idForm" action ="<c:url value='/uat/uia/searchId.do'/>" method="post">
	                    	<input type="hidden" name="userSe" value="GNR" />
	                        <fieldset class="login_form">
	                            <legend>아이디 찾기</legend>
	                            <p>
	                                이름과 이메일을 입력하시면<br> 해당 이메일로 아이디를 알려드립니다.
	                            </p>
	                            <div class="name_area input_area">
	                                <div class="input_row" id="name_area">
	                                    <span class="input_box">
	                                        <label for="name" id="label_name_area" class="sound_only">이름</label>
	                                        <input type="text" id="name" name="name" placeholder="이름" class="int">
	                                    </span>
	                                </div>
	                            </div>
	                            <div class="mail_area input_area">
	                                <div class="input_row" id="pw_area">
	                                    <span class="input_box">
	                                        <label for="mail" id="label_mail_area" class="sound_only">이메일</label>
	                                        <input type="email" id="email" name="email" placeholder="이메일" class="int">
	                                    </span>
	                                </div>
	                            </div>
	
	                            <!-- <input type="submit" title="아이디 찾기" alt="아이디 찾기" value="아이디 찾기" class="id_find"> -->
	                            <input type="button" class="id_find" onClick="fnSearchId();" value="아이디 찾기" />
	                        </fieldset>
	                    </form>
	                </div>
	                <!--end mem_form-->
	                <div class="mem_form">
	                    <!-- <form id="frmNIDLogin" name="frmNIDLogin" target="_self" method="POST"> -->
	                    <form name="passwordForm" action ="<c:url value='/uat/uia/searchPassword.do'/>" method="post">
	                    	<input type="hidden" name="userSe" value="GNR" />
	                        <fieldset class="login_form">
	                            <legend>비밀번호 찾기</legend>
	                            <p>
	                                아이디, 이름, 이메일을 입력하시면<br> 해당 이메일로 임시 비밀번호를 알려드립니다.
	                            </p>
	                            <div class="id_area input_area">
	                                <div class="input_row" id="id_area">
	                                    <span class="input_box">
	                                        <label for="id" id="label_id_area" class="sound_only">아이디</label>
	                                        <input type="text" id="id" name="id" placeholder="아이디" class="int">
	                                    </span>
	                                </div>
	                            </div>
	                            <div class="name_area input_area">
	                                <div class="input_row" id="name_area">
	                                    <span class="input_box">
	                                        <label for="name" id="label_name_area" class="sound_only">이름</label>
	                                        <input type="text" id="name" name="name" placeholder="이름" class="int">
	                                    </span>
	                                </div>
	                            </div>
	                            <div class="mail_area input_area">
	                                <div class="input_row" id="pw_area">
	                                    <span class="input_box">
	                                        <label for="mail" id="label_mail_area" class="sound_only">이메일</label>
	                                        <input type="email" id="email" name="email" placeholder="이메일" class="int">
	                                    </span>
	                                </div>
	                            </div>
	
	                            <!-- <input type="submit" title="비밀번호 찾기" alt="비밀번호 찾기" value="비밀번호 찾기" class="pw_find"> -->
	                            <input type="button" class="pw_find" onClick="fnSearchPassword();" value="<spring:message code="비밀번호 찾기" />">
	                        </fieldset>
	                    </form>
	                </div>
	                <!--end mem_form-->
                </div>
            </div>
            <!--end inner-->
        </div>
        <!--end con01-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>