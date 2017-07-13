jQuery(document).ready(function($) {

    $('.main-content-footer ul li').hover(function(){
       $( this ).find( 'img.ma' ).hide();
       $( this ).find( 'img.ho' ).show();
       $( this ).find( 'span.arrow-up' ).show();
    }, function() {
         $( this ).find( 'img.ho' ).hide();
         $( this ).find( 'img.ma' ).show();
		 $( this ).find( 'span.arrow-up' ).hide();
    });
	

	/*jCarsoul loop*/
	function jcarsouel_miras_pars(){
		
	$number_slide = $('ul#jc li').length;	
	$certain = $('ul#jc li.active').index() + 1;
	if($certain ==$number_slide) {	
		$('.carousel-stage').jcarousel('scroll', '0');
		$now = 1;
	} else {
		$('.carousel-stage').jcarousel('scroll', '+=1');
		$now = $('ul#jc li.active').index() + 1;
	}
	
	//show product name and number
	var name = $( "ul#big_slide li:nth-child(" + $now + ")" ).attr('data-name');
	var number = $( "ul#big_slide li:nth-child(" + $now + ")" ).attr('data-num');
	var pishnahad = $( "ul#big_slide li:nth-child(" + $now + ")" ).attr('data-pishnahad');
	var link = $( "ul#big_slide li:nth-child(" + $now + ")" ).attr('data-link');
	var link_card = $( "ul#big_slide li:nth-child(" + $now + ")" ).attr('data-link-card');
	
	$("span#product_name").hide().html(name).fadeIn();
	$("span#product_num").hide().html(number).fadeIn();
	if(pishnahad =="") {
		$('span#product_pishnahad').html(pishnahad);
	} else {
		$("span#product_pishnahad").hide().html("تا کنون این کالا به " + pishnahad + " نفر پیشنهاد شده").fadeIn();
	}
	
	//change id product now
	$("li[data-nowproduct]").attr('data-nowproduct',$now);
	
	//change product_link change
	$("a#product_link").attr("href",link);
	
	//change link sefaresh
	$("a#link_card").attr("href",link_card);
	
	}
	
	//click for li item and run functrion
	$("ul#jc li, a#prev_carousel_a, a#next_carousel_a").click(function(){
        jcarsouel_miras_pars();
	});
	
	var IntID = setTimer();

	function setTimer(){
		 i = setInterval(jcarsouel_miras_pars, 4500);
		 return i;
	}
	function stopSlider() {
		clearInterval(IntID);
	}
	function restartSlider(){
		  IntID = setTimer();
	}
	
	
	//Stop in hover
	$("li[data-nowproduct]").hover(
		function() {
			stopSlider();
			
			$("div[data-slide]").hide();
			$now_id = $("li[data-nowproduct]").attr('data-nowproduct');
			$("div[data-slide=" + $now_id + "]").show();
			 $( '.pop' ).css('display','block');
			$( '.black-hover' ).css('background-color','rgba(0,0,0,0.3)');
			
			$(this).find( 'a' ).css('background-color','#00b3c3').css('color','#fff');
			
			
	
			/*console.log("[data-slide=" + $now_id + "]");*/
		},
		function(e) {
			
			
			if( $(e.relatedTarget).hasClass("main-content-footer") ) {
				
			$( this ).find( 'img.ma' ).hide();
       $( this ).find( 'img.ho' ).show();
       $( this ).find( 'span.arrow-up' ).show();
				
				
          //The user has hovered over a label...Do nothing (or some other function)
        } else {
          // User has left the map and isn't over a label
          $("div[data-slide]").hide();
			  $( '.black-hover' ).css('background-color','transparent');
			$( '.pop' ).hide();
			$("li[data-nowproduct]").find( 'a' ).css('background-color','#fff').css('color','#808080');
			
			restartSlider();
      }	

		}
	);
	
	$(".main-content-footer").mouseleave(function(){
		
		$( this ).find( 'img.ho' ).hide();
         $( this ).find( 'img.ma' ).show();
		 $( this ).find( 'span.arrow-up' ).hide();
		
				$("div[data-slide]").hide();
			  $( '.black-hover' ).css('background-color','transparent');
			$( '.pop' ).hide();
			$("li[data-nowproduct]").find( 'a' ).css('background-color','#fff').css('color','#808080');
			stopSlider();
			restartSlider();
});
	
	
	
	
});