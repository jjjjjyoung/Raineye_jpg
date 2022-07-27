<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
::-webkit-scrollbar{width: 10px;}
::-webkit-scrollbar-track {background-color:#999;}
::-webkit-scrollbar-thumb {background-color:#222;border-radius: 3px;}
::-webkit-scrollbar-thumb:hover {background: #555;}
::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:10px;height:16px;background:#222;} 
</style>

<div class="am-left-sidebar">
	<div class="content">
		<div class="am-logo">
			<span>CMS CO</span>
		</div>
		<ul class="sidebar-elements">
			<li class="parent"><a href="/home.do"><i
					class="fas fa-sign-in-alt snb-icon"></i><span>바로가기</span>
					</a>
				<ul class="sub-menu">
					<li><a href="/home.do">메인화면</a></li>

				</ul></li>
			<!-- 
			<li class="parent"><a href="#"><i
					class="fas fa-sign-in-alt snb-icon"></i><span>사용자 통합인증</span></a>
				<ul class="sub-menu">
					<li><a href="/uat/uap/selectLoginPolicyList.do">로그인정책관리</a></li>

				</ul></li>
			<li class="parent"><a href="#"><i
					class="fas fa-shield-alt snb-icon"></i><span>보안</span></a>
				<ul class="sub-menu">
					<li><a href="/sec/ram/EgovAuthorList.do">권한관리</a></li>
					<li><a href="/sec/rgm/EgovAuthorGroupList.do">권한그룹관리</a></li>
					<li><a href="/sec/gmt/EgovGroupList.do">그룹관리</a></li>
					<li><a href="/sec/rmt/EgovRoleList.do">롤관리</a></li>
					<li><a href="/sec/drm/EgovDeptAuthorList.do">부서권한관리</a></li>
				</ul></li>
			 -->

			<li class="parent"><a href="#"><i
					class="fas fa-cogs snb-icon"></i><span>회원 관리</span></a>
				<ul class="sub-menu">
					<li><a href="/uss/umt/EgovMberManage.do">사용자 관리</a></li>			
					<li><a href="/uss/umt/EgovUserManage.do">관리자 관리</a></li>
					<li><a href="/paidMemberList.do">유료회원 신청 관리</a></li>
					<!-- 
					<li><a href="/cop/sms/addSms.do">문자메시지 발송</a></li>
					<li><a href="/cop/ems/insertSndngMailView.do">메일발송</a></li>
 					-->
				</ul></li>
			<li class="parent"><a href="#"><i
					class="fas fa-user-cog snb-icon"></i><span>홈페이지 관리</span></a>
				<ul class="sub-menu">
					<!-- <li><a href="/uss/umt/EgovEntrprsMberManage.do">--450.기업회원관리</a></li> -->
					
					<!-- 
					<li><a href="/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do">저작권보호정책</a></li>
					<li><a href="/uss/sam/ipm/listIndvdlInfoPolicy.do">개인정보보호정책확인</a></li>
					 -->
					<li><a href="/cop/bbs/selectBBSMasterInfs.do">게시판 관리</a></li>
					<li><a href="/contentsManage.do">컨텐츠 관리</a></li>
					<li><a href="/eduList.do">교육 / 체험 관리</a></li>
					<li><a href="/bgmManage.do">BGM 관리</a></li>
					<li><a href="/snsManage.do">SNS 관리</a></li>
					<li><a href="/uss/ion/pwm/listPopup.do">팝업 관리</a></li>
					<li><a href="/uss/ion/bnr/selectBannerList.do">배너 관리</a></li>
					<li><a href="/sym/mnu/mpm/EgovMenuManageSelect.do"> 메뉴 관리</a></li>
					<!-- <li><a href="/uss/ion/lsi/selectLoginScrinImageList.do">로그인화면이미지관리</a></li> -->

				</ul></li>
				<!-- 
			<li class="parent"><a href="#"><i
					class="fas fa-laptop snb-icon"></i><span>시스템관리</span></a>
				<ul class="sub-menu">
			        <li><a href="/sym/mnu/mpm/EgovMenuListSelect.do">메뉴관리리스트</a></li>
			        
			        <li><a href="/sym/mnu/mcm/EgovMenuCreatManageSelect.do">메뉴권한관리</a></li> 
				</ul></li>
			-->
			<li class="parent"><a href="#"><i
					class="far fa-chart-bar snb-icon"></i><span>통계/리포팅</span></a>
				<ul class="sub-menu">
					<!-- 
					<li><a href="/sts/bst/selectBbsStats.do">게시물통계</a></li>
					<li><a href="/sts/ust/selectUserStats.do">사용자통계</a></li>
					 -->
					<li><a href="/sts/cst/selectConectStats.do">접속통계</a></li>
					<!-- 
					<li><a href="/sts/sst/selectScrinStats.do">화면통계</a></li>

					<li><a href="/sts/dst/selectDtaUseStatsListView.do">자료이용현황통계</a></li>
					 -->
				</ul></li>

		</ul>
	</div>
</div>

		<!-- Layout wrapper -->
		 <div class="layout-wrapper layout-2">
		<div class="layout-inner"> 
