<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<script>
/* ********************************************************
 * 뒤로 처리 함수
 ******************************************************** */
function fncGoAfterPage(){
    history.back(-2);
}

function fncGoIdPwd(){
    location.href="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
}

function fncGoLogin(){
	location.href="<c:url value='/uat/uia/egovLoginUsr.do'/>";
}

</script>

<div id="subWrap" class="login join sub01">
    <div class="sub_visual">
        <h2>아이디/비밀번호 찾기</h2>
    </div>

    <div id="container">

        <!--start content-->
        <div class="contentWrap">
	        <div class="inner">
	            <div class="leftMenu2">
	                <strong>회원가입</strong>
	                <ul>
	                    <li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
	                    <li class="on"><a href="javascript:fncGoIdPwd();">아이디/비밀번호 찾기</a></li>
	                    <li><a href="javascript:goRegiUsrheader();">회원가입</a></li>
	                    <li><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                </ul>
	            </div>
	            <!--end leftMenu2-->
	
	            <div class="last">
	                <div class="text_area">
	                    <p>
	                       ${resultInfo}
	                    </p>
	                </div>
	                <div class="join_box">
	                    <!-- <a href="/uat/uia/egovLoginUsr.do">로그인</a> -->
	                    <div class="btn_box">
	                        <a href="javascript:fncGoIdPwd();" style="width: 199px;"><spring:message code="comUatUia.idPasswordResult.searchIdPwd" /></a>
						    <a href="javascript:fncGoLogin();" style="width: 199px;"><spring:message code="comUatUia.loginForm.login" /></a>
						</div>
	                </div>
	            </div>
	            <!--end last-->
	        </div>
	        <!--end inner-->
		</div>
		<!--end contentWrap-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->


<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>
