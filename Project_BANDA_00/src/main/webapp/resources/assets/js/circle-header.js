/*
	Radius by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
*/

var isLogin = 0;

function loginChk(){
	var email = $("#email").val();
	var pw = $("#password").val();
	//alert("email: " + email + "  pw: " + pw);
		
	if(email =="test" && pw=="test"){
		isLogin = 1;
		$(".closeBtn").hide();
		$("#logincontent").hide();
		$("#header").toggleClass('hide');
		$("#content").hide();
		
		
	}else{
		return;
	}
}

function joinUser(){
	$("#logincontent").hide();
	$("#joincontent").show();
}

function joinChk(){
	var email = $("#joinForm #email").val();
	var id = $("#joinForm #id").val();
	var pw = $("#joinForm #password").val();
	var phone = $("#joinForm #phone").val();
	alert("email: " + email + "ID: " + id+  "pw: " + pw + "phone:" + phone);
	
	/*정규식 및 데이터 입력 체크 - login 담당*/
	if(email != "" && id != "" && pw != "" && phone != ""){
		close();
	}else{
		alert("정보를 모두 입력하세요.");
	}
}

function close(){
	$("#testlogo").hide();
	$("#isLogin").hide();
	$(".closeBtn").hide();
	$("#logOut").hide();
	$("#logincontent").hide();
	$("#joincontent").hide();
	$("#header").toggleClass('hide');
	
}

(function($) {
	$("#header").toggleClass('hide');
	$("#content").hide();
	isLogin=1;
	
	skel.breakpoints({
		xlarge:	'(max-width: 1680px)',
		large:	'(max-width: 1280px)',
		medium:	'(max-width: 980px)',
		small:	'(max-width: 736px)',
		xsmall:	'(max-width: 480px)'
	});
	
	$(function() {

		
		
		var	$window = $(window),
			$body = $('body'),
			$header = $('#header'),
			$footer = $('#footer');

		// Disable animations/transitions until the page has loaded.
			$body.addClass('is-loading');

			$window.on('load', function() {
				window.setTimeout(function() {
					$body.removeClass('is-loading');
				}, 100);
			});

		// Fix: Placeholder polyfill.
			//$('form').placeholder();

		// Prioritize "important" elements on medium.
			skel.on('+medium -medium', function() {
				$.prioritize(
					'.important\\28 medium\\29',
					skel.breakpoint('medium').active
				);
			});

		// Header.
			$header.each( function() {

				var t 		= jQuery(this),
					button 	= t.find('.button');

				button.click(function(e) {
					
					if(isLogin==0){
						
						$("#content").show();
						$("#testlogo").show();
						if($(this).attr("id")=="loginBtn"){
							alert("???");
							$("#content").hide();
							$(".closeBtn").show();
							$("#login-email").val("");
							$("#login-password").val("");
							$("#logincontent").show();
						}else if($(this).attr("id")=="feedBtn"){
							$("#testlogo").hide();
							t.toggleClass('hide');
						}else{
							t.toggleClass('hide');
						}

						if ( t.hasClass('preview') ) {
							return true;
						} else {
							e.preventDefault();
						}
						
					}else{
						$("#header").toggleClass('hide');
						$("#logOut").show();
						$(".closeBtn").show();
						$("#isLogin").show();
					}
				});

			});
		// Footer.
			$footer.each( function() {

				var t 		= jQuery(this),
					inner 	= t.find('.inner'),
					button 	= t.find('.info');

				button.click(function(e) {
					t.toggleClass('show');
					e.preventDefault();
				});

			});
		$("#closeBtn").click(function(){
			close();
		})

		$("#logOut").click(function(){
			
			isLogin = 0;
			location.href="../index.jsp";
		})
		
	});

})(jQuery);