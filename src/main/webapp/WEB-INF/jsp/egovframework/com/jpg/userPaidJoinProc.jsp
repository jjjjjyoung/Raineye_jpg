<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">
<link rel="stylesheet" href="/css/egovframework/com/jpg/style2.css">


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address2").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
    
    
    function submitForm(form){
    	if(confirm("신청하시겠습니까?")){

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
    
    function goFindId() {
        document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
        document.defaultForm.submit();
    }
    
    
</script>
<div id="subWrap" class="paid sub01">
    <div class="sub_visual">
        <h2>유료회원</h2>
    </div>

    <div id="container">
        <!--start content-->
        <div class="contentWrap">
	        <div class="inner">
	            <div class="leftMenu2">
	            	<c:choose>
	            		<c:when test="${loginVO != null && loginVO.id != '' }">
		                <strong>마이페이지</strong>
		                <ul>
                	
	                		<li><a href="/mypage.do">회원정보수정</a></li>
		                    <li class="on"><a href="/userPaidJoinAgree.do">유료회원</a></li>
		                    <li><a href="/userHistory.do">신청내역</a></li>
		                    <li><a href="/userOut.do">회원탈퇴</a></li>
			            </ul>
		                    	
	                	</c:when>
	                	<c:otherwise>
	                	<strong>회원가입</strong>
		                <ul>
		                	<li><a href="/uat/uia/egovLoginUsr.do">로그인</a></li>
		                    <li><a href="javascript:goFindId();">아이디/비밀번호 찾기</a></li>
		                    <li><a href="javascript:goRegiUsrheader();">회원가입</a></li>
		                    <li class="on"><a href="/userPaidJoinAgree.do">유료회원</a></li>
		                </ul>
	                	</c:otherwise>
                	</c:choose>
	                
	            </div>
	            <!--end leftMenu2-->
				
				
				
				
				
	            <div class="paid-join" id="go_direct">
	                <form action="/userPaidJoinComp.do" name="paidMemberVO" id="PaidMemberVO" onsubmit="submitForm(document.forms[0]); return false;" method="post" enctype="multipart/form-data" class="info_box">
	                    <div class="sub_title"><p>유료회원가입</p></div>
                            <ul>
                                <li>
                                    <div class="left">이름</div>
                                    <div class="right">
                                        <input title="이름 입력" type="text" placeholder="이름" id="name" name="name" value='<c:out value="${paidMemberVO.mberNm}"/>'/>
                                        <p class="em_gray">(공백없이 한글만 입력가능)</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="left">성별</div>
                                    <div class="right">
                                        <input title="남" type="radio" name="gender" id="man" checked/>
                                        <label for="man">남</label>
                                        <input title="여" type="radio" name="gender" id="woman"/>
                                        <label for="woman">여</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="left">
                                        생년월일
                                    </div>
                                    <div class="right">
                                        <input title="생년월일 입력" type="text" id="birthday" name="birthday" placeholder="연도-월-일" value="<c:out value="${paidMemberVO.birthday}"/>"/>
                                        <input type="radio" name="lift" id="lift" checked/>
                                        <label for="lift" class="lift">양력</label>
                                        <input type="radio" name="lunar" id="lunar"/>
                                        <label for="lunar">음력</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="left">연락처(휴대전화)</div>
                                    <div class="right">
                                        <input title="연락처 입력" type="text"  name="phone" id="phone" placeholder="000-0000-0000" />
                                    </div>
                                </li>
                                 <li>
                                    <div class="left">연락처(유선전화)</div>
                                    <div class="right">
                                        <input title="연락처 입력" type="text"  name="tel" id="tel" placeholder="000-000-0000" />
                                    </div>
                                </li>
                                  <li>
	                               <div class="left">E-mail</div>
	                                    <div class="right"><input style="width: 201px;" type="email"  id="mail" name="mberEmailAdres" value='<c:out value="${paidMemberVO.mberEmailAdres}"/>'></div>
	                           </li>
                                <li>
                                    <div class="left">주소</div>
                                    <div class="right address_box">
                                        <input title="우편번호 입력" type="text" id="zip" name="zip" readonly/>
                                        <button type="button" onclick="sample6_execDaumPostcode();" class="sty_btn_y2">주소검색</button>
                                        <input title="기본주소 입력" type="text" name="address1" id="address1" placeholder="기본주소" readonly/ class="sty_btn_y3">
                                        <input title="상세주소 입력" type="text" name="address2" id="address2" placeholder="상세주소" />
                                        <p class="em_gray">&gt; 공연 홍보물, 이벤트 경품 등 수령이 가능한 정확한 주소지를 기입하여 주십시오.</p>
                                    </div>
                                </li>
                                <li>
                                    <p class="em_red">회원님의 개인정보를 안전하게 보호하고 있으며, 회원님의 명백한 동의 없이는 공개 또는 제 3자에게 제공되지 않습니다.</p>
                                    <p class="em_red">정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 23조 2의 1항에 의거 주민등록번호를 수집하지않습니다.
                                        이에 따라 본인 확인 절차를 위해 생년월일과 연락처를 정확히 입력하여 주시기 바랍니다. 생년월일 추후 변경은 불가합니다.
                                    </p>
                                    <div class="bottom">
                                        <p>공연 정보, 유료회원 대상 이벤트 등 안내 SMS 수신 여부</p>

                                        <input type="radio" name="sms" id="sms_o" value="Y"checked/>
                                        <label for="sms_o">예</label>
                                        <input type="radio" name="sms" id="sms_x" value="N"/>
                                        <label for="sms_x">아니오</label>
                                    </div>
                                </li>
                            </ul>

                            <div class="sub_title"><p>서비스 이용에 따른 신청사항</p></div>
                            <ul>
                                <li>
                                    <div class="left">회원등급 선택</div>
                                    <div class="right">
                                        <input type="radio" id="dues2" name="dues" value="0" checked/>
                                        <label for="dues2">풍류회원 ( 평생 - 10만원)</label>
                                        <input type="radio" id="dues1" name="dues" value="1"  />
                                        <label for="dues1">남도회원(1년 2만원)</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="left">연회비 결제방법</div>
                                    <div class="right">
                                        <p class="red">계좌이체</p>
                                        <p class="gray14">광주은행 650-107-009398  예금주 : (재)전남문화관광재단</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="left">우편 서비스 신청</div>
                                    <div class="right">
                                        <input type="radio" name="post" id="post_o" value="Y" checked/>
                                        <label for="post_o">예</label>
                                        <input type="radio" name="post" id="post_x" value="N"/>
                                        <label for="post_x">아니오</label>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <p class="gray12_1">회원가입 약관 (요약)</p>
                                        <p class="gray12_1">개인정보 수집 및 활용에 관한 사항 (필수)</p>
                                        <p class="gray12_2">상기 회원의 정보를 수집하고, 전라남도립국악단에서 활용하는 것을 동의합니다.</p>
                                        <p class="gray12_1">서비스 가입에 관한 사항 (필수)</p>
                                        <p class="gray12_2">해당 회원은 유료회원에 가입하여, 약관에 명기된 혜택을 받을 수 있습니다.</p>
                                    </div>
                                    <div class="bottom">
                                        <p class="em_red">본인은 약관의 주요 내용에 대해 충분히 설명 들었고, 동 약관을 준수할 것을 확인하며 회원 가입을 신청합니다.</p>
                                        <p class="em_red">기존 회원의 경우 상기 신청 내용으로 회원정보 변경을 동의합니다.</p>
                                    </div>
                                    <div class="bottom">
                                        <p>
                                            본인은 위 기재된 내용이 사실과 다름이 없음을 확인하였으며, 전라남도립국악단의 회원약관을 수령하고 이에 동의하여
                                            회원 가입을 신청합니다.
                                        </p>
                                    </div>
                                </li>
                            </ul>
						<input type="submit" class="s_submit" value="유료회원 가입하기" title="유료회원 가입하기" style="background: #333;color: #fff;font-size: 16px; font-weight: 500;display: block;width: 200px;border-radius: 5px;border: 1px solid #333;height: 45px;line-height: 45px;text-align: center;">
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
	<form name="defaultForm" action="" method="post" target="_blank" title="로그인 페이지로 이동">
	<div style="visibility: visible; display: none;">
		<input name="iptSubmit3" type="submit"
			value="<spring:message code="comUatUia.loginForm.submit"/>"
			title="<spring:message code="comUatUia.loginForm.submit"/>">
	</div>
</form>
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>