jQuery(document).ready(function()
{	
	var $j = jQuery.noConflict();
	
	// INITIALIZE DROPDOWN MENU
	$j('.dd-menu li:has(ul) > a').addClass('dd-submenu-title').append('<span class="dd-arrow"></span>');	
	$j('.dd-menu li').hover(function(){	
			// HOVER IN HANDLER
	
			$j('ul:first', this).css({visibility: "visible",display: "none"}).slideDown(250);									
			var path_set = $j(this).parents('.dd-menu li').find('a:first');
			$j(path_set).addClass('dd-path');						
			$j('.dd-menu li a.dd-path').not(path_set).removeClass('dd-path');
			
		},function(){			
			// HOVER OUT HANDLER
		
			$j('ul:first', this).css({visibility: "hidden"});			
	});
	$j('.dd-menu').hover(function() {
			// HOVER IN HANDLER
			
		}, function() {			
			// HOVER OUT HANDLER
		
			$j('a.dd-path', this).removeClass('dd-path');			
	});

	
	
	// REPLACE SUBMIT BUTTONS WITH SOMETHING EASIER TO STYLE:)
	$j('input[type=submit]').each(function() {		
	
		var val = $j(this).val();
		var a = $j('<a class="button-submit">' + val + '<span class="circle-arrow"></span></a>');
		var input = $j(this);
		
		input.after(a);
		input.hide();
		
		a.click(function() {			
			input.trigger('click');
		});
	});
	
	$j('input[type=reset]').each(function() {		
	
		var val = $j(this).val();
		var a = $j('<a class="button-reset">' + val + '</a>');
		var input = $j(this);
		
		input.after(a);
		input.hide();
		
		a.click(function() {			
			input.trigger('click');
		});
	});
	
	
	//BIG SLIDER AT HOME PAGE
	$j("#big-slider").hover( function () {
			$j('ul#slider-items').cycle('pause');
		  }, 
		  function () {
			  $j('ul#slider-items').cycle('resume');
	});
	
	//slider Items
	$j('ul#slider-items').cycle({
		//fx:     'fade', 
		 fx:     'scrollDown,fade', 
		    easing: 'easeOutBounce', 
		    delay:  -4000,
	    next:   '.next',
	    prev:   '.previous',
	    pager:  '#slider-pagination',
	    pause:   1,
	    fit:     1,
	    height:  300,
	    // callback fn that creates a thumbnail to use as pager anchor 
	    pagerAnchorBuilder: MLS_paginate
	});
	
	//Pagination related to main slider at home page
	function MLS_paginate(index, obj){
	    return '<li><a href="#">' + (index+1) + '</a></li>'; 
	}
	
	
	//CATEGORY SCROLLER AT HOME PAGE
	$j("#scroller").cycle({
		fx:     'blindY', 
		speed:   500, 
		next:   '.down-arrow',
		prev:   '.up-arrow',
		pause:   1,
		timeout: 0
	});
		
		
		
	//ZOOM effect FancyBox	
	$j("a[rel=example_group]").fancybox({
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'titlePosition' 	: 'over',
		'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
			return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
		}
	});		
		
	}); //END Document Ready
