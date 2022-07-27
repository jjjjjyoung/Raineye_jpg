<%--
  Class Name : EgovPopupRegist.jsp
  Description : 팝업창관리 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.09.16    장동한          최초 생성
     2018.08.29    이정은          공통컴포넌트 3.8 개선

    author   : 공통서비스 개발팀 장동한
    since    : 2009.09.16

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">


<script >
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_PopupManage(){

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_PopupManage(){
	var popupTitleNm = document.getElementById('popupTitleNm').value;
	var popCn = CKEDITOR.instances.popCn.getData();
	var popupWlc = document.getElementById('popupWlc').value;
	var popupWSize = document.getElementById('popupWSize').value;
	var ntceBgndeYYYMMDD = document.getElementById('ntceBgndeYYYMMDD').value;
	var ntceEnddeYYYMMDD = document.getElementById('ntceEnddeYYYMMDD').value;
	var iChkBeginDe = Number( ntceBgndeYYYMMDD.replaceAll("-","") );
	var iChkEndDe = Number( ntceEnddeYYYMMDD.replaceAll("-","") );
	var varFrom = document.popupManageVO;
	var dateValidformat = /^\d{4}\-\d{2}\-\d{2}$/; //Basic check for format validity
	
	if (popupTitleNm=='') {
		  alert('팝업창명을 입력해주세요');
		  return;
		  }
	if (popCn=='') {
		  alert('팝업창 내용을 입력해주세요');
		  return;
		  }
	if (popupWlc=='') {
		  alert('팝업창 위치를 입력해주세요');
		  return;
		  }
	if (popupWSize=='') {
		  alert('팝업창 사이즈를 입력해주세요');
		  return;
		  }
	if (!dateValidformat.test(ntceBgndeYYYMMDD)) {
		  alert('시작일자를 입력해주세요');
		  return;
	  }
	if(!dateValidformat.test(ntceEnddeYYYMMDD) ){
	  	alert('종료일자를 입력해주세요');
		  return;		  
	  }
	if(iChkBeginDe > iChkEndDe || iChkEndDe < iChkBeginDe ){
			alert("<spring:message code="ussIonPwm.popupRegist.validate.iChkDate"/>");/* 게시시작일자는 게시종료일자 보다 클수 없고,\n게시종료일자는 게시시작일자 보다 작을수 없습니다. */
			return;
		}
		varFrom.ntceBgnde.value = ntceBgndeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('ntceBgndeHH') +  fn_egov_SelectBoxValue('ntceBgndeMM');
		varFrom.ntceEndde.value = ntceEnddeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('ntceEnddeHH') +  fn_egov_SelectBoxValue('ntceEnddeMM');

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/ion/pwm/registPopup.do' />";
		/*
		if(!validatePopupManageVO(varFrom)){
			
			return;
		}else{
*/
			varFrom.submit();
		//}
	}
}

/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_egov_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){

			FValue=document.getElementById(sbName).options[i].value;
		}
	}

	return  FValue;
}
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}
/* ********************************************************
 * 달력
 ******************************************************** */
function fn_egov_init_date(){
	
	$("#ntceBgndeYYYMMDD").datepicker(  
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'
	         , buttonImageOnly: true
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});


	$("#ntceEnddeYYYMMDD").datepicker( 
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'  
	         , buttonImageOnly: true
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
}
</script>
</head>
<body onLoad="fn_egov_init_PopupManage(); fn_egov_init_date();">

<div class="layout-container">

<h2><spring:message code="ussIonPwm.popupRegist.popupRegist"/></h2><!-- 팝업창관리 등록 -->
<form:form commandName="popupManageVO" name="popupManageVO" action="${pageContext.request.contextPath}/uss/ion/pwm/registPopup.do" method="post" >
<input type="hidden" class="form-control" name="fileUrl"  value="egovframework/com/uss/ion/pwm/sample/EgovPopupSample" maxlength="255" />
<!-- <input type="hidden" class="form-control" name="popupWlc" size="5" value="112" maxlength="10" /> 
<input type="hidden" class="form-control" name="popupHlc" size="5" value="112" maxlength="10" />
<input type="hidden" class="form-control" name="popupWSize" size="5" maxlength="10" value="112"/> 
<input type="hidden" class="form-control" name="popupHSize" size="5" maxlength="10" value="112"/> -->
 

	<!-- 타이틀 -->
	

<div class="wTableFrm">	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:20%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="ussIonPwm.popupRegist.popupTitleNm"/> <span class="pilsu">*</span></th><!-- 팝업창명 -->
			<td class="left">
				<form:input id="popupTitleNm" path="popupTitleNm" maxlength="255"/>
				<form:errors path="popupTitleNm" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<th>
				팝업창 내용
				<span class="pilsu">*</span>
			</th>
			<td>
				<textarea class="ckeditor" id="popCn" name="popCn" placeholder="내용을 입력하세요.">${vo.popCn }</textarea>

			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.popupUpdt.popupLoca"/> <span class="pilsu">*</span></th>
			<td class="left">
			    가로 <form:input path="popupWlc" id="popupWlc" maxlength="10" cssStyle="width:100px"/>  세로 <form:input path="popupHlc" maxlength="10" cssStyle="width:100px"/>
			  <form:errors path="popupWlc" cssClass="error"/>
			  <form:errors path="popupHlc" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.popupUpdt.popupSize"/> <span class="pilsu">*</span></th>
			<td class="left">
			    가로 <form:input path="popupWSize" id="popupWSize" maxlength="10" cssStyle="width:100px"/> 세로 <form:input path="popupHSize" maxlength="10" cssStyle="width:100px"/>
				<form:errors path="popupWSize" cssClass="error"/>
				<form:errors path="popupHSize" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.popupRegist.ntcePeriod"/> <span class="pilsu">*</span></th><!-- 게시기간 -->
			<td class="left">
				<input id="ntceBgndeYYYMMDD" type="text" name="ntceBgndeYYYMMDD" size="15" maxlength="10" class="readOnlyClass" title="게시기간" readonly="readonly" style="width:100px" />
				<form:select path="ntceBgndeHH">
					<form:options items="${ntceBgndeHH}" itemValue="code" itemLabel="codeNm"/>
				</form:select> H
				<form:select path="ntceBgndeMM">
					<form:options items="${ntceBgndeMM}" itemValue="code" itemLabel="codeNm"/>
				</form:select> M
				&nbsp;~&nbsp;
				<input id="ntceEnddeYYYMMDD" type="text" name="ntceEnddeYYYMMDD" size="15" maxlength="10" class="readOnlyClass" title="게시기간" readonly="readonly" style="width:100px" />
				<form:select path="ntceEnddeHH">
					<form:options items="${ntceEnddeHH}" itemValue="code" itemLabel="codeNm"/>
				</form:select> H
				<form:select path="ntceEnddeMM">
					<form:options items="${ntceEnddeMM}" itemValue="code" itemLabel="codeNm"/>
				</form:select> M
			</td>
		</tr>
		<tr style="display: none">
			<th><label for="stopVewAt"><spring:message code="ussIonPwm.popupRegist.stopVewAt"/> <span class="pilsu">*</span></label></th><!-- 그만보기 설정 여부 -->
			<td class="left">
				<input id ="stopVewAt" type="radio" name="stopVewAt" value="Y" checked="checked" />Y
				<input class="ml10" type="radio" name="stopVewAt" value="N" />N
			</td>
		</tr>
		<tr>
			<th><label for="ntceAt"><spring:message code="ussIonPwm.popupRegist.ntceAt"/> <span class="pilsu">*</span></label></th><!-- 게시 상태 -->
			<td class="left">
				<input id="ntceAt" type="radio" name="ntceAt" value="Y" checked="checked" />Y
				<input class="ml10" type="radio" name="ntceAt" value="N" />N
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_PopupManage(); return false;" />
		<span class="btn_s"><a href="<c:url value='/uss/ion/pwm/listPopup.do' />" onclick=""><spring:message code="button.list" /></a></span>
	</div>
	<div style="clear:both;"></div>
</div>

<form:hidden path="ntceBgnde" />
<form:hidden path="ntceEndde" />
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>


</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

</body>
</html>
