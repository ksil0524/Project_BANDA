/*
	Radius by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
*/

var isLogin = 0;



function loginChk(){
	
	var email = $("#login-email").val().trim();
	var pw = $("#login-password").val().trim();
	
	alert("email: " + email + "  pw: " + pw);
	
	var login_set = {
			"id":email,
			"password":pw			
	};
	
	//console.log(login_set);
	
	//추가

	if(email == null || email == ""||pw == null || pw == ""){
		
		alert("ID 및 PW를 확인해 주세요");
		
	}else{
		
	
	$.ajax({
		
		url : "login.do",
		type : "post",
		data : JSON.stringify(login_set),
		contentType: "application/json",
		dataType:"json",
		success : function(msg){
			
			if(msg.chk){
				
			isLogin = 1;
			
			$(".closeBtn").hide();
			$("#logincontent").hide();
			$("#header").toggleClass('hide');
			$("#content").hide();
			$("#loginchk").css("display","none");
			location.href = "index.jsp";
			
			
			
			} else {
				$("#loginchk").css("display","block");
				
				alert("잘못입력");
				
				return;
			}
			
		},
		error:function(request,status,error){
			
			alert("통신실패");
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);

		}
		
		
	});
	
	}
	
}


function logout(){
	
	$.ajax({
		
		url : "logout.do",
		type : "post",
		success : function(data){
			
			if(data.chk){
				isLogin = 0;
				alert("로그아웃성공");
				location.href = "index.jsp";
			} 
			
		},
		error : function(request,status,error){
			
			alert("통신실패");
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
		
	});
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
	if(email == null || email == "" ||id == null|| id == "" || pw == null||pw == "" ||phone ==null || phone == ""){
		alert("정보를 모두 입력하세요.");
	}else{
		$("#joinForm").submit();
		close();
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
		
		// 재호
		$("#searchBtn").click(function(){
			
			var text = $("#searchform #searchinput").val();
			
			if(text == null || text == ""){
				alert("검색어를 입력해주세요");
			} else {
				alert(text);
			}
			

			
   
       })
		
	});
	
	


})(jQuery);