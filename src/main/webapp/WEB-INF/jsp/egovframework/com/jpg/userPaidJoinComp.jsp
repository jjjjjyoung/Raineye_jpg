<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<script>
function goFindId() {
    document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
    document.defaultForm.submit();
}
</script>
<div id="subWrap" class="login join sub01">
    <div class="sub_visual">
        <h2>유료회원</h2>
    </div>

    <div id="container">
        <div class="inner">
            <div class="leftMenu2">
                <c:choose>
            		<c:when test="${loginVO != null && loginVO.id != '' }">
	                <strong>마이페이지</strong>
	                <ul>
               	
                		<li><a href="/mypage.do">회원정보수정</a></li>
	                    <li class="on"><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                    <li><a href="/userHistory.do">신청내역</a></li>
	                    <li><a href="/userOut.do">회원탈퇴</a></li>
		            </ul>
	                    	
                	</c:when>
                	<c:otherwise>
                	<strong>회원가입</strong>
	                <ul>
	                	<li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
	                    <li><a href="javascript:goFindId();">아이디/비밀번호 찾기</a></li>
	                    <li><a href="javascript:goRegiUsrheader();">회원가입</a></li>
	                    <li class="on"><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                </ul>
                	</c:otherwise>
               	</c:choose>
            </div>
            <!--end leftMenu2-->

            <div class="last" id="go_direct">
                <div class="text_area">
                    <p class="hmgo_lob hmgo_lob2">
					유료회원 가입신청이 완료되었습니다.<br>
					가입자 명의로 회비를 계좌이체 하시면 확인 후 회원카드를 발급해드립니다.
                    </p>
                </div>
            </div>
            <!--end last-->
        </div>
        <!--end inner-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	<form name="defaultForm" action="" method="post" target="_blank" title="로그인 페이지로 이동">
	<div style="visibility: visible; display: none;">
		<input name="iptSubmit3" type="submit"
			value="<spring:message code="comUatUia.loginForm.submit"/>"
			title="<spring:message code="comUatUia.loginForm.submit"/>">
	</div>
</form>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>