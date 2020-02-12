<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
	<!-- ==============================================
	Styles
	=============================================== -->
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/custom-boardwrite.css" rel="stylesheet" />
</head>
<body>

	<!-- ==============================================
	HeaderSection
	=============================================== -->
	<jsp:include page="/WEB-INF/views/circle-header.jsp"></jsp:include>
	
	<!-- ==============================================
	Navbar Second Section + Style
	=============================================== -->
	<section class="nav-sec" style="margin-top: 15px; height: 60px;">
	  <div class="d-flex justify-content-between">
	   <div class="p-2 nav-icon-lg mint-green"style="height: 59px;">
	   <a class="nav-icon" href="boardListFree.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>무료나눔</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
	   <a class="nav-icon" href="boardListExchange.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>물물교환</span>
	   </a>
	   </div>
	   
	   <style>
	   .nav-icon-lg {
	   	width: 400px !important;
	   }
	   </style>
	   
	   <!-- 
	   <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
	   <a class="nav-icon" href="photo_stories.jsp" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>나의피드</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg dark-black" style="height: 59px;">
	   <a class="nav-icon" href="photo_profile.jsp" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>내계정</span>
	   </a>
	   </div>
	    -->
	    
	  </div>
	</section>
  
	 <!-- ==============================================
	 News Feed Section
	 =============================================== --> 
	 <section class="newsfeed">
	  <div class="container" style="width: auto;">
	  	<div class="col-lg-3" ></div><!--/ col-lg-3 -->
	   <!-- <div class="row"> -->
	    <div class="col-lg-6" style="">
	    <!-- style="width: inherit;" -->
		
         <div class="cardbox" style="color: #88898a; padding-bottom:86px !important;">
		  
		  <div class="board-form-title" style="padding: 20px;">
		  	<span style="border-bottom: 1px;"><h3>글쓰기</h3></span>
		  </div><!--/ board-form-title -->
		  <div class="board-form">
			<form action="" method="post">
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="country">게시판선택</label>
			    </div>
			    <div class="col-75">
			      <select id="boardtab" name="boardtab">
			        <option value="free">무료나눔</option>
			        <option value="trade">물물교환</option>
			      </select>
			    </div>
			  </div>
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="title">제목</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="title" name="title" placeholder="제목을 입력하세요..">
			    </div>
			  </div> 
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="content">내용</label>
			    </div>
			    <div class="col-75">
			      <textarea id="content" name="content" placeholder="내용을 입력하세요.." style="height:200px"></textarea>
			    </div>
			  </div>
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="hashtag">해시태그</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="hashtag" name="hashtag" placeholder="해시태그를 입력하세요..">
			    </div>
			  </div>
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="hashtag">반려동물태그</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="hashtag" name="hashtag" placeholder="반려동물 태그를 입력하세요..">
			    </div>
			  </div>
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="content">첨부파일</label>
			    </div>
			    <div class="custom-file col-75 ">
			      <input type="file" class="custom-file-input" id="customFile" name="customFile">
			      <label class="custom-file-label" for="customFile"></label>
			    </div>
			  </div>
			  <div class="row btns" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <input type="submit" value="작성">
			    <input type="button" value="목록" onclick="location.href='boardListFree.do'">
			  </div>
			  </form>
		  </div><!--/ board-form -->
          			        
		 </div><!--/ cardbox -->	
		
		</div><!--/ col-lg-6 -->
	 	
	 	<div class="col-lg-3" ></div><!--/ col-lg-3 -->
	 	
	   <!-- </div> --><!--/ row -->
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
	
    <!-- ==============================================
	HEADER CIRCLE Scripts
	=============================================== -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/assets/js/skel.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/assets/js/util.js"></script>
	<!-- main 외  페이지 전용 -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/circle-header.js"></script>

  </body>
</html>
