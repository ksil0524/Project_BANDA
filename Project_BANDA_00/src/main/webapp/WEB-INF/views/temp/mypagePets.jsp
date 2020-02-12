<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mvc.banda.model.vo.AccountVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
	<!-- ==============================================
	Styles
	=============================================== -->
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/photo_home(kim).css" rel="stylesheet" />
	<%
		AccountVo accvo = (AccountVo)session.getAttribute("accvo");
	%>
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
	   <div class="p-2 nav-icon-lg mint-green" style="height: 59px;">
	   <a class="nav-icon" href="mypagePets.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>나의 반려동물</span>
	   </a>
	   </div>
	   
	   <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
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
	 <section class="newsfeed">
	  <div class="container-fluid" >
	   <div id="mediaSet" class="row" style="position:absoute; left:50%; transform:translate(12.5%,0%);">
	    <div class="col-lg-3">
		

		 <div class="storybox mypetInsert" 
		   style="background-color: white; background-color: rgba(0, 0, 0, 0.59);">
          <div class="story-body text-center">
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/icon/mypagePets-plusIcon.jpg" alt="user"></div>
          	<h4 style="color:white;font-family: sans serif;">반려동물 추가</h4>
          </div>		  
		 </div>
		 

		 <div class="storybox mypetListSeq" 
		   style="background: linear-gradient( rgba(34,34,34,0.78), rgba(34,34,34,0.78)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/2.gif') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
          <div class="story-body text-center">
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
           <h4><%=accvo.getPet_list().get(0).getP_Name() %></h4>
          </div>		  
		 </div>

		
		 <div class="storybox mypetListSeq" 
		   style="background: linear-gradient( rgba(34,34,34,0.78), rgba(34,34,34,0.78)), url('<%=request.getContextPath() %>/resources/temp/assets/img/posts/3.gif') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
          <div class="story-body text-center">
           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/13.jpeg" alt="user"></div>
           <h4>cat</h4>
          </div>		  
		 </div>
		 
		</div><!--/ col-lg-3 -->
	    <div class="col-lg-6">
			
			<div id="mypetsInsert" class="cardbox" style="border:1px solid #F4F4F4; background-color: #F4F4F4; box-shadow: 2px 2px 2px 2px lightgray; height: 712px;">
			  <form action="" method="">
			  
			  <div class="row">
			    
			    <div class="col-65">
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="name">이름</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="text" id="name" name="name" placeholder="이름을 입력하세요..">
			        </div>
			      </div>
			      
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="birth">출생</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="date" id="birth" name="birth" placeholder="이름을 입력하세요..">
			        </div>
			      </div>
			      
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category1">카테고리1</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category1" name="category1">
			        	<option value="mammal">포유류</option>
			        	<option value="birds">조류</option>
			      	  </select>
			        </div>
			  	  </div>
			      
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category2">카테고리2</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category2" name="category2">
			        	<option value="dog">개</option>
			        	<option value="cat">고양이</option>
			      	  </select>
			        </div>
			  	  </div>
			      
			    </div> <!--/ col-65 -->
			    
				<div class="col-35" style="padding-left: 4px; padding-top: 10px; overflow: hidden; cursor:pointer;">
			      <input type="file" id="imgInp" style="display: none;">
			     <!--  <img id="image_section" src="https://www.w3schools.com/css/img_5terre.jpg" /> -->
			      <img id="image_section" src="<%=request.getContextPath() %>/resources/temp/assets/img/icon/profile_default.jpg" alt="user">
			    </div> <!--/ col-35 -->
			    
			    
			  </div><!--/ row -->
			  </form>
			
			  <div class="row">
			    <div class="col-25">
			      <label for="species">종</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="species" name="species" placeholder="종을 입력하세요..">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="like">좋아요</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="like" name="like" placeholder="좋아하는 것을 입력하세요..">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="hate">싫어요</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="hate" name="hate" placeholder="싫어하는 것을 입력하세요..">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="introduce">소개</label>
			    </div>
			    <div class="col-75">
			      <textarea id="introduce" name="introduce" placeholder="소개를 입력하세요.." style="height:200px"></textarea>
			    </div>
			  </div>
			</div><!--/ container -->
			
			<!-- 저장된 프로필 보기 -->
			<div id="mypetsDetail" class="cardbox" style="display:none; border:1px solid #F4F4F4; background-color: #F4F4F4; box-shadow: 2px 2px 2px 2px lightgray; height: 712px;">
			  <form action="" method="">
			  <div class="row">
			    <div class="col-65">
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="name">이름</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="text" id="name" name="name" value="<%=accvo.getPet_list().get(0).getP_Name() %>" disabled="disabled">
			        </div>
			      </div>
			      
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="birth">출생</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="date" id="birth" name="birth" value="<%=accvo.getPet_list().get(0).getP_birth() %>" disabled="disabled" >
			        </div>
			      </div>
			      
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category1">카테고리1</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category1" name="category1" disabled="disabled">
			        	<option value="mammal" selected="selected">포유류</option>
			        	<option value="birds">조류</option>
			      	  </select>
			        </div>
			  	  </div>
			      
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category2">카테고리2</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category2" name="category2" disabled="disabled">
			        	<option value="dog" selected="selected">개</option>
			        	<option value="cat">고양이</option>
			      	  </select>
			        </div>
			  	  </div>
			      
			    </div> <!--/ col-65 -->
			    
				<div class="col-35" style="padding-left: 4px; padding-top: 10px; overflow: hidden; cursor:pointer;">
			     <!--  <img id="image_section" src="https://www.w3schools.com/css/img_5terre.jpg" /> -->
			      <img src="<%=request.getContextPath() %>/resources/temp/assets/img/icon/testDog.jpg">
			    </div> <!--/ col-35 -->
			    
			    
			  </div><!--/ row -->
			  </form>
			
			  <div class="row">
			    <div class="col-25">
			      <label for="species">종</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="species" name="species" value="<%=accvo.getPet_list().get(0).getP_kind() %>" disabled="disabled">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="like">좋아요</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="like" name="like" value="<%=accvo.getPet_list().get(0).getP_like() %>" disabled="disabled">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="hate">싫어요</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="hate" name="hate" value="<%=accvo.getPet_list().get(0).getP_hate() %>" disabled="disabled">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="introduce">소개</label>
			    </div>
			    <div class="col-75">
			      <textarea id="introduce" name="introduce" style="height:200px" disabled="disabled"><%=accvo.getPet_list().get(0).getP_about() %></textarea>
			    </div>
			  </div>
			  
			  
			</div><!--/ container -->
			
			
			<!-- 저장된 프로필  수정-->
			<div id="mypetsUpdate" class="cardbox" style="display:none; border:1px solid #F4F4F4; background-color: #F4F4F4; box-shadow: 2px 2px 2px 2px lightgray; height: 712px;">
			  <form action="" method="">
			  <div class="row">
			    <div class="col-65">
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="name">이름</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="text" id="name" name="name" value="멍순이" >
			        </div>
			      </div>
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="birth">출생</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="date" id="birth" name="birth" value="2018-9-17">
			        </div>
			      </div>
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category1">카테고리1</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category1" name="category1" >
			        	<option value="mammal" selected="selected">포유류</option>
			        	<option value="birds">조류</option>
			      	  </select>
			        </div>
			  	  </div>
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category2">카테고리2</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category2" name="category2" >
			        	<option value="dog" selected="selected">개</option>
			        	<option value="cat">고양이</option>
			      	  </select>
			        </div>
			  	  </div>
			    </div> <!--/ col-65 -->
				<div class="col-35" style="padding-left: 4px; padding-top: 10px; overflow: hidden; cursor:pointer;">
			     <!--  <img id="image_section" src="https://www.w3schools.com/css/img_5terre.jpg" /> -->
			      <img src="<%=request.getContextPath() %>/resources/temp/assets/img/icon/testDog.jpg">
			    </div> <!--/ col-35 -->
			  </div><!--/ row -->
			  </form>
			  <div class="row">
			    <div class="col-25">
			      <label for="species">종</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="species" name="species" value="시바견" >
			    </div>
			  </div> 
			  <div class="row">
			    <div class="col-25">
			      <label for="like">좋아요</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="like" name="like" value="간식">
			    </div>
			  </div> 
			  <div class="row">
			    <div class="col-25">
			      <label for="hate">싫어요</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="hate" name="hate" value="목욕">
			    </div>
			  </div> 
			  <div class="row">
			    <div class="col-25">
			      <label for="introduce">소개</label>
			    </div>
			    <div class="col-75">
			      <textarea id="introduce" name="introduce" style="height:200px">강아지 소개입니다.</textarea>
			    </div>
			  </div>
			</div><!--/ container -->
			
			<div id="subBtn" class="row btns">
			    <input id="submitBtn" type="submit" value="저장">
			    <input id="updateBtn" type="button" value="수정">
			 </div><!--/ row btns -->
		   </form>
        </div><!--/ col-lg-6 -->
	   </div><!--/ row -->
	  </div><!--/ container -->
	 </section><!--/ newsfeed -->
  
	 <!-- ==============================================
	 Modal Section
	 =============================================== -->
     <div id="myModal" class="modal fade">
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
	<!-- custom script -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/custom-mypage-pets.js"></script>
  </body>
</html>