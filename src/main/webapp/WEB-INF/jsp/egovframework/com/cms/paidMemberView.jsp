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
	    
		var dues = document.paidMemberVO.dues.value;
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
		
		
		document.paidMemberVO.submit();
	    return true;
	    
	}
}


</script>


<div class="layout-container">
	<h2>유료회원 신청 상세</h2>
	<form:form commandName="paidMemberVO" action="/paidMemberUpdate.do" name="paidMemberVO" method="post" onSubmit="fnUpdate(document.forms[0]); return false;">
		<input type="hidden" name="idx" id="idx" value='<c:out value="${paidMemberVO.idx}"/>'/>
		<input type="hidden" name="dues" id="dues" value='<c:out value="${paidMemberVO.dues}"/>'/>
		<input type="hidden" name="mberId" id="mberId" value='<c:out value="${paidMemberVO.mberId}"/>'/>
		<div class="wTableFrm">
			
			<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
				<tr>
		            <th class="tg-wp8o" >회비</th>
		            <td class="tg-wp8o" >
		            	<c:choose>
		            		<c:when test="${paidMemberVO.dues=='1'}">
		            			20,000 원정(1년 회원)
		            		</c:when>
		            		<c:otherwise>
		            			100,000 원정(평생회원)
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">성명</th>
		            <td class="tg-c3ow"><input type="text" id="name" name="name" value='<c:out value="${paidMemberVO.name}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">생년월일</th>
		            <td class="tg-c3ow"><input type="text" id="birthday" name="birthday" value="<c:out value="${paidMemberVO.birthday}"/>"></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">우편발송</th>
		            <td class="tg-c3ow post">
		                <label for="post_o">유<input type="radio" name="post" id="post_o" value="Y" <c:if test="${paidMemberVO.post=='Y'}">checked</c:if>></label>
		                <label for="post_x">무<input type="radio" name="post" id="post_x" value="N" <c:if test="${paidMemberVO.post=='N'}">checked</c:if>></label>
		            </td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow sms">문자발송</th>
		            <td class="tg-c3ow sms">
		                <label for="sms_o">유<input type="radio" name="sms" id="sms_o" value="Y" <c:if test="${paidMemberVO.sms=='Y'}">checked</c:if> ></label>
		                <label for="sms_x">무<input type="radio" name="sms" id="sms_x" value="N" <c:if test="${paidMemberVO.sms=='N'}">checked</c:if> ></label>
		            </td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">핸드폰</th>
		            <td class="tg-c3ow"><input type="text" id="phone" name="phone" value='<c:out value="${paidMemberVO.phone}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">자택주소</th>
		            <td class="tg-0pky adr">
		                <input type="text" placeholder="우편번호" id="zip" name="zip" value='<c:out value="${paidMemberVO.zip}"/>'>
		                <br>
		                <input type="text" style="width:70%;margin-top:5px;" name="address1" id="address1" class="long" placeholder="기본주소" value='<c:out value="${paidMemberVO.address1}"/>'><br>
		                <input type="text" style="width:70%;margin-top:5px;" name="address2" id="address2" class="long" placeholder="상세주소" value='<c:out value="${paidMemberVO.address2}"/>'>
		                
		            </td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">전화</th>
		            <td class="tg-c3ow"><input type="text" id="tel" name="tel" value='<c:out value="${paidMemberVO.tel}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">E-mail</th>
		            <td class="tg-c3ow"><input type="email" id="mail" name="mberEmailAdres" value='<c:out value="${paidMemberVO.mberEmailAdres}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">승인여부</th>
		            <td class="tg-c3ow">
		            	<select name="mberStatus">
		            		<option value="I" <c:if test="${paidMemberVO.mberStatus=='I'}">selected</c:if>>승인대기</option>
		            		<option value="C" <c:if test="${paidMemberVO.mberStatus=='C'}">selected</c:if>>승인완료</option>
		            		<option value="N" <c:if test="${paidMemberVO.mberStatus=='N'}">selected</c:if>>승인거부</option>
		            	</select>
		            </td>
		        </tr>
	        
			</table>
			<div style="margin-top:30px;text-align: center;">
				<input type="submit" class="s_submit" value="수정" title="수정"/>
				<a class="btn_s2 gray" href="<c:url value='/paidMemberList.do' />"  title="목록">
					목록
				</a>
				
			</div>
		</div>

	</form:form>
	
</div>
	
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>	
	
