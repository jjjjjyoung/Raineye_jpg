<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>CMS CO</title>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/x-icon" href="favicon.ico">


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
<link type="text/css" rel="stylesheet" href="<c:url value='/assets/lib/jquery.vectormap/jquery-jvectormap-1.2.2.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='https://use.fontawesome.com/releases/v5.8.2/css/all.css' />">
 <link type="text/css" rel="stylesheet" href="<c:url value='/assets/css/app.css' />">


<script>
	document['documentMode'] === 10
			&& document
					.write('<script src="https://polyfill.io/v3/polyfill.min.js?features=Intl.~locale.en"><\/script>')
</script>
<script>
	window.themeSettings = new ThemeSettings({
		cssPath : "/css/egovframework/com/cms/",
		themesPath : "/css/egovframework/com/cms/"
	});

</script>
