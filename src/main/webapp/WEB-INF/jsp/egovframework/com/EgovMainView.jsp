<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CMS CO</title><!-- 행정안전부 공통서비스 테스트 사이트 -->

<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cms/slick.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/slick.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/slick-theme.css' />">

<script language="javascript">
function chk_all(val) {

	var arr_chk = document.getElementsByName("chk");

		if (val == "Y") {

			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =true;
			}
		}
		else if(val == "N") {
			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =false;
			}
		}
}

</script>
</head>

<body topmargin="0" leftmargin="0">
<c:if test="${cookie.popView.value != 'done' && fn:contains(requestScope['javax.servlet.forward.request_uri'],'EgovMainMenuHome.do') && fn:length(popList) > 0}">

<div id="op_layout">
	<div class="op_wrap">
    	<div class="sliderBox">
            <ul class="lazy">
				<c:forEach var="pop" items="${popList }">
					<li class="item">
					   <div>
					       <h2 style="text-align:center"><c:out value="${pop.popupTitleNm }" />1</h2>
					       <p>111<c:out value="${pop.popCn }" escapeXml="flase"/></p>
					   </div>
					</li>
					<li class="item">
					   <div>
					       <h2 style="text-align:center"><c:out value="${pop.popupTitleNm }" />2</h2>
					       <p>222<c:out value="${pop.popCn }" escapeXml="flase"/></p>
					   </div>
					</li>
					<li class="item">
					   <div>
					       <h2 style="text-align:center"><c:out value="${pop.popupTitleNm }" />3</h2>
					       <p>333<c:out value="${pop.popCn }" escapeXml="flase"/></p>
					   </div>
					</li>
				</c:forEach>									
      		</ul>
        </div>
        <div class="btn_close">
            <div class="never">
                <!-- <input id="never_op" type="checkbox">
                <label for="never_op">오늘 그만보기</label> -->
                <a href="#" class="close">팝업창 닫기</a>
            </div>
        </div>
    </div>
</div>

</c:if>
<!-- header -->
<script>
$("#op_layout .btn_close a").on("click", function(){
    //팝업창 쿠키 만들어야함
	$("#op_layout").hide();
    
    
});
</script>
<c:import url="/sym/mnu/mpm/EgovMainCustomHead.do" />

<div id="wrap">	
	<!-- 배너 -->
	<div class="mp_bn mainVisual">
	    
		<c:import url="/uss/ion/bnr/getBannerImage.do" charEncoding="utf-8">
			<c:param name="atchFileId" value="${banner.bannerImageFile}" />
		</c:import>
		
	</div>
	<!-- end mainVisual -->

	<div class="container">
	    <!-- contents -->
	    <div class="content">
			<!-- 상단 -->
			<div class="mp_top">
				<div class="l"><!-- 게시판1 -->
					<h3 class="m_tit01 mt15">공지사항</h3><!-- 생성된 게시판 목록 -->
					<div class="main_con">
					    <ul>
					    	<c:forEach var="item" items="${list1}">
					    		<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
									<li class="list">
										<input name="nttId" type="hidden" value="<c:out value="${item.nttId}"/>">
									    <input name="bbsId" type="hidden" value="<c:out value="${item.bbsId}"/>">
										<a class="submitBtn" style="cursor: pointer">
			                                <span class="title"><c:out value="${item.nttSj}" /></span>
			                                <span class="text"><c:out value="${item.frstRegisterPnttm}"/></span>
			                            </a>
		                            </li>
	                            </form>	                            
							</c:forEach>
                        </ul>
					</div>
				</div>
				<div class="l"><!-- 게시판2 -->
					<h3 class="m_tit01 mt15">소식</h3><!-- 생성된 게시판 목록 -->
					<div class="main_con">
					    <ul>
					    	<c:forEach var="item" items="${list2}">
								<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
									<li class="list">
										<input name="nttId" type="hidden" value="<c:out value="${item.nttId}"/>">
									    <input name="bbsId" type="hidden" value="<c:out value="${item.bbsId}"/>">
										<a class="submitBtn" style="cursor: pointer">
			                                <span class="title"><c:out value="${item.nttSj}" /></span>
			                                <span class="text"><c:out value="${item.frstRegisterPnttm}"/></span>
			                            </a>
		                            </li>
	                            </form>	       
							</c:forEach>
                        </ul>
					</div>
				</div>
			</div>

	</div><!-- end container -->
			
		<!-- bottom -->
		<c:import url="./main_bottom.jsp" />
		</div><!-- contents -->
	
</div><!-- end wrap -->


	<script>
	$(document).ready(function(){

	    $(".lazy").slick({
	        lazyLoad: 'ondemand', // ondemand progressive anticipated
	        infinite: true,
	        autoplay: true,
	        autoplaySpeed: 3000,
	        slidesToShow: 1
	      });
	    
        $('.regular').slick({
            dots: true,
            arrows: true,
            infinite: true,
            autoplay: true,
            autoplaySpeed: 3000,
            slidesToShow: 1,
            prevArrow: $('.prev-arrow'),
            nextArrow: $('.next-arrow')
        });
	});
	
	$(".submitBtn").on("click", function() {
		$(this).parent().parent().submit();
	});
	
	</script>
		
</body>
</html>
