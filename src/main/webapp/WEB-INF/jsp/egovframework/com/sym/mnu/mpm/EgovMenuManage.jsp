<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMenuManage.jsp
  * @Description : 메뉴관리 조회 화면
  * @Modification Information
  * @
  * @  수정일             수정자          수정내용
  * @ -------     --------  ---------------------------
  * @ 2009.03.10   이용            최초 생성
  	  2011.07.27     서준식          메뉴 삭제 자바스크립트 오류 수정
  	  2018.08.09     신용호          삭제시 목록이 1개인경우 예외처리 수정
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button";
%>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script language="javascript1.2" type="text/javaScript">

/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.menuManageForm.checkField;
    if(document.menuManageForm.checkAll.checked) {
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
/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteMenuList(meCode) {
 
    document.menuManageForm.checkedMenuNoForDel.value=meCode;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDelete.do'/>";
    document.menuManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.menuManageForm.pageIndex.value = pageNo;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuManageList() {
	document.menuManageForm.pageIndex.value = 1;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
	document.menuManageForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 일괄처리 화면호출 함수
 ******************************************************** */
/* function bndeInsertMenuManage() {
	   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
	   	document.menuManageForm.submit();
	}
 */
function bndeInsertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtMenuManageDetail(menuNo) {
	
	document.menuManageForm.req_menuNo.value = menuNo;
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do'/>";
   	document.menuManageForm.submit();
   	
}
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuManageSelect(){
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}

<c:if test="${!empty resultMsg}">
	alert("${resultMsg}");
	window.location.href="/sym/mnu/mpm/EgovMenuManageSelect.do";

</c:if>

</script>
<style>
	.search_box .btn_b:last-child a {
		background-color: #ec9e9e;
	}
	.search_box .btn_b {
	    margin: 0 .3rem;
	}
</style>
</head>
<body>

<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

<div class="layout-container">

<div class="board">
	<h1><spring:message code="comSymMnuMpm.menuManage.pageTop.title"/></h1><!-- 메뉴관리리스트 -->


	<button type="button" class="btn_add_submenu btn_03" onclick="insertMenuManage(); return false;">추가</button>
	
	
<%-- 	
	<span class="btn_b">
		<a href="#" onclick="fDeleteMenuList(); return false;" title='<spring:message code="button.delete" />'><spring:message code="button.delete" /></a>
	</span><!-- 삭제 --> 
--%>
	
	<form name="menuManageForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" method="post">
		<input name="req_menuNo" type="hidden"  />
		<input name="checkedMenuNoForDel" type="hidden" />
    </form>
	
	</form>
	<table class="datatables-demo table table-striped table-bordered dataTable no-footer" id="menulist">
		<caption></caption>
		<colgroup>
			<col style="width:20%" />
			<col style="width:40%" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">메뉴</th>
				<th scope="col">링크</th>
				<th scope="col">새창</th>
				<th scope="col">순서</th>
				<th scope="col">사용여부</th>
				<th scope="col">관리</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="result" items="${list_menumanage}" varStatus="status">
			<tr class="menu_list menu_group_<c:out value='${result.meCode}'/>">
				<c:choose>
					<c:when test="${fn:length(result.meCode)==4}">
						<td class="td_category" >
			            	<input type="hidden" name="code[]" value="<c:out value='${result.meCode}'/>">
			            	<a class="depth2" href="javascript:selectUpdtMenuManageDetail('<c:out value="${result.meId}"/>');">
			            		<c:out value='${result.meName}'/>
			            	</a>
			        	</td>
			        </c:when>
			        <c:when test="${fn:length(result.meCode)==6}">
						<td class="td_category" >
			            	<input type="hidden" name="code[]" value="<c:out value='${result.meCode}'/>">
			            	<a class="depth3" href="javascript:selectUpdtMenuManageDetail('<c:out value="${result.meId}"/>');">
			            		<c:out value='${result.meName}'/>
			            	</a>
			        	</td>
			        </c:when>
			    	<c:otherwise>
						<td class="td_category" >
			            	<input type="hidden" name="code[]" value="<c:out value='${result.meCode}'/>">
			            	<a href="javascript:selectUpdtMenuManageDetail('<c:out value="${result.meId}"/>');">
			            		<c:out value='${result.meName}'/>
			            	</a>
			        	</td>			    	
			    	</c:otherwise>
			    </c:choose>
		        <td>
		            <c:out value='${result.meLink}'/>
		        </td>
		        <td class="td_mng">
		            
		            <c:choose>
						<c:when test='${result.meTarget eq "self"}'>
							사용안함
						</c:when>
						<c:otherwise>
							사용함
						</c:otherwise>
			        </c:choose>
		        </td>
		        <td class="td_num">
		            <c:out value='${result.meOrder}'/>
		        </td>
		        <td class="td_mng">
		            <c:choose>
						<c:when test='${result.meUse eq "0"}'>
							사용안함
						</c:when>
						<c:otherwise>
							사용함
						</c:otherwise>
			        </c:choose>
		        </td>
		        <td class="td_mng">
		        	<c:if test="${fn:length(result.meCode) < 4}">
		            	<button type="button" class="btn_add_submenu btn_03" onClick="add_submenu('<c:out value="${result.meCode}"/>')">추가</button>
		            </c:if>
		            <button type="button" class="btn_del_menu btn_02" onclick="fDeleteMenuList('<c:out value="${result.meCode}"/>')">삭제</button>
		        </td>
		    </tr>
		    </c:forEach>

		</tbody>
	</table>

</div>


</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
<script>

function add_submenu(meCode){
	var depth = '';
	var len = meCode.length;
	
	if(len == '2'){
		depth = '2';
		window.location.href="/sym/mnu/mpm/EgovMenuRegistInsert.do?depth="+depth+"&parentCode="+meCode;
	}else if(len == '4'){
		depth = '3';
		window.location.href="/sym/mnu/mpm/EgovMenuRegistInsert.do?depth="+depth+"&parentCode="+meCode;
	}
}

</script>
