<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<script>

// 약관동의 작업 진행중
function fnAgree(){
	var term1 = $('input[id="term1"]:checked').val();
	var term2 = $('input[id="term2"]:checked').val();

	if(!term1) {
		alert("회원가입 이용약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
		$("#term1").focus();
		return false;
	}

	if(!term2) {
		alert("개인정보 이용약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
		$("#term2").focus();
		return false;
	}

	//실명인증 기본페이지는 주민번호 실명확인으로 한다.
    //패키지 변경 document.stplatForm.action = "<c:url value='/uss/umt/EgovRlnmCnfirm.do'/>";
    document.stplatForm.action = "<c:url value='/sec/rnc/EgovRlnmCnfirm.do'/>";
    document.stplatForm.submit();

	return true;
}

/*
function fnAgree(){
	var checkField = document.stplatForm.term;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                }else{
                    alert("<spring:message code="comUssUmt.stplatCnfirmtValidate.disagreeStplatCnfirmt" />"); //약관에 동의하지 않으면 회원으로 가입할 수 없습니다.
                    checkField[i].focus();
                    return;
                }
            }
        } else {
            if(checkField.checked) {
            }else{
            	alert("<spring:message code="comUssUmt.stplatCnfirmtValidate.disagreeStplatCnfirmt" />"); //약관에 동의하지 않으면 회원으로 가입할 수 없습니다.
                checkField[i].focus();
                return;
            }
        }
    }
    
    //실명인증 기본페이지는 주민번호 실명확인으로 한다.
    //패키지 변경 document.stplatForm.action = "<c:url value='/uss/umt/EgovRlnmCnfirm.do'/>";
    document.stplatForm.action = "<c:url value='/sec/rnc/EgovRlnmCnfirm.do'/>";
    document.stplatForm.submit();
}
*/
function fnDisAgree(){
	alert("<spring:message code="comUssUmt.stplatCnfirmtValidate.disagreeStplatCnfirmt" />"); //약관에 동의하지 않으면 회원가입을 하실수 없습니다.
	return;
}

function goFindId() {
    document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
    document.defaultForm.submit();
}

function goRegiUsr() {
	 
	var useMemberManage = '${useMemberManage}';

	<%-- if(useMemberManage != 'true'){
		사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요.
		alert("<spring:message code="comUatUia.validate.userManagmentCheck" />");
		return false;
	} --%>

    document.defaultForm.action="<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
    document.defaultForm.submit();
    

}

$(document).ready(function() {
	// 본문 바로가기 후 동의합니다에 포커스
	$("#go_di_all2").on("click blur", function(e) {
		e.preventDefault();

		var goDirectTop = $("#go_direct").offset();

		$("html, body").scrollTop(goDirectTop.top - 100);

		$("#term1").focus();
	});
});
</script>

<style>
.login .mem_form p	{text-align:unset !important;}
.login .text_area p	{text-align:unset !important;}
</style>
<form name="defaultForm" action="" method="post" >
	<div style="visibility: visible; display: none;">
		<input name="iptSubmit3" type="submit" value="<spring:message code="comUatUia.loginForm.submit"/>" title="<spring:message code="comUatUia.loginForm.submit"/>">
		<input name="userSe" type="hidden" value='<c:out value="${adm}"/>'/>
	</div>
</form>
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
	                    <li><a href="javascript:goFindId();">아이디/비밀번호 찾기</a></li>
	                    <li class="on"><a href="javascript:goRegiUsr();">회원가입</a></li>
	                    <li><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                </ul>
	            </div>
	            <!--end leftMenu2-->
	
	            <div id="go_direct">
	                <!-- <div class="text_area">
	                    <p>
	                        전라남도립국악원의 회원이 되시면 수준 높은 남도국악의 흥과 감동이 담긴 공연과<br>
	                        국악과 함께 삶을 풍요롭게 할 다양한 프로그램을 만나실 수 있습니다.<br>
	                        <span>일반회원(무료)</span>과 <span>유료회원(유료)</span>을 선택하여 회원가입 해 주세요.
	                    </p>
	                    <div class="paid_mem">
	                        <a href="/userPaidJoinAgree.do">&#91;유료회원 혜택보기&#93;</a>
	                    </div>
	                    <span class="txtRed">회원가입 약관 및 개인정보 이용약관에 동의하셔야 회원가입 하실 수 있습니다.</span>
	                </div> -->
					<form name="stplatForm" action="<c:url value='/sec/rnc/EgovRlnmCnfirm.do'/>" method="post" class="joinTable">
						<input type="hidden" name="sbscrbTy" value="${sbscrbTy}"/>
						<!-- 실명인증의 기본옵션은 주민번호 실명확인임 : 주민번호 실명인증 으로 가기위한 초기화값 -->
						<input type="hidden" name="ihidnum" value=""/>
						<input type="hidden" name="realname" value=""/>
						<!-- 실명인증후 다음단계에 대한 셋팅정보 -->
						<input type="hidden" name ="nextUrlName" value="button.subscribe"/>
						<input type="hidden" name ="nextUrl" value=
						<c:if test="${sbscrbTy == 'USR01'}">"/uss/umt/EgovMberSbscrbView.do"</c:if>
						<c:if test="${sbscrbTy == 'USR02'}">"/uss/umt/EgovEntrprsMberSbscrbView.do"</c:if>
						<c:if test="${empty sbscrbTy}">""</c:if>
						/>
		                <div class="join_box">
		                    <!-- <label for="term_all" class="chk_all">전체 선택<input type="checkbox" name="term_all" id="term_all"></label> -->
		                    
		                    <div class="terms mem_form">
		                        <div class="tit">
		                            <span title="회원가입 이용약관">회원가입 이용약관</span>
		                            <label for="term1">회원가입 이용약관 내용에 동의합니다.
		                                <input type="checkbox" name="term" id="term1">
		                            </label>
		                        </div>
		                        <div class="text_area" tabindex="0"><c:out value="${conditions}" escapeXml="false"/></div>
		                    </div>
		                    
		                    <!--end terms 운영약관-->
		                    <div class="terms mem_form">
		                        <div class="tit">
		                            <span title="개인정보 이용약관">개인정보 이용약관</span>
		                            <label for="term2">개인정보 이용약관 내용에 동의합니다.
		                                <input type="checkbox" name="term" id="term2">
		                            </label>
		                        </div>
		                        <div class="text_area" tabindex="0"><c:out value="${information}" escapeXml="false"/></div>
		                    </div>
		                    <!--end terms 개인정보 이용약관-->
							<div class="text_area">
			                    <span class="txtRed">회원가입 약관 및 개인정보 이용약관에 동의하셔야 회원가입 하실 수 있습니다.</span>
	        		        </div>
		                    <a href="javascript:fnAgree();">회원가입</a>
		                    
		                </div>
		            </form>
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