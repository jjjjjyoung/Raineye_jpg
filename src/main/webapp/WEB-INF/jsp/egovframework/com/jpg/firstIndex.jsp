<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, viewport-fit=cover">
			<meta name="apple-mobile-web-app-capable" content="yes" />
			<meta property="og:type" content="website">
			<meta property="og:title" content="전라남도립국악단">
			<meta property="og:description" content="전남 무안군 삼향읍 남악로 위치. 전남도립국악단 소개. 공연정보. 교육정보. 어린이국악단. 티켓예매 등 안내.">
			<meta property="og:image" content="/images/egovframework/com/jpg/favicon_link_img.jpg">
			<link rel="icon" href="/images/egovframework/com/jpg/favicon.png">
			<link rel="shortcut icon" href="/images/egovframework/com/jpg/favicon.ico">
			<title>전라남도립국악단</title>

			<script>
			var uAgent = navigator.userAgent.toLowerCase(); 
			// 아래는 모바일 장치들의 모바일 페이지 접속을위한 스크립트 
			var mobilePhones = new Array('iphone', 'ipod', 'ipad', 'android', 'blackberry', 'windows ce','nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile'); 
			for (var i = 0; i < mobilePhones.length; i++){ 
				if (uAgent.indexOf(mobilePhones[i]) != -1){ 
					//모바일 이미지 설정 hm
				    var imgArray = new Array();
					imgArray[0] = "/images/egovframework/com/jpg/mobile_intro1.jpg";
					imgArray[1] = "/images/egovframework/com/jpg/mobile_intro2.jpg";
					imgArray[2] = "/images/egovframework/com/jpg/mobile_intro3.jpg";
					imgArray[3] = "/images/egovframework/com/jpg/mobile_intro4.jpg"; 
					break;
				} 
				else {
					//PC 이미지 설정 hm
				    var imgArray = new Array();
					imgArray[0] = "/images/egovframework/com/jpg/intro1.jpg";
					imgArray[1] = "/images/egovframework/com/jpg/intro2.jpg";
					imgArray[2] = "/images/egovframework/com/jpg/intro3.jpg";
					imgArray[3] = "/images/egovframework/com/jpg/intro4.jpg"; 
				}
			};
			</script>
			
			<link rel="stylesheet" href="/css/egovframework/com/jpg/wb.min.css"/>
	        <script src="/js/egovframework/com/jpg/jquery-3.3.1.min.js"></script>
		    <script src="/js/egovframework/com/jpg/jquery.transit.js"></script>
			<!--
			 <link href="css/wb.min.css" rel="stylesheet" type="text/css">
			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.transit.js"></script>
 			 -->
			<style>
                
                /*css는 /css/egovframework/com/jpg/style.css 제일 아래쪽에 옮기고 
                <link rel="stylesheet" href="/css/egovframework/com/jpg/style.css"> 연결하면 될것같습니다~*/
                
				/* intro */
				.intro-wrapper {position:relative; width:100%; height:100%; overflow:hidden}
				.intro-wrapper .intro-content {}
                
                
                .intro-wrapper .intro-content .txt figure { position: absolute; z-index: 999;}
				.intro-wrapper .intro-content .txt figure.intro_txt { left: 50%; top: 50%; transform: translate(-50%,-50%); max-width: 815px; width: 100%;}
				.intro-wrapper .intro-content .txt figure.intro_logo { right: 4%; bottom: 3%; width: 100%; max-width: 300px;}
                
                
				.intro-wrapper .intro-content .img {position:absolute; top:0; left:0; right:0; bottom:0; -ms-transform:scale(1); -webkit-transform:scale(1); -moz-transform:scale(1); -o-transform:scale(1); transform:scale(1)}
				/*.intro-wrapper .intro-content .img.no-transit {top:-100px; right:-100px; bottom:-100px; left:-100px}*/
				.intro-wrapper .intro-content .img1 {background:url(images/content/intro1.jpg) 100% no-repeat; background-size:cover}
				.intro-wrapper .intro-content .img2 {background:url(images/content/intro2.jpg) 100% no-repeat; background-size:cover}
				.intro-wrapper .intro-content .img3 {background:url(images/content/intro3.jpg) 100% no-repeat; background-size:cover}
				.intro-wrapper .intro-content .img4 {background:url(images/content/intro4.jpg) 100% no-repeat; background-size:cover}
				/*
				@media screen and (min-width:2560px) {
					.intro-wrapper .intro-content .txt strong {width:1564px; height:118px; margin:-59px 0 0 -782px; background:url(/images/content/bg-logo-2560.png) no-repeat}
					.intro-wrapper .intro-content .txt p {margin-left:-782px; font-size:65px}
				}*/
			</style>
			
	<script type="text/javascript">
	

	
	$(function() {
        //이미지 사이즈 점점 커지는 쿼리 부분
		$(".img").transition({
			  "scale":" 1.25"
		},6000);
		
 	});
	

    //메인으로 넘어가는 스크립트 부분
    setTimeout(function() { 
	    self.location.replace('/home.do');
	}, 5000);		

    //이미지 랜덤으로 나오는 스크립트 부분 hm
	function showImage(){
		var imgNum = Math.round(Math.random()*3);
		var objImg = document.getElementById("introImg");
	    $('.img').append($('<img/>', {
	        src: imgArray[imgNum],
	        id: 'introImg',
	        alt : '전라남도립국악단에 오신 것을 환영합니다'
	    }));
	}
	
	</script>
	
	<!-- 모바일 인트로 아래 안잘리게 하기 -->
	<style>
	@media screen and (max-width:500px) {
		#introImg{width:140% !important; max-width:500%; padding-right:30px;}
	}
	</style>

		</head>

		<body class="slides white" onload="showImage()">

	<!--SVG-->
	<svg xmlns="http://www.w3.org/2000/svg" style="display:none">
		<symbol id="menu" viewBox="0 0 18 18"><path	d="M16 5h-14c-.6 0-1-.4-1-1 0-.5.4-1 1-1h14c.5 0 1 .4 1 1s-.4 1-1 1zm-14 5h14c.5 0 1-.4 1-1 0-.5-.4-1-1-1h-14c-.6 0-1 .4-1 1s.4 1 1 1zm14 3h-14c-.5 0-1 .4-1 1 0 .5.4 1 1 1h14c.5 0 1-.4 1-1s-.4-1-1-1z"></path></symbol>
		<symbol id="close" viewBox="0 0 30 30"><path d="M15 0c-8.3 0-15 6.7-15 15s6.7 15 15 15 15-6.7 15-15-6.7-15-15-15zm5.7 19.3c.4.4.4 1 0 1.4-.2.2-.4.3-.7.3s-.5-.1-.7-.3l-4.3-4.3-4.3 4.3c-.2.2-.4.3-.7.3s-.5-.1-.7-.3c-.4-.4-.4-1 0-1.4l4.3-4.3-4.3-4.3c-.4-.4-.4-1 0-1.4s1-.4 1.4 0l4.3 4.3 4.3-4.3c.4-.4 1-.4 1.4 0s.4 1 0 1.4l-4.3 4.3 4.3 4.3z"/></symbol>
  		<symbol id="close-small" viewBox="0 0 11 11"><path d="M6.914 5.5l3.793-3.793c.391-.391.391-1.023 0-1.414s-1.023-.391-1.414 0l-3.793 3.793-3.793-3.793c-.391-.391-1.023-.391-1.414 0s-.391 1.023 0 1.414l3.793 3.793-3.793 3.793c-.391.391-.391 1.023 0 1.414.195.195.451.293.707.293s.512-.098.707-.293l3.793-3.793 3.793 3.793c.195.195.451.293.707.293s.512-.098.707-.293c.391-.391.391-1.023 0-1.414l-3.793-3.793z"/></symbol>
	</svg>


	<div class="intro-wrapper">
		<div class="intro-content">
		<!-- hm pc -->
			<div class="txt intro_pcm_liv01">
				<figure class="intro_txt"><img src="/images/egovframework/com/jpg/intro_txt.png" alt="전통예술과 함께하는 전라남도를 만들어갑니다." class="intro_text_pra"></figure>
				<figure class="intro_logo"><img src="/images/egovframework/com/jpg/intro_logo.png" alt="전라남도립국악단"></figure>
			</div>
		<!-- hm mob -->
			<div class="txt intro_pcm_liv02">
				<figure class="intro_txt inteolo_vz0"><img src="/images/egovframework/com/jpg/intro_txt_mob.png" alt="전통예술과 함께하는 전라남도를 만들어갑니다." class="intro_text_pra"></figure>
				<figure class="intro_logo inteolo_v1"><img src="/images/egovframework/com/jpg/intro_logo_mob.png" alt="전라남도립국악단"></figure>
			</div>
			
			
			<!-- 4개 중에서 한개만 랜덤하게 출력 -->
			<div class="img img1">
			</div>
			
			<!-- //4개 중에서 한개만 랜덤하게 출력 -->
		</div>
	</div>
	<div id="divGetScrollbarWidth" style="position:absolute; left:-100px; top:-500px; width:300px; height:350px; overflow:auto"><div style="height:400px"></div></div>

	
		</body>
	</html>



