<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="login join sub01">
    <div class="sub_visual">
        <h2>회원가입</h2>
    </div>

    <div id="container">
        <!--start content-->
        <div class="contentWrap">
	        <div class="inner">
	            <div class="leftMenu2">
	                <strong>회원가입</strong>
	                <ul>
	                    <li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
	                    <li><a href="/publeView.do?id=userForget">아이디/비밀번호 찾기</a></li>
	                    <li class="on"><a href="/publeView.do?id=userJoinAgree">회원가입</a></li>
	                    <li><a href="/publeView.do?id=userPaidJoinAgree">유료회원</a></li>
	                </ul>
	            </div>
	            <!--end leftMenu2-->
	
	            <div class="join_box" id="go_direct">
	                <form accept-charset="utf-8" name="insert_student" onsubmit="return submitForm()" method="post" enctype="multipart/form-data" class="info_box">
	                    <div>
	                        <table class="mem_info">
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="m_id">아이디</label>
	                                </td>
	                                <td>
	                                    <input type="text" name="m_id" value="" id="m_id" class="long" maxlength="12" placeholder="" style="width: 630px;">
	                                    <button type="button" class="btn03" onclick="checkId()">중복확인</button>
	                                    <span class="error-msg"></span>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="m_password">패스워드</label>
	                                </td>
	                                <td>
	                                    <input type="password" name="m_password" id="m_password" class="long" maxlength="20" placeholder="패스워드" value="" tabindex="101">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="m_password_re">패스워드 확인</label>
	                                </td>
	                                <td>
	                                    <input type="password" name="m_password_re" id="m_password_re" class="long" maxlength="20" placeholder="비밀번호 확인" value="">
	                                    <p class="info-txt">&#8251; 숫자와 영문자, 특수문자 [ !@#$%^&*()+=- ] 조합 8~12자리</p>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="m_name">이름</label>
	                                </td>
	                                <td>
	                                    <input type="text" id="m_name" name="m_name" maxlength="10" value="" class="long" size="10" placeholder="이름">
	                                    <p class="info-txt">(공백없이 한글만 입력 가능)</p>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="m_nick">별명</label>
	                                </td>
	                                <td>
	                                    <input type="text" id="m_nick" name="m_nick" maxlength="10" value="" class="long" size="10" placeholder="별명">
	                                    <p class="info-txt">공백없이 한글, 영문, 숫자만 입력 가능 (한글2자, 영문4자 이상)</p>
	                                    <p class="info-txt">별명을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.</p>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">생년월일</td>
	                                <td class="tg-c3ow"><input type="date" id="birthday" required="required" title="예).2020-03-04"></td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <label for="m_email">E-mail</label>
	                                </td>
	                                <td>
	                                    <input type="text" name="m_email" id="m_email" class="short" placeholder="E-mail" style="float:left;" value="">
	                                    <button type="button" class="btn03" onclick="checkId()">중복확인</button>
	                                    <p>&#8251; 본인 확인 수단으로 사용 되므로 정확히 입력해 주시기 바랍니다.</p>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>성별</span>
	                                </td>
	                                <td>
	                                    <label for="fe"><input type="radio" name="gender" id="fe">여자</label>
	                                    <label for="man"><input type="radio" name="gender" id="man">남자</label>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>메일링서비스</span>
	                                </td>
	                                <td>
	                                    <label for="mailling1"><input type="radio" name="mailling" id="mailling1">수신동의</label>
	                                    <label for="mailling2"><input type="radio" name="mailling" id="mailling2">수신하지 않음</label>
	                                </td>
	                            </tr>
	
	                            <tr>
	                               <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>SMS 수신여부</span>
	                                </td>
	                                <td>
	                                    <label for="opt-in1"><input type="radio" name="sms" id="opt-in1">수신동의</label>
	                                    <label for="opt-in2"><input type="radio" name="sms" id="opt-in2">수신하지 않음</label>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <td style="width: 200px;padding: 2%;border-right: 1px solid #ccc;background: #f8f8f8;">
	                                    <span>정보공개</span>
	                                </td>
	                                <td>
	                                    <label for="info_open">
	                                        <input type="checkbox" name="m_letter" id="info_open">다른 분들이 나의 정보를 볼 수 있도록 합니다.</label>
	                                </td>
	                            </tr>
	
	                        </table>
	                    </div>
	
	                </form>
	                <a href="/publeView.do?id=userJoinComp">확인</a>
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