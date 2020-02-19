<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mvc.banda.model.vo.AccountVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>

     <!-- ==============================================
	 Scripts
	 =============================================== -->
	 
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/jquery.min.js"></script>
	
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/bootstrap.min.js"></script>
	
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/base.js"></script>
	
	<script src="<%=request.getContextPath() %>/resources/temp/assets/plugins/slimscroll/jquery.slimscroll.js"></script>

	<%
		AccountVo accvo = (AccountVo)session.getAttribute("accvo");

	%>	  	  
		
		
	   <script type="text/javascript">
		  //프로필 사진 변경 스크립트
	  		function profileimg(){
	  			alert("프로필 사진은 .jpg 또는 .JPG 파일만 선택이 가능합니다.");
	  			$("#profile_img").click();
	  		}
	   			
	   			
	   		function profileimginp(){
	   			
	   			$("#profileform").submit();
	   			
	   		}
	   		
	  		function readURL3(input) {
			   	 if (input.files && input.files[0]) {
			   	  var reader = new FileReader();
								   	  
			   	  reader.onload = function (e) {
			   		  $('#profile_img').attr('src', e.target.result);  
			
			   	  }
			   	  
			   	  reader.readAsDataURL(input.files[0]);
			   	  }
			   	}	
	   	
	   </script>


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
	  <div class="d-flex justify-content-between">
	   <div class="p-2 nav-icon-lg dark-black"style="height: 59px;">
	   <a class="nav-icon" href="mypageFollw.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>F / F</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
	   <a class="nav-icon" href="mypagePets.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>나의 반려동물</span>
	   </a>
	   </div>
	   
	   <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
	   <a class="nav-icon" href="mypageFeed.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>나의피드</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg mint-green" style="height: 59px;">
	   <a class="nav-icon" href="mypageAccount.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		<span>내계정</span>
	   </a>
	   </div>
	  </div>
	</section>	
  
	 <!-- ==============================================
	 News Feed Section
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
	 User Profile Section
	 =============================================== --> 
	 <section class="user-profile">
	  <div class="container-fluid">
	   <div class="row">
	    <div class="col-lg-12">
		   <div class="post-content">
		    <div class="author-post text-center">
	  	 <form:form action="mypage_acco_changeprofileimg.do" method="post" enctype="multipart/form-data" id="profileform">
	   		 <input type="hidden" name="account_id" value="<%=accvo.getId()%>"> 
	   		 <input type="file" id="profile_img" name="profile_img" src="" style="display: none;" accept=".jpg" onchange="profileimginp();">
		     <img id="changeprofileimg" class="img-fluid img-circle" src="<%=request.getContextPath() %>/resources/images/filemanager/account/account_profile/<%=accvo.getId() %>/image.jpg" alt="Image" onclick="profileimg();">
	  	 </form:form>
		    </div><!-- /author -->
		   </div><!-- /.post-content -->		
		</div><!-- /col-sm-12 -->
		
       </div><!--/ row-->	
	  </div><!--/ container -->
	 </section><!--/ profile -->
  
	 <!-- ==============================================
	 User Profile Section
	 =============================================== --> 
	 
	 <script type="text/javascript">
	 	
	 	function conform(){
	 		if($("#tconform").css("display") == "none"){
	 			$("#tconform").show();
	 			$("#cfbtn").show();
	 			$("#updatebtn").html("");
	 			$("#updatebtn").text("취   소");
	 			$("#tprofile").hide();
	 		}else{
	 			$("#tconform").hide();
	 			$("#tprofile").show();
	 			$("#cfbtn").hide();
	 			$("#updatebtn").html("");
	 			$("#updatebtn").text("수   정");
	 		}
	 	};
	 	
	 	function confirm(){
	 		
	 		var email = $("#ckemail").val();
	 		var phone = $("#ckphone").val();
	 		var password = $("#ckpassword").val();
	 		var passwordck = $("#ckpasswordck").val();
	 		
	 		if(email == "" ||  phone == "" ||  password == "" || passwordck == ""){
	 			alert("수정항목을 제대로 입력해주세요.");
	 			return false;	
	 		}
	 		
	 		if(password != passwordck){
	 			
	 			alert("비밀번호가 같지 않습니다. 다시 입력해 주세요.");
	 			return false;
	 			
	 		}
	 	
	 		$("#accountupdate").submit();

	 	}
	 	
	 	
	 </script>
	 
	 
	 
	 <section class="details">
	  <div class="container">
	   <div class="row">
	    <div class="col-lg-12">
		 
          <div class="details-box row" style="margin-bottom: 200px;">
		   <div class="col-lg-9" style="width: 1140px;">
           <div class="content-box">
		     <h4 style="margin-bottom: 50px;margin-top: 30px;text-align: center;">ID.   <%=accvo.getId() %> <i class="fa fa-check"></i></h4>
             <table id="tprofile">
             	<col width="300px;">
             	<col width="300px;">
             	<tr>
             		<td style="text-align: center;    padding: 3.75em 0.75em ">
            			<p style="font-size: 20pt;">EMAIL</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><%=accvo.getEmail() %></span><p>
             		</td>
             	</tr>
             	<tr>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
            			<p style="font-size: 20pt;">PHONE</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><%=accvo.getPhone() %></span><p>
             		</td>
             	</tr>
             	<tr>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
            			<p style="font-size: 20pt;">PASSWORD</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><%=accvo.getPassword() %></span><p>
             		</td>
             	</tr>
             </table>
             
             <form action="mypage_accountupdate.do" method="post" id="accountupdate">
             <input type="hidden" name="id" value="<%=accvo.getId() %>">
             <table id="tconform" style="display: none;">
             	<col width="300px;">
             	<col width="300px;">
             	<tr>
             		<td style="text-align: center;    padding: 3.75em 0.75em ">
            			<p style="font-size: 20pt;">EMAIL</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><input type="text" id="ckemail" name="email" value="<%=accvo.getEmail() %>"></span><p>
             		</td>
             	</tr>
             	<tr>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
            			<p style="font-size: 20pt;">PHONE</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><input type="text" id="ckphone" name="phone" value="<%=accvo.getPhone() %>"></span><p>
             		</td>
             	</tr>
             	<tr>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
            			<p style="font-size: 20pt;">PASSWORD</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><input type="password" id="ckpassword" name="password" value=""></span><p>
             		</td>
             	</tr>
             	<tr>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
            			<p style="font-size: 20pt;">PASSWORD CHECK</p>
             		</td>
             		<td style="text-align: center;     padding: 3.75em 0.75em">
             			<p style="font-size: 20pt;"><span class="hashtag"><input type="password" id="ckpasswordck" name="passwordck" value=""></span><p>
             		</td>
             	</tr>
             </table>
             </form>
             
             
             <!-- 
			 <small><span>www.themashabrand.com</span></small>
              -->
			 
           </div><!--/ media -->
		   </div> 
		   <div class="col-lg-3" style="width: 1140px; margin-top: 30px;">
           <div class="follow-box" style="text-align: center; margin-top: 50px; margin-bottom: 70px;">
		    <button id="updatebtn" class="kafe-btn kafe-btn-mint" onclick="conform();">수   정</button>
		    <button id="cfbtn" class="kafe-btn kafe-btn-mint" style="display: none;" onclick="confirm()">수정완료</button>
		    <button class="kafe-btn kafe-btn-mint">회원 탈퇴</button>
           </div><!--/ dropdown -->
		   </div>
          </div><!--/ details-box -->
		</div>
	   </div>
	  </div><!--/ container -->
	 </section><!--/ profile -->

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
		   

	
    <!-- ==============================================
	HEADER CIRCLE Scripts
	=============================================== -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/jquery.min.js"></script>

	<script src="<%=request.getContextPath() %>/resources/assets/js/skel.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/assets/js/util.js"></script>
	<!-- main 외  페이지 전용 -->
	<script src="<%=request.getContextPath() %>/resources/assets/js/circle-header.js"></script>
	<!-- Auto Script -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
  </body>
</html>
