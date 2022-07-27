<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<link type="text/css" rel="stylesheet"	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/jsbn.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rsa.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/prng4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cms/rng.js'/>"></script>	

<script type="text/javaScript" language="javascript" defer="defer">
/*********************************************************
 
 ******************************************************** */
function fn_egov_init(){


	fn_modal_setting();

}
/*********************************************************
 * 아이디 체크 AJAX
 ******************************************************** */
function fn_id_check(){	
	if($("#mberId").val()!= ''){
		$.ajax({
			type:"POST", 
			url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
			data:{
				"checkId": $("#mberId").val()			
			},
			dataType:'json',
			timeout:(1000*30),
			success:function(returnData, status){
				if(status == "success") {
					if(returnData.usedCnt > 0 ){
						//사용할수 없는 아이디입니다.
						$("#divModalResult").html("<font color='red'> ["+returnData.checkId+"]<spring:message code="comUssUmt.userManageRegistModal.useMsg" /></font>");
					}else{
						//사용가능한 아이디입니다.
						$("#divModalResult").html("<font color='blue'> ["+returnData.checkId+"]<spring:message code="comUssUmt.userManageRegistModal.notUseMsg" /></font>");
						$("#checkId").val('Y');
					}
				}else{ alert("ERROR!");return;} 
			}
		});
	}else{
		alert('아이디를 입력하세요.')
	}
}

/*********************************************************
 * 메일 체크 AJAX
 ******************************************************** */
function fn_email_check(){	
	
	if($("#mberEmailAdres").val()!= ''){
	
		$.ajax({
			type:"POST", 
			url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjaxMail.do' />",
			data:{
				"email": $("#mberEmailAdres").val()			
			},
			dataType:'json',
			timeout:(1000*30),
			success:function(returnData, status){
				if(status == "success") {
					if(returnData.usedCnt > 0 ){
						//사용할수 없는 아이디입니다.
						$("#emailDuple").html("<font color='red'> ["+returnData.email+"]사용할수 없는 이메일입니다.</font>");
					}else{
						//사용가능한 아이디입니다.
						$("#emailDuple").html("<font color='blue'> ["+returnData.email+"]사용가능한 이메일입니다.</font>");
						$("#checkEmail").val('Y');
					}
				}else{ alert("ERROR!");return;} 
			}
		});
	}else{
		alert('이메일을 입력하세요.')
	}
}


function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}

function fnInsert(form){
	
	if(confirm("<spring:message code="common.regist.msg" />")){	
		
		var mberId = document.mberManageVO.mberId.value;
		var password = document.mberManageVO.password.value;
		var password2 = document.mberManageVO.password2.value;
		
		var mberNm = document.mberManageVO.mberNm.value;
		var mberNick = document.mberManageVO.mberNick.value;
		
		var mberEmailAdres = document.mberManageVO.mberEmailAdres.value;
		
		var birthday = document.mberManageVO.birthday.value;
		
		var checkId = document.mberManageVO.checkId.value;
		var checkEmail = document.mberManageVO.checkEmail.value;
		
		var sexdstnCode = document.mberManageVO.sexdstnCode.value;
		
		
		
		

		if(mberId == ''){
			alert('아이디는 필수값입니다.');
			return;
		}
		
		if(password == ''){
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
            return false;
        }
		
		if(mberNm == ''){
			alert('이름은 필수값입니다.');
			return;
		}
		
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if(!check.test(mberNm)){
			alert("이름은 공백없이 한글만 입력 가능합니다.");
			return ; 
		}
		
		if(mberNick == ''){
			alert('별명은 필수값입니다.');
			return;
		}
		
		var reg_hanengnum = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
		if(!reg_hanengnum.test(mberNick)){
			alert("별명은 공백없이 한글, 영문, 숫자만 입력 가능합니다.");
			return ; 
		}
				
		if(birthday == ''){
			alert('생년월일은 필수값입니다.');
			return;
		}
		
		if(mberEmailAdres == ''){
			alert('이메일주소는 필수값입니다.');
			return;
		}
		
		if(checkId == 'N'){
			alert('아이디 중복체크를 해주세요.');
			return;
		}
		
		if(checkEmail == 'N'){
			alert('이메일 중복체크를 해주세요');
			return;
		}
		
		document.mberManageVO.submit();
		return true;
		
		
		 


		
		
		document.mberManageVO.submit();
		return true;
	}
	$(function(){
	    $('html > head > title').text('회원가입!!');
	});
}


</script>

<style>
	.layout-container form { width:100% !important;}
	.modal-content {width: 400px;}
	.btn_s2 { padding: 4px 8px !important; font-size: 13px !important;}
	.btn input.s_submit { background: #75c4e6 !important;}
	select {padding:0.2rem;}
</style>

</head>
<body onload="fn_egov_init()">
<div class="layout-container">
	<h2>${pageTitle} <spring:message code="title.create" /></h2>
	<form:form commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovMberInsert.do" name="mberManageVO"  method="post" onSubmit="fnInsert(document.forms[0]); return false;"> 
		<input type="hidden" name="checkId" id="checkId" value="N" />
		<input type="hidden" name="checkEmail" id="checkEmail" value="N" /> 
		<div class="wTableFrm">
			<table class="wTable mberInsert" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
			<caption>${pageTitle} <spring:message code="title.create" /></caption>
			<colgroup>
				<col style="width: 22%;"><col style="width: ;">
			</colgroup>
			<tbody>
				<tr>
				    <th>
				        <label for="mberId">아이디</label>
				    </th>
				    <td>
				        <input type="text" name="mberId" value="" id="mberId" class="long" maxlength="12" placeholder="" style="width: 630px;">
				        <button type="button" class="btn_s2" onclick="fn_id_check()">중복확인</button>
				        <span id ="divModalResult" class="error-msg"></span>
				    </td>
				</tr>
				<tr>
				    <th>
				        <label for="password">패스워드</label>
				    </th>
				    <td>
				        <input type="password" name="password" id="password" class="long" maxlength="20" placeholder="패스워드" value="" >
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
				        <label for="mberNm">이름</label>
				    </th>
				    <td>
				        <input type="text" id="mberNm" name="mberNm" maxlength="10" value="" class="long" size="10" placeholder="이름">
				        <p class="info-txt">(공백없이 한글만 입력 가능)</p>
				    </td>
				</tr>
				<tr>
				    <th>
				        <label for="mberNick">별명</label>
				    </th>
				    <td>
				        <input type="text" id="mberNick" name="mberNick" maxlength="10" value="" class="long" size="10" placeholder="별명">
				        <p class="info-txt">공백없이 한글, 영문, 숫자만 입력 가능 (한글2자, 영문4자 이상)</p>
				        
				    </td>
				</tr>
				<tr>
				    <th class="tg-c3ow">생년월일</th>
				    <td class="tg-c3ow"><input type="date" title="예).2020-03-04" id="birthday" name="birthday"></td>
				</tr>
				<tr>
				    <th>
				        <label for="mberEmailAdres">E-mail</label>
				    </th>
				    <td>
				        <input type="text" name="mberEmailAdres" id="mberEmailAdres" class="short" placeholder="E-mail" style="float:left;" value="">
				        <button type="button" class="btn_s2" onclick="fn_email_check()">중복확인</button>
				        <p id="emailDuple">&#8251; 본인 확인 수단으로 사용 되므로 정확히 입력해 주시기 바랍니다.</p>
				    </td>
				</tr>
				<tr>
				    <th>
				        <span>성별</span>
				    </th>
				    <td>
				        <label for="F"><input type="radio" name="sexdstnCode" id="F" value="F" checked>여자</label>
				        <label for="M"><input type="radio" name="sexdstnCode" id="M" value="M">남자</label>
				    </td>
				</tr>
				<tr>
				    <th>
				        <span>회원 등급</span>
				    </th>
				    <td>
				        <label for="level1"><input type="radio" name="level" id="level1" value="1" checked>일반회원</label>
				        <label for="level2"><input type="radio" name="level" id="level2" value="2">유료회원(1년)</label>
				        <label for="level3"><input type="radio" name="level" id="level3" value="3">유료회원(평생)</label>
				    </td>
				</tr>
				<tr>
				    <th>
				        <span>메일링서비스</span>
				    </th>
				    <td>
				        <label for="mailling1"><input type="radio" name="mailling" value="Y" id="mailling1" checked>수신동의</label>
				        <label for="mailling2"><input type="radio" name="mailling" value="N" id="mailling2">수신하지 않음</label>
				    </td>
				</tr>
				<tr>
				    <th>
				        <span>SMS 수신여부</span>
				    </th>
				    <td>
				        <label for="opt-in1"><input type="radio" name="sms" id="opt-in1" value="Y" checked>수신동의</label>
				        <label for="opt-in2"><input type="radio" name="sms" id="opt-in2" value="N">수신하지 않음</label>
				    </td>
				</tr>
				<tr>
				    <th>
				        <span>정보공개</span>
				    </th>
				    <td>
				        <label for="infoOpen">
				            <input type="checkbox" name="infoOpen" id="infoOpen" value="Y" checked>다른 분들이 나의 정보를 볼 수 있도록 합니다.</label>
				    </td>
				</tr>
			</tbody>
			</table>
			<div class="btn">
				<span style="margin-right: 5px;" class="btn_s"><a href="<c:url value='/uss/umt/EgovMberManage.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
				<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
			</div><div style="clear:both;"></div>
		</div><!-- div end(wTableFrm)  -->
	</form:form>
</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

