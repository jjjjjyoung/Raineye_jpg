<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/kidMenu.do"/>

<style>

.slick-next:before {margin-left: -150px;content:''; width: 30px; height: 30px; border-right: 3px solid white; border-bottom:3px solid white; transform:rotate(-45deg); display:inline-block;}
.slick-prev:before {margin-right: -150px;content:''; width: 30px; height: 30px; border-left: 3px solid white; border-bottom:3px solid white; transform:rotate(45deg); display:inline-block;}
.slick-prev, .slick-next {z-index: 10;}

@media screen and (max-width: 1024px) {
	
    #nav .logo { width: 200px; float: none; margin: auto; line-height: 60px; height: 100%;}
    
    #nav .gnb_menu_btn { width: 60px; display: block; margin-top: 5px;}
    
}


</style>

<div id="container" class="kidCon jpg_kid_main">
    <div class="content kid_main">
        <div class="main_visual pc">
            <div><img src="/images/egovframework/com/jpg/gallery/photo01.jpg" alt="어린이국악단 공연 사진1"></div>
            <div><img src="/images/egovframework/com/jpg/gallery/photo02.jpg" alt="어린이국악단 공연 사진2"></div>
            <div><img src="/images/egovframework/com/jpg/gallery/photo03.jpg" alt="어린이국악단 공연 사진3"></div>
            <div><img src="/images/egovframework/com/jpg/gallery/photo04.jpg" alt="어린이국악단 공연 사진4"></div>
        </div>

        <div class="main_visual mb">
            <div><img src="/images/egovframework/com/jpg/gallery/photo01_mb.jpg" alt="어린이국악단 공연 사진1"></div>
            <div><img src="/images/egovframework/com/jpg/gallery/photo02_mb.jpg" alt="어린이국악단 공연 사진2"></div>
            <div><img src="/images/egovframework/com/jpg/gallery/photo03_mb.jpg" alt="어린이국악단 공연 사진3"></div>
            <div><img src="/images/egovframework/com/jpg/gallery/photo04_mb.jpg" alt="어린이국악단 공연 사진4"></div>
        </div>
    <script src="/js/egovframework/com/jpg/jquery.matchHeight.js?ver=1.3"></script>
        <script>


        $(function() {  
        	/* $('img').matchHeight();
        	$('.content').matchHeight({ target: $('.plz') }); 
        	});
        	
       		$( window ).resize(function() {
        	$('img').matchHeight();
        	$('.content').matchHeight({ target: $('.plz') }); }); */
        
            $('.main_visual').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                dots: false,
                focusOnSelect: true,
                arrows: true,
                autoplay: true,
                speed: 300 
            });
        })
        </script>
    </div>
    <!--end content-->
</div>
<!--end container-->
	
<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp" %>