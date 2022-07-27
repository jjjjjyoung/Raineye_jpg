<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/index.css">
<script src="/js/egovframework/com/jpg/index.js"></script>


<script>
function Move_left(id) {
	$(id).on('click',function(e) {
		var $href = $(this).find('a').attr('href');
		var $left = $($href).offset().left;

		$('html, body').animate({
			scrollLeft: $left - 120
		},600);

		$($href).focus();
		
	});
}

$(function() {
	var outMsg = '${outMsg}';

	if (outMsg.length > 1) {
		alert(outMsg);
	}

	// 오른쪽 스크롤 이동
	Move_left("#home")
	Move_left("#perf")
	Move_left("#noti")


    $(window).scroll(function() {

		var $perfleft = $('#panel-2').offset().left - 300;
		var $perfnext = $('#panel-2').offset().left;

		if ($(this).scrollLeft() >= $perfleft && $(this).scrollLeft() < $perfnext) {
        	
        	$("#home").removeClass('select');
        	$("#noti").removeClass('select');
        	$("#perf").addClass('select');
        	
        } else if($(this).scrollLeft() >= $perfnext ) {
        	
        	$("#home").removeClass('select');
        	$("#perf").removeClass('select');
        	$("#noti").addClass('select');
        	
        } else if($(this).scrollLeft() < $perfleft) {
        	
        	$("#noti").removeClass('select');
        	$("#perf").removeClass('select');
        	$("#home").addClass('select');
        	
        }

		/*
		if ($(this).scrollLeft() >= "470" && $(this).scrollLeft() < "1240") {
        	
        	$("#home").removeClass('select');
        	$("#noti").removeClass('select');
        	$("#perf").addClass('select');
        	
        } else if($(this).scrollLeft() >= "1240" ) {
        	
        	$("#home").removeClass('select');
        	$("#perf").removeClass('select');
        	$("#noti").addClass('select');
        	
        }else if($(this).scrollLeft() < "470"){
        	
        	$("#noti").removeClass('select');
        	$("#perf").removeClass('select');
        	$("#home").addClass('select');
        	
        }
		*/

    });
});

function scrollLeft(type,obj){
	$('.anchor > li').each(function(){
		$(this).removeClass('select');
	});
	if(type == "1"){
		$('html').scrollLeft(0);
		$(obj).parents().addClass('select');
		$("#home").addClass('select');
	}else if(type =="2"){
		var leftmenu = $(".leftMenu").outerWidth();
		var panel = $("#panel-1").width();
		var scrollLeft =  leftmenu;
		
		$('html').scrollLeft(1100);
		
		$(obj).parents().addClass('select');
		$("#perf").addClass('select');	
	}else if(type =="3"){
		var html = $("html").width();
		$('html').scrollLeft(html);
		$("#noti").addClass('select');
	}
}


function getCookie(name){
	  var nameOfCookie = name + "=";
	  var x = 0

	  while( x <= document.cookie.length){
	    var y = (x+nameOfCookie.length);

	    if(document.cookie.substring(x, y) == nameOfCookie){
	      if((endOfCookie=document.cookie.indexOf( ";",y )) == -1)
	        endOfCookie = document.cookie.length;
	      return unescape(document.cookie.substring(y, endOfCookie));
	    }

	    x = document.cookie.indexOf( " ", x ) + 1;

	    if( x == 0 )
	      break;
	  }

	  return "";
	}

</script>

<!-- <script>



<c:forEach var="pop" items="${popList}">
	var fileUrl = '<c:out value="${pop.fileUrl}"/>';
	var popupId = '<c:out value="${pop.popupId}"/>';
	var popupSjNm = '<c:out value="${pop.popupSjNm}"/>';
	
	var popupWSize = '<c:out value="${pop.popupWidthSize}"/>';
	var popupHSize = '<c:out value="${pop.popupVrticlSize}"/>';
	var popupWlc = '<c:out value="${pop.popupWidthLc}"/>';
	var popupHlc = '<c:out value="${pop.popupVrticlLc}"/>';
	
	var link = "/uss/ion/pwm/openPopupManage.do?fileUrl="+fileUrl+"&stopVewAt=Y&popupId="+popupId;
	var option = 'width='+popupWSize+',height='+popupHSize+',left='+popupWlc+',top='+popupHlc;
	
	if(getCookie(popupId) != 'done'){
		
		window.open(link,popupSjNm,option);
	}
		

	
</c:forEach>
</script> -->
<!--start container-->

<style>
.slick-slide {
    width: 1400px !importent;
}

</style>

<c:forEach var="pop" items="${popList}" varStatus="status">
      	<c:import url="/uss/ion/pwm/openPopupManage.do" charEncoding="utf-8">
			<c:param name="popupId" value="${pop.popupId}" />
		    <c:param name="fileUrl" value="${pop.fileUrl}" />
			<c:param name="stopVewAt" value="Y" />
			<c:param name="popCount" value="${status.count}"/>
		</c:import>
		
</c:forEach>
<div id="container">
	<div class="leftMenu">
		<div class="tab">
			<a tabindex = "2" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M">공연일정</a> 
			<a tabindex = "2" href="/contents.do?id=ticketing">공연예매</a> 
			<a tabindex = "2" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000044">뉴스레터</a>
		</div>
		<ul class="anchor">
			<li id="home" class="select"><a tabindex = "2"  href="#go_direct">Home</a></li>
			<li id="perf" class=""><a tabindex = "2" href="#panel-2">공연</a></li>
			<li id="noti" class="" ><a tabindex = "2" href="#panel-3" >알림</a></li>
		</ul>
		<!--<ul class="anchor">
			<li id="home" class="select"><a tabindex = "2"  href="javascript:scrollLeft('1','1');">Home</a></li>
			<li id="perf" class=""><a tabindex = "2" href="javascript:scrollLeft('2','2');">공연</a></li>
			<li id="noti" class="" ><a tabindex = "2" href="javascript:scrollLeft('3','3');" >알림</a></li>
		</ul>-->
	</div>
	<!--end leftMenu-->

	<!--start content-->
	<div class="content" id="page-wrap">

		<!--start panel-1-->
		<c:import url="/uss/ion/bnr/getBannerImage.do" charEncoding="utf-8">
			<c:param name="atchFileId" value="${banner.bannerImageFile}" />
		</c:import>
		<!--end panel-1-->

		<!--start panel-2-->
		<p class="main_mid_titleye2">주요공연일정</p>
		<div class="cont02 pannel" id="panel-2">
		
			<!--start 공연포스터-->
			
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
			
			<!----
			<div class="main_next_boxye">
				<img src="../../../../images/egovframework/com/jpg/icon/prev_arrow2.png" class="main_next_btnye1">
				<img src="../../../../images/egovframework/com/jpg/icon/next_arrow2.png" class="main_next_btnye2">
			</div>
			---->
			
			<div class="poster mb ifdj_zero1">
				<c:forEach items='${list5}' var="list5" varStatus="status">
					<div class="slick-slide">
					<%--<c:if test="${list5.ntceBgnde >= sysYear}">--%>
						<a tabindex = "3" class="tabindex_slick" href="/cop/bbs/selectArticleDetail.do?bbsId=${list5.bbsId}&nttId=${list5.nttId}&skin=M">
						<c:choose>
							<c:when test="${list5.ntceEndde >= sysYear}">
							<img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" alt="<c:out value='${list5.nttSj}'/>">
							</c:when>
							<c:when test="${list5.ntceEndde < sysYear}">
							<img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" class="grayimg" alt="<c:out value='${list5.nttSj}'/>">
							</c:when> 
						</c:choose>
						<!--img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" alt="" class="grayimg"-->
							<span>
								<c:choose>
								<c:when test="${list5.type =='토요'}">
									<span class="bedge blue">토요</span>
								</c:when>
								<c:when test="${list5.type =='정기'}">
									<span class="bedge pink">정기</span>
								</c:when>
								<c:when test="${list5.type =='기획'}">
									<span class="bedge green">기획</span>
								</c:when>
								</c:choose>
								<c:out value='${list5.sjBoldAtMain}'/>
							</span>	
							
							<c:out value='${list5.nttSj}' escapeXml="false"/>
							
							<!--  ${fn:substring(list5.ntceBgnde,5,7)} -->
						
							<%-- <span>${fn:substring(list5.ntceBgnde,0,10)} - ${fn:substring(list5.ntceEndde,0,10)}</span> --%>
						</a>
					<%--</c:if>	--%>
					</div>
				</c:forEach> 
				
			</div>
					
			<div  class="poster pc">
				
				<c:forEach items='${list5}' var="list5" varStatus="status">
					<div class="slick-slide" >
						
						
						<a tabindex = "0" class="tabindex_slick"  href="/cop/bbs/selectArticleDetail.do?bbsId=${list5.bbsId}&nttId=${list5.nttId}&skin=M" style="display:block">
						<c:choose>
							<c:when test="${list5.ntceEndde >= sysYear}">
							<img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" alt="<c:out value='${list5.nttSj}'/>">
							</c:when>
							<c:when test="${list5.ntceEndde < sysYear}">
							<img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" class="grayimg" alt="<c:out value='${list5.nttSj}'/>">
							</c:when> 
						</c:choose>
							<span>
								<c:choose>
								<c:when test="${list5.type =='토요'}">
									<span class="bedge blue">토요</span>
								</c:when>
								<c:when test="${list5.type =='정기'}">
									<span class="bedge pink">정기</span>
								</c:when>
								<c:when test="${list5.type =='기획'}">
									<span class="bedge green">기획</span>
								</c:when>
								</c:choose>
								<c:out value='${list5.sjBoldAtMain}'/>
							</span>	
						
							<strong><c:out value='${list5.nttSj}' escapeXml="false"/></strong>
							<!--<strong><c:out value='${list5.ntceEndde}' escapeXml="false"/></strong>-->
							<%-- <span>${fn:substring(list5.ntceBgnde,0,10)} - ${fn:substring(list5.ntceEndde,0,10)}</span> --%>
						</a>
					
					</div>
				</c:forEach> 
				
			</div>
			<!--end 공연포스터-->
			
			<div class="sns_thumb ifdj_zero2">
				
				<div class="sns_tit">
					<button class="insta tablinks2" onclick="javascript:tapOpen('insta');" id="defaultOpen1" title="인스타그램 선택됨"></button>
					<button class="youtube tablinks2" onclick="javascript:tapOpen('youtube');" id="defaultOpen2" title="유튜브"></button>
					<!-- <button class="youtube tablinks2" onclick="openCity2(event, 'youtube_con')" id="defaultOpen2"></button> -->
				</div>
				<div id="insta_con" class="tabcontent2 btnb_alls_od" style="display:block;">
					
					
					
					
					
					<div class="thumb_list insta_list_allbox01">
						<!--  인스타 -->
						<c:forEach items='${instar}' var="instar" varStatus="status">
							<div class="slick-slide">
								<a tabindex = "3" class="tabindex_slick"  href='<c:out value="${instar.snsLink }"/>' target="_blank" title="인스타그램 바로가기(새창)" style="width:calc(100% - 10px); height:210px; display:block;">
									<div style="position:relative; overflow:hidden; width:100%; height:100%;">
										<div style="position:absolute; top:0; left:0; height:100%; width:100%;">
											<img src="/cmm/fms/getImage.do?atchFileId=${instar.snsFile}" alt="<c:out value='${instar.snsTitle}'/>" style="height:100%; object-fit:cover; width:-webkit-fill-available !important;">
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
					
					
					
					
					
				</div>
				
				<div id="youtube_con" class="tabcontent2 fadoi_boid_y" style="display:none;">
					<div class="thumb_list2">
					
						<c:forEach items='${youtube}' var="youtube" varStatus="status">
							<div class="slick-slide">
								<a tabindex = "3" class="tabindex_slick" href='<c:out value="${youtube.snsLink }"/>' target="_blank" title="유튜브 공유하기(새창)">
									<img src="/cmm/fms/getImage.do?atchFileId=${youtube.snsFile}" alt="<c:out value='${youtube.snsTitle}'/>" >
								</a>
							</div>
						</c:forEach>
						
						<!-- 
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum01.jpg" alt="썸네일1"></a>
						</div>
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum02.jpg" alt="썸네일2"></a>
						</div>
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum03.jpg" alt="썸네일3"></a>
						</div>

						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum04.jpg" alt="썸네일4"></a>
						</div>
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum01.jpg" alt="썸네일1"></a>
						</div>
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum02.jpg" alt="썸네일2"></a>
						</div>
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum03.jpg" alt="썸네일3"></a>
						</div>
						<div class="slick-slide">
							<a href=""><img
								src="/images/egovframework/com/jpg/main/thum04.jpg" alt="썸네일4"></a>
						</div>
						 -->
					</div>
				</div>
			</div>
			<!--end 인스타,전라남도 도립 국악단 유투브 썸네일-->
		</div>
				<!--end paneanl-2-->

		<!--start panel-3-->
		<div class="cont03 pannel" id="panel-3">
			<!--start tab-->
			<div class="tab02">
				<div class="active">
					<button class="tablinks atv" onclick="openCity(event, 'notice')" tabindex = "0"  id="defaultOpen">
						<p class="main_jpg_list3">공지사항</p>
					</button>
					<div id="notice" class="tabcontent">
						<h3>공지사항</h3>
						<a class="more" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000041" title="공지사항 더보기" id = "tabMore" tabindex = "0">+</a>
						<c:forEach items='${list1}' var="list1" varStatus="status">
						<div class="ntc_list" data-nttid="<c:out value="${list1.nttId}"/>" data-bbsid="<c:out value="${list1.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO1.bbsTyCode}'/>">
							<a class="goBtn" href="#" id = "tabContents"  tabindex = "0">
								<strong class="ellipsis"><c:out value='${list1.nttSj}'/></strong>
								<span class="ellipsis2 ntc_text"><c:out value='${fn:substring(list1.nttCn,0,55)}...' escapeXml="false"/></span>
								<span class="writer"><c:out value='${list1.frstRegisterNm}'/></span>
								<span><c:out value='${list1.frstRegisterPnttm}'/></span>
							</a>
						</div>
						</c:forEach> 
					</div>
				</div>
				<div>
					<button class="tablinks" onclick="openCity(event, 'notice2');" tabindex = "0" id = "tabNotice2">
						<p class="main_jpg_list3">채용공고</p>
					</button>
					<div id="notice2" class="tabcontent" style="display:none">
						<h3>채용공고</h3>
						<a class="more" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000042" title="채용공고 더보기" id = "tabMore2" tabindex = "0">+</a>
						<c:forEach items='${list2}' var="list2" varStatus="status">
						<div class="ntc_list" data-nttid="<c:out value="${list2.nttId}"/>" data-bbsid="<c:out value="${list2.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO2.bbsTyCode}'/>">
							<a class="goBtn"  id = "tabContents2"  tabindex = "0">
								<strong class="ellipsis"><c:out value='${list2.nttSj}'/></strong>
								<span class="ellipsis2 ntc_text"><c:out value='${fn:substring(list2.nttCn,0,45)}...' escapeXml="false"/></span>
								<span class="writer"><c:out value='${list2.frstRegisterNm}'/></span>
								<span><c:out value='${list2.frstRegisterPnttm}'/></span>
							</a>
						</div> 
						</c:forEach>
					</div>
				</div>
				<div>
					<button class="tablinks" onclick="openCity(event, 'news');" tabindex = "0" id = "tabNotice3">
						<p class="main_jpg_list3">언론보도</p>
					</button>
					<div id="news" class="tabcontent" style="display:none">
						<h3>언론보도</h3>
						<a class="more" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000043" title="언론보도 더보기" id = "tabMore3" tabindex = "0">+</a>
						<c:forEach items='${list3}' var="list3" varStatus="status"  >
						<div class="ntc_list ur_list_zo" data-nttid="<c:out value="${list3.nttId}"/>" data-bbsid="<c:out value="${list3.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO3.bbsTyCode}'/>">
							<a href='<c:url value="${list3.nttCn}" />' target="_blank" tabindex = "0" title="<c:out value='${list3.nttSj}' escapeXml="false"/>(새창)" id = "tabContents3">
								<strong class="ellipsis"><c:out value='${list3.nttSj}' escapeXml="false"/></strong>
								<%-- <p class="ellipsis2 ntc_text"><c:out value='${fn:substring(list3.nttCn,0,60)}...' escapeXml="false"/></p> --%>
								<span class="writer"><c:out value='${list3.frstRegisterNm}'/></span>
								<span><c:out value='${list3.frstRegisterPnttm}'/></span>
							</a>
						</div>
						</c:forEach>
					</div>
				</div>
				<div>
					<button class="tablinks" onclick="openCity(event, 'edu')" tabindex = "0" id = "tabNotice4">
						<p class="main_jpg_list3">교육체험</p>
					</button>
					<div id="edu" class="tabcontent" style="display:none">
						<h3>국악교육</h3>
						<a class="more" href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000046" title="교육시험 더보기" id = "tabMore4" tabindex = "0">+</a>
						<c:forEach items='${list4}' var="list4" varStatus="status" >
						<div class="ntc_list" data-nttid="<c:out value="${list4.nttId}"/>" data-bbsid="<c:out value="${list4.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO4.bbsTyCode}'/>">
							<a class="goBtn" id = "tabContents4"  tabindex = "0">
								<strong class="ellipsis"><c:out value='${list4.nttSj}'/></strong>
								<p class="ellipsis2 ntc_text"><c:out value='${fn:substring(list4.nttCn,0,45)}...' escapeXml="false"/></p>
								<span class="writer"><c:out value='${list4.frstRegisterNm}'/></span>
								<span><c:out value='${list4.frstRegisterPnttm}'/></span>
							</a>
						</div>
						</c:forEach>
					</div>
				</div>

				
				
				
				
			</div>
			<!--end tab-->			
			
			<form id="subForm" name="BoardVO" method="post" action="/cop/bbs/selectArticleDetail.do" style="display: hidden">
           		<input class="nttIdVal" name="nttId" type="hidden" value="">
			    <input class="bbsIdVal" name="bbsId" type="hidden" value="">
			    <input class="pageIndexVal" name="pageIndex" type="hidden" value=""/>
			    <input class="skinVal" name="skin" type="hidden" value=""/>
          	</form>

			<!--start tab_body-->
			<div id="tab_body">
			

			

			

			
			</div>
			<!--end tab_body-->
		</div>
		<!--end panel-3-->

		<!--start panel-4 foot-->
		<div class="foot pannel footer" id="panel-4">
		<div class="foot_bg __web-inspector-hide-shortcut__"><div class="foot_text"><img src="images/egovframework/com/jpg/foot_text.png" alt="전통예술과 함께하는 전라남도를 만들어갑니다." /></div><img src="images/egovframework/com/jpg/main/foot_bg.jpg" alt="전통예술과 함께하는 전라남도를 만들어갑니다."></div>
			<div class="ft_con pc">
				<div class="top">
                    <div class="fmSite">
						<!-- <a href="#">&#62;&nbsp;&nbsp; 패밀리 사이트</a> -->
						<select name="select" onchange="window.open(value,'_blank');" title="패밀리사이트">
								<option selected disabled>패밀리사이트</option>
	                            <option value="https://www.jeonnam.go.kr/" style="color:#333" title="전라남도 새창열기">전라남도</option>
	                            <option value="http://www.jact.or.kr/jact/index.do" style="color:#333" title="전남문화재단 새창열기">전남문화재단</option>
	                            <!-- <option value="https://www.mcst.go.kr/">문화관광부</option>
	                            <option value="http://www.cha.go.kr/main.html">문화재청</option>
	                            <option value="http://www.gugak.go.kr/">국립국악원</option>
	                            <option value="https://www.ntok.go.kr/">국립극장</option> -->
							</select> 
					</div>
					<!--end fmSite-->
				</div>
				<!--end top-->
				<div class="bottom">
					<img src="/images/egovframework/com/jpg/wa_img.png" class="wa_img_place" alt="전라남도립국악단">
					<figure>
						<img src="/images/egovframework/com/jpg/MainLogo_W.png" alt="전라남도립국악단">
					</figure>
					<div>58579 전남 무안군 삼향읍 남악로 222 (남도소리울림터 3F)</div>
					<div>222 Namak -ro, Samhyang-eup, Muan, Jeollanam-do</div>
					<div class="tel">
						<span>문의 . 061-285-6928</span>|<span>Fax . 061-285-6929</span>
					</div>
					<!-- <div>E-Mail : jpg6928@naver.com</div> -->
					<div class="info">
					    <a href="/contents.do?id=location">&#62;&nbsp;&nbsp;오시는 길</a>
                        <a href="/contents.do?id=privacy">&#62;&nbsp;&nbsp;개인정보처리방침</a>
					    <a href="/contents.do?id=service">&#62;&nbsp;&nbsp;이용안내</a>
                    </div>
					<div class="copyright">copyright&copy; 2019 전라남도립국악단 All
						Rights Reserved.</div>
				</div>
				<!--end bottom-->
			</div>
			<!--end pc-->
			
			
			
			
			
			
			
			<div class="ft_con mb">
                    <div class="top">
               			<!--------------------
                        <div class="left">
                            <a href="/contents.do?id=service">이용안내</a>
                            <a href="/contents.do?id=privacy">개인정보처리방침</a>
                        </div>
                    	--------------------->
                        <div class="right"> 
                            <select class="fm_select" name="select" onchange="window.open(value,'_blank');" title="패밀리사이트">
                                <option selected disabled>패밀리사이트</option>
                                <option value="https://www.jeonnam.go.kr/" style="color:#333" title="전라남도 새창열기">전라남도</option>
	                            <option value="http://www.jact.or.kr/jact/index.do" style="color:#333" title="전남문화재단 새창열기">전남문화재단</option>
                                <!-- <option value="https://www.mcst.go.kr/">문화관광부</option>
                                <option value="http://www.cha.go.kr/main.html">문화재청</option>
                                <option value="http://www.gugak.go.kr/">국립국악원</option>
                                <option value="https://www.ntok.go.kr/">국립극장</option> -->
                            </select>
                            <span>Family Site&nbsp;:&nbsp;</span>
                        </div>
                        <!--end right-->
                    </div>
                    <!--end top-->
                    <div class="mid">
                        <div class="left">
                            <img src="/images/egovframework/com/jpg/MainLogo_W.png" alt="전라남도립국악단">
                        </div>
                        <div class="right">
                            <a href="https://www.youtube.com/channel/UCwZHHFSbD15bnhBDBV01oBQ/featured" class="youtube">전라남도 도립 국악단 유투브</a>
                            <a href="https://www.instagram.com/jeonnam_gugak/" class="insta">전라남도 도립 국악단 인스타그램</a>
                        </div>
                    </div>
                    <!--end mid-->
                    <div class="bottom">
                        <div><strong>58579 전남 무안군 삼향읍 남악로 222 (남도소리울림터 3F)</strong></div>
                        <div>222 Namak -ro, Samhyang-eup, Muan, Jeollanam-do</div>
                        <div class="tel_fax"><strong>문의 . 061-285-6928</strong>|<strong>Fax . 061-285-6929</strong></div>
                        <!-- <div>E-Mail : jpg6928@naver.com</div> -->
                    </div>
                    <!--end bottom-->
                    
                    
                    
                    <div class="person_user_menu_li">
                    	<ul>
                        	<li><a href="/contents.do?id=service">이용안내</a></li>
                        	<li><a href="/contents.do?id=privacy">개인정보처리방침</a></li>
                        	<li><a href="/contents.do?id=location">오시는길</a></li>
                        </ul>
                    </div>
                    
                    
                    
                    <div class="copyright">copyright&copy; 2019 전라남도립국악단 All Rights Reserved.</div>
                </div>
			<!--end mb-->
		</div>
		<!--end panel-4 foot-->
	<!--end content-->
</div>
<!--end container-->

</div>
<!--end wrap-->

<script>
	//1st sec
	$('.visual').slick({
		dots : true,
		arrows : false,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 3000,
		slidesToShow : 1,
		slidesToScroll : 1,
		fade : false,
		swipeToSlide: true,
		//variableWidth: true,
		adaptiveHeight : false,
		appendDots: $('.slick_nav'),
		arrows: true,
		prevArrow: $('.slick_nav .prev'),
		nextArrow: $('.slick_nav .next')
	});

	$('.play').on('click', function() {
	  $('.visual').slick('slickPlay');
	});

	$('.pause').on('click', function() {
	  $('.visual').slick('slickPause');
	});

	$('.slick_btn button').click(function(e){
		e.preventDefault();
		$this = $(this);
		slickControl( $this, '.visual', '.pause', '.play');
	});	

	// slick control
	function slickControl($this, slick, stop, play){
		$slick = $(slick); //slider wrap
		$stop = $(stop); //Stop Button
		$play = $(play);//Play Button

		if($this.is(stop)){
			$stop.css('display','none');
			$play.delay(100).css('display','inline-block');
			$slick.slick('slickPause');
		}
		if($this.is(play)){
			$play.css('display','none');
			$stop.delay(100).css('display','inline-block');
			$slick.slick('slickPlay');
		}
	};

	//2nd sec poster
	$('.poster').slick({
		dots : false,
		arrows : false,
		infinite : true,
		autoplay : false,
		autoplaySpeed : 5000,
		slidesToShow : 4,
		slidesToScroll : 4,
		adaptiveHeight : false,
		responsive : [
			{
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3,
				}
			}, {
			breakpoint : 768,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2,
			}
		}, {
			breakpoint : 480,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2,
				arrows : true
			}
		} ]
	});

	//2nd sec sns thumb
function windowOpen(url,target){
	
	if(confirm("해당 페이지로 이동을 하시겠습니까?")){
		window.open(url, target);
		}
	}
	$('.thumb_list').slick({
		dots : false,
		arrows : false,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 5000,
		slidesToShow : 5,
		slidesToScroll : 5,
		adaptiveHeight : false,
		responsive : [ {
			breakpoint : 1600,
			settings : {
				slidesToShow : 4,
				slidesToScroll : 4,
			}
		}, {
			breakpoint : 560,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2
			}
		} ]
	});

	//2nd sec sns thumb
	$('.thumb_list2').slick({
		dots : false,
		arrows : false,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 5000,
		slidesToShow : 3,
		slidesToScroll : 3,
		adaptiveHeight : false,
		responsive : [ {
			breakpoint : 1600,
			settings : {
				slidesToShow : 3,
				slidesToScroll : 3
			}
		}, {
			breakpoint : 560,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2
			}
		} ]
	});

	// http://www.dte.web.id/2013/02/event-mouse-wheel.html
	(function() {
		function scrollHorizontally(e) {
			e = window.event || e;
			var delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)));
			document.documentElement.scrollLeft -= (delta * 40); // Multiplied by 40
			document.body.scrollLeft -= (delta * 40); // Multiplied by 40
			//e.preventDefault();
		}
		if (window.addEventListener) {
			// IE9, Chrome, Safari, Opera
			window.addEventListener("mousewheel", scrollHorizontally, false);
			// Firefox
			window
					.addEventListener("DOMMouseScroll", scrollHorizontally,
							false);
		} else {
			// IE 6/7/8
			window.attachEvent("onmousewheel", scrollHorizontally);
		}
	})();

	//panel-2 tab
	function openCity2(evt, cityName) {
		var i, tabcontent2, tablinks2;
		tabcontent2 = document.getElementsByClassName("tabcontent2");
		for (i = 0; i < tabcontent2.length; i++) {
			tabcontent2[i].style.display = "none";
		}
		tablinks2 = document.getElementsByClassName("tablinks2");
		for (i = 0; i < tablinks2.length; i++) {
			tablinks2[i].className = tablinks2[i].className.replace(" active",
					"");
		}
		document.getElementById(cityName).style.display = "block";
	}

	//document.getElementById("defaultOpen2").click();
	
	//panel-3 tab
	$(function(){
        var tabMenu = $(".tab02");
        var $tabButton = $(".tab02 > div > button");

        //컨텐츠 내용을 숨겨주세요!
        tabMenu.find("div > .tabcontent").hide();
        tabMenu.find("div.active > .tabcontent").show();

        //두번째 버튼 클릭 --> 모든 active 삭제 --> 내가 클릭한 버튼 active 추가
        function tabList(e){
        //e.preventDefault(); //#의 기능을 차단
        var target = $(this);
        target.next().show().parent("div").addClass("active").siblings("div").removeClass("active").find(".tabcontent").hide();    
        }

        tabMenu.find("div > button").click(tabList).focus(tabList);

        $tabButton.on("click focusin", function() {
            $tabButton.remove('atv');
            $(this).addClass("atv");
        });
    });

	/*
    $(function() {
        var $tabContent = $("#tab_body > div");

        $(".tab > button").on("click focusin", function() {
            var $this = $(this);
            var idx = $this.index();
            

            $this.siblings().filter(".atv").removeClass("atv");
            $this.addClass("atv");
            
            $tabContent.css("display","none");
            $tabContent.eq(idx).css("display","block");
        });
    });  
	*/

	
	//panel-3 tab
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		//evt.currentTarget.className += " atv";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

	function go_url(url) {
		if (url != '')
			window.open(url, '_blank');
	}

	$(".goBtn").on("click", function() {
		var baseDom = $(this).parent();
		
		$("#subForm .nttIdVal").val(baseDom.data("nttid"));
		$("#subForm .bbsIdVal").val(baseDom.data("bbsid"));
		$("#subForm .pageIndexVal").val(baseDom.data("pageindex"));	
		$("#subForm .skinVal").val(baseDom.data("skin"));	
		$("#subForm").submit();
	});
	
	function tapOpen(type){
		if(type == "insta"){
			$("#youtube_con").hide();
			$("#insta_con").show();
			$(".youtube").attr("title","유튜브");
			$(".insta").attr("title","인스타그램 선택됨");
			$(".youtube").removeClass("selected");
			$(".insta").addClass("selected");
			//init(type);
			$('.thumb_list').slick('resize');
		}else{
			$("#youtube_con").show();
			$("#insta_con").hide();
			$(".insta").attr("title","인스타그램");
			$(".youtube").attr("title","유튜브 선택됨");
			$(".insta").removeClass("selected");
			$(".youtube").addClass("selected");
			//init(type);
			 $('.thumb_list2').slick('resize');
		}

		
	}
	var agent = navigator.userAgent.toLowerCase();
	
	
	//$(".tabindex_slick").attr("tabindex", "3");
</script>

</body>

</html>