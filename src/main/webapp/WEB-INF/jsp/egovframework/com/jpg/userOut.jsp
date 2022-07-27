<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/menu.do"/>

<link rel="stylesheet" href="/css/egovframework/com/jpg/style.css">

<div id="subWrap" class="login join mypage sub01">
	<div class="sub_visual">
		<h2>마이페이지</h2>
	</div>

	<div id="container">
		<div class="inner">
			<div class="leftMenu2">
				<strong>마이페이지</strong>
				<ul>
					<li><a href="/mypage.do">회원정보수정</a></li>
					<li><a href="/userHistory.do">신청내역</a></li>
					<li class="on"><a href="/userOut.do">회원탈퇴</a></li>
				</ul>
			</div>
			<!--end leftMenu2-->
		
			<div class="userout" id="go_direct">
				<p>
					개인정보 보호를 위하여 회원탈퇴 시 개인정보를 삭제합니다.<br>
					탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
				</p>
				<table>
					<tr>
						<th>탈퇴사유</th>
						<td><select name="out" id="out" title="탈퇴사유 선택">
							<option value="탈퇴사유 선택" disabled selected>탈퇴사유 선택</option>
							<option value="서비스 불만족">서비스 불만족</option>
							<option value="사용안함">사용안함</option>
							<option value="기타">기타</option>
						</select></td>
					</tr>
					<tr>
						<th>기타의견</th>
						<td><textarea name="out_text" id="out_text" cols="30" rows="10" class="noresize"></textarea>
						</td>
					</tr>
				</table>
				<div class="btn_area1">
					<a href="/home.do">취소</a>
					<a href="#" class="out_btn">탈퇴하기</a>
				</div>
                <form class="my_delete_data" id="mberManageVO" name="mberManageVO" action="" method="post">
                    <input type="hidden" id="mberId" name="mberId" value="<c:out value='${mberManageVO.mberId}'/>"/>
                    <input type="hidden" id="mberNm" name="mberNm" value="<c:out value='${mberManageVO.mberNm}'/>"/>
                    <input type="hidden" id="outRe" name="outRe" value=""/>
                    <input type="hidden" id="outOp" name="outOp" value=""/>
                </form>
			</div>
		</div>
		<!--end inner-->
	</div>
	<!--end container-->
</div>
<!--end subWrap-->

<script>
	$(".out_btn").on("click", function () {
		var outRe = $("#out_text").val();
		var outOp = $("#out").val();

		$("#outRe").val(outRe);
		$("#outOp").val(outOp);

		$("#mberManageVO").attr("action", "/userOutProc.do");
		$("#mberManageVO").submit();
	});
</script>

<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>