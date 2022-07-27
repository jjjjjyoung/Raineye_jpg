<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.userManage.title"/></c:set>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/jsbn.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rsa.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/prng4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rng.js'/>"></script>	

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">



<script type="text/javaScript" language="javascript" defer="defer">
function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.mberManageVO.checkedIdForDel.value=checkedIds;
	    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberDelete.do'/>";
	    document.mberManageVO.submit();
	}
}
function fnPasswordMove(){
    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberPasswordUpdtView.do'/>";
    document.mberManageVO.submit();
}

function fnLockIncorrect(){
	if(confirm("<spring:message code="comUssUmt.common.lockAtConfirm" />")){
	    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberLockIncorrect.do'/>";
	    document.mberManageVO.selectedId.value=document.mberManageVO.uniqId.value;
	    document.mberManageVO.submit();
	}
}

function fnUpdate(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		var password = document.mberManageVO.password.value;
		var password2 = document.mberManageVO.password2.value;
		var mberNick = document.mberManageVO.mberNick.value;
		var birthday = document.mberManageVO.birthday.value;
		var sexdstnCode = document.mberManageVO.sexdstnCode.value;

		/* if(password == ''){
			alert('비밀번호는 필수값입니다.');
			return;
		}
				
		if(password2 == ''){
			alert('비밀번호확인은 필수값입니다.');
			return;
		} 
		
		var regex = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

		if(!regex.test(password)){
			alert('비밀번호는 영문,특수문자,숫자 포함 형태의 8~20자리로 입력해주세요.');
			return;
		}
		
		if(password != password2){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
		*/
		if(birthday == ''){
			alert('생년월일은 필수값입니다.');
			return;
		}

		document.mberManageVO.submit();
		return true;
	}
}
</script>

<style>
.layout-container form { width:100% !important;}
div.btn { margin-left: 26%;}
</style>

</head>
<body>

<div class="layout-container">

	<h2>${pageTitle} <spring:message code="title.update" /></h2>

<!-- content start -->
<form:form commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovMberSelectUpdt.do" name="mberManageVO"  method="post" onSubmit="fnUpdate(document.forms[0]); return false;"> 

	<input type="hidden" name="uniqId" id="uniqId" value='<c:out value="${mberManageVO.uniqId}"/>' />
	<input type="hidden" id="mberNm" name="mberNm"  value='<c:out value="${mberManageVO.mberNm}"/>' >
   	<input type="hidden" id="mberId" name="mberId" value="<c:out value="${mberManageVO.mberId}"/>"  >
   	<input type="hidden" name="selectedId" id="selectedId" value='' />
   	
   	<input type="hidden" id="mberEmailAdres" name="mberEmailAdres" value="<c:out value="${mberManageVO.mberEmailAdres}"/>" >
	<div class="wTableFrm">
		<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
		<caption>${pageTitle} <spring:message code="title.create" /></caption>
		<colgroup>
			<col style="width: 22%;"><col style="width: ;">
		</colgroup>
		<tbody>
			
			<tr>
	            <th>
	                <label for="mberNm">이름</label>
	            </th>
	            <td>
	                <c:out value="${mberManageVO.mberNm}"/>
	            </td>
	        </tr>
	
	        <tr>
	            <th>
	                <label for="mberId">아이디</label>
	            </th>
	            <td>
	                <c:out value="${mberManageVO.mberId}"/>
	            </td>
	        </tr>
	        <tr>
	            <th>
	                <label for="mberEmailAdres">E-mail</label>
	            </th>
	            <td>
	                <c:out value="${mberManageVO.mberEmailAdres}"/>
	                 <!-- 
	                <button type="button" class="btn03" onclick="fn_email_check()">중복확인</button>
	                <p id="emailDuple">&#8251; 본인 확인 수단으로 사용 되므로 정확히 입력해 주시기 바랍니다.</p>
	                 -->
	            </td>
	        </tr>
	        <tr>
	            <th class="tg-c3ow">생년월일</th>
	            <td class="tg-c3ow"><input type="date" title="예).2020-03-04" name="birthday" id="birthday" value="<c:out value="${mberManageVO.birthday}"/>" ></td>
	        </tr>
	
	        <tr>
	            <th>
	                <label for="mberNick">별명</label>
	            </th>
	            <td>
	                <input type="text" id="mberNick" name="mberNick" maxlength="10" value="<c:out value="${mberManageVO.mberNick}"/>" class="long" size="10" placeholder="별명">
	                <p class="info-txt">공백없이 한글, 영문, 숫자만 입력 가능 (한글2자, 영문4자 이상)</p>
	                <p class="info-txt">별명을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.</p>
	            </td>
	        </tr>
	
	        <tr>
	            <th>
	                <span>성별</span>
	            </th>
	            <td>
	                <label for="F"><input type="radio" value="F" name="sexdstnCode" id="F" <c:if test="${mberManageVO.sexdstnCode=='F'}">checked</c:if>>여자</label>
	                <label for="M"><input type="radio" value="M" name="sexdstnCode" id="M" <c:if test="${mberManageVO.sexdstnCode=='M'}">checked</c:if>>남자</label>
	            </td>
	        </tr>
			<tr>
			    <th>
			        <span>회원 등급</span>
			    </th>
			    <td>
			        <label for="level1"><input type="radio" name="level" id="level1" value="1" <c:if test="${mberManageVO.level=='1'}">checked</c:if>>일반회원</label>
			        <label for="level2"><input type="radio" name="level" id="level2" value="2" <c:if test="${mberManageVO.level=='2'}">checked</c:if>>유료회원(1년)</label>
			        <label for="level3"><input type="radio" name="level" id="level3" value="3" <c:if test="${mberManageVO.level=='3'}">checked</c:if>>유료회원(평생)</label>
			    </td>
			</tr>
	
	
	        <tr>
	            <th>
	                <label for="password">패스워드</label>
	            </th>
	            <td>
	                <input type="password" name="password" id="password" class="long" maxlength="20" placeholder="패스워드" value="">
	            </td>
	        </tr>
	
	        <tr>
	            <th>
	                <label for="password2">패스워드 확인</label>
	            </th>
	            <td>
	                <input type="password" name="password2" id="password2" class="long" maxlength="20" placeholder="비밀번호 확인" value="">
	                <p class="info-txt">&#8251; 숫자와 영문자, 특수문자 [ !@#$%^&*()+=- ] 조합 8~12자리</p>
	            </td>
	        </tr>
	
	        <tr>
	            <th>
	                <span>메일링서비스</span>
	            </th>
	            <td>
	                <label for="mailling1"><input type="radio" name="mailling" id="mailling1" value="Y" <c:if test="${mberManageVO.mailling=='Y'}">checked</c:if>>수신동의</label>
	                <label for="mailling2"><input type="radio" name="mailling" id="mailling2" value="N" <c:if test="${mberManageVO.mailling=='N'}">checked</c:if>>수신하지 않음</label>
	            </td>
	        </tr>
	
	        <tr>
	            <th>
	                <span>SMS 수신여부</span>
	            </th>
	            <td>
	                <label for="opt-in1"><input type="radio" name="sms" id="opt-in1" value="Y" <c:if test="${mberManageVO.sms=='Y' }">checked</c:if>>수신동의</label>
	                <label for="opt-in2"><input type="radio" name="sms" id="opt-in2" value="N" <c:if test="${mberManageVO.sms=='N' }">checked</c:if>>수신하지 않음</label>
	            </td>
	        </tr>
	
	        <tr>
	            <th>
	                <span>정보공개</span>
	            </th>
	            <td>
	               
	                  <label for="infoOpen"><input type="checkbox" name="infoOpen" id="infoOpen" value="Y" <c:if test="${mberManageVO.infoOpen=='Y' }">checked</c:if>>다른 분들이 나의 정보를 볼 수 있도록 합니다.</label>
	            </td>
	        </tr>
		</tbody>
		</table>			
	
	
		<div class="btn">
			<input type="submit" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" />
			<button class="btn_s2" style="margin-left:10px !important;" onClick="fnDeleteMber('<c:out value='${mberManageVO.userTy}'/>:<c:out value='${mberManageVO.uniqId}'/>'); return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="button.delete" /></button>
			<span class="btn_s"><a href="<c:url value='/uss/umt/EgovMberManage.do' />"  title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
			<%-- <button class="btn_s2 gray" style="margin-left:10px !important;" onClick="fnPasswordMove(); return false;" title="<spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /></button> --%>
			<button class="btn_s2 gray" onClick="fnLockIncorrect(); return false;" title="<spring:message code="comUssUmt.common.lockAtBtn" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.common.lockAtBtn" /></button>
	<%-- 		<button class="btn_s2 gray" onClick="document.mberManageVO.reset(); return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />"><spring:message code="button.reset" /></button> --%>
		</div><div style="clear:both;"></div>
	</div>
</form:form>
<!-- content end -->

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>