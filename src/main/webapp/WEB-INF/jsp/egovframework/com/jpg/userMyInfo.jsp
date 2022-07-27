<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<script>


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

function fnUpdate(form){
	if(confirm("저장하시겠습니까?")){

		//var mberId = document.mberManageVO.mberId.value;
		var password = document.mberManageVO.password.value;
		var password2 = document.mberManageVO.password2.value;
		//var mberNm = document.mberManageVO.mberNm.value;
		var mberNick = document.mberManageVO.mberNick.value;
		var mberEmailAdres = document.mberManageVO.mberEmailAdres.value;
		var birthday = document.mberManageVO.birthday.value;
		
		//var checkEmail = document.mberManageVO.checkEmail.value;
		var sexdstnCode = document.mberManageVO.sexdstnCode.value;
		/*
		if(mberId == ''){
			alert('아이디는 필수값입니다.');
			return;
		}
		*/
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
            return;
        }
		/*
		if(mberNm == ''){
			alert('이름은 필수값입니다.');
			return;
		}
		*/
	
				
		if(birthday == ''){
			alert('생년월일은 필수값입니다.');
			return;
		}
		
		if(mberEmailAdres == ''){
			alert('이메일주소는 필수값입니다.');
			return;
		}
		
		/*
		if(checkEmail == 'N'){
			alert('이메일 중복체크를 해주세요');
			return;
		}
		*/
		document.mberManageVO.submit();
		return true;
	}
}
</script>

</script>
<div id="subWrap" class="login join mypage sub01">
    <div class="sub_visual">
        <h2>마이페이지</h2>
    </div>

    <div id="container">

        <!--start content-->
        <div class="contentWrap">
	        <div class="inner">
	            <div class="leftMenu2">
	                <strong>마이페이지</strong>
	                <ul>
	                    <li class="on"><a href="/mypage.do">회원정보수정</a></li>
	                    <li><a href="/userPaidJoinAgree.do">유료회원</a></li>
	                    <li><a href="/userHistory.do">신청내역</a></li>
	                    <li><a href="/userOut.do">회원탈퇴</a></li>
	                </ul>
	            </div>
	            <!--end leftMenu2-->
	
	            <div class="join_box" id="go_direct">
	                
	                <form id="mberManageVO" name="mberManageVO" onsubmit="fnUpdate(document.forms[0]); return false;" action="/myinfoUp.do" method="post" class="my_info_box"> 
	                	<input type="hidden" name="uniqId" id="uniqId" value='<c:out value="${mberManageVO.uniqId}"/>' />
	                	<!-- <input type="hidden" name="checkEmail" id="checkEmail" value="N" /> --> 
	                	<input type="hidden" id="mberNm" name="mberNm"  value='<c:out value="${mberManageVO.mberNm}"/>' >
	                	<input type="hidden" id="mberId" name="mberId" value="<c:out value="${mberManageVO.mberId}"/>"  >
	                	<%-- <input type="hidden" id="mberEmailAdres" name="mberEmailAdres" value="<c:out value="${mberManageVO.mberEmailAdres}"/>" > --%>
	                	
	                    <div>
	                        <table class="mem_info">
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="mberNm">이름</label>
	                                </td>
	                                <td>
	                                    <c:out value="${mberManageVO.mberNm}"/>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="mberId">아이디</label>
	                                </td>
	                                <td>
	                                    <c:out value="${mberManageVO.mberId}"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="level">회원등급</label>
	                                </td>
	                                <td>
	                                	<c:choose>
	                                		<c:when test="${mberManageVO.level =='1'}">
	                                			일반회원
	                                		</c:when>
	                                		<c:when test="${mberManageVO.level =='2'}">
	                                			일반회원(1년)
	                                		</c:when>
	                                		<c:otherwise>
	                                			유료회원(평생)
	                                		</c:otherwise>
	                                	
	                                	</c:choose>
	                                    
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="tg-c3ow"><label for="birthday">생년월일</label></td>
	                                <td class="tg-c3ow"><input type="date" name="birthday" title="예).2020-03-04" id="birthday" value="<c:out value="${mberManageVO.birthday}"/>" ></td>
	                            </tr>
								<!-- 
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
								-->
								<tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="mberEmailAdres">E-mail</label>
	                                </td>
	                                <td>
	                                	<input name="mberEmailAdres" id="mberEmailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="30" maxlength="50" value="<c:out value="${mberManageVO.mberEmailAdres}"/>"/>
	                                    
	                                     <!-- 
	                                    <button type="button" class="btn03" onclick="fn_email_check()">중복확인</button>
	                                    <p id="emailDuple">&#8251; 본인 확인 수단으로 사용 되므로 정확히 입력해 주시기 바랍니다.</p>
	                                     -->
	                                </td>
	                            </tr>
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>성별</span>
	                                </td>
	                                <td>
	                                    <label for="F"><input type="radio" value="F" name="sexdstnCode" id="F" <c:if test="${mberManageVO.sexdstnCode=='F'}">checked</c:if>>여자</label>
	                                    <label for="M"><input type="radio" value="M" name="sexdstnCode" id="M" <c:if test="${mberManageVO.sexdstnCode=='M'}">checked</c:if>>남자</label>
	                                </td>
	                            </tr>
	
	
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="password">패스워드</label>
	                                </td>
	                                <td>
	                                    <input type="password" name="password" id="password" class="long" maxlength="20" placeholder="패스워드" value="">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="password2">패스워드 확인</label>
	                                </td>
	                                <td>
	                                    <input type="password" name="password2" id="password2" class="long" maxlength="20" placeholder="비밀번호 확인" value="">
	                                    <p class="info-txt">&#8251; 숫자와 영문자, 특수문자 [ !@#$%^&*()+=- ] 조합 8~12자리</p>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>메일링서비스</span>
	                                </td>
	                                <td>
	                                    <label for="mailling1"><input type="radio" name="mailling" id="mailling1" value="Y" <c:if test="${mberManageVO.mailling=='Y'}">checked</c:if>>수신동의</label>
	                                    <label for="mailling2"><input type="radio" name="mailling" id="mailling2" value="N" <c:if test="${mberManageVO.mailling=='N'}">checked</c:if>>수신하지 않음</label>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>SMS 수신여부</span>
	                                </td>
	                                <td>
	                                    <label for="opt-in1"><input type="radio" name="sms" id="opt-in1" value="Y" <c:if test="${mberManageVO.sms=='Y' }">checked</c:if>>수신동의</label>
	                                    <label for="opt-in2"><input type="radio" name="sms" id="opt-in2" value="N" <c:if test="${mberManageVO.sms=='N' }">checked</c:if>>수신하지 않음</label>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>정보공개</span>
	                                </td>
	                                <td>
	                                    <label for="infoOpen">
	                                        <input type="checkbox" name="infoOpen" id="infoOpen" value="Y" <c:if test="${mberManageVO.infoOpen=='Y' }">checked</c:if>>다른 분들이 나의 정보를 볼 수 있도록 합니다.</label>
	                                </td>
	                            </tr>
	
	                        </table>
	                        <div class="btn_area1">
			                    <a href="/home.do">취소</a>
			                    <!-- <a href="/publeView.do?id=userMyInfo">수정완료</a> -->
			                    <input type="submit" class="s_submit" value="수정완료" title="수정완료" style="background: #333;color: #fff;font-size: .9rem; font-weight: 500;display: block;width: 200px;border-radius: 5px;border: 1px solid #333;height: 45px;line-height: 45px;text-align: center;margin-right: 10px;">
			                </div>
	                    </div>
						
	                </form>
	
	            </div>
	            <!--end join_box-->
	        </div>
	        <!--end inner-->
		</div>
		<!--end contentWrap-->

    </div>
    <!--end container-->
</div>
<!--end subWrap-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>