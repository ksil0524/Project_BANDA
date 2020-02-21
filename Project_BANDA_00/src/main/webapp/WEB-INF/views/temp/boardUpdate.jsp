<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.mvc.banda.model.vo.AccountVo"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
	<!-- ==============================================
	Styles
	=============================================== -->
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/custom-boardwrite.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/jquery.tagsinput.css" rel="stylesheet" />
	
	<%
		AccountVo accvo = (AccountVo)session.getAttribute("accvo");
	%>
</head>
<body style="background-color: #f4f4f4;">

	<!-- ==============================================
	HeaderSection
	=============================================== -->
	<jsp:include page="/WEB-INF/views/circle-header.jsp"></jsp:include>
	
	<!-- ==============================================
	Navbar Second Section + Style
	=============================================== -->
	<section class="nav-sec" style="margin-top: 15px; height: 60px;">
	  <div class="d-flex justify-content-between">
	   <c:set var="category" value="${detail.board_cate }"/>
	   <c:choose>
	     <c:when test="${fn:contains(category, 'SH')}">
	       <div class="p-2 nav-icon-lg mint-green"style="height: 59px;">
	         <a class="nav-icon" href="boardListFree_test.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		       <span>무료나눔</span>
	         </a>
	       </div>
	       <div class="p-2 nav-icon-lg clean-black" style="height: 59px;">
	         <a class="nav-icon" href="boardListExchange_test.do" style="padding: 7px 6px 10px 6px; margin-top: 13px;">
		       <span>물물교환</span>
	         </a>
	       </div> 
	     </c:when>
	     <c:when test="${fn:contains(category, 'EX')}">
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
	     </c:when>
	   </c:choose>	  
	  
<!--
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
-->	   
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
		  	<span style="border-bottom: 1px;"><h3>글 수정</h3></span>
		  </div><!--/ board-form-title -->
		  <div class="board-form">
			<form:form method="post" enctype="multipart/form-data" name="updateForm" id="updateForm" modelAttribute="BoardVo" action="boardUpdateRes.do">
<!-- 			  <input type="hidden" value="<accvo.getId() %>" name="id"/>	 -->
			  <input type="hidden" value="test" name="id"/>
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="boardtab">게시판선택</label>
			    </div>
			    <div class="col-75">
			      <select id="boardtab" name="board_cate" disabled>
			        <option value="SH" <c:if test="${detail.board_cate eq 'SH' }"> selected</c:if>>무료나눔</option>
			        <option value="EX" <c:if test="${detail.board_cate eq 'EX' }"> selected</c:if>>물물교환</option>
			      </select>
			    </div>
			  </div>
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="title">제목</label>
			    </div>
			    <div class="col-75">
			      <input type="text" id="title" name="board_title" placeholder="제목을 입력하세요" value="${detail.board_title }">
			    </div>
			  </div> 
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="content">내용</label>
			    </div>
			    <div class="col-75">
			      <textarea id="content" name="board_content" placeholder="내용을 입력하세요" style="height:200px">${detail.board_content }</textarea>
			    </div>
			  </div>
			  
			  <!-- 해시태그 -->		  
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="hashtag">해시태그</label>
			    </div>
			    <div class="col-75">
			     <div class="tags-input-wrapper" id="tags-input-wrapper">
			       <!-- 코어태그써서 해시태그 불러오기 -> 문자열에서 split 쉼표로 구별해서 배열에 넣고 for문 돌려서 쓰기 -->
			       <c:set var="boardHash" value="${detail.board_hash }"/>
			       <c:if test="${not empty boardHash }">

			     	<c:forTokens items="${detail.board_hash }" delims="," var="tags">			     	
			     	  <span class="tag">${tags }<a>×</a></span>
			     	</c:forTokens>
			       </c:if>
			     	<input id="tag-input1" placeholder="태그를 입력하세요">
			     	<!-- --------------------------- -->
			     </div>
			     <input type="hidden" name="board_hash" id="board_hash" value="${detail.board_hash }">
			      <script src="<%=request.getContextPath() %>/resources/temp/assets/js/index_update.js"></script>
			      <script>
			        var tagInput1 = new TagsInput({
			            selector: '#tag-input1',
			            duplicate : false,
			            max : 10
			       	 
			        });
			        
			       
			
			        tagInput1.addData('#tag-input1');
			        
//			        document.getElementById("board_hash").value=tagInput1.arr;
			       
			      </script>
			    </div>
			  </div>
			  <!--/ 해시태그 -->
			  
			  <div class="row" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <div class="col-25">
			      <label for="board_file">첨부파일</label>
			    </div>
			    <div class="custom-file col-75 ">
			      <input type="file" class="custom-file-input" id="board_file" name="boardfile">
			      <label class="custom-file-label" for="board_file"></label>
			    </div>
			  </div>
			  <div class="row btns" style="padding-left: 5% !important; padding-right: 5% !important;">
			    <input type="button" value="작성" onclick="$('#updateForm').submit();">
			    <input type="button" value="목록" onclick="javascript:history.back()">
			    
			  </div>
			  </form:form>
			  <script type="text/javascript">
			   $(function(){
			          $('input[type="submit"]').keydown(function() {
			               if (event.keyCode === 13) {
			                 event.preventDefault();
			               };
			             });
			          $('input[type="button"]').keydown(function() {
			               if (event.keyCode === 13) {
			                 event.preventDefault();
			               };
			             });
			   });
			  </script>
			  
			  <!-- 해시태그 수정용 js -->
			  <script type="text/javascript">
			  (function(){

				    var TagsInput = function(opts){
				        this.options = Object.assign(TagsInput.defaults , opts);
				        this.original_input = document.getElementById(opts.selector);
				        this.arr = [];
				        this.wrapper = document.getElementById('tags-input-wrapper');
				        this.input = document.getElementById('tag-input1');
				        this.wrapper = document.createElement('div');
				        this.input = document.createElement('input');
				        this.input.setAttribute('placeholder', '태그를 입력하세요');
				        buildUI(this);
				        addEvents(this);
				    }


				    TagsInput.prototype.addTag = function(string){

				        if(this.anyErrors(string))
				            return ;

				        this.arr.push(string);
				        var tagInput = this;


				        var tag = document.createElement('span');
				        tag.className = this.options.tagClass;
				        tag.innerText = string;

				        var closeIcon = document.createElement('a');
				        closeIcon.innerHTML = '&times;';
				        closeIcon.addEventListener('click' , function(e){
				            e.preventDefault();
				            var tag = this.parentNode;

				            for(var i =0 ;i < tagInput.wrapper.childNodes.length ; i++){
				                if(tagInput.wrapper.childNodes[i] == tag)
				                    tagInput.deleteTag(tag , i);
				            }
				        })


				        tag.appendChild(closeIcon);
				        this.wrapper.insertBefore(tag , this.input);
				        this.original_input.value = this.arr.join(',');
				        
				        console.log("추가 후 해시태그 배열: " + this.arr);
				        document.getElementById("board_hash").value=this.arr;	//jsp페이지의 hidden value로 배열 넣어줌

				        return this;
				    }



				    TagsInput.prototype.deleteTag = function(tag , i){
				        tag.remove();
				        this.arr.splice( i , 1);
				        this.original_input.value =  this.arr.join(',');
				        console.log("제거 후 해시태그 배열: "+this.arr);
				        document.getElementById("board_hash").value=this.arr;	//jsp페이지의 hidden value로 배열 넣어줌
				        
				        return this;
				    }


				    TagsInput.prototype.anyErrors = function (string) {
				        if (this.options.max != null && this.arr.length >= this.options.max) {
				            console.error('max tags limit reached');
				            return true;
				        }
				    
				        if (!this.options.duplicate && this.arr.indexOf(string) != -1) {
				            console.error('duplicate found " ' + string + ' " ')
				            return true;
				        }
				    
				        if (this.options.validator != undefined && !this.options.validator(string)) {
				            console.error('Invalid input: ' + string)
				            return true;
				        }
				    
				        return false;
				    }


				    TagsInput.prototype.addData = function(array){
				        var plugin = this;

				        array.forEach(function(string){
				        	plugin.addTag(string);

				        	console.log("배열:"+array);
				       	});
				        

				        
				        return this;
				    }

				    
				    TagsInput.prototype.getInputString = function(){
				        return this.arr.join(',');
				    }


				    // Private function to initialize the UI Elements
				    function buildUI(tags){
				        tags.wrapper.append(tags.input);
				        tags.wrapper.classList.add(tags.options.wrapperClass);
				        tags.original_input.setAttribute('hidden' , 'true');
				        tags.original_input.parentNode.insertBefore(tags.wrapper , tags.original_input);
				    }



				    function addEvents(tags){
				        tags.wrapper.addEventListener('click' ,function(){
				            tags.input.focus();           
				        });
				        tags.input.addEventListener('keydown' , function(e){
				            var str = tags.input.value.trim(); 
				            if( !!(~[9 , 13 , 188].indexOf( e.keyCode ))  )
				            {
				            	if(str != "" || str != null) {            		
				            		tags.addTag(str);
				            		tags.input.value = "";
				            	}
//				                e.stopPropagation();	//폼태그 submit 넘어가는거 방지
								e.preventDefault();
				            }
				        });
				    }


				    TagsInput.defaults = {
				        selector : '',
				        wrapperClass : 'tags-input-wrapper',
				        tagClass : 'tag',
				        max : null,
				        duplicate: false
				    }


				    window.TagsInput = TagsInput;

				})();
			  </script>
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
