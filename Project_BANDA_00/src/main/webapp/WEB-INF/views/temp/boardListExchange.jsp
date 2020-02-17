<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>

	<!-- ==============================================
	Styles
	=============================================== -->
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/custom-boardlist.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/custom-page.css" rel="stylesheet" />
	
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
	   <div class="p-2 nav-icon-lg clean-black"style="height: 59px;">
	   <a class="nav-icon" href="boardListFree.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>무료나눔</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg mint-green" style="height: 59px;">
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
	 Button Section
	 =============================================== --> 
	 
	 <section class="button-menu">
	  <div class="container">
	  	<!-- 검색창 부분 -->
	  	<span id="searchinputBox">
		  	<select id="searchSelect">
		  		<option>제목</option>
		  		<option>내용</option>
		  		<option>글쓴이</option>
		  	</select>
			<input type="text" id="searchKeyword" placeholder="검색어를 입력하세요" />
			<div id="searchBtn" onclick=""><i class="fas fa-search" style="width: 25px; height: 25px;"></i></div>
		</span>
	  	<!-- -------- -->
	  	
	   	<button class="kafe-btn kafe-btn-mint-small pull-right btn-sm" onclick="location.href='boardWriteForm.do'" style="position: relative;">Upload</button>
	  </div>
	 </section>
	 

	 <!-- ==============================================
	 Board List Section
	 =============================================== --> 
	 <section class="boardlist">
	  <div class="container">
	  
	   <!-- 공지사항 부분 -->	   
	   <div class="row">
	   	<div class="upper-notice" style="padding: 1em;">
	   	  <table>
	   	  	<colgroup>
	   	  	  <col style="width: 90px;">
	   	  	  <col>
	   	  	  <col style="width: 130px;">
	   	  	  <col style="width: 100px;">
	   	  	  <col style="width: 100px;">
	   	  	</colgroup>
	   	  	<thead>
		   	  <tr>
		   	  	<th><!-- 공지 --></th>
		   	  	<th>제목</th>
		   	  	<th>글쓴이</th>
		   	  	<th>작성일</th>
		   	  	<th>조회수</th>
		   	  </tr>
	   	  	</thead>
	   	  	<tbody>
	   	  	  <tr>
	   	  	  	<td class="td_notice">공지</td>
	   	  	  	<td class="td_title"><a href="boardDetail.do">거래 전 주의사항</a></td>
	   	  	  	<td class="td_writer">BANDA</td>
	   	  	  	<td class="td_date">2020-01-01</td>
	   	  	  	<td class="td_view">100</td>
	   	  	  </tr>
	   	  	</tbody>
	   	  </table>
	   	</div><!--/ upper-notice -->
	   </div><!--/ div row -->
	   <!--/ 공지사항 부분 -->
	  
	   <div class="row">
	   
	    <div class="col-lg-4">
		 <a href="boardDetail.do">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/14.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fas fa-eye"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="fa fa-comments"></i> <span>100</span></div>
          </div>		

          <div class="story-body">
           <h3>TITLE</h3>
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4>Clifford Graham</h4>
           <p>2020-01-01</p>
          </div>  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="boardDetail.do">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/18.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fas fa-eye"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="fa fa-comments"></i> <span>100</span></div>
          </div>		

          <div class="story-body">
           <h3>TITLE</h3>
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4>Clifford Graham</h4>
           <p>2020-01-01</p>
          </div>  			  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="boardDetail.do">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/15.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fas fa-eye"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="fa fa-comments"></i> <span>100</span></div>
          </div>		

          <div class="story-body">
           <h3>TITLE</h3>
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4>Clifford Graham</h4>
           <p>2020-01-01</p>
          </div>  	  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
		
	   </div><!--/ row -->
	   
	   <div class="row">
	   
	    <div class="col-lg-4">
		 <a href="boardDetail.do">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/25.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fas fa-eye"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="fa fa-comments"></i> <span>100</span></div>
          </div>		

          <div class="story-body">
           <h3>TITLE</h3>
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4>Clifford Graham</h4>
           <p>2020-01-01</p>
          </div>  	  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="boardDetail.do">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/36.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fas fa-eye"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="fa fa-comments"></i> <span>100</span></div>
          </div>		

          <div class="story-body">
           <h3>TITLE</h3>
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4>Clifford Graham</h4>
           <p>2020-01-01</p>
          </div>  			  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="boardDetail.do">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/26.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fas fa-eye"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="fa fa-comments"></i> <span>100</span></div>
          </div>		

          <div class="story-body">
           <h3>TITLE</h3>
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4>Clifford Graham</h4>
           <p>2020-01-01</p>
          </div>  		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
		
	   </div><!--/ row -->
	   
	  </div><!--/ container -->
	 </section><!--/ newsfeed -->
	 
	 <!-- ==============================================
	 Page Section
	 =============================================== -->

	 <nav aria-label="Page navigation example" style="background-color: #f4f4f4; padding-bottom:100px;">
	  <ul class="pagination justify-content-end">
		  <!-- « » -->
		  <li><a href="#">❮❮</a></li>
		  <li><a href="#">❮</a></li>
		  <li><a href="#">1</a></li>
		  <li><a class="active" href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#">6</a></li>
		  <li><a href="#">7</a></li>
		  <li><a href="#">❯</a></li>
		  <li><a href="#">❯❯</a></li>
		</ul>
	 </nav>
	
	  <script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?73c27e26f610eb3c9f3feb0c75b03925";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	  </script>
	 
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
