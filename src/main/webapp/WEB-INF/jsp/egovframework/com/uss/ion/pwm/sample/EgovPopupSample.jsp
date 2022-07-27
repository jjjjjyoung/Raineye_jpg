<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


</title><!-- 팝업 샘플페이지 -->
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 쿠키설정
 ******************************************************** */
function fnSetCookiePopup( name, value, expiredays ) {
	  var todayDate = new Date();
	  todayDate.setDate( todayDate.getDate() + expiredays );
	  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
/* ********************************************************
* 체크버튼 클릭시
******************************************************** */
/* function fnPopupCheck() {
	fnSetCookiePopup( "${popupId}", "done" , 365);
	window.close();
}
$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});
function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        alert("ddddddddddddd")
    	isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

} */
</script>
	<div id="layer${popCount}" class="pop-layer layer${popCount}" style="display:none;">
	    <div class="pop-container">
	        <div class="pop-conts">
	            <c:out value='${popList.popCn}' escapeXml="false"/>
	            <div class="btn-r">
	                <a href="#" class="btn-layerClose"> 닫기
	                <input type="hidden" id="popCount" value='${popCount}'>
	                </a>
	            </div>
	        </div>
	    </div>
		<div id="div_laypopup" align="center" style="display:block;border-width:0px;Z-INDEX: 201; POSITION: absolute; padding-left:10px; color:#fff; bottom: 9px; font-size: 12px;">  
		    <input type="checkbox" name="close" value="OK" onclick="javascript:closeWin('layer${popCount}', 1);"/> 하루동안 이 창을 열지 않음  
		    <!-- <input type="checkbox" name="close" value="OK" onclick="javascript:closeWinAt00('div_laypopup', 1);"/>오늘만 이 창을 열지 않음 -->  
		 </div>  
	</div> 

	<script type="text/javaScript">
			var pop="layer${popCount}";
			var $el = $("#"+pop);        //레이어의 id를 $el 변수에 저장
			var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변  
			var blnCookie = getCookie(pop);  
			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
	/* 		var $elWidth = ~~($el.outerWidth()),
			    $elHeight = ~~($el.outerHeight()),
			    docWidth = $(document).width(),
			    docHeight = $(document).height(); */
			
			$( '.layer${popCount}' ).width('${popList.popupWSize}px');
			$( '.layer${popCount}' ).height('${popList.popupHSize}px');
			$( '.layer${popCount}' ).css("top",'${popList.popupHlc}px');
			$( '.layer${popCount}' ).css("left",'${popList.popupWlc}px');
			$( "#layer${popCount}" ).css("display",'none');
			
			// 화면의 중앙에 레이어를 띄운다. 
			$('a.btn-layerClose').click(function(){
				var yo="#layer"+$.trim($(this).parent().find('#popCount').val());
				isDim ? $('.dim-layer').fadeOut() : $(yo).fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
				return false;
			});
			$('.layer .dimBg').click(function(){
			    $('.dim-layer').fadeOut();
			    return false;
			});
			   var obj = eval( "window." + pop );  
				if(!blnCookie) {  
					    obj.style.display ="block";  
				   } 
			function closeWin(winName, expiredays) {   
				   setCookie( winName, "done" , expiredays);   
				   var obj = eval( "window." + winName );  
				   obj.style.display = "none";  
				}  
			function getCookie(name) {  
				   var nameOfCookie = name + "=";  
				   var x = 0;  
				   while ( x <= document.cookie.length )  
				   {  
				       var y = (x+nameOfCookie.length);  
				       if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
				           if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
				               endOfCookie = document.cookie.length;  
				           return unescape( document.cookie.substring( y, endOfCookie ) );  
				       }  
				       x = document.cookie.indexOf( " ", x ) + 1;  
				       if ( x == 0 )  
				           break;  
				   }  
				   return "";  
				}  
			function setCookie( name, value, expiredays ) {   
				var todayDate = new Date();   
				   todayDate.setDate( todayDate.getDate() + expiredays );   
				   document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
				}
			/* function plz1(plz){
				$( '.pop-layer' ).width('400');
				$( '.pop-layer' ).height('400');
				$( '.pop-layer' ).css("top",'${popList.popupHlc}px');
				$( '.pop-layer' ).css("left",'${popList.popupWlc}px');
			} */
</script>