<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
	<!-- ==============================================
	Styles
	=============================================== -->
	<link href="<%=request.getContextPath() %>/resources/temp/assets/css/custom-boarddetail.css" rel="stylesheet" />
</head>
<body>
<input type = "hidden" id = "hidden_session" value = <%=session.getAttribute("vo") %>>

	<!-- ==============================================
	HeaderSection
	=============================================== -->
	<jsp:include page="/WEB-INF/views/circle-header.jsp"></jsp:include>
	
	<!-- ==============================================
	Navbar Second Section + Style
	=============================================== -->
	<section class="nav-sec" style="margin-top: 15px; height: 60px;">
	  <div class="d-flex justify-content-between">
	   <c:set var="boardCate" value="${detail.board_cate}"/>
	   <c:choose>
	     <c:when test="${fn:contains(boardCate, 'SH')}">
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
	     <c:when test="${fn:contains(boardCate, 'EX')}">
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
	  <div class="container">
	  	<div class="col-lg-3" ></div><!--/ col-lg-3 -->
	   <!-- <div class="row"> -->
	    <div class="col-lg-6" >
	    <!-- style="width: inherit;" -->
		
         <div class="cardbox">
		 
          <div class="cardbox-heading">
           <!-- START dropdown-->
           <div class="dropdown pull-right">
            <button class="btn btn-secondary btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
		     <em class="fa fa-ellipsis-h"></em>
			</button>
            <div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
	         <a class="dropdown-item" href="#">수정</a>
			 <a class="dropdown-item" href="#">삭제</a>
			 <c:set var="noticeChk" value="${detail.board_nyn}"/>
			 <c:choose>
			   <c:when test="${fn:contains(noticeChk, 'Y')}">
	         	 <a class="dropdown-item" href="boardSetNoticeCancel.do?board_no=${detail.board_no }">공지해제</a>
	           </c:when>
			   <c:when test="${fn:contains(noticeChk, 'N')}">
	         	 <a class="dropdown-item" href="boardSetNotice.do?board_no=${detail.board_no }">공지등록</a>
	           </c:when>
	         </c:choose>
            </div>
           </div><!--/ dropdown -->
           <!-- END dropdown-->
           
           <!-- 게시글 정보 - 제목, 글쓴이, 작성일자, 조회수 -->
           <div class="detail-info" style="margin-top: 10px; margin-bottom: 10px; padding-left: 10px;">
           <!-- TITLE -->
            <span class="detail-title">${detail.board_title }</span>   
           <!-- END title -->
            <div class="media m-0">
             <div class="d-flex mr-3">
			  <a href="#"><img class="img-responsive img-circle" src="<%=request.getContextPath() %>/resources/temp/assets/img/users/18.jpg" alt="User"></a>
			 </div>
             <div class="media-body">
              <p class="m-0">${detail.id }</p>
			  <small><span><fmt:formatDate value="${detail.board_regdate }" pattern="yyyy-MM-dd"/></span></small>
			  <div class="detail-view">
			 	<i class="fas fa-eye"></i><span> 786,286</span>
			  </div>
             </div>
            </div><!--/ media -->
           </div><!--/detail-info  -->
          </div><!--/ cardbox-heading -->
          
          <!-- 본문 -->
		  <div class="cardbox-item">
		    <div class="cardbox-img">
		      <img class="img-responsive" src="<%=request.getContextPath() %>/resources/temp/assets/img/posts/1.jpg" alt="MaterialImg">
		    </div>
		    <div class="cardbox-content">
		     <div class="cardbox-text">
		       	${detail.board_content }
		     </div>
		     <div class="cardbox-hashtag">
		      <p id="pHash"></p>
		     </div><!--/ cardbox-hashtag -->
		    </div>
          </div><!--/ cardbox-item -->
	      
	      <!-- 구분선  -->
	      <div class="img-poster"></div>
	      
	      <!-- 댓글 -->
          <div class="cardbox-comments">     
          
		    <div class="cardbox-comment-count">
  		      <span class="com"><i class="fa fa-comments"></i></span> <span class="span-last">Comments</span><p/>
		    </div><!--/ cardbox-comment-count  -->
		    
		  <div class="cardbox-comment-list">
		   <ul class="img-comment-list">
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/17.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anthony McCartney</a></strong> <span class="date sub-text">on December 5th, 2016</span>
               <p>Hello this is a test comment.</p> 
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/15.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Vanessa Wells</a></strong> <span>on December 5th, 2016</span>
               <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> 
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/14.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Sean Coleman</a></strong> <span class="date sub-text">on December 5th, 2016</span>
               <p class="">Hello this is a test comment.</p> 
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/13.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anna Morgan</a></strong> <span class="date sub-text">on December 5th, 2016</span>
               <p class="">Hello this is a test comment.</p> 
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/3.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Allison Fowler</a></strong> <span class="date sub-text">on December 5th, 2016</span>
               <p class="">Hello this is a test comment.</p> 
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="<%=request.getContextPath() %>/resources/temp/assets/img/users/7.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">한국인</a></strong> <span class="date sub-text">on December 5th, 2016</span>
               <p class="">쿨거래원합니다</p> 
              </div>
             </li><!--/ li -->
            </ul><!--/ comment-list -->
           </div><!--/ cardbox-comment-list -->
		   
		   <div class="comment-bottom">   	 	 
			<div class="comment-put">
			   <table style="width: 800px;">
		   	    <tr>
		   	     <td style="width: 50px;"><img class="align-self-end mr-3 img-responsive img-circle" src="http://bootdey.com/img/Content/user_3.jpg" alt="Image"></td>
		   	     <td><input class="form-control input-sm" type="text" placeholder="댓글을 입력하세요"/></td>
		   	     <td style="width: 50px;"><a href="#"><i class="fas fa-edit"></i></a></td>
		   	    </tr>
		   	   </table>  
			 </div><!--/ comment-put -->
			 <div class="list-btn">
		       <button class="kafe-btn kafe-btn-mint-small pull-right btn-sm" onclick="javascript:history.back()">목록</button>
		     </div><!--/ list-btn -->
	  	   </div><!--/ comment-bottom -->
		   
          </div><!--/ cardbox-comments -->			  
                
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
		<script type="text/javascript">
		var hashtags = '${detail.board_hash }';
		var hash = hashtags.split(",");
		var inner ='';
		      
		console.log(hash);
		      
		for(var i=0 ; i<hash.length ; i++) {
			inner += '<a href="#" class="tagSearch" style="margin: 0 0.2em;"><span class="boardtag tagtext">'+hash[i]+'</span></a>';
		}
		document.getElementById("pHash").innerHTML = inner;
		      
	</script>
	
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
