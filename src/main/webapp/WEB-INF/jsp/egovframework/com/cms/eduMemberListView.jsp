<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javaScript" language="javascript" defer="defer">

function fn_egov_excel(id) {
	document.listForm.selectedId.value = id;
	document.listForm.action = "/excelDownload.do";
   	document.listForm.submit();
}
function fnCheckAll() {
    var checkField = document.listForm.checkField;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function eduMemberView(id){
	document.listForm.selectedId.value = id;
    document.listForm.action = "/eduMemberView.do";
    document.listForm.submit();
}

function fnDeleteUser(){
	var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm("<spring:message code="common.delete.msg" />")){
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/paidMemberDel.do'/>";
            document.listForm.submit();
        }
    }
}

<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>

</script>
<div class="layout-container">
	<h1>교육/체험 신청관리</h1>
	<form id="listForm" name="listForm" action="<c:url value='/eduList.do'/>" method="post" style="width:75% !important"> 
	<div class="board">
	
	
		<table class="datatables-demo table table-striped table-bordered dataTable no-footer" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
			<caption>${pageTitle} <spring:message code="title.list" /></caption>
					<a class="excel_donwload" href="#link" onClick="fn_egov_excel('<c:out value="${idx}"/>'); return false;">목록 엑셀 다운로드</a>
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 5%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
				<col style="width: 15%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
			</colgroup>
			<thead>
			<tr>
				<th><spring:message code="table.num" /></th><!-- 번호 -->
				<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fnCheckAll()" title="<spring:message code="input.selectAll.title" />"></th>
				<th class="board_th_link">신청자</th>
				<th>신청자 전화번호</th>
				<th>이메일</th>
				<th>교육명</th>
				<th>클래스</th>
				<th>신청일</th>
				<th>승인일</th>
				<th>승인여부</th>
		
			</tr>
			</thead>
			<tbody class="ov">
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="9"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
				    <td><c:out value="${status.count}"/></td>
				    
				    <td>
				        <input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
				        <input name="checkId" type="hidden" value="<c:out value='${result.eduId}'/>"/>
				    </td>
				    
				    <td><a href="javascript:eduMemberView('<c:out value="${result.eduId}"/>')"><c:out value="${result.mberNm}"/></a></td>
				    
				    <td><c:out value="${result.eduApplyTel}"/></td>
				    <td><c:out value="${result.eduEmail}"/></td>
				    <td><c:out value="${result.nttSj}"/></td>
				    <td><c:out value="${result.eduType}"/></td>
				    <td><c:out value="${fn:substring(result.registDate,0,10)}"/></td>
				    <td><c:out value="${fn:substring(result.agreeDate,0,10)}"/></td>
				    <td>
			    		<c:if test="${result.status == 'I'}">
			    			신청 중
				    	</c:if>
				    	<c:if test="${result.status == 'C'}">
			    			신청 완료
				    	</c:if>
				    	<c:if test="${result.status == 'N'}">
			    			신청 취소
				    	</c:if>
				    </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<input name="selectedId" type="hidden" />
		<input name="checkedIdForDel" type="hidden" />
		<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	</div>
</form>
</div>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
