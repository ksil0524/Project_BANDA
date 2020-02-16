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

	if(session.getAttribute("vo1") != null){
		AccountVo main_vo = (AccountVo)request.getAttribute("vo1");
		//System.out.println(main_vo);	
		
		List<FeedVo> feed_list = (List)main_vo.getFeed_list();

		
		for(FeedVo l : feed_list){
			
			List feed_image = new ArrayList();//전체
			List feed_file = new ArrayList();//이미지만
			
			//feed image -> no입력
			feed_image.add(l.getFeed_no());
			
			String file_n = l.getFeed_file();
			String[] f = file_n.split("@");
			
			feed_image.add(f[1]);	
			
			feed.add(feed_image);

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
						  		  style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), no-repeat; background-size: cover; background-position: center center;" autoplay>
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
       <div class="modal-content">
        <div class="modal-body">
		
         <div class="row">
		 
          <div class="col-md-8 modal-image">
           <img class="img-responsive" src="<%=request.getContextPath() %>/resources/temp/assets/img/posts/1.jpg" alt="Image"/>
          </div><!--/ col-md-8 -->
          <div class="col-md-4 modal-meta">
           <div class="modal-meta-top">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			 <span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button><!--/ button -->
            <div class="img-poster clearfix">
             <a href=""><img class="img-responsive img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/18.jpg" alt="Image"/></a>
             <strong><a href="">Benjamin</a></strong>
             <span>12 minutes ago</span><br/>
		     <a href="" class="kafe kafe-btn-mint-small"><i class="fa fa-check-square"></i> Following</a>
            </div><!--/ img-poster -->
			  
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
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/15.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Vanessa Wells</a></strong>
               <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span>on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/14.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Sean Coleman</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/13.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anna Morgan</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/3.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Allison Fowler</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
            </ul><!--/ comment-list -->
			  
            <div class="modal-meta-bottom">
			 <ul>
			  <li><a class="modal-like" href="#"><i class="fa fa-heart"></i></a><span class="modal-one"> 786,286</span> | 
			      <a class="modal-comment" href="#"><i class="fa fa-comments"></i></a><span> 786,286</span> </li>
			  <li>
			   <span class="thumb-xs">
				<img class="img-responsive img-circle" src="http://bootdey.com/img/Content/user_3.jpg" alt="Image">
			   </span>
			   <div class="comment-body">
				 <input class="form-control input-sm" type="text" placeholder="Write your comment...">
			   </div><!--/ comment-body -->	
              </li>				
             </ul>				
            </div><!--/ modal-meta-bottom -->
			  
           </div><!--/ modal-meta-top -->
          </div><!--/ col-md-4 -->
		  
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

	</body>
</html>