<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssUmt.deptUserManage.title"/></c:set>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">


<script type="text/javaScript" language="javascript" defer="defer">
function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}

function fnUpdate(form){
	if(confirm("<spring:message code="common.save.msg" />")){
	    
		/* var dues = document.paidMemberVO.dues.value;
		var name = document.paidMemberVO.name.value;
		var birthday = document.paidMemberVO.birthday.value;
		var post = document.paidMemberVO.post.value;
		var sms = document.paidMemberVO.sms.value;
		var phone = document.paidMemberVO.phone.value;
		var tel = document.paidMemberVO.tel.value;
		var zip = document.paidMemberVO.zip.value;
		var address1 = document.paidMemberVO.address1.value;
		var address2 = document.paidMemberVO.address2.value;
		var mberEmailAdres = document.paidMemberVO.mberEmailAdres.value;
				
		if(name == ''){
			alert('성명을 입력하세요.');
			return;
		}
				
		if(birthday == ''){
			alert('생년월일을 입력하세요');
			return;
		}
		
		if(tel == ''){
			alert('전화를 입력하세요');
			return;
		}
		
		if(zip == '' || address1=='' || address2 ==''){
			alert('주소를 입력하세요.');
			return;
		}
		
		if(phone == ''){
			alert('핸드폰을 입력하세요');
			return;
		}
		
		if(mberEmailAdres == ''){
			alert('이메일주소를 입력하세요');
			return;
		}
		 */
		
		document.eduProgramVO.submit();
	    return true;
	    
	}
}


</script>


<div class="layout-container">
	<h2>교육/체험 신청 상세</h2>
	<form:form commandName="eduProgramVO" action="/eduMemberUpdate.do" name="eduProgramVO" method="post" onSubmit="fnUpdate(document.forms[0]); return false;">
		<input type="hidden" name="eduId" id="eduId" value='<c:out value="${eduProgramVO.eduId}"/>'/>
		<input type="hidden" name="registId" id="registId" value='<c:out value="${eduProgramVO.registId}"/>'/>
		
		<div class="wTableFrm">
			
			<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">

		        <tr>
		            <th class="tg-c3ow">성명</th>
		            <td class="tg-c3ow"><input type="text" id="mberNm" name="mberNm" value='<c:out value="${eduProgramVO.mberNm}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">교육명</th>
		            <td class="tg-c3ow"><input type="text" id="nttSj" name="nttSj" value="<c:out value="${eduProgramVO.nttSj}"/>"></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">신청일</th>
		            <td class="tg-c3ow"><input type="text" id="registDate" name="registDate" value='<c:out value="${eduProgramVO.registDate}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">승인일</th>
		            <td class="tg-c3ow"><input type="text" id="agreeDate" name="agreeDate" value='<c:out value="${eduProgramVO.agreeDate}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">승인자</th>
		            <td class="tg-c3ow"><input type="text" id="agreeId" name="agreeId" value='<c:out value="${eduProgramVO.agreeId}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">승인여부</th>
		            <td class="tg-c3ow">
		            	<select name="status">
		            		<option value="I" <c:if test="${eduProgramVO.status=='I'}">selected</c:if>>승인대기</option>
		            		<option value="C" <c:if test="${eduProgramVO.status=='C'}">selected</c:if>>승인완료</option>
		            		<option value="N" <c:if test="${eduProgramVO.status=='N'}">selected</c:if>>승인거부</option>
		            	</select>
		            </td>
		        </tr>
	        
			</table>
			<div style="margin-top:30px;text-align: center;">
				<input type="submit" class="s_submit" value="수정" title="수정"/>
				<a class="btn_s2 gray" href="<c:url value='/eduList.do' />"  title="목록">
					목록
				</a>
				
			</div>
		</div>

	</form:form>
	
</div>
	
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>	
	
