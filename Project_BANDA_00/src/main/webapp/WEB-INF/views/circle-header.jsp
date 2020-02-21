<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mvc.banda.model.vo.AccountVo" %>

			<header id="header">
				<div class="inner" style="position:relative;">
					<div class="closeBtn">
						<a href="#" id="closeBtn" class=""><i class="fas fa-times-circle"></i></a>
					</div>					
					<div id="content" class="content">
						<img id="testlogo" src="<%=request.getContextPath()%>/resources/images/logo_profile.png">
						<!-- <h1>Radius</h1> -->
						<h2></h2>
						
						<!-- 닫힘 버튼 -->
						<a href="#" id="loginBtn" class="button big alt"><span>Login</span></a>
						
						<a href="#" id="feedBtn" class="feedBtn button big alt"><span>Feed</span></a>
					</div>
					
					<div id="logincontent" style="display: none;" >
						<div class="content">
                                <div class="social">
                                    <a class="circle github" href="${naver_url}" style = "background-color:#00CF38">
                                        <img src = "<%=request.getContextPath() %>/resources/images/naver.png" style = "width:23px;height:25px">
                                    </a>
                                    <a id="google_login" class="circle google" href="#">
                                        <i class="fa fa-google-plus fa-fw"></i>
                                    </a>
                                    <a id="facebook_login" class="circle facebook" href="#">
                                        <i class="fa fa-facebook fa-fw"></i>
                                    </a>
                                </div>
                                <div class="division">
                                    <div class="line l"></div>
                                      <span>or</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                
                                <!-- 로그인 -->
                                <div class="form loginBox" id = "login" style = "display:block">
                                    <form id="loginForm" method="" action="login.do" accept-charset="UTF-8">
                                    <input id="login-email" class="form-control" type="text" placeholder="Id" name="email">
                                    <input id="login-password" class="form-control" type="password" placeholder="Password" name="password">
                                    <p id = "error_login" style = "color:red;display:none">아이디와 비밀번호가 맞지 않습니다.</p>
                                    <a href = "#" style = "color:lightgray" id = "idFind" onclick = "idFind()">아이디찾기</a>&nbsp;&nbsp;
                                    <a href = "#" style = "color:lightgray" id = "pwdFind" onclick = "pwdFind()">비밀번호찾기</a>
                                    <input id="login-loginBtn" class="btn btn-default btn-login" type="button" value="Login" onclick="loginChk()">                         
                                    <input id="joinBtn" class="btn btn-default btn-login" type="button" value="Join" onclick="joinUser()">
                                    </form>
                                </div>
                                
                                <!-- 어아다찾기 -->
                                <div class="form loginBox" id = "idfind" style = "display:none;margin-top: 20%;">
                                    <form method="" action="" accept-charset="UTF-8">
                                    <input class="form-control" type="text" placeholder="Email" name="email" id = "findid">
                                    <input class="form-control" type="text" placeholder="Email" name="email" id = "findid_res" style = "display:none;color:red;font-weight:bold" >
                                    <input class="btn btn-default btn-login" type="button" value="아이디찾기" onclick="idFindChk_res()" id = "idFindChk_res_id">
                                    <input class="btn btn-default btn-login" type="button" value="로그인" onclick="return_login()" id = "return_login_id" style = "display:none">
                                    </form>
                                </div>
                                
                                <!-- 비밀번호찾기 -->
                                <div class="form loginBox" id = "pwdfind" style = "display:none;vertical-align:middle">
                                    <form method="" action="login.do" accept-charset="UTF-8">
                                    <input class="form-control" type="text" placeholder="아이디" name="id" id = "findpwd_id">
                                    <input class="form-control" type="email" placeholder="이메일" name="email" id = "findpwd_email">
                                    <p style = "color:red;font-weight:bold;display:none" id = "findpwd_res"></p>
                                    <input class="btn btn-default btn-login" type="button" value="비밀번호찾기" onclick="pwdFindChk_res()" id = "idFindChk_res_pwd">
                                    <input class="btn btn-default btn-login" type="button" value="로그인" onclick="return_login2()" id = "return_login_pwd" style = "display:none">
                                    </form>
                                </div>
                             </div>
					</div>
					
					<div id="joincontent" style="display: none;" >
						<div class="content">
                                <div class="division">
                                      <span id="joinIcon"><i class="fas fa-user-edit"></i></span>
                                </div>
                                <div class="error"></div> 
                                <div class="form loginBox">
                                    <form id="joinForm" method="" action="register.do" accept-charset="UTF-8">
                                    <input id="email" class="form-control" type="text" placeholder="Email" name="email">
                                    <input id="id" class="form-control" type="text" placeholder="Id" name="id">
                                    <input id="password" class="form-control" type="password" placeholder="Password" name="password">
                                    <input id="phone" onKeyup="inputPhoneNumber(this);" maxlength="13"  class="form-control" type="text" placeholder="Phone" name="phone">
                                    <input id="join-loginBtn" class="btn btn-default btn-login" type="button" value="Join" onclick="joinChk()">
                                    </form>
                                </div>
                             </div>
					</div>
					
					<div class="content" id="isLogin" style="display: none">
						<div>
							<!-- 알림  -->
							<a class="islogin-icon-left" href="#" >
								<i class="fa fa-bell noti-icon"></i>
								<span class="badge badge-danger badge-pill noti-icon-badge">4</span>
							</a>
							
							<%
								String id = null;
							
								if(session.getAttribute("vo") != null){
									AccountVo vo = (AccountVo)session.getAttribute("vo");
									id = vo.getId();
								}
							%>
							<!-- 프로필사진 -->
							<a href="photo_profile.do"><img class="img-fluid img-circle" src="<%=request.getContextPath() %>/resources/images/filemanager/account/account_profile/<%=id %>/image.jpg" alt="Image" onerror="this.src = '<%=request.getContextPath() %>/resources/images/filemanager/account/account_profile/image.jpg'"></a>
							<!-- 메일 -->
							<a class="islogin-icon-right" href="myChat.do" >
								<i class="fas fa-comments"></i>
								<span class="badge badge-success badge-pill noti-icon-badge">6</span>
							</a>
						</div>
						<div class="iconBox">
							<a href="rank.do" id="menuBtn1" class="" style="color:#21b77b;"><i class="fas fa-award"></i></a>
							<a href="boardListFree.do" id="menuBtn2" class="" style="color:#80b8ff;"><i class="fas fa-user-friends"></i></a>
							<a href="mapHospital.do" id="menuBtn3" class="" style="color:#f79689;"><i class="fas fa-map-marked-alt"></i></a>
							<a href="mypage_followpage.do" id="menuBtn4" class="" style="color:#ec3d6e;"><i class="fas fa-user"></i></a>
							
						</div>
						
						<div id="searchinputBox">
						  
						  <form action="search_feedlist.do" id="searchform" method="get">
						    
						  <div>
					        <input type="radio" class="jh_searchtype" name="jh_searchtype" value="jh_searchid"> 계정
					        <input type="radio" class="jh_searchtype" name="jh_searchtype" value="jh_searchfeedptag"> 반려동물
					        <input type="radio" class="jh_searchtype" name="jh_searchtype" value="jh_searchfeedhtag"> 해시태그
					      </div>
					        <div id="autoArea" style="text-align: left;"></div><!-- 자동완성 @author 주희진 -->
							<input type="text" id="searchinput" name="keyword" value="" >
							<div id="searchBtn" class="searchBtn" onclick="#"><i class="fas fa-search"></i></div>
							
						  </form>
							
						</div>
				      
						
					</div>				
					<div id="logOut">
						<button onclick = "logout();" style = "background : none;"><i class="fas fa-sign-out-alt"></i></button>
					</div>
					
					<!-- 닫혔을때 열기 버튼  -->
					<a href="#" class="button hidden"><span>Let's Go</span></a>
				</div>
			</header>
			
			<script>
			
			
			function idFind(){
				
				$('#idfind').show();
				$('#login').hide();
				$('#pwdfind').hide();
				
			}
			
			function idFindChk_res(){
				
				var email = $('#findid').val();
				var findid_set = {
						
						'email'  : email						
				}
				
				$.ajax({
					
					url : 'idFind.do',
					type : 'post',
					data : JSON.stringify(findid_set),
  					contentType: "application/json",
  					dataType:"json",
  					success : function(data){
  						
  						if(data.chk){
  							
  							alert('아이디 찾기 성공');
  							$('#findid_res').show();
  							$('#findid').hide();
  							
  							alert(data.id);
  							$('#findid_res').val(data.id);
  							
  							$('#idFindChk_res_id').hide();
  							$('#return_login_id').show();
  							
  							
  						} else {
  							alert('아이디 찾기 실패');
  						}
  						
  					},
					error:function(request,status,error){
						
						alert("통신실패");
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);

					}
					
				});
				
			}
			
			function return_login(){
				
				$('#findid_res').val('');
				$('#findid').val('');
				
				//아이디찾기이전
				$('#idfind').hide();
				$('#login').show();
				$('#pwdfind').hide();
				
				//아이디찾기 이후
  				$('#findid_res').hide();
  				$('#findid').show();
				$('#idFindChk_res_id').show();
				$('#return_login_id').hide();
				
			}
			
			function pwdFind(){
				
				$('#idfind').hide();
				$('#login').hide();
				$('#pwdfind').show();
				
				
			}
			
			function pwdFindChk_res(){
				
				var findpwd_id = $('#findpwd_id').val();
				var findpwd_email = $('#findpwd_email').val();
				
				var findpwd_set = {
					'id' : 	findpwd_id,
					'email' : findpwd_email						
				}
				
				$.ajax({
					
					url : 'pwdFind.do',
					type : 'post',
					data : JSON.stringify(findpwd_set),
  					contentType: "application/json",
  					dataType:"json",
  					success : function(data){
  						
  						if(data.chk){
  							
  							alert('비밀번호 찾기 성공');
  							alert(data['id']);
  							
  							$('#findpwd_res').show();
  							$('#findpwd_id').hide();
  							$('#findpwd_email').hide();
  							
  							$('#findpwd_res').html(data.id);
  							$('#idFindChk_res_pwd').hide();
  							$('#return_login_pwd').show();
  							
  							
  							
  						} else {
  							alert('비밀번호 찾기 실패');
  						}
  						
  					},
					error:function(request,status,error){
						
						alert("통신실패");
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);

					}
					
				});
				
				
				
			}
			
			function return_login2(){
				
				$('#findpwd_id').val('');
				$('#findpwd_email').val('');
				$('#findpwd_res').val('');
				
				//아이디찾기이전
				$('#idfind').hide();
				$('#login').show();
				$('#pwdfind').hide();
				
				//아이디찾기 이후
				$('#findpwd_res').hide();
				$('#findpwd_id').show();
				$('#findpwd_email').show();
				$('#idFindChk_res_pwd').show();
				$('#return_login_pwd').hide();
				
			}
			</script>
			

			
