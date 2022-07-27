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

function snsManageView(id){
	document.listForm.selectedId.value = id;
    document.listForm.action = "/snsManageView.do";
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

function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/snsManage.do'/>";
    document.listForm.submit();
}




<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>

</script>

<style>
.layout-container form { border-top: 0; padding: 0 !important;}
.search_box { margin-bottom: 1.2rem;}
</style>

</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="layout-container">

	<h1>SNS 신청관리</h1>
	

<form id="listForm" name="listForm" action="<c:url value='/snsManage.do'/>" method="post"> 
	<div class="board">
		<!-- 검색영역 -->
		<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
			<ul>
				<li><!-- 조건 -->
	                <select name="searchCondition" id="searchCondition" title="<spring:message code="comUssUmt.userManageSsearch.searchConditioTitle" />"><!--  -->
		                <option value="0" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >검색</option>
	                    <option value="1" <c:if test="${userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >인스타그램</option><!-- ID  -->
	                    <option value="2" <c:if test="${userSearchVO.searchCondition == '2'}">selected="selected"</c:if> >유튜브</option><!-- Name -->
	                </select>
				</li>
				<!-- 검색키워드 및 조회버튼 -->
				<li>
				<%-- 	<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${userSearchVO.searchKeyword}"/>'  maxlength="255" > --%>
					<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
					<input type="button" class="s_btn" onClick="fnDeleteUser(); return false;" value="<spring:message code="title.delete" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" />
					<span class="btn_b"><a href="<c:url value='/snsInsertView.do'/>" onClick="fnAddUserView(); return false;"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span> 
				</li>
			</ul>
		</div>
	
	
		<table class="datatables-demo table table-striped table-bordered dataTable no-footer" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
			<caption>${pageTitle} <spring:message code="title.list" /></caption>
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 5%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
				<col style="width: 50%;">
				<col style="width: 10%;">

			</colgroup>
			<thead>
			<tr>
				<th><spring:message code="table.num" /></th><!-- 번호 -->
				<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fnCheckAll()" title="<spring:message code="input.selectAll.title" />"></th>
				<th>분류</th>
				<th class="board_th_link">제목</th>
				<th>링크</th>
				<th>신청일</th>
		
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
				        <input name="checkId" type="hidden" value="<c:out value='${result.snsId}'/>"/>
				    </td>
				    <td>
				    	<c:if test="${result.snsType.equals('1')}">
				    		인스타그램
				    	</c:if>
				    	<c:if test="${result.snsType.equals('2')}">
				    		유튜브
				    	</c:if>
				    
				    </td>
				    <td><a href="javascript:snsManageView('<c:out value="${result.snsId}"/>')"><c:out value="${result.snsTitle}"/></a></td>
				    
				    <td><c:out value="${result.snsLink}"/></td>
				    <td><c:out value="${fn:substring(result.snsRegistDate,0,10)}"/></td>
				    
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<!-- paging navigation -->
		<div class="pagination">
			<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/></ul>
		</div>
		
		<input name="selectedId" type="hidden" />
		<input name="checkedIdForDel" type="hidden" />
		<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	</div>
	
</form>

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
