<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import = "com.mvc.banda.model.vo.AccountVo" %>
<%@ page import = "com.mvc.banda.model.vo.FeedVo" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Radius by TEMPLATED</title>
		<meta charset="utf-8" />
	    <!-- ==============================================
		LOGIN CSS
		=============================================== -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
		<link href="<%=request.getContextPath() %>/resources/assets/css/custom-modal.css" rel="stylesheet" />
		<link href="<%=request.getContextPath() %>/resources/temp/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath() %>/resources/assets/css/login-register.css" rel="stylesheet" />
	    <!-- ==============================================
		CSS
		=============================================== -->
		<link href="<%=request.getContextPath() %>/resources/assets/icon/all.min.css" rel="stylesheet" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets/css/main.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets/css/custom.css" />
		
		<!-- Bootstrap core CSS -->
 		 <link href="<%=request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- favicon -->
		<link rel="icon" href="/favicon.ico"> 

		<!-- Login css -->
		<!-- <link href="login/assets/css/bootstrap.css" rel="stylesheet" /> -->
		<!-- <script src="login/assets/js/login-register.js" type="text/javascript"></script> -->
		
	</head>
	<body style="overflow: auto;">
	<!-- TOP Button -->
	<a id="back-to-top" href="#" class="back-to-top" role="button" data-placement="left" data-toggle="modal" data-target="#myModal2" >
	<i class="fas fa-plus-circle"></i></a>	
	<!-- Header -->
	<jsp:include page="./circle-header.jsp"></jsp:include>
	
	
	<input type = "hidden" id = "hidden_session" value = <%=session.getAttribute("vo") %>>
	
		<!-- Main -->
			<div id="main">
				<div class="inner">
					<div class="columns">
						
						<!-- 피드이미지 -->
<%

	List feed = new ArrayList();
	List<FeedVo> feed_list = new ArrayList();
	String str[] = null;

	if(session.getAttribute("vo") != null){
		
		if(request.getAttribute("fvo") != null){
			
		AccountVo main_vo = (AccountVo)request.getAttribute("fvo");
		//System.out.println(main_vo);	
		
		feed_list = (List)main_vo.getFeed_list();

		
		for(FeedVo l : feed_list){
			
			List feed_image = new ArrayList();//전체
			
			//feed image -> no입력
			feed_image.add(l.getFeed_no());
			
			String file_n = l.getFeed_file();
			str = file_n.split("@");
			
			feed_image.add(str[1]);	
			
			feed.add(feed_image);

		}	
		
		for(FeedVo f : feed_list){
			System.out.println(f);
		}
		
	} else {
		
		feed_list = (List)request.getAttribute("frvo");	
		
		for(FeedVo f : feed_list){
			
			List rfeed_image = new ArrayList();
			List rfeed_file = new ArrayList();
			
			rfeed_image.add(f.getFeed_no());
			
			str = f.getFeed_file().split("@");
			rfeed_image.add(str[1]);
			
			feed.add(rfeed_image);
			
		}
		
		for(FeedVo f : feed_list){
			System.out.println(f);
		}
		
	}
		
} else {
	
		feed_list = (List)request.getAttribute("frvo");	
		
		for(FeedVo f : feed_list){
			
			List rfeed_image = new ArrayList();
			List rfeed_file = new ArrayList();
			
			rfeed_image.add(f.getFeed_no());
			
			str = f.getFeed_file().split("@");
			rfeed_image.add(str[1]);
			
			feed.add(rfeed_image);
			
		}
		
		for(FeedVo f : feed_list){
			System.out.println(f);
		}	
		
}
%>
					<c:forEach items = "<%=feed %>" var = "list">
					<c:set var = "file" value = "${list.get(1)}"/>
					<c:set var = "file_length" value = "${fn:length(file)}"/>
					<c:set var = "file_type" value = "${fn:substring(file, file_length-3 , file_length)}" />
					<c:choose>
					<c:when test = "${file_type ne 'mp4'}">	
						<div id="imgfit">
							
							<a data-toggle="modal" data-target="#myModal">
								<img class="testexplorebox" 
						  		  style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/images/filemanager/feed/${list.get(0)}/${list.get(1)}') no-repeat; background-size: cover; background-position: center center;">
			               	</a>
		                </div>
		            </c:when>
		            <c:otherwise>
		           		<div id="imgfit">
							<a data-toggle="modal" data-target="#myModal">
								<video class="testexplorebox"
						  		  style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), no-repeat; background-size: cover; background-position: center center;" autoplay loop>
						  		  		<source src="<%=request.getContextPath() %>/resources/images/filemanager/feed/${list.get(0)}/${list.get(1)}" type="video/mp4"> 
						  		</video>
			               	</a>
		                </div>		            
		            </c:otherwise>
		            </c:choose>
		            </c:forEach>


					</div>
				</div>
			</div>
	 <!-- ==============================================
	 Modal Section
	 =============================================== -->
     <div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">
       <div class="modal-content" style = "width:160%;margin-left:-28%;margin-top:-20%">
        <div class="modal-body">
		
         <div class="row" style = "float:left">
		
		<!-- --------------------------------------------------------------------------------------------------------------- --> 
		<!-- 이미지 -->
	    <div class="container" style = "width:60%;height:auto;float:left">
	
		    <div class="row" style = "width:150%">
					
			<div class="col-lg-9">
		
		        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
		         
		          <div class="carousel-inner" role="listbox">
		          
		          <!-- 진짜이미지 -->
		            <div class="carousel-item active">
		              <img class="d-block img-fluid" src="<%=request.getContextPath() %>/resources/temp/assets/img/posts/1.jpg" alt="First slide">
		            </div>
		            <div class="carousel-item">
		              <img class="d-block img-fluid" src="<%=request.getContextPath() %>/resources/temp/assets/img/posts/1.jpg" alt="Second slide">
		            </div>
		            <div class="carousel-item">
		              <img class="d-block img-fluid" src="<%=request.getContextPath() %>/resources/temp/assets/img/posts/1.jpg" alt="Third slide">
		            </div>
		          </div>
		          
		          <!-- 앞 -->
		          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		            <span class="sr-only">Previous</span>
		          </a>
		          
		           <!-- 뒤 -->
		          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		            <span class="carousel-control-next-icon" aria-hidden="true"></span>
		            <span class="sr-only">Next</span>
		          </a>
		        </div>
		        
		        <!-- 좋아요 -->
		        <div style = "float:left">
			 	 <a class="modal-like" href="#"><i class="fa fa-heart" style = "float:left;padding-top:15%;color:rgb(5,203,149)"></i></a>
			 	 <a href = "#" style = "color:rgb(5,203,149)">122</a>
			 	</div>
		      
		       </div>
					
			</div>
		
		</div>
		<!-- --------------------------------------------------------------------------------------------------------------- --> 
          
          
          <div class="col-md-4 modal-meta">
           <div class="modal-meta-top">
           
           <!-- x -->
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			 <span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button><!--/ button -->
			
			<!-- 작성자 -->
            <div class="img-poster clearfix" style = "padding-top:10%">
             <a href=""><img class="img-responsive img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/18.jpg" alt="Image"/></a>
             <strong><a href="">Benjamin</a></strong>
		     <a href="" class="kafe kafe-btn-mint-small"><i class="fa fa-check-square"></i> Following</a>
            </div><!--/ img-poster -->
			 
			<!-- 내용 -->
			<div style = "height:20vh">
            <ul class="img-comment-list">
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/17.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anthony McCartney</a></strong>
               <p style = "font-size : 8px;color:rgb(5,203,149)">feed_ptag</p>
               <p style = "font-size : 8px;color:rgb(5,203,149)">feed_htag</p>
               <p>Hello this is a test comment.</p> 
               <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
            </ul><!--/ comment-list -->
            </div>
            
            <!-- 댓글 -->
            <div style = "height:38vh">
             <ul class="img-comment-list">
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/17.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anthony McCartney</a></strong>
               <p>Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
            </ul><!--/ comment-list -->
            </div>
			  
            <div class="modal-meta-bottom">
			 <ul>
			  
			  <!-- 댓글쓰기 -->
			  <li>
			   <div class="comment-body" style = "width:105%">
				 <input class="form-control input-sm" type="text" placeholder="Write your comment..." style = "float:left">
				 <div style = "float:left;margin-left:5%;margin-top:8%">
				 	<a class="modal-comment" href="#"><i class="fa fa-comments" style = "float:left"></i></a>
				 </div>
			   </div><!--/ comment-body -->	
              </li>
              				
             </ul>				
            </div><!--/ modal-meta-bottom -->
			  
           </div><!--/ modal-meta-top -->
          </div><!--/ col-md-4 -->
          <!-- --------------------------------------------------------------------------------------------------------------- --> 
		  
         </div><!--/ row -->
        </div><!--/ modal-body -->
		
       </div><!--/ modal-content -->
      </div><!--/ modal-dialog -->
     </div><!--/ modal -->
	 
     <div id="myModal2" class="modal fade" role="dialog">
      <div id="myModal2-modal-dialog" class="modal-dialog">
       <div class="modal-content">
        <div class="modal-body">
         <div class="row">
       		<div class="col-md-12 new-postbox">
				<figure>
					<img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/3.jpg" alt="">
				</figure>
				<div class="newpst-input">
					<form method="post">
						<textarea rows="2" placeholder="write something"></textarea>
						<div class="attachments">
							<ul>
								<li>
									<i class="fa fa-image"></i>
									<label class="fileContainer">
										<input type="file">
									</label>
								</li>
								<li>
									<i class="fa fa-video-camera"></i>
									<label class="fileContainer">
										<input type="file">
									</label>
								</li>
								<li>
									<i class="fa fa-camera"></i>
									<label class="fileContainer">
										<input type="file">
									</label>
								</li>
								<li>
									<button type="submit">Publish</button>
								</li>
							</ul>
						</div>
					</form>
				</div>
			</div>
         </div>
        </div>
       </div>
      </div>
     </div>

		<!-- Footer -->
			<footer id="footer">
				<a href="#" class="info fa fa-info-circle"><span>About</span></a>
				<div class="inner">
					<div class="content">
						<h3>Vestibulum hendrerit tortor id gravida</h3>
						<p>In tempor porttitor nisl non elementum. Nulla ipsum ipsum, feugiat vitae vehicula vitae, imperdiet sed risus. Fusce sed dictum neque, id auctor felis. Praesent luctus sagittis viverra. Nulla erat nibh, fermentum quis enim ac, ultrices euismod augue. Proin ligula nibh, pretium at enim eget, tempor feugiat nulla.</p>
					</div>
					<div class="copyright">
						<h3>Follow me</h3>
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
						</ul>
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
			<script src="<%=request.getContextPath() %>/resources/assets/js/jquery.min.js"></script>
			<script src="<%=request.getContextPath() %>/resources/assets/js/skel.min.js"></script>
			<script src="<%=request.getContextPath() %>/resources/assets/js/util.js"></script>
			<script src="<%=request.getContextPath() %>/resources/assets/js/main.js"></script>
			<script src="<%=request.getContextPath() %>/resources/assets/jquery/jquery.min.js"></script>
  			<script src="<%=request.getContextPath() %>/resources/assets/js/bootstrap.bundle.min.js"></script>

	</body>
</html>