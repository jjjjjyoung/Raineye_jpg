<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    </div>
    <!--end subWrap-->
		<!--start footer-->
        <div class="footer">
            <div class="inner">
               <div class="ft_con pc">
                    <div class="top">
                        <div class="left">
                            <a href="/contents.do?id=service">이용안내</a>
                            <a href="/contents.do?id=privacy">개인정보처리방침</a>
                        </div>
                        <div class="right"> 
                            <select class="fm_select" name="select" onchange="window.open(value,'_blank');" title="패밀리사이트">
                                <option selected disabled>패밀리사이트</option>
                                <option value="https://www.jeonnam.go.kr/" title="전라남도 새창열기">전라남도</option>
                                <option value="http://jncf.or.kr" title="전남문화재단 새창열기">전남문화재단</option>
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
                    <div class="bottom">
                        <div class="left">
                            <img src="/images/egovframework/com/jpg/MainLogo_W.png" alt="전라남도립국악단">
                            <div class="copyright">copyright&copy; 2019 전라남도립국악단 All Rights Reserved.</div>
                        </div>
                        
                        <div class="center">
                            <div><strong>58579 전남 무안군 삼향읍 남악로 222 (남도소리울림터 3F)</strong>&nbsp;&nbsp;<strong class="tel">문의 . 061-285-6928</strong>|<strong class="fax">Fax . 061-285-6929</strong></div> 
                            <div><span>222 Namak -ro, Samhyang-eup, Muan, Jeollanam-do</span><!-- <span>E-Mail : jpg6928@naver.com</span> --></div>
                        </div>
                        
                        <div class="right">
                            <a href="https://www.youtube.com/channel/UCwZHHFSbD15bnhBDBV01oBQ/featured" class="youtube">전라남도 도립 국악단 유투브</a>
                            <a href="https://www.instagram.com/jeonnam_gugak/" class="insta">전라남도 도립 국악단 인스타그램</a>
                        </div>
                    </div>
                    <!--end mid-->
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
                                <option value="https://www.jeonnam.go.kr/">전라남도</option>
                                <option value="http://jncf.or.kr">전남문화재단</option>
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
            <!--end inner-->
        </div>
        <!--end footer-->
<script>
    var reSizeStatus = 3;
    $(".font_pop button").on("click", function () {
        var type = $(this).attr("class");

        if (type == "big" && reSizeStatus >= 6) {
            alert("최대 크기 입니다");
        } else if (type == "small" && reSizeStatus <= 0) {
            alert("최소 크기 입니다");
        } else {
            reSizeFont(type);
            (type == "big") ? (reSizeStatus++) : (reSizeStatus--);
        }
    });

    function reSizeFont(type) {
        var baseSize = "";

        $(".contentWrap *").each(function() {
            baseSize = $(this).css("font-size");
            if (baseSize.length > 1) {
                var thisSize = parseFloat(baseSize.split("px")[0]);
                (type == "big") ? (thisSize *= 1.2) : (thisSize /= 1.2);
                $(this).css("font-size", thisSize + "px");
            }
        });
    }
	$.get("/sts/cst/insertConectStats.do?<%=request.getQueryString()%>");
</script>
</body>
</html>