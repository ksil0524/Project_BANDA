<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <a class="circle github" href="#">
                                        <i class="fa fa-github fa-fw"></i>
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
                                <div class="form loginBox">
                                    <form id="loginForm" method="" action="" accept-charset="UTF-8">
                                    <input id="login-email" class="form-control" type="text" placeholder="Email" name="email">
                                    <input id="login-password" class="form-control" type="password" placeholder="Password" name="password">
                                    <input id="login-loginBtn" class="btn btn-default btn-login" type="button" value="Login" onclick="loginChk()">
                                    <input id="joinBtn" class="btn btn-default btn-login" type="button" value="Join" onclick="joinUser()">
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
                                    <form id="joinForm" method="" action="" accept-charset="UTF-8">
                                    <input id="email" class="form-control" type="text" placeholder="Email" name="email">
                                    <input id="id" class="form-control" type="text" placeholder="Id" name="id">
                                    <input id="password" class="form-control" type="password" placeholder="Password" name="password">
                                    <input id="phone" class="form-control" type="text" placeholder="Phone" name="phone">
                                    <input id="join-loginBtn" class="btn btn-default btn-login" type="button" value="Login" onclick="joinChk()">
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
							<!-- 프로필사진 -->
							<a href="photo_profile.do"><img class="img-fluid img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/3.jpg" alt="Image"></a>
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
							<a href="mypageFollw.do" id="menuBtn4" class="" style="color:#ec3d6e;"><i class="fas fa-user"></i></a>
							
						</div>
						<div id="searchinputBox">
							<input type="text" id="searchinput"><div id="searchBtn" onclick="" ><i class="fas fa-search"></i></div>
						</div>
					</div>
					<div id="logOut">
						<div ><i class="fas fa-sign-out-alt"></i></div>
					</div>
					
					<!-- 닫혔을때 열기 버튼  -->
					<a href="#" class="button hidden" onclick=""><span>Let's Go</span></a>
				</div>
			</header>
