<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<link rel="stylesheet" href="/css/egovframework/com/jpg/style2.css">

<script>
function goFindId() {
    document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
    document.defaultForm.submit();
}
</script>

<div id="subWrap" class="paid sub01">
    <div class="sub_visual">
        <h2>유료회원</h2>
    </div>	
    <div id="container">

        <!--start content-->
        <div class="contentWrap">
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
	
	            <div class="paid-info" id="go_direct">
	                <div class="text">
                            <div class="sub_title"><p>유료회원</p></div>
                            <div class="box1">
                                <h2>남도회원 (1년) : 회비 2만원</h2>
                                <div class="border_box wbd_boxz_08">
                                    <div class="left wa_dr_cime01">
                                        <img src="/images/egovframework/com/jpg/card1.png" alt="남도회원 카드"/>
                                    </div>
                                    <div class="right wa_dr_cime02 yeag_Box">
                                        <ul>
                                            <li>일반 관람료 <span>50%</span> 할인 (본인포함 2인)</li>
                                            <li>국악강좌 수강료 <span>10,000원</span> 할인 (본인)</li>
                                            <li>토요공연 무료관람권 <span>2매</span>증정</li>
                                            <li>공연 정보 SMS 안내 서비스</li>
                                            <li>공연 프로그램북 우편 배송 서비스</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="box2">
                                <h2>풍류회원 (평생) : 회비 10만원</h2>
                                <div class="border_box box wbd_boxz_08">
                                    <div class="left wa_dr_cime01">
                                        <img src="/images/egovframework/com/jpg/card2.png" alt="풍류회원 카드"/>
                                    </div>
                                    <div class="right wa_dr_cime02 yeag_Box">
                                        <ul>
                                            <li>일반 관람료 <span>50%</span> 할인 (본인포함 4인)</li>
                                            <li>국악강좌 수강료 <span>20,000원</span> 할인 (본인포함 2인)</li>
                                            <li>토요공연 무료관람권 <span>2매</span>증정 (연1회)</li>
                                            <li>공연 정보 SMS 안내 서비스</li>
                                            <li>공연 프로그램북 우편 배송 서비스</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="box3">
                                <h2>멤버십 가입 안내 및 납부 안내</h2>
                                <div class="border_box">
                                    <ul>
                                        <li>1. 홈페이지 로그인 후 유료회원 가입 신청서 작성</li>
                                        <li>
                                            2. 가입자 명의로 계좌 입금 <br />
                                            <strong>·계좌번호 : 광주은행 650-17-009398 (재)전라남도문화관광재단</strong>
                                        </li>
                                        <li>3. 회비 납입 확인 후 유료회원으로 승인 완료</li>
                                        <li>4. 등록된 주소로 회원카드 발급</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="box4">
                                <p>가입문의<span>_061)285-6928</span></p>
                            </div>
                        </div>
					<c:choose>
						<c:when test="${loginVO != null && loginVO.id != null }">
							<c:choose>
								<c:when test="${mberManageVO.level > '1' }">
									<a href="javascript:paidCheck();">유료회원 가입하기</a>
								</c:when>
								<c:otherwise>
									<a href="/userPaidJoinProc.do">유료회원 가입하기</a>
								</c:otherwise>
							</c:choose>
		                </c:when>
		                <c:otherwise>
		                	<a href="javascript:alert('로그인을 먼저 해주세요.'); window.location.href='/uat/uia/egovLoginUsr.do';">유료회원 가입하기</a>
		                </c:otherwise>
	                </c:choose>
	            </div>
	            <!--end join_box-->
	        </div>
	        <!--end inner-->
		</div>
		<!--end contentWrap-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	<form name="defaultForm" action="" method="post" title="로그인 페이지로 이동">
	<div style="visibility: visible; display: none;">
		<input name="iptSubmit3" type="submit"
			value="<spring:message code="comUatUia.loginForm.submit"/>"
			title="<spring:message code="comUatUia.loginForm.submit"/>">
	</div>
</form>

<script>
	function paidCheck(){
		var con = confirm("승인된 유료회원 입니다. 신청하시겠습니까?");
		if(con == true){
			window.location.href="/userPaidJoinProc.do";		
		}
	}
</script>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>