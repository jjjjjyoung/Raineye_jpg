<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>CMS CO</title>

<c:if test="${loginVO.userSe ne 'USR' }">
<script>
alert("관리자 권한만 접근 가능합니다.");
location.href="/";
</script>	
</c:if>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/x-icon" href="favicon.ico">

<!-- load jQuery -->
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>

<!-- load js file -->
<script	src="<c:url value='/assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js'/> "></script>
<script	src="<c:url value='/assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js'/> "></script>
<script src="<c:url value='/assets/js/app.js'/> "></script>

<!-- Libs -->
<script src="<c:url value='/js/egovframework/com/cms/perfect-scrollbar.js'/> "></script>
<script src="<c:url value='/js/egovframework/com/cms/datatables.js'/> "></script>

<!-- content, datatable css -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/datatables.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/appwork.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/colors.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/demo.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/fontawesome.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/fullcalendar.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/fullcalendar.print.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/ionicons.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/linearicons.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/open-iconic.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/Stroke-7.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/theme-corporate.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/uikit.css' />">

<!-- assets head,snb css -->
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/css/reset.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/icons/style.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/lib/stroke-7/style.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='https://use.fontawesome.com/releases/v5.8.2/css/all.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/css/app.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">

<style>
.layout-wrapper {
    margin-left: 100px;
    padding: 2rem;
    width: auto;
}

 div.board h1, div.calendar h2, .layout-container h2, .layout-container h1,
	.wTableFrm h2 {
	background-color: none!important;
	margin-bottom: 0!important;
	padding-bottom: 1.2rem!important;
	font-size: 1.5rem!important;
	margin-top:0!important;
} 

.layout-sidenav-toggle {
	color: #fff;
	position: absolute;
	left: 10px;
	top: 15px;
	width: 20px;
	height: 20px;
}


.app-brand {
	margin-left: 10px;
}
</style>



</head>
<script>
var timer2 = "60:01";
var interval = setInterval(function() {


	var timer = timer2.split(':');
	
	var minutes = parseInt(timer[0], 10);
	var seconds = parseInt(timer[1], 10);
	--seconds;
	minutes = (seconds < 0) ? --minutes : minutes;
	if (minutes < 0) clearInterval(interval);
	seconds = (seconds < 0) ? 59 : seconds;
	seconds = (seconds < 10) ? '0' + seconds : seconds;
	
	$('#counter1').html(minutes + ':' + seconds);
	timer2 = minutes + ':' + seconds;
	  
	
	if(timer2 == "0:00"){
		clearInterval(interval);
		window.location.href="/uat/uia/actionLogout.do";
		alert("세션시간이 끝났습니다.");
	}
	  
	  
	}, 1000);
	

</SCRIPT>
</script>
<body >

    <div class="am-wrapper">
        <nav class="navbar navbar-expand-md fixed-top am-top-header">
            <div class="container-fluid">
            
                <div class="am-navbar-header">
                    <div class="page-title"><span>Dashboard</span></div>
                    <a class="am-toggle-left-sidebar navbar-toggle collapsed" href="/cms.do"><span class="icon-bar"><span></span><span></span><span></span></span></a>
                    <a class="navbar-brand" href="/cms.do"></a>
                </div>
                
                <button class="navbar-toggler hidden-md-up collapsed" data-toggle="collapse" data-target="#am-navbar-collapse"><span class="icon fas fa-chevron-down"></span></button>
                
                <div class="collapse navbar-collapse" id="am-navbar-collapse">
                    <ul class="nav navbar-nav am-user-nav">
                        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-expanded="false"><c:out value='${loginVO.name }'/>님 어서오세요<span class="angle-down fas fa-chevron-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
<!--                                 <li><a href="#"> <span class="icon fas fa-user"></span>My profile</a></li>
                                <li><a href="#"> <span class="icon fas fa-envelope"></span>Settings</a></li>
                                <li><a href="#"> <span class="icon fas fa-cog"></span>Help</a></li> -->
                                
                                
                                <li><a href="/uat/uia/actionLogout.do"> <span class="icon fas fa-sign-out-alt"></span>Sign Out</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav am-top-logo">
                        <li><a href="/cms.do" style="font-size:1.8em;">CMS CO</a></li>
						<li><div style="height: 80px;line-height: 80px;color: #fff;margin-left: 300px;">세션남은시간 : <span id="counter1"></span></li>
                    </ul>

            </div>
        </nav>
	<!-- / navbar -->
