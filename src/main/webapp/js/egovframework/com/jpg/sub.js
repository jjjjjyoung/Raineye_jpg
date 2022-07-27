var $ = jQuery;

$(function () {
    $('.tab_body .list').hide(); // 내용 숨김

    /*$('.tab li').eq(0).addClass('selected'); //처음탭 활성화*/

    $('.tab_body .list').eq(0).show(); //처음탭 내용 보이기

    $('.tab div div').click(function () {
        $('.tab div div').removeClass(); //클래스제거
		$('.tab div div a').attr('title',''); //타이틀제거
        $(this).addClass('selected'); //선택된 탭에 스타일적용
		$(this).find('a').attr('title','현재페이지');//선택된 탭에 타이틀적용

        $('.tab_body .list').hide(); //내용안보이게
        $('.tab_body .list').eq($(this).index()).show(); //선택된 탭 내용을 보여줌

        //console.log($(this).index()); 순번 맞게 나오는지 확인할 때 쓸수있
        return false;
    }); //.tab li click 종료


    //sub4-5 FAQ accordion
//    $('.acc_tb dl dd').hide();

    //.selected 추가 및 제거
  /*  $('.acc_tb dl dt').click(function () {

        $(this).toggleClass('selected');


        //열려있는 내용 있으면 닫아줌
        $('.acc_tb dl dd').slideUp('500');

        //selected 적용되면 참, 아니면 거짓
        if ($(this).hasClass('selected')) {
            $('+dd', this).slideDown('500');

            $('.acc_tb dl dt').removeClass('selected');

            $(this).addClass('selected');
        }
    });*/

    //1:1문의하기 버튼 클릭 팝업
    $('.faq_popup, .graylayer').hide();
    $('.faq_btn button').click(function () {
        $('.faq_popup, .graylayer').fadeIn('fast');
    });

    $('.faq_popup .close, .graylayer').click(function () {
        $('.faq_popup, .graylayer').fadeOut('fast');
    });

    //신청하시겠습니까?
    $('.faq .step').hide();
    $('.faq_popup .rgs_btn').click(function () {
        $('.faq .step.st01').fadeIn('fast');
    });

    $('.faq .step.st01 .cs_btn').click(function () {
        $('.faq .step.st01, .graylayer').fadeOut('fast');
    });

    //신청내용확인
    $('.faq .step.st01 .confi_btn').click(function () {
        $('.faq .step.st02').fadeIn('fast');
    });

    //1:1문의 팝업 전부 닫기
    $('.faq .step.st02 .confi_btn').click(function () {
        $('.faq .step.st01, .faq .step.st02, .faq .faq_popup, .graylayer').fadeOut('fast');
    });


    //sub2-1-2 일간일정 월 선택
    $('.month .mon_hd ul li').click(function () {
        $('.month .mon_hd ul li').removeClass('on');
        $(this).addClass('on');
    });



    //sub2-1-view 할인정보 팝업
    $('.sub02 .sale .sale_pop').hide();
    $('.sub02 .sale  button').click(function () {
        $('.sub02 .sale .sale_pop').fadeToggle();
    })

    
    //kid-sub3 모집안내 상세보기
    //$('.kid_sub .con01 .overH > div').addClass('show');
   /* $('.kid_sub .con01 .left .show_btn').click(function(){
    	setTimeout(function() { $('.kid_sub .con01 .left, .kid_sub .con01 .right').toggleClass('show')}, 0);
    });*/
 
    $('.kidGnb > div').click(function(){
    	$(this).addClass('on');
    });
    
    $('.og_chart').parents('.inner').css('padding','0');
    
/*    $('.sub04 #bo_btn_top').show();
    $('.sub04 #bo_btn_top').append().html('<div class="tb_hd"><div class="total"><span>1</span>&nbsp;/&nbsp;<span>135페이지</span></div><!--end total--></div>');*/
    
    $('.sub03.ntc #bo_btn_top').css('display','table');

    
    //게시판 리스트 첫번째 td color:#c72d38 활성화 '채용공고' 일때
    if ($('#subWrap .page_title').text() == '채용공고') {
    	$('.ntc_table').addClass('add');
    } 

    //게시판 리스트 첫번째 td color:#c72d38 활성화 '언론보도' 일때
    if ($('#subWrap .page_title').text() == '언론보도') {
    	$('.ntc_table').addClass('add');
    } 

    //게시판 리스트 첫번째 td color:#c72d38 활성화 '관람후기' 일때
    if ($('#subWrap .page_title').text() == '관람후기') {
    	$('.ntc_table').addClass('add');
    } 

    //게시판 리스트 첫번째 td color:#c72d38 활성화 '뉴스레터' 일때
    if ($('#subWrap .page_title').text() == '뉴스레터') {
    	$('.ntc_table').addClass('add');
    } 
    


    //어린이국악단 서브비주얼이미지 변경 '소개'페이지
    if ($('.sub05 .sub_visual h2').text() == '소개') {
    	$('.sub_visual').addClass('sv1');
    }

    //어린이국악단 서브비주얼이미지 변경 '어린이단원 소개'페이지
    if ($('.sub05 .sub_visual h2').text() == '어린이단원 소개') {
    	$('.sub_visual').addClass('sv2');
    }

    //어린이국악단 서브비주얼이미지 변경 '모집안내'페이지
    if ($('.sub05 .sub_visual h2').text() == '모집안내') {
    	$('.sub_visual').addClass('sv3');
    }

    //어린이국악단 서브비주얼이미지 변경 '갤러리'페이지
    if ($('.sub05 .sub_visual h2').text() == '갤러리') {
    	$('.sub_visual').addClass('sv4');
    }

    //어린이국악단 서브비주얼이미지 변경 '공지사항'페이지
    if ($('.sub05 .sub_visual h2').text() == '공지사항') {
    	$('.sub_visual').addClass('sv5');
    } 
  
    
});
