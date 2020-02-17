<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import = "com.mvc.banda.model.vo.AccountVo" %>
<%@ page import = "com.mvc.banda.model.vo.FeedVo" %>
<%@ page import = "java.util.*" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/assets/css/custom-modal.css" rel="stylesheet" />
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
	  <div class="d-flex justify-content-between">
	   <div class="p-2 nav-icon-lg clean-black"style="height: 59px;">
	   <a class="nav-icon" href="mypageFollw.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>F / F</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
	   <a class="nav-icon" href="mypagePets.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>나의 반려동물</span>
	   </a>
	   </div>
	   
	   <div class="p-2 nav-icon-lg mint-green" style="height: 59px;">
	   <a class="nav-icon" href="mypageFeed.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>나의피드</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg dark-black" style="height: 59px;">
	   <a class="nav-icon" href="mypageAccount.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>내계정</span>
	   </a>
	   </div>
	  </div>
	</section>	
			
  
	 <!-- ==============================================
	 News Feed Section
	 =============================================== --> 
	 
	 <%
	 	
		AccountVo vo = (AccountVo)session.getAttribute("vo");
	 	String id = vo.getId();
	 	
	 	System.out.println(id);
	 	
	 	List<FeedVo> fvo = (List)request.getAttribute("fvo");

	 	
	 	String str[] = null;
	 	List feed = new ArrayList();
	 
		for(FeedVo f : fvo){
			
			List rfeed_image = new ArrayList();
			List rfeed_file = new ArrayList();
			
			rfeed_image.add(f.getFeed_no());
			
			str = f.getFeed_file().split("@");
			rfeed_image.add(str[1]);
			
			rfeed_image.add(f.getLike_list().size());
			
			feed.add(rfeed_image);
			
		}
	 	
	 	
	 
	 %>
	 
	 <!-- ==============================================
		뒤에배경
	 =============================================== --> 
	 <section class="profile">
	  <div class="container-fluid">
	   <div class="row">
	   
	   <div class="col-lg-3">
		 <div class="profilebox hidden-xs hidden-sm" 
		   style="background: linear-gradient( rgba(34,34,34,0.45), rgba(34,34,34,0.45)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/4.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">		  
		 </div>
		 <div class="profilebox hidden-xs hidden-sm" 
		   style="background: linear-gradient( rgba(34,34,34,0.45), rgba(34,34,34,0.45)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/1.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">		  
		 </div>
	   </div>
	   <div class="col-lg-6">
		 <div class="profilebox-large hidden-xs hidden-sm" 
		   style="background: linear-gradient( rgba(34,34,34,0.45), rgba(34,34,34,0.45)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/9.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">		  
		 </div>
	   </div>
	   <div class="col-lg-3">
		 <div class="profilebox hidden-xs hidden-sm" 
		   style="background: linear-gradient( rgba(34,34,34,0.45), rgba(34,34,34,0.45)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/11.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">		  
		 </div>
		 <div class="profilebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.6), rgba(34,34,34,0.6)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/12.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">		  
		 </div>
	   </div>
		
       </div><!--/ row-->	
	  </div><!--/ container -->
	 </section><!--/ profile -->
  
	 <!-- ==============================================
	 	사람사진
	 =============================================== --> 
	 <section class="user-profile">
	  <div class="container-fluid">
	   <div class="row">
	   
	    <div class="col-lg-12">
		   <div class="post-content">
		    <div class="author-post text-center">
		     <a href="#"><img class="img-fluid img-circle" src="<%=request.getContextPath() %>/resources/images/filemanager/account/<%=id %>/profile.jpg" 
		     											   alt="이미지 없음" onerror="this.src = '<%=request.getContextPath() %>/resources/images/logo_profile.png'"></a>
		    </div><!-- /author -->
		   </div><!-- /.post-content -->		
		</div><!-- /col-sm-12 -->
		
       </div><!--/ row-->	
	  </div><!--/ container -->
	 </section><!--/ profile -->
  
	 <!-- ==============================================
	 	글올리기
	 =============================================== --> 
	 <section class="details">
	  <div class="container">
	   
	   <div class="row">
	    <div class="col-lg-12">  
		
	     <div class="box">
		  <form>
		   <textarea class="form-control no-border" rows="3" placeholder="Type something..."></textarea>
		  </form>
		  <div class="box-footer clearfix">
		   <button class="kafe-btn kafe-btn-mint-small pull-right btn-sm">Upload</button>
		   <ul class="nav nav-pills nav-sm">
			<li class="nav-item"><a class="nav-link" href=""><i class="fa fa-camera text-muted"></i></a></li>
			<li class="nav-item"><a class="nav-link" href=""><i class="fa fa-video text-muted"></i></a></li>
		   </ul>
		  </div>
		 </div>	
		 
		</div>
	   </div>
	  
	  </div><!--/ container -->
	 </section><!--/ profile -->	
    
	 <!-- ==============================================
	  피드부분
	 =============================================== --> 
	 <section class="newsfeed">
	  <div class="container">
	  
	   <div class="row">
	   
	   <c:choose>
	   <c:when test = "${not empty fvo}">
	   
			<c:forEach items="<%=feed %>" var="list">
					<c:set var = "file" value = "${list.get(1)}"/>
					<c:set var = "file_length" value = "${fn:length(file)}"/>
					<c:set var = "file_type" value = "${fn:substring(file, file_length-3 , file_length)}" />
					
					<c:choose>
					<c:when test = "${file_type ne 'mp4'}">	
						<div class="col-lg-4">
						 <a href="#myModal" data-toggle="modal">
						 
						 <!-- 사진 -->
						 <div class="explorebox" 
						   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('<%=request.getContextPath() %>/resources/images/filemanager/feed/${list.get(0)}/${list.get(1)}') no-repeat;
						          background-size: cover;
				                  background-position: center center;
				                  -webkit-background-size: cover;
				                  -moz-background-size: cover;
				                  -o-background-size: cover;">
				          
				          <!-- 좋아요수 --> 
						  <div class="explore-top">
						   <div class="explore-like"><i class="fa fa-heart"></i> <span>${list.get(2)}</span></div>
				          </div>	
				          	  
						 </div>
						 </a>
						</div><!--/ col-lg-4 -->
		            </c:when>
		            <c:otherwise>
		            <div class="col-lg-4">
					 <a href="#myModal" data-toggle="modal">
					 
					 <!-- 사진 -->
					 <div>
					 <video class="explorebox" 
					 		style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)),  no-repeat;
					          background-size: cover;
			                  background-position: center center;
			                  -webkit-background-size: cover;
			                  -moz-background-size: cover;
			                  -o-background-size: cover;" autoplay loop>
			               <source src="<%=request.getContextPath() %>/resources/images/filemanager/feed/${list.get(0)}/${list.get(1)}" type="video/mp4">    
			          </video>
			          
			          <!-- 좋아요수 --> 
					  <div class="explore-top" style = "margin-top:-121%;color:black">
						   <div class="explore-like"><i class="fa fa-heart"></i> <span>${list.get(2)}</span></div>
			     	  </div>
			          	  
					 </div>
					 </a>
					</div><!--/ col-lg-4 -->
			            
		            </c:otherwise>
		            </c:choose>
			</c:forEach>
		
		</c:when>
		
		<c:otherwise>
	            	<div style = "color : rgb(5,203,149);font-weight:bold;text-align : center;font-size : 20px; width : 100%;">
	            		<br>
	            		피드가 존재하지 않습니다.
	            		<br><br><br>
	    
	            	</div>
	    </c:otherwise>
		
		</c:choose>

		
	   </div><!--/ row -->
	   
	  </div><!--/ container -->
	 </section><!--/ newsfeed -->
  
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
		          
		          <!-- --------------------------------------- -->
		          
		          <iframe name = "por" width = "0" height = "0" ></iframe>
		          <form name = "frm" method = "post" action = ""> </form>
		          
		          <!-- ------------------------------------------- -->
		          
		          	<!-- 이미지 삽입 -->
					<div class = "carousel-item active">
						
						<%
						
												
						if(session.getAttribute("feedno")!=null){
							
							Integer feedvo = (Integer)session.getAttribute("feedno");
							System.out.println(feedvo);
							
						} else {
							
							//System.out.println("null");
							
						}
						
						
						%>
						
						<c:set var = "feedno2" value = "#{feedno}"/>
						<c:out value = "${feedno2}"/>
						
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
			<div style = "height:15vh">
            <ul class="img-comment-list" >
             <li>
              <div class="comment-text">
               <p style = "font-size : 8px;color:rgb(5,203,149)">feed_ptag</p>
               <p style = "font-size : 8px;color:rgb(5,203,149)">feed_htag</p>
               <p>Hello this is a test comment.</p> 
               <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
            </ul><!--/ comment-list -->
            </div>
            
            <hr>
            
            <!-- 댓글 -->
            <div style = "height:32vh">
             <ul class="img-comment-list2">
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
	<script src="<%=request.getContextPath() %>/resources/assets/jquery/jquery.min.js"></script>
  	<script src="<%=request.getContextPath() %>/resources/assets/js/bootstrap.bundle.min.js"></script>
	   
  </body>
</html>
