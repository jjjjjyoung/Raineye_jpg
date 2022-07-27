<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<script>

function fn_egov_select_linkPage(pageNo){
	document.articleForm.pageIndex.value = pageNo;
	document.articleForm.action = "<c:url value='/userHistory.do'/>";
   	document.articleForm.submit();
}

	function calcleEdu(eduId){
		
		var defaultForm = document.defaultForm;
		defaultForm.eduId.value = eduId;
		
		if (confirm("해당 교육을 취소하시겠습니까?")) {
			
			defaultForm.action="/cancleEdu.do";
			defaultForm.submit();
			
		}
	}

</script>
<form name="defaultForm" id="defaultForm" action="" method="post">
	<input type="hidden" name="eduId" id="eduId" value=""/>
</form>
<div id="subWrap" class="login join mypage sub01">
    <div class="sub_visual">
        <h2>신청내역</h2>
    </div>

    <div id="container">
        <!--start content-->
        <div class="contentWrap">
	        <div class="inner">
	            <div class="leftMenu2">
	                <strong>마이페이지</strong>
	                <ul>
	                    <li><a href="/mypage.do">회원정보수정</a></li>
	                    <li><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                    <li class="on"><a href="/userHistory.do">신청내역</a></li>
	                    <li><a href="/userOut.do">회원탈퇴</a></li>
	                </ul>
	            </div>
	            <!--end leftMenu2-->
	            <div id="go_direct">
					<div class="app_history">
						<span>접수 후 입금 확인이 되면 &#91;등록완료&#93;로 바뀝니다.</span>
						<ul>
							<c:forEach var="result" items="${list}">
								<li>
									<div>
										<c:if test="${result.eduVal == '1'}">
											<strong>&#91;교육프로그램&#93;</strong>
										</c:if>
										<c:if test ="${result.eduVal == '2' }">
											<strong>&#91;체험프로그램&#93;</strong>
										</c:if>
										<strong>&#91;<c:out value="${result.nttSj}" />&#93;</strong>
										<strong>&#91;클래스 : <c:out value="${result.eduType}" />&#93;</strong>
									</div>
									<span>신청날짜 : <c:out value="${fn:substring(result.registDate,0,10)}" /></span>
									<c:if test="${result.status == 'N' }">
										<span style="margin-left:5%;">취소날짜 : <c:out value="${fn:substring(result.cancleDate,0,10)}" /></span>
									</c:if>
									<c:if test="${result.status == 'C' }">
										<span style="margin-left:5%;">승인날짜 : <c:out value="${fn:substring(result.agreeDate,0,10)}" /></span>
									</c:if>
									<div class="btn_area posA">
										<c:if test="${result.status == 'I' }">
											<span class="ing">접수 중</span>
											<a href="javascript:calcleEdu('<c:out value="${result.eduId }"/>');" class="app_cs_btn">취소</a>
										</c:if>
										<c:if test="${result.status == 'C' }">
											<span class="comp">등록완료</span>
										</c:if>
										<c:if test="${result.status == 'N' }">
											<span class="comp">접수취소</span>
										</c:if>
									</div>
								</li>
							</c:forEach>
						</ul>
						<div class="pageindex">
							<div class="userHistoryPage">
								<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
							</div>
						</div>
					</div>
					
					<form name="articleForm" action="<c:url value='/userHistory.do'/>" method="post" onSubmit="fn_egov_search_article(); return false;"> 
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
					</form>
					
					<div class="app_history hmgh_history">
						<span>접수 후 입금 확인이 되면 &#91;승인완료&#93;로 바뀝니다.</span>
						
						<ul>
							<c:forEach var="result" items="${resultList}">
								<li>
									<div>
										<c:if test="${result.dues == '1'}">
											<strong>&#91;1년&#93;</strong>
										</c:if>
										<c:if test ="${result.dues == '2' }">
											<strong>&#91;평생&#93;</strong>
										</c:if>
										<strong>유료회원</strong>
									</div>
									<span>신청날짜 : <c:out value="${fn:substring(result.regiDate,0,10)}" /></span>
									<c:if test="${result.mberStatus == 'C' }">
										<span style="margin-left:5%;">승인날짜 : <c:out value="${fn:substring(result.agreeDate,0,10)}" /></span>
									</c:if>
									<div class="btn_area posA">
										<c:if test="${result.mberStatus == 'I' }">
											<span class="comp">접수 중</span>
											<%-- <a href="javascript:calcleEdu('<c:out value="${result.eduId }"/>');" class="app_cs_btn">취소</a> --%>
										</c:if>
										<c:if test="${result.mberStatus == 'C' }">
											<span class="comp">등록완료</span>
										</c:if>
										
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
	            </div>
	            <!--end app_history-->
	        </div>
	        <!--end inner-->
		</div>
		<!--end contentWrap-->
    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>