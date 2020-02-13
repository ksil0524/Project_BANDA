<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mvc.banda.model.vo.AccountVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <!-- ==============================================
	Scripts
	=============================================== -->
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/js/base.js"></script>
	<script src="<%=request.getContextPath() %>/resources/temp/assets/plugins/slimscroll/jquery.slimscroll.js"></script>

<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
	<!-- ==============================================
	Styles
	=============================================== -->
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/photo_home(kim).css" rel="stylesheet" />
	
	<script type="text/javascript">
  		var species_list = ['선택','개','고양이','패럿','기니피그','다람쥐,하늘다람쥐','햄스터','토끼','고슴도치','돼지','말','영장류','원숭이','여우','너구리','사자','새','닭,병아리','오리','메추라기','십자매','거북','도마뱀','뱀','개구리,도롱뇽','물고기','새우','가재','게','거미','기타곤충','달팽이','문어','해파리','기타','기타','기타','기타','기타','기타']
  	</script>
	
	<%
		AccountVo accvo = (AccountVo)session.getAttribute("accvo");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
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
	 <section class="newsfeed" style="padding: 100px 0px;">
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
		 
		 <c:if test="<%=accvo.getPet_list() != null %>">
		 	<c:forEach begin="1" end="<%=accvo.getPet_list().size() %>" var="i">
		 		<div class="storybox mypetListSeq" 
				   style="background: linear-gradient( rgba(34,34,34,0.78), rgba(34,34,34,0.78)), url('<%=request.getContextPath() %>/resources/images/filemanager/pet/pet_gif/${i }.gif') no-repeat;
				          background-size: cover;
		                  background-position: center center;
		                  -webkit-background-size: cover;
		                  -moz-background-size: cover;
		                  -o-background-size: cover;"
		                  onclick="#" id="storybox${i }">
		          <div class="story-body text-center">
		           <div class=""><img class="img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/10.jpg" alt="user"></div>
		           <h4><%=accvo.getPet_list().get(0).getP_Name() %></h4>
		          </div>		  
				</div>
		 	</c:forEach>
		 </c:if>
		
		<!-- 
		 <div class="storybox mypetListSeq" 
		   style="background: linear-gradient( rgba(34,34,34,0.78), rgba(34,34,34,0.78)), url('<%=request.getContextPath() %>/resources/images/filemanager/pet/pet_gif/1.gif') no-repeat;
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
		   style="background: linear-gradient( rgba(34,34,34,0.78), rgba(34,34,34,0.78)), url('<%=request.getContextPath() %>/resources/images/filemanager/pet/pet_gif/2.gif') no-repeat;
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
		 
		  -->
		 
		 
		</div><!--/ col-lg-3 -->
	    <div class="col-lg-6">
			
			<div id="mypetsInsert" class="cardbox" style="border:1px solid #F4F4F4; background-color: #F4F4F4; box-shadow: 2px 2px 2px 2px lightgray; height: 712px;">
			  <form action="" method="">
			  
			  <div class="row">
			    
			    <div class="col-65">
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="name">NAME</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="text" id="name" name="name" placeholder="이름을 입력하세요..">
			        </div>
			      </div>
			      
			      <div class="row">    
			      	<div class="col-35">
			      		<label for="birth">BIRTH</label>
			    	</div>
			   		<div class="col-65">
			      		<input type="date" id="birth" name="birth" placeholder="이름을 입력하세요..">
			        </div>
			      </div>
			      
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category1">CLASS</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category1" name="category1">
			      	  	<option value="0">선택해주세요</option>
			        	<option value="1">포유류</option>
					    <option value="2">조류</option>
					    <option value="3">파충류,양서류</option>
					    <option value="4">어류</option>
					    <option value="5">절지류</option>
					    <option value="6">기타</option>			      	  
					  </select>
			        </div>
			  	  </div>
			      
	<!-- 
		selectbox 설정 : class 셀렉트시 class에 맞게 species 가 변하게 수정하게 하는 script 부분
	 -->
	 <script type="text/javascript">
	 	
	 	$(function(){
	 		
	 		$("#category1").on('change',function(){			
				if(this.value == 0){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('0').text("대분류를 선택해주세요."));
				}else if(this.value == 1){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('1').text("개"));
					$("#category2").append($("<option>").val('2').text("고양이"));
					$("#category2").append($("<option>").val('3').text("패럿"));
					$("#category2").append($("<option>").val('4').text("기니피그"));
					$("#category2").append($("<option>").val('5').text("다람쥐,하늘다람쥐"));
					$("#category2").append($("<option>").val('6').text("햄스터"));
					$("#category2").append($("<option>").val('7').text("토끼"));
					$("#category2").append($("<option>").val('8').text("고슴도치"));
					$("#category2").append($("<option>").val('9').text("돼지"));
					$("#category2").append($("<option>").val('10').text("말"));
					$("#category2").append($("<option>").val('11').text("영장류"));
					$("#category2").append($("<option>").val('12').text("원숭이"));
					$("#category2").append($("<option>").val('13').text("여우"));
					$("#category2").append($("<option>").val('14').text("너구리"));
					$("#category2").append($("<option>").val('15').text("사자"));
					$("#category2").append($("<option>").val('34').text("기타"));
				}else if(this.value == 2){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('16').text("앵무새"));
					$("#category2").append($("<option>").val('17').text("닭, 병아리"));
					$("#category2").append($("<option>").val('18').text("오리"));
					$("#category2").append($("<option>").val('19').text("메추라기"));
					$("#category2").append($("<option>").val('20').text("십자매"));
					$("#category2").append($("<option>").val('35').text("기타"));
				}else if(this.value == 3){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('21').text("거북"));
					$("#category2").append($("<option>").val('22').text("도마뱀"));
					$("#category2").append($("<option>").val('23').text("뱀"));
					$("#category2").append($("<option>").val('24').text("개구리, 도롱뇽"));
					$("#category2").append($("<option>").val('36').text("기타"));
				}else if(this.value == 4){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('25').text("물고기"));
					$("#category2").append($("<option>").val('37').text("기타"));
				}else if(this.value == 5){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('26').text("새우"));
					$("#category2").append($("<option>").val('27').text("가재"));
					$("#category2").append($("<option>").val('28').text("게"));
					$("#category2").append($("<option>").val('29').text("거미"));
					$("#category2").append($("<option>").val('38').text("기타"));
				}else if(this.value == 6){
					$("#category2").html(" ");
					$("#category2").append($("<option>").val('31').text("달팽이"));
					$("#category2").append($("<option>").val('32').text("문어"));
					$("#category2").append($("<option>").val('33').text("해파리"));
					$("#category2").append($("<option>").val('39').text("기타"));
				}
	 		});
	 		
	 		
	 		$("#update_category1").on('change',function(){			
				if(this.value == 0){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('0').text("대분류를 선택해주세요."));
				}else if(this.value == 1){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('1').text("개"));
					$("#update_category2").append($("<option>").val('2').text("고양이"));
					$("#update_category2").append($("<option>").val('3').text("패럿"));
					$("#update_category2").append($("<option>").val('4').text("기니피그"));
					$("#update_category2").append($("<option>").val('5').text("다람쥐,하늘다람쥐"));
					$("#update_category2").append($("<option>").val('6').text("햄스터"));
					$("#update_category2").append($("<option>").val('7').text("토끼"));
					$("#update_category2").append($("<option>").val('8').text("고슴도치"));
					$("#update_category2").append($("<option>").val('9').text("돼지"));
					$("#update_category2").append($("<option>").val('10').text("말"));
					$("#update_category2").append($("<option>").val('11').text("영장류"));
					$("#update_category2").append($("<option>").val('12').text("원숭이"));
					$("#update_category2").append($("<option>").val('13').text("여우"));
					$("#update_category2").append($("<option>").val('14').text("너구리"));
					$("#update_category2").append($("<option>").val('15').text("사자"));
					$("#update_category2").append($("<option>").val('34').text("기타"));
				}else if(this.value == 2){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('16').text("앵무새"));
					$("#update_category2").append($("<option>").val('17').text("닭, 병아리"));
					$("#update_category2").append($("<option>").val('18').text("오리"));
					$("#update_category2").append($("<option>").val('19').text("메추라기"));
					$("#update_category2").append($("<option>").val('20').text("십자매"));
					$("#update_category2").append($("<option>").val('35').text("기타"));
				}else if(this.value == 3){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('21').text("거북"));
					$("#update_category2").append($("<option>").val('22').text("도마뱀"));
					$("#update_category2").append($("<option>").val('23').text("뱀"));
					$("#update_category2").append($("<option>").val('24').text("개구리, 도롱뇽"));
					$("#update_category2").append($("<option>").val('36').text("기타"));
				}else if(this.value == 4){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('25').text("물고기"));
					$("#update_category2").append($("<option>").val('37').text("기타"));
				}else if(this.value == 5){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('26').text("새우"));
					$("#update_category2").append($("<option>").val('27').text("가재"));
					$("#update_category2").append($("<option>").val('28').text("게"));
					$("#update_category2").append($("<option>").val('29').text("거미"));
					$("#update_category2").append($("<option>").val('38').text("기타"));
				}else if(this.value == 6){
					$("#update_category2").html(" ");
					$("#update_category2").append($("<option>").val('31').text("달팽이"));
					$("#update_category2").append($("<option>").val('32').text("문어"));
					$("#update_category2").append($("<option>").val('33').text("해파리"));
					$("#update_category2").append($("<option>").val('39').text("기타"));
				}
	 		});
	 		
	 	});
	 	
	 	
	 </script>
	 
	 			      
			      <div class="row">
			    	<div class="col-35">
			      		<label for="category2">SPECIES</label>
			      	</div>
			      	<div class="col-65">
			      	  <select id="category2" name="category2">
					    <option value="0" selected="selected">대분류를 선택해주세요</option>
			      	  </select>
			        </div>
			  	  </div>
			      
			    </div> <!--/ col-65 -->
			    
				<div class="col-35" style="padding-left: 4px; padding-top: 10px; overflow: hidden; cursor:pointer;">
			      <input type="file" id="imgInp" style="display: none;">
			     <!--  <img id="image_section" src="https://www.w3schools.com/css/img_5terre.jpg" /> -->
			      <img id="image_section" style="width: 95%; height: 95%" src="<%=request.getContextPath() %>/resources/temp/assets/img/icon/profile_default.jpg" alt="user">
			    </div> <!--/ col-35 -->
			    
			    
			  </div><!--/ row -->
			  </form>
			
			  <div class="row">
			    <div class="col-25">
			      <label for="species">KIND</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="species" name="species" placeholder="종을 입력하세요..">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="like">LIKE</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="like" name="like" placeholder="좋아하는 것을 입력하세요..">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="hate">HATE</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="hate" name="hate" placeholder="싫어하는 것을 입력하세요..">
			    </div>
			  </div> 
			  
			  <div class="row">
			    <div class="col-25">
			      <label for="introduce">ABOUT</label>
			    </div>
			    <div class="col-75">
			      <textarea id="introduce" name="introduce" placeholder="소개를 입력하세요.." style="height:200px"></textarea>
			    </div>
			  </div>
			</div><!--/ container -->
			
			
			
			<c:if test="<%=accvo.getPet_list() != null %>">
				<c:forEach var="pet" items="<%=accvo.getPet_list() %>">
				
				<div>
					
						<!-- 저장된 프로필 보기 -->
					<div id="mypetsDetail" class="cardbox" style="display:none; border:1px solid #F4F4F4; background-color: #F4F4F4; box-shadow: 2px 2px 2px 2px lightgray; height: 712px;">
					  <form action="" method="">
					  <div class="row">
					    <div class="col-65">
					      <div class="row">    
					      	<div class="col-35">
					      		<label for="name">NAME</label>
					    	</div>
					   		<div class="col-65">
					      		<input type="text" id="name" name="name" value="${pet.p_Name }" disabled="disabled">
					        </div>
					      </div>
					      
					      <div class="row">    
					      	<div class="col-35">
					      		<label for="birth">BIRTH</label>
					    	</div>
					   		<div class="col-65">
					      		<input type="text" id="birth" name="birth" value="<fmt:formatDate value="${pet.p_birth }" pattern="yyyy-MM-dd"/>" disabled="disabled" >
					        </div>
					      </div>
					      
					      <div class="row">
					    	<div class="col-35">
					      		<label for="view_category1">CLASS</label>
					      	</div>
					      	<div class="col-65">
					      	  <select id="view_category1" name="view_category1" disabled="disabled">
					      	  
					      	  <c:choose>
					      	  	<c:when test="${pet.class_no == 1 }">
					        		<option value="1" selected="selected">포유류</option>
					      	  	</c:when>
					      	  	<c:when test="${pet.class_no == 2 }">
					        		<option value="1" selected="selected">조류</option>
					      	  	</c:when>
					      	  	<c:when test="${pet.class_no == 3 }">
					        		<option value="1" selected="selected">파충류,양서류</option>
					      	  	</c:when>
					      	  	<c:when test="${pet.class_no == 4 }">
					        		<option value="1" selected="selected">어류</option>
					      	  	</c:when>
					      	  	<c:when test="${pet.class_no == 5 }">
					        		<option value="1" selected="selected">절지류</option>
					      	  	</c:when>
					      	  	<c:when test="${pet.class_no == 6 }">
					        		<option value="1" selected="selected">기타</option>
					      	  	</c:when>
					      	  </c:choose>
					      	  
					      	  </select>
					        </div>
					  	  </div>
					  	  
					  	  
<!--  
	selectbox 설정 : 불러온 petVo의 species 에 맞게 view_category2 가 변하게 수정하게 하는 script 부분
  -->					  	  
  <script type="text/javascript">
	
  	$(function(){
  		
  		var viewVal = $("#view_category2 option:selected").val();
  		
  		var speciesVal = species_list[viewVal];
  		
  		$("#view_category2 option:selected").text(speciesVal);
  		
  	});
  	
  </script>
  
					  	  
					      <div class="row">
					    	<div class="col-35">
					      		<label for="view_category2">SPECIES</label>
					      	</div>
					      	<div class="col-65">
					      	  <select id="view_category2" name="view_category2" disabled="disabled">
					        	<option value="${pet.species_no }" selected="selected"></option>
					      	  </select>
					        </div>
					  	  </div>
					      
					    </div> <!--/ col-65 -->
					    
						<div class="col-35" style="padding-left: 4px; padding-top: 10px; overflow: hidden; cursor:pointer;">
					     <!--  <img id="image_section" src="https://www.w3schools.com/css/img_5terre.jpg" /> -->
					      <img src="<%=request.getContextPath() %>/resources/images/filemanager/pet/pet_profile/${pet.p_no }/image.jpg" style="width: 95%; height: 95%">
					    </div> <!--/ col-35 -->
					    
					    
					  </div><!--/ row -->
					  </form>
					
					  <div class="row">
					    <div class="col-25">
					      <label for="species">KIND</label>
					    </div>
					    <div class="col-75">
					      <input type="text" id="species" name="species" value="${pet.p_kind }" disabled="disabled">
					    </div>
					  </div> 
					  
					  <div class="row">
					    <div class="col-25">
					      <label for="like">LIKE</label>
					    </div>
					    <div class="col-75">
					      <input type="text" id="like" name="like" value="${pet.p_like }" disabled="disabled">
					    </div>
					  </div> 
					  
					  <div class="row">
					    <div class="col-25">
					      <label for="hate">HATE</label>
					    </div>
					    <div class="col-75">
					      <input type="text" id="hate" name="hate" value="${pet.p_hate }" disabled="disabled">
					    </div>
					  </div> 
					  
					  <div class="row">
					    <div class="col-25">
					      <label for="introduce">ABOUT</label>
					    </div>
					    <div class="col-75">
					      <textarea id="introduce" name="introduce" style="height:200px" disabled="disabled">${pet.p_about }</textarea>
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
					      		<label for="name">NAME</label>
					    	</div>
					   		<div class="col-65">
					      		<input type="text" id="name" name="name" value="${pet.p_Name }" >
					        </div>
					      </div>
					      <div class="row">    
					      	<div class="col-35">
					      		<label for="birth">BIRTH</label>
					    	</div>
					   		<div class="col-65">
					      		<input type="date" id="birth" name="birth" value="<fmt:formatDate value="${pet.p_birth }" pattern="yyyy-MM-dd"/>">
					        </div>
					      </div>
					      <div class="row">
					    	<div class="col-35">
					      		<label for="update_category1">CLASS</label>
					      	</div>
					      	<div class="col-65">
					      	  <select id="update_category1" name="update_category1" >
					      	  	<option value="0">선택해주세요</option>
					        	<option value="1">포유류</option>
							    <option value="2">조류</option>
							    <option value="3">파충류,양서류</option>
							    <option value="4">어류</option>
							    <option value="5">절지류</option>
							    <option value="6">기타</option>		
					      	  </select>
					        </div>
					  	  </div>
					      <div class="row">
					    	<div class="col-35">
					      		<label for="update_category2">SPECIES</label>
					      	</div>
					      	<div class="col-65">
					      	  <select id="update_category2" name="update_category2" >
					        	<option value="0">대분류를 선택해주세요</option>
					      	  </select>
					        </div>
					  	  </div>
					    </div> <!--/ col-65 -->
						<div class="col-35" style="padding-left: 4px; padding-top: 10px; overflow: hidden; cursor:pointer;">
					     <!--  <img id="image_section" src="https://www.w3schools.com/css/img_5terre.jpg" /> -->
					      <img src="<%=request.getContextPath() %>/resources/images/filemanager/pet/pet_profile/${pet.p_no }/image.jpg" style="width: 95%; height: 95%">
					    </div> <!--/ col-35 -->
					  </div><!--/ row -->
					  </form>
					  <div class="row">
					    <div class="col-25">
					      <label for="species">KIND</label>
					    </div>
					    <div class="col-75">
					      <input type="text" id="species" name="species" value="${pet.p_kind }" >
					    </div>
					  </div> 
					  <div class="row">
					    <div class="col-25">
					      <label for="like">LIKE</label>
					    </div>
					    <div class="col-75">
					      <input type="text" id="like" name="like" value="${pet.p_like }">
					    </div>
					  </div> 
					  <div class="row">
					    <div class="col-25">
					      <label for="hate">HATE</label>
					    </div>
					    <div class="col-75">
					      <input type="text" id="hate" name="hate" value="${pet.p_hate }">
					    </div>
					  </div> 
					  <div class="row">
					    <div class="col-25">
					      <label for="introduce">ABOUT</label>
					    </div>
					    <div class="col-75">
					      <textarea id="introduce" name="introduce" style="height:200px">${pet.p_about }</textarea>
					    </div>
					  </div>
					</div><!--/ container -->
					
					<div id="subBtn" class="row btns">
					    <input id="submitBtn" type="submit" value="저장">
					    <input id="updateBtn" type="button" value="수정">
					 </div><!--/ row btns -->	
					
				</div>
				
				</c:forEach>

			</c:if>
			
			
			
			
			
<!-- ---------------------------------------------------------------ctrl x -------------------------------------- -->
			
			
			
			
			

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