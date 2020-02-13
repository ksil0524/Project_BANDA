<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Auto CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Map CSS -->
<link href="<%=request.getContextPath() %>/resources/assets/css/custom-map.css" rel="stylesheet" />
<!-- HEAD CSS -->
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>

</head>
<body>

	<!-- ==============================================
	HeaderSection
	=============================================== -->
	<jsp:include page="/WEB-INF/views/circle-header.jsp"></jsp:include>
	
	<!-- ==============================================
	Navbar Second Section
	=============================================== -->
	<section class="nav-sec" style="margin-top: 15px; height: 60px;">
		<div class="row">
			<div class="d-flex justify-content-between col-lg-12 col-xs-12">
				<div class="p-2 nav-icon-lg mint-green"style="height: 59px;">
					<a class="nav-icon" href="mapHospital.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
						<span>병원</span>
					</a>
				</div>
				<div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
					<a class="nav-icon" href="mapDrugstore.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
						span>약국</span>
					</a>
				</div>
			  
				<div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
					<a class="nav-icon" href="mapPark.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
						<span>공원</span>
					</a>
				</div>
				<div class="p-2 nav-icon-lg dark-black" style="height: 59px;">
					<a class="nav-icon" href="#" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
						<span></span>
					</a>
				</div>
			 </div>
		</div>
	</section>	
  
	<!-- ==============================================
	User Profile Section
	=============================================== --> 
	<section class="user-profile">
		<div class="container-fluid">
		</div>
	</section>

	<!-- ==============================================
	User Profile Section
	=============================================== --> 
	 	
	<section id="details" class="details">
		<div id="searchCon" class="container">
			<div id="detail-bg-box">
				<div id="testimgfile">
					<div class="row">
						<div id="searchBox" style="width: 1070px;">
							<span id="cateOne" class="col-lg-3 col-xs-12" style="text-align: left;">
								<select id="selbox" class="w3-select w3-border" name="city">
									<option value="" disabled selected>&nbsp;&nbsp;Choose your option</option>
										<option value="서울">서울</option>
										<option value="충남">충남</option>
										<option value="인천">인천</option>
										<option value="부산">부산</option>
										<option value="울산">울산</option>
										<option value="제주">제주</option>
										<option value="광주">광주</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="강원">강원</option>
										<option value="전북">전북</option>
										<option value="경북">경북</option>
										<option value="전남">전남</option>
										<option value="세종시">세종시</option>
										<option value="경남">경남</option>
										<option value="경기">경기</option>
										<option value="충북">충북</option>
								</select>
							</span>
							<span class="col-lg-3 col-xs-12" style="text-align: left;">
								<select id="selbox" class="w3-select w3-border" name="district">
									<option value="" disabled selected>&nbsp;&nbsp;Choose your option</option>
									<option value="1">Option 1</option>
									<option value="2">Option 2</option>
									<option value="3">Option 3</option>
								</select>
							</span>
							<span class="col-lg-3 col-xs-12" style="text-align: left;">
								<input id="searchInput" type="text" class="">
							</span>
							<span class="col-lg-3 col-xs-12" style="text-align: left;">
								<button id="topSearchBtn" onclick="sub()">Search<i id="searchIcon" class="fas fa-search"></i></button>
							</span>
						</div><!-- 1070 -->
					</div><!-- row -->
				</div>
			</div>
		</div><!--/ container -->
	</section><!--/ profile -->

	 <!-- ==============================================
	 News Feed Section
	 =============================================== --> 
	 <section id="map-container" class="newsfeed">
	  <div class="container">
	  
	   <div class="row">
		<div id="mapform" class="col-lg-12" >
			<div style="position: relative; padding: 60px 15px 15px 15px;">
				<div style="margin-top:-18px; background: #0fc19e;; width:62px; height:65px;position: absolute; top: 0px; left:15px; right: 0px; z-index: 10; 
					text-align: center; padding: 15px; border-radius: 7px;">
			    	<i class="fas fa-map-marker-alt" style="color: white;font-size: 32px;"></i>
				</div>
				<div id="map"></div>
			</div>

		</div>
	   </div><!--/ row -->
	   
	  </div><!--/ container -->
	 </section><!--/ newsfeed -->
	 
	 
	 
  	 <section id="maplist" class="newsfeed">
	  <div class="container">

		 <div class="row">
			 <div class="col-xs-12" style="background: rgba(255,255,255,.15); padding: 0px;">
			 	<div class="" style="height:100px;border: 0px solid red; border-radius: 10px;background: white; padding: 20px; margin-bottom: 15px;">
				 	 <h3 style="margin: 0px 0px 12px 0px;"><i class="fas fa-clinic-medical"></i>&nbsp;<b>이스턴병원</b></h3>
					  <span><i class="fas fa-map-marker-alt"></i>&nbsp;제주특별자치도 제주시 일도이동 72-2번지</span>
					  <span style="margin-left: 7px;"><i class="fas fa-phone-square-alt"></i>&nbsp;757-8275</span>
				</div>
			 	<div class="" style="height:100px;border: 0px solid red; border-radius: 10px;background: white; padding: 20px; margin-bottom: 15px;">
				 	<h3 style="    margin: 0px 0px 12px 0px;"><i class="fas fa-clinic-medical"></i>&nbsp;<b>이스턴병원</b></h3>
					  <span><i class="fas fa-map-marker-alt"></i>&nbsp;제주특별자치도 제주시 일도이동 72-2번지</span>
					  <span style="margin-left: 7px;"><i class="fas fa-phone-square-alt"></i>&nbsp;757-8275</span>
				</div>
		 	</div>
		 </div>
		 <div class="row">
			 <div class="col-xs-12" style="background: rgba(255,255,255,.15); padding: 0px;">
			 	<div class="col-lg-6" id="left-container" style="padding:0px 15px 0px 0px">
			 		<div style="padding:15px; height:100px;border: 0px solid red; border-radius: 10px;background: white; padding: 20px; margin-bottom: 15px;">
					 	  <h3 style="margin: 0px 0px 12px 0px;"><i class="fas fa-clinic-medical"></i>&nbsp;<b>이스턴병원2</b></h3>
						  <span><i class="fas fa-map-marker-alt"></i>&nbsp;제주특별자치도 제주시 일도이동 72-2번지</span>
						  <span style="margin-left: 7px;"><i class="fas fa-phone-square-alt"></i>&nbsp;757-8275</span>
					</div>
				</div>
			 	<div class="col-lg-6" style="padding:0px">
			 		<div style="padding:15px; height:100px;border: 0px solid red; border-radius: 10px;background: white; padding: 20px; margin-bottom: 15px;">
				 		<h3 style="margin: 0px 0px 12px 0px;"><i class="fas fa-clinic-medical"></i>&nbsp;<b>이스턴병원2</b></h3>
					  	<span><i class="fas fa-map-marker-alt"></i>&nbsp;제주특별자치도 제주시 일도이동 72-2번지</span>
					  	<span style="margin-left: 7px;"><i class="fas fa-phone-square-alt"></i>&nbsp;757-8275</span>
					 </div>
				</div>
		 	</div>
		 </div>		 
		 
	   
	  </div><!--/ container -->
	 </section><!--/ newsfeed -->
  

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
		   
     <!-- ==============================================
	 Scripts
	 =============================================== -->
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/base.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/plugins/slimscroll/jquery.slimscroll.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/follwer.js"></script>
		
    <!-- ==============================================
	HEADER CIRCLE Scripts
	=============================================== -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/assets/js/skel.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/assets/js/util.js"></script>
	<!-- main 외  페이지 전용 -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/circle-header.js"></script>
	<!-- Map Script -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/custom-map.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0d9f5c75a037bb611cbdea021d1a56f"></script>
	<!-- Auto Script -->
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
  </body>
</html>
