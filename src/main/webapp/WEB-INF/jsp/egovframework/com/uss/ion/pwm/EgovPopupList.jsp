<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javaScript" language="javascript">
/* ********************************************************
 ******************************************************* */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/pwm/listPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 ******************************************************** */
function fn_egov_regist_PopupManage(){
	location.href = "<c:url value='/uss/ion/pwm/registPopup.do' />";
}
/* ********************************************************
 ******************************************************** */
function fn_egov_detail_PopupManage(popupId){
	var vFrom = document.listForm;
	vFrom.popupId.value = popupId;
	vFrom.action = "<c:url value='/uss/ion/pwm/detailPopup.do' />";
	vFrom.submit();
}

/* ********************************************************
 ******************************************************** */
function fn_egov_search_PopupManage(){
	var vFrom = document.listForm;
	
	vFrom.action = "<c:url value='/uss/ion/pwm/listPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
******************************************************** */
function fn_egov_checkAll_PopupManage(){

	var FLength = document.getElementsByName("checkList").length;
	var checkAllValue = document.getElementById('checkAll').checked;

	//undefined
	if( FLength == 1){
		document.getElementById("checkList").checked = checkAllValue;
	}{
			for(var i=0; i < FLength; i++)
			{
				document.getElementsByName("checkList")[i].checked = checkAllValue;
			}
		}

}
/* ********************************************************
******************************************************** */
function fn_egov_view_PopupManage(){


	var FLength = document.getElementsByName("checkList").length;
	var check = 0;
	
	if( FLength == 1){
		if(document.getElementById("checkList").checked == true){
			fn_egov_ajaxPopupInfo_PopupManage( document.getElementById("checkList").value );
			check ++;
		}
	}else{
		for(var i=0; i < FLength; i++)
		{
			if(document.getElementsByName("checkList")[i].checked == true){
				check ++;
				fn_egov_ajaxPopupInfo_PopupManage( document.getElementsByName("checkList")[i].value );
				}
		}
		}
	
	if(check == 0){
		alert("<spring:message code="ussIonPwm.popupList.checkAlert"/>");/* ì²´í¬ë°ì¤ë¥¼ íë ì´ì ì íí´ ì£¼ì¸ì. */
			}
	
	return;

}
/* ********************************************************
******************************************************** */
function fn_egov_ajaxPopupInfo_PopupManage(popupIds){
	var url = "<c:url value='/uss/ion/pwm/ajaxPopupManageInfo.do' />";

	var param = {
			popupId: popupIds
	};

	new Ajax.Request(url,
   {
     asynchronous:true,
     method:"post",
     parameters: param ,
     evalJSON:     false,
     evalJS:       false,
    onLoading  : function() { },
    onSuccess  : function(returnValue)
    {
    	var returnValueArr = returnValue.responseText.split("||");

    	//if(fnGetCookie(popupIds) == null ){
    	   	fn_egov_popupOpen_PopupManage(popupIds,
        	    	returnValueArr[0],
        	    	returnValueArr[1],
        	    	returnValueArr[2],
        	    	returnValueArr[3],
        	    	returnValueArr[4],
        	    	returnValueArr[5]);
    	//}

    },
    onFailure: function() {},
    onComplete : function() {}
   });
}

/* ********************************************************
******************************************************** */
function fn_egov_popupOpen_PopupManage(popupId,fileUrl,width,height,top,left,stopVewAt){

	var url = "<c:url value='/uss/ion/pwm/openPopupManage.do' />?";
	url = url + "fileUrl=" + fileUrl;
	url = url + "&stopVewAt=" + stopVewAt;
	url = url + "&popupId=" + popupId;
	var name = popupId;
	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if (window.focus) {openWindows.focus()}
}

/* ********************************************************
******************************************************** */
function fnGetCookie(name) {
	  var prefix = name + "=";

	  var cookieStartIndex = document.cookie.indexOf(prefix);
	  if (cookieStartIndex == -1) return null;
	  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;


	  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
}

</script>
</head>
<body>

<div class="layout-container">
 

<div class="board">
<form name="listForm" action="<c:url value='/uss/ion/pwm/listPopup.do'/>" method="post">
	<h1><spring:message code="ussIonPwm.popupList.popupList"/></h1>
	<%-- <span style="display: block; padding: 10px;"><spring:message code="ussIonPwm.popupList.guide"/> </span> --%>

	<div class="search_box" title="<spring:message code="common.noScriptTitle.msg"/>">
		<ul>
			<li>
				<select name="searchCondition" class="select" title="<spring:message code="select.searchCondition"/>">
					<option value=''>--<spring:message code="input.select"/>--</option>
					<option value='POPUP_SJ_NM' <c:if test="${searchCondition == 'POPUP_SJ_NM'}">selected</c:if>><spring:message code="ussIonPwm.popupList.popupTitleNm"/></option>
					<option value='FILE_URL' <c:if test="${searchCondition == 'FILE_URL'}">selected</c:if>><spring:message code="ussIonPwm.popupList.fileUrl"/></option>
				</select>
				<input class="s_input2 vat" name="searchKeyword" type="text" value="" size="10" onkeypress="press();" title="<spring:message code="input.input"/>" />
				
				
				<%-- <span class="btn_b"><a style="background:#6bc3b0;" href="" onclick="fn_egov_view_PopupManage(); return false;" title=""><spring:message code="button.preview"/></a></span> --%>
				<input class="s_btn" style="margin-left:0.8rem;" type="submit" value="<spring:message code="button.inquire" />" title="<spring:message code="button.inquire" />" onclick="fn_egov_search_PopupManage(); return false;" />
				<span class="btn_b"><a href="<c:url value='/uss/ion/pwm/registPopup.do'/>" onclick="" title="<spring:message code="button.create" />"><spring:message code="button.create" /></a></span>
			</li>
		</ul>
	</div>
<input name="popupId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${popupManageVO.pageIndex}'/>"/>
</form>

	<table class="datatables-demo table table-striped table-bordered dataTable no-footer" >
		<caption></caption>

		<thead>
			<tr>
			   <th scope="col"><spring:message code="table.num"/></th>
			   <th scope="col"><spring:message code="ussIonPwm.popupList.popupTitleNm"/></th>
			   <th scope="col"><spring:message code="ussIonPwm.popupList.ntcePeriod"/></th>

			   <th scope="col"><spring:message code="ussIonPwm.popupList.ntceAt"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr>
				<td style="width:5%;"><c:out value="${(popupManageVO.pageIndex-1) * popupManageVO.pageSize + status.count}"/></td>
				<td>
					<form name="subForm" method="post" action="<c:url value='/uss/ion/pwm/detailPopup.do'/>" >
						<input name="popupId" type="hidden" value="${resultInfo.popupId}">
						<input name="pageIndex" type="hidden" value="<c:out value='${popupManageVO.pageIndex}'/>"/>
						<span class="link"><input type="submit" style="width:200px;text-align:left;" value="<c:out value="${resultInfo.popupTitleNm}"/>" onclick="fn_egov_detail_PopupManage('${resultInfo.popupId}'); return false;"></span>
					</form>
				</td>
				<td>
					<c:out value="${fn:substring(resultInfo.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceBgnde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceBgnde, 10, 12)}"/>M
					~
					<c:out value="${fn:substring(resultInfo.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceEndde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceEndde, 10, 12)}"/>M
				 

				
				<td>
					<c:out value="${resultInfo.ntceAt}"/>
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="6">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
		</ul>
	</div>
</div>

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

