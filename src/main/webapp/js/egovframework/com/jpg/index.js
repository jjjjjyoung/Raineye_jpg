var $ = jQuery;

$(function () {

    //content height
    function funLoad() {
    	
        var Cheight = $(window).height() - 124;
        if($(window).height() > 700) {
        $('.pannel').css({
            'height': Cheight + 'px'
        });
        }
        
    }
    window.onload = funLoad;
    window.onresize = funLoad;

    //tablinks
    /*$('.sns_tit .tablinks2').click(function () {
        $('.sns_tit .tablinks2').removeClass('atv');
        $(this).addClass('atv');
    });*/

    //tablinks
    $('.tab .tablinks').click(function () {
        $('.tab .tablinks').removeClass('atv');
        $(this).addClass('atv');
    });

    
    $('#panel-2 .sns_thumb .sns_tit').append('<span class="bar"></span>');

    
    //공지사항

    $('.tabcontent > div:nth-of-type(1)').addClass('list1');
    $('.tabcontent > div:nth-of-type(2)').addClass('list2');
    $('.tabcontent > div:nth-of-type(3)').addClass('list3');
    $('.tabcontent > div:nth-of-type(4)').addClass('list4');
    $('.tabcontent > div:nth-of-type(5)').addClass('list5');

    $('#panel-3 .ntc_text p').addClass('ellipsis2');
    
}); //end jquery
