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
	<h2>SNS 입력</h2>
	<form:form commandName="snsManageVO" action="/snsUpdate.do" name="snsManageVO" method="post" onSubmit="fnUpdate(document.forms[0]); return false;" enctype="multipart/form-data">
		<input type="hidden" name="snsId" id="snsId" value='<c:out value="${snsManageVO.snsId}"/>'/>
		<input type="hidden" name="snsRegistId" id="snsRegistId" value='<c:out value="${snsManageVO.snsRegistId}"/>'/>
		
		<div class="wTableFrm">
			
			<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">

		        <tr>
		            <th class="tg-c3ow">제목</th>
		            <td class="tg-c3ow"><input type="text" id="snsTitle" name="snsTitle" value='<c:out value="${snsManageVO.snsTitle}"/>'></td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">타입</th>
		            <td class="tg-c3ow">
		            	<%-- <input type="text" id="snsType" name="snsType" value="<c:out value="${snsManageVO.snsType}"/>"> --%>
		            	<select name="snsType" id="snsType">
		            		<option value="1" <c:if test="${snsManageVO.snsType == 1 }">selected</c:if> >인스타그램</option>
		            		<option value="2" <c:if test="${snsManageVO.snsType == 2 }">selected</c:if>>유튜브</option>
		            	</select>
		            </td>
		        </tr>
		        <tr>
		            <th class="tg-c3ow">링크</th>
		            <td class="tg-c3ow"><input type="text" id="snsLink" name="snsLink" value='<c:out value="${snsManageVO.snsLink}"/>'></td>
		        </tr>
		        <c:if test='${snsManageVO.snsFile != null }'>
		        <tr>
		        	<th>현재 이미지</th>
		        	<td>
		        		<img src="/cmm/fms/getImage.do?atchFileId=${snsManageVO.snsFile}" alt="<c:out value='${snsManageVO.snsTitle}'/>" style="width:100%;">
		        	</td>
		        </tr>
		        </c:if>
		        <tr>
					<th>이미지</th>
					<td class="nopd" >
						<input name="file_1" id="egovComFileUploader" type="file" title="SNS IMG"/>
					</td>
				</tr>
	        
			</table>
			<div style="margin-top:30px;text-align: center;">
				<input type="submit" class="s_submit" value="수정" title="수정"/>
				<a class="btn_s2 gray" href="<c:url value='/snsManage.do' />"  title="목록"> 목록 </a>
				
			</div>
		</div>

	</form:form>
	
</div>
	
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>	
	
