var $ = jQuery;

$(function () {

    //nav hover navi_sec

	/*
    $('#gnb ul li button').click(function () {
        $('#gnb ul li .navi_sec').slideUp(300);
        $('+.navi_sec', this).slideDown(300);
    });
    
    $('#gnb ul li').mouseenter(function () {
        $('#gnb ul li .navi_sec').slideUp(300);
        $('.navi_sec', this).slideDown(300);
    });
    
    $('#gnb ul li').mouseleave(function () {
        $('.navi_sec', this).slideUp(300);
    });
    */
	
	 $(".tabOver").focus(function () {
			$('.over1').attr("style", "");
		 $(this).parent().find(".over1").css("display","block").css("opacity","1");
	    });
	
    $("#gnb ul li button").focus(function () {
    	$('.siteMap').slideUp();
    	$('#gnb ul li .navi_sec').attr("style", "");
    	$(this).parent().find(".navi_sec").css({ "transform": "translate(-50%,0)", "z-index": "9999", "opacity": "1", "height": "auto", "padding": "8% 0"});
    });
    $("#searchKeyword").focus(function () {
    	$('#gnb ul li .navi_sec').attr("style", "");
    });
    $(".mn_tit").focus(function () {
    	$(".mn_2nd").css({"display":"none"});
    	$(this).parent().find(".mn_2nd").css({"display":"block"});  	
    });
    $(".first_mn").focus(function(){
    	var check = false;
    	
    	if(check){
    		$(".mn_2nd").css({"display":"none"});
        	$(this).parent().find(".mn_2nd").css({"display":"block"});
        	check = !check;
    	}else{
    		$(".mn_2nd").css({"display":"none"});
        	$(this).parent().find(".mn_2nd").css({"display":"none"});
        	check = !check;
    	}
    });
    $(".second_mn").focus(function(){
    	var check = false;
    	
    	if(check){
    		$(".mn_2nd").css({"display":"none"});
        	$(this).parent().find(".mn_2nd").css({"display":"block"});
        	check = !check;
    	}else{
    		$(".mn_2nd").css({"display":"none"});
        	$(this).parent().find(".mn_2nd").css({"display":"none"});
        	check = !check;
    	}
    });
    $(".btn_b a").focus(function () {
    	$('.over1').attr("style", "");
    });
    $(".font_resize").focus(function () {
    	$(".mn_2nd").css("display","none");
    });
    $(".tablinks").focus(function () {
    	$(".tablinks").removeClass('atv' );
    	$(this).addClass( 'atv' );
    });
    $(".more").focus(function () {
    	$(".tablinks").removeClass('atv' );
    });

    if ($(window).width() > 768) {

    	if($(window).height() < 700) {
    		$('#panel-1').css('width', 969 * 1.56);
            $('#panel-2').css('width', 969 * 1.488);
            $('#panel-3').css('width', '450px');
            $('#panel-4').css('width', 969 * 0.435);
            $('#page-wrap').css('width', 969 * 3.483 + 570);

            $('.slide_box').css('height', 969 * 0.6 * 0.9);
            
            $('#page-wrap').css('height', 845 + 125);
            $('#panel-1').css('height', '845px');
            $('#panel-2').css('height', '845px');
            $('#panel-3').css('height', '845px');
            $('#panel-4').css('height', '845px');
        } else {
            $('#panel-1').css('width', ($(window).height() - 125) * 1.56 * 0.95);
            $('#panel-2').css('width', ($(window).height() - 125) * 1.488);
            $('#panel-3').css('width', '450px');
            $('#panel-4').css('width', ($(window).height() - 125) * 0.435);
            $('#page-wrap').css('width', ($(window).height() - 125) * 3.483 + 570);

            $('.slide_box').css('height', ($(window).height() - 125) * 0.6 * 0.9);
        }
    } else {
        $('#panel-1').css('width', "100%");
        $('#panel-2').css('width', "100%");
        $('#panel-3').css('width', "100%");
        $('#panel-4').css('width', "100%");
        $('#page-wrap').css('width', "100%");
    }

    $(window).resize(function () {
        if ($(window).width() > 768) {
            

        	if($(window).height() < 700) {
        		$('#panel-1').css('width', 969 * 1.56);
                $('#panel-2').css('width', 969 * 1.488);
                $('#panel-3').css('width', '450px');
                $('#panel-4').css('width', 969 * 0.435);
                $('#page-wrap').css('width', 969 * 3.483 + 570);

                $('.slide_box').css('height', 969 * 0.6 * 0.9);

                $('#page-wrap').css('height', 845 + 125);
                $('#panel-1').css('height', '845px');
                $('#panel-2').css('height', '845px');
                $('#panel-3').css('height', '845px');
                $('#panel-4').css('height', '845px');
                
            } else {
                $('#panel-1').css('width', ($(window).height() - 125) * 1.56 * 0.95);
                $('#panel-2').css('width', ($(window).height() - 125) * 1.488);
                $('#panel-3').css('width', '450px');
                $('#panel-4').css('width', ($(window).height() - 125) * 0.435);
                $('#page-wrap').css('width', ($(window).height() - 125) * 3.483 + 570);

                $('.slide_box').css('height', ($(window).height() - 125) * 0.6 * 0.9);
            }

            if ($(window).height() < 860) {
                $('.slide_date').css('opacity', '0');
            } else {
                $('.slide_date').css('opacity', '1');
            }
            
        } else {
            $('#panel-1').css('width', "100%");
            $('#panel-2').css('width', "100%");
            $('#panel-3').css('width', "100%");
            $('#panel-4').css('width', "100%");
            $('#page-wrap').css('width', "100%");
        }
        

        if ($(window).height() < 860) {
            $('.slide_date').css('opacity', '0');
        } else {
            $('.slide_date').css('opacity', '1');
        }

    });

    var slide_index = 0;
    setInterval(function () {
        $(".slide_group").eq(slide_index).removeClass("right_in").addClass("left_out");
        slide_index = ((slide_index + 1) == 2) ? 0 : (slide_index + 1);
        $(".slide_group").eq(slide_index).removeClass("left_out").addClass("right_in");
    }, 3000);

    //mb nav show
    $(".gnb_menu_btn").click(function () {
        $(".mbNav").stop().animate({
            left: 0
        }, 500);

        $(".overlayer").show();
    });

    $(".gnb_close_btn, .overlayer").click(function () {
        $(".mbNav").stop().animate({
            left: '-100%'
        }, 500);

        $(".overlayer").hide();
    });

    //mb nav accordion
    $('#accordion_navi li ul').hide();

    $('#accordion_navi li').click(function () {
        $(this).toggleClass('selected');

        $('#accordion_navi li ul').slideUp('fast');

        //selected 
        if ($(this).hasClass('selected')) {
            $('ul', this).slideDown('fast');

            $('#accordion_navi button').removeClass('selected');
            $(this).addClass('selected');
        };
    });


    //sitemap show
    $('.siteMap').hide();
    $('.stMap').click(function () {
        $('.siteMap').slideToggle();
    });
    
    $('.stMap a').focus(function () {
        $('.siteMap').slideDown();
    });


    //font popup 
	$('.font_pop').hide();
    $('.btn_area3 .font_resize').click(function(){
    	$('.font_pop').fadeToggle(100);
    });

    //$('.btn_area3 .font_pop .cs_btn').click(function(){
    //	$('.font_pop').fadeOut(100);
    //});


    var getaudio = $('#player')[0];
    /* Get the audio from the player (using the player's ID), the [0] is necessary */
    var mouseovertimer;
    /* Global variable for a timer. When the mouse is hovered over the speaker it will start playing after hovering for 1 second, if less than 1 second it won't play (incase you accidentally hover over the speaker) */
    var audiostatus = 'off';
    /* Global variable for the audio's status (off or on). It's a bit crude but it works for determining the status. */

    $(document).on('mouseenter', '.speaker', function() {
      /* Bonus feature, if the mouse hovers over the speaker image for more than 1 second the audio will start playing */
      if (!mouseovertimer) {
        mouseovertimer = window.setTimeout(function() {
          mouseovertimer = null;
          if (!$('.speaker').hasClass("on")) {
            getaudio.load();
            /* Loads the audio */
            getaudio.play();
            /* Play the audio (starting at the beginning of the track) */
            $('.speaker').addClass('on');
            return false;
          }
        }, 1000);
      }
    });

    $(document).on('mouseleave', '.speaker', function() {
      /* If the mouse stops hovering on the image (leaves the image) clear the timer, reset back to 0 */
      if (mouseovertimer) {
        window.clearTimeout(mouseovertimer);
        mouseovertimer = null;
      }
    });

    $(document).on('click touchend', '.speaker', function() {
      /* Touchend is necessary for mobile devices, click alone won't work */
      if (!$('.speaker').hasClass("on")) {
        if (audiostatus == 'off') {
          $('.speaker').addClass('on');
          getaudio.load();
          getaudio.play();
          window.clearTimeout(mouseovertimer);
          audiostatus = 'on';
          return false;
        } else if (audiostatus == 'on') {
          $('.speaker').addClass('on');
          getaudio.play()
        }
      } else if ($('.speaker').hasClass("on")) {
        getaudio.pause();
        $('.speaker').removeClass('on');
        window.clearTimeout(mouseovertimer);
        audiostatus = 'on';
      }
    });

    $('#player').on('ended', function() {
      $('.speaker').removeClass('on');
      /*When the audio has finished playing, remove the class on*/
      audiostatus = 'off';
      /*Set the status back to off*/
    });
    
    
    $('.fmSite select option:first-child, .footer .fm_select option:first-child').text('유관기관 바로가기');});

/****
$(document).ready(function(){
	$('.acc_tb .faq_con dt').click(function(){
		$(this).addClass('goback_to_x')
		$('.goback_to_x').siblings('dd').slideUp('slow')
	})
	$('.goback_to_x').click(function(){
		$(this).addClass('faq_visible_y')
		$('.faq_visible_y').siblings('dd').css('display','block !important')
	})
})
****/
/****
$(document).ready(function(){
	$('.jp_aco_p2_dt').click(function(){
		$(this).removeClass('jp_aco_p2_dt')
		$(this).addClass('whth_faq')
		$(this).siblings('.jp_aco_p2_dd').slideDown('slow')
		$('.whth_faq').click(function(){
			$(this).removeClass('whth_faq')
			$(this).addClass('jp_aco_p2_dt')
			$(this).siblings('.jp_aco_p2_dd').slideUp('slow')
		})
	})
});
****/
$(document).ready(function(){
	/*
	$('.jp_aco_p2_dt').on('click focusin',function(){
		$(this).siblings('.jp_aco_p2_dd').slideToggle('slow')
	}).on('focusout',function(){
		$(this).siblings('.jp_aco_p2_dd').slideToggle('slow')
	});
	*/
	
	/* faq 관련 js 수정(220610 산) */
	$(".jp_aco_p2_dt").on("click",function(){
		$(this).parent(".faq_con").find(".jp_aco_p2_dd").stop().slideToggle();
		$(".jp_aco_p2_dt").not($(this)).parent(".faq_con").find(".jp_aco_p2_dd").slideUp();
	});


})























