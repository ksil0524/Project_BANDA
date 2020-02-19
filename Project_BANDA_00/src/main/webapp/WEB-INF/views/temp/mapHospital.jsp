<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Map CSS -->
<link href="<%=request.getContextPath() %>/resources/assets/css/custom-map.css" rel="stylesheet" />
<!-- HEAD CSS -->
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>

</head>
<body>
<input type = "hidden" id = "hidden_session" value = <%=session.getAttribute("vo") %>>

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
						<span>약국</span>
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
						<!-- <form action="" method="post" id="searchForm"> -->
						<div id="searchBox" style="width: 1070px;">
								<div id="cateOne" class="custom-select col-lg-3 col-xs-12">
								  <select id="city_selbox" class="w3-select w3-border" name="city">
								  </select>
								</div>
								<div id="cateTwo" class="custom-select2 col-lg-3 col-xs-12">
								  <select id="dist_selbox" class="w3-select w3-border" name="district">
								  </select>
								</div>
							<span class="col-lg-3 col-xs-12" style="text-align: left;">
								<input id="searchInput" type="text" name="keyword" placeholder="병원명을 입력해주세요.">
							</span>
							<span class="col-lg-3 col-xs-12" style="text-align: left;">
								<button id="topSearchBtn" onclick="searchFormSubmit()">Search<i id="searchIcon" class="fas fa-search"></i></button>
							</span>
						</div><!-- 1070 -->
						<!-- </form> -->
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
			<div id="mapCon" style="">
				<div id="mapDiv" style="">
			    	<i class="fas fa-map-marker-alt"></i>
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
			 <div id="listCon" class="col-xs-12">
 			 	<c:choose>
			 		<c:when test="${empty list }">
			 			<div id="listDiv"  class="nodatalistDiv">
				 	 		<b>검색된 병원이 없습니다.</b>
						</div>
			 		</c:when>
			 		<c:otherwise>
			 			<c:forEach items="${list }" var="vo">
						 	<div id="listDiv"  class="">
							 	 <h3><i class="fas fa-clinic-medical"></i>&nbsp;<b>${vo.map_name}</b></h3>
								  <span><i class="fas fa-map-marker-alt"></i>&nbsp;${vo.map_addr}</span>
								  <span style="margin-left: 7px;"><i class="fas fa-phone-square-alt"></i>&nbsp;${vo.map_phone }</span>
							</div>
			 			</c:forEach>
			 		</c:otherwise>
			 	</c:choose> 
<!-- 			 	<div id="listDiv"  class="">
				 	 <h3><i class="fas fa-clinic-medical"></i>&nbsp;<b>이스턴병원</b></h3>
					  <span><i class="fas fa-map-marker-alt"></i>&nbsp;제주특별자치도 제주시 일도이동 72-2번지</span>
					  <span style="margin-left: 7px;"><i class="fas fa-phone-square-alt"></i>&nbsp;757-8275</span>
				</div>
			 	<div id="listDiv"  class="nodatalistDiv">
				 	 <b>검색된 병원이 없습니다.</b>
				</div> -->
		 	</div>
		 </div>
		 
		 <!-- <div class="row">
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
		 </div>		  -->
		 
	   
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
  </body>
</html>
