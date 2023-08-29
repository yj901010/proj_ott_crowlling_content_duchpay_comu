<%@page import="com.model.dto.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.dao.ReviewDAO"%>
<%@page import="com.model.dto.MemberDTO"%>
<%@page import="com.model.dto.VideoDTO"%>
<%@page import="com.model.dao.VideoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

   <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
   <meta name="author" content="SemiColonWeb" />

   <!-- Stylesheets
   ============================================= -->
   <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Inter:400,500,600,700&display=swap" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
   <link rel="stylesheet" href="style.css" type="text/css" />
   <link rel="stylesheet" href="css/dark.css" type="text/css" />
   <link rel="stylesheet" href="css/font-icons.css" type="text/css" />
   <link rel="stylesheet" href="css/animate.css" type="text/css" />
   <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

   <link rel="stylesheet" href="css/custom.css" type="text/css" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />

   <!-- Document Title
   ============================================= -->
   <title>Tabs | Canvas</title>

   <style>
      .block-tab-3 {
         background-color: #EFE9E2;
      }

      .block-tab-3 h1,
      .block-tab-3 h2,
      .block-tab-3 h3,
      .block-tab-3 h4,
      .block-tab-3 h5,
      .block-tab-3 p {
         font-family: 'Inter',  sans-serif;
         color: #000;
      }

      .block-tab-3 .nav-link {
         padding:20px 0px 20px 12px;
         color: #AAA;
         border-left: 1px solid #DDD;
         font-size: 1.25rem;
         transition: all .2s ease;
      }

      .block-tab-3 .nav-link:hover {
         color: #777;
      }

      .block-tab-3 .nav-link.active {
         color: #FFD966;
         border-color: #FFD966;
         font-weight: 500;
      }

      .card-columns.layout-2 {
         -webkit-column-count: 2;
         -moz-column-count: 2;
         column-count: 2;
      }

      .card-columns a {
         position: relative;
         display: block;
      }

      @media (max-width: 991.98px) {
         .block-tab-3 .nav-link {
            border: 1px solid #CCC;
            padding: 10px 15px;
            margin: 5px;
            font-size: 1.15rem;
         }
      }
      
   #myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}

	
   </style>

</head>

<body class="stretched">


   <!-- Document Wrapper
   ============================================= -->
   <div id="wrapper">

      <!-- Document Wrapper
   ============================================= -->
   <div id="wrapper" class="clearfix">

      <!-- Header
      ============================================= -->
      <header id="header" class="dark">
         <div id="header-wrap"  style="background-color: #202020;">
            <div class="container">
               <div class="header-row">

                  <!-- Logo
                  ============================================= -->
                  <div id="logo">
                     <a href="index.jsp" class="standard-logo" data-dark-logo="images/neulbo_logo.png"><img src="images/neulbo_logo.png" alt="Canvas Logo"></a>
                     <a href="index.jsp" class="retina-logo" data-dark-logo="images/neulbo_logo.png"><img src="images/neulbo_logo.png" alt="Canvas Logo"></a>
                  </div><!-- #logo end -->

                  <div class="header-misc">

                     <!-- Top Search
                     ============================================= -->
                     <div id="top-search" class="header-misc-icon">
                        <a href="#" id="top-search-trigger"><i class="icon-line-search"></i><i class="icon-line-cross"></i></a>
                     </div><!-- #top-search end -->

                     <!-- Top Cart
                     ============================================= -->
                     <div id="top-cart" class="header-misc-icon d-none d-sm-block">
                        
                     </div><!-- #top-cart end -->

                  </div>

                  <div id="primary-menu-trigger">
                     <svg class="svg-trigger" viewBox="0 0 100 100"><path d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"></path><path d="m 30,50 h 40"></path><path d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"></path></svg>
                  </div>

                  <!-- Primary Navigation
                  ============================================= -->
                  <nav class="primary-menu">

                     <ul class="menu-container">
                        <li class="menu-item">
                           <a class="menu-link" href="videoMain.jsp"><div><i class="icon-camera3"></i>영화 검색</div></a>
                           
                        </li>
                        <li class="menu-item">
                           <a class="menu-link" href="party_post_main.jsp"><div><i class="icon-edit"></i>늘보더치</div></a>
                           
                        </li>
                        <li class="menu-item">
                           <a class="menu-link" href="post_main.jsp"><div><i class="icon-list-alt"></i>자유게시판</div></a>
                           
                        </li>
                  <% 
                     MemberDTO info = (MemberDTO)session.getAttribute("info");
                  
                     if(info==null){                           %>
                     
                        <li class="menu-item">
                           <a class="menu-link" href="login_join.jsp"><div><i class="icon-user4"></i>회원 가입</div></a>
                           
                        </li>
                        <li class="menu-item">
                           <a class="menu-link" href="login_join.jsp"><div>로그인</div></a>
                           
                        </li>
                     
                  
                        
                  <%    }else{                                        %>
                  
                        <li class="menu-item">
                           <a class="menu-link" href="profile.jsp"><div><i class="icon-user4"></i>마이페이지</div></a>
                           
                        </li>
                        <li class="menu-item">
                           <a class="menu-link" href="LogoutService"><div>로그아웃</div></a>
                           
                        </li>
                     
                  <%
                     }
                  %>
                  </ul>

                  </nav><!-- #primary-menu end -->

                  <form class="top-search-form" action="videoSearchResult.jsp" method="get">
                     <input type="text" name="title" class="form-control" value="" placeholder="Type &amp; Hit Enter.." autocomplete="off">
                  </form>

               </div>
            </div>
         </div>
         <div class="header-wrap-clone"></div>
      </header><!-- #header end -->
   <!-- Document Wrapper
   ============================================= -->
   <div id="wrapper" class="clearfix">

      <!-- Content
      ============================================= -->
      <section id="content">
     
      <% 
         int no = Integer.parseInt(request.getParameter("no"));
         VideoDAO dao = new VideoDAO();
		 ReviewDAO reviewDao = new ReviewDAO();
		 
		 double score = reviewDao.score(no);
		 dao.updateScore(no, score);
         VideoDTO dto = dao.selectOne(no);
		 ArrayList<ReviewDTO> reviewList = reviewDao.select(no);
		
	%>
         <div class="content-wrap block-tab-3" style="padding:0; background-color: #202020;">
            <div class="container mw-md py-6 clearfix" style="padding:0;">
               <div class="row">
                  <hr style="color:#FFD966">
                  <br>
                  <br>
                  <div style="padding:0 0 0 0;" class="col-lg-4 mb-5 mb-lg-0">
                   
                      <div class="nav flex-lg-column" id="side-tab" role="tablist" aria-orientation="vertical">
                        <a stlye="padding: 20px 0px;" class="nav-link active" id="side-tab-niche-tab" data-bs-toggle="pill" href="#platform" role="tab" aria-controls="side-tab-niche" aria-selected="true">Platform</a>
                        <a class="nav-link" id="side-tab-onepages-tab" data-bs-toggle="pill" href="#actor" role="tab" aria-controls="side-tab-onepages" aria-selected="false">Actor</a>
                        <a class="nav-link" id="side-tab-blocks-tab" data-bs-toggle="pill" href="#year" role="tab" aria-controls="side-tab-blocks" aria-selected="false">Year</a>
                        <a class="nav-link" id="side-tab-blocks-tab" data-bs-toggle="pill" href="#genre" role="tab" aria-controls="side-tab-blocks" aria-selected="false">Genre</a>
                        <a class="nav-link" id="side-tab-blocks-tab" data-bs-toggle="pill" href="#time" role="tab" aria-controls="side-tab-blocks" aria-selected="false">Running time</a>
                        <a class="nav-link" id="side-tab-blocks-tab" data-bs-toggle="pill" href="#age" role="tab" aria-controls="side-tab-blocks" aria-selected="false">Age Rating</a>
                        <a class="nav-link" id="side-tab-blocks-tab" data-bs-toggle="pill" href="#score" role="tab" aria-controls="side-tab-blocks" aria-selected="false">Score</a>
                        <a class="nav-link" id="side-tab-blocks-tab" data-bs-toggle="pill" href="#director" role="tab" aria-controls="side-tab-blocks" aria-selected="false">Director</a>
                     </div>
                  </div>
                  		<%
                            String platformName = dto.getPlatform_Name();
                            ArrayList<String> platformImages = new ArrayList<>();

                         if (platformName.contains("Amazon Prime Video")) {
                             platformImages.add("https://images.justwatch.com/icon/52449861/s100");
                         }
                         if (platformName.contains("wavve")) {
                             platformImages.add("https://www.justwatch.com/images/icon/155655742/s100");
                         }
                         if (platformName.contains("Netflix")) {
                             platformImages.add("https://images.justwatch.com/icon/207360008/s100");
                         }
                         if (platformName.contains("Watcha")) {
                             platformImages.add("https://www.justwatch.com/images/icon/2538290/s100");
                         }
                         if (platformName.contains("Disney Plus")) {
                             platformImages.add("https://www.justwatch.com/images/icon/147638351/s100");
                         }
                         if (platformName.contains("Apple TV Plus")) {
                             platformImages.add("https://www.justwatch.com/images/icon/152862153/s100");
                         }

                         // Default image in case none of the platforms match
                         if (platformImages.isEmpty()) {
                             platformImages.add("./images/default.png");
                         }
                     %>	
                  <div class="col-lg-8">
                    <div class="row align-items-center">
                        <div style="padding:0 0 0 0;"class="col-lg-6">
                            <img style="height: 100%; width: 100%;" src="<%= dto.getThumbnail_Path() %>" alt="포스터">
                            <!--<img src="<%= dto.getThumbnail_Path() %>" alt="poster">-->
                        </div>
                        <div class="col-lg-6">
                            <br>
                            <h6 style="color: rgba(255, 255, 255, 0.773);" class="h1 mb-4"><%=dto.getTitle() %></h6>
                            <p style="font-size: 14px; color: rgba(255, 255, 255, 0.436);"><%= dto.getSynopsis() %></p>
                            <div class="tab-content" id="side-tab-tabContent">
		                        <div class="tab-pane fade show active" id="platform" role="tabpanel" aria-labelledby="side-tab-niche-tab">
                                   <h3 style="color:white;" >Platform</h3>
                                   <div style="row">
                                       <% for (String image : platformImages) { %>
										    <img src="<%= image %>" alt="Platform Image" width="100" height="100">
										<% } %>
                                   </div><!--플랫폼 정보 넣으면 됩니다.--></p>
                                </div>
		                        <!-- 표시선 -->
                                <div class="tab-pane fade" id="actor" role="tabpanel" aria-labelledby="side-tab-onepages-tab">
                                   <h3 style="color:white;">Actor</h3>
                                   <p style="font-size:16px; color:rgba(255, 255, 255, 0.508)" class="op-07 mb-5"><%= dto.getActor()%><!--출연진 정보 넣으면 됩니다.--></p>
                                </div>
                                <div class="tab-pane fade" id="year" role="tabpanel" aria-labelledby="side-tab-blocks-tab">
                                   <h3 style="color:white;" >Year</h3>
                                   <p style="font-size:16px; color:rgba(255, 255, 255, 0.508);" class="op-07 mb-5"><%= dto.getYear()%><!--출시 연도 정보 넣으면 됩니다.--> </p>
                                </div>
                                <div class="tab-pane fade" id="genre" role="tabpanel" aria-labelledby="side-tab-blocks-tab">
                                   <h3 style="color:white;">Genre</h3>
                                   <p style="font-size:16px; color:rgba(255, 255, 255, 0.508);" class="op-07 mb-5"><%= dto.getGenre()%><!--장르 정보 넣으면 됩니다.--> </p>
                                </div>
                                <div class="tab-pane fade" id="time" role="tabpanel" aria-labelledby="side-tab-blocks-tab">
                                   <h3 style="color:white;">Running time</h3>
                                   <p style="font-size:16px; color:rgba(255, 255, 255, 0.508);" class="op-07 mb-5"><%= dto.getRunning_Time()%><!-- 러닝 타임 정보 넣으면 됩니다.--></p>
                                </div>
                                <div class="tab-pane fade" id="age" role="tabpanel" aria-labelledby="side-tab-blocks-tab">
                                   <h3 style="color:white;" >Age Rating</h3>
                                   <p style="font-size:16px; color:rgba(255, 255, 255, 0.508);" class="op-07 mb-5"><%= dto.getAge_Rating()%><!-- 연령 정보 넣으면 됩니다.--> </p>
                                </div>
                                <div class="tab-pane fade" id="score" role="tabpanel" aria-labelledby="side-tab-blocks-tab">
                                   <h3 style="color:white;" >Score</h3>
                                   <p style="font-size:16px; color:rgba(255, 255, 255, 0.508);"class="op-07 mb-5"><%=dto.getScore()%><!--평점 정보 넣으면 됩니다.--></p>
                                </div>
                                <div class="tab-pane fade" id="director" role="tabpanel" aria-labelledby="side-tab-blocks-tab">
                                 <h3 style="color:white;">Director</h3>
                                 <p style="font-size:16px; color:rgba(255, 255, 255, 0.508);" class="op-07 mb-5"><%= dto.getDirector()%><!--감독 정보 넣으면 됩니다.--></p>
                              </div>
                              
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <hr style="color:#FFD966;">
            <!-- 리뷰 작성-->
           
            <div class="col-12">
               <h4 style="color: white; margin: 0 0 0 0;">Review</h4>
               
               <%
               		if (info != null){
               			%>
               			   <form action="ReviewWriteService" method="post" class="mb-3" name="myform" id="myform">
			               <input type="hidden" name="no" value="<%= no %>">
			               <fieldset>
								<input type="radio" name="reviewStar" value="5" id="rate1"><label
									for="rate1">★</label>
								<input type="radio" name="reviewStar" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="reviewStar" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
			               <textarea style="background-color:#202020;" class="sm-form-control" id="template-contactform-message" name="content" rows="3" cols="30"></textarea>
			               <div style="margin: 1em 0 1em 0;"class="col-6">
			                  <button style="background-color: gray;" class="button m-0" type="submit" id="template-contactform-submit" name="template-contactform-submit" value="submit">작성</button>
			               </div>
			               </form>
               			<%
               		}else{
               			%>
               				<p style="color:white">로그인 후 댓글을 작성할 수 있습니다. </p>
               				<div style="margin: 1em 0 1em 0;"class="col-6">
			                  <button style="background-color: gray;" class="button m-0" type="submit" id="template-contactform-submit" name="template-contactform-submit" onclick="window.location.href='/404project/login_join.jsp'">로그인 하러 가기</button>
			               	</div>
               			<%
               		}
               %>
               
               <div style="border: white;">
               <!-- 리뷰 목록 보기  -->
               
               <%
				for (int i = 0; i < reviewList.size(); i++) {
				%>
				    <% if (info != null && reviewList.get(i).getId().equals(info.getId())) { %>
				    	<p style="margin:0px 0px 0px 0px; font-size:18px; color:rgb(255, 255, 255);">평점: <%=reviewList.get(i).getScore() %></p>
				    	<p id="review-<%= reviewList.get(i).getNo() %>" style="margin:0px 0px 0px 0px; font-size:18px; color:rgb(255, 255, 255);"><%= reviewList.get(i).getContent() %></p>
				      <!-- <button class="button button-3d button-black m-0 edit-button" onclick="showEditSection(<%= reviewList.get(i).getNo() %>)">수정</button> -->
				      <button class="button button-3d button-black m-0 edit-button" onclick="location.href='ReviewDeleteService?no=<%=reviewList.get(i).getNo()%>&videoNo=<%=no%>'">삭제</button>
				    <% } else { %>
				    	<p style="margin:0px 0px 0px 0px; font-size:18px; color:rgb(255, 255, 255);">평점: <%=reviewList.get(i).getScore() %></p>
				      <p style="margin:0px 0px 0px 0px; font-size:18px; color:rgb(255, 255, 255);"><%= reviewList.get(i).getContent() %></p>
				    <% } %>
				  
				  <div id="edit-section-<%= reviewList.get(i).getNo() %>" style="display: none;">
				  	<form action="ReviewUpdateService" method="post" class="mb-3" name="updateform" id="updateform">
				  	<input type="hidden" name="videoNo" value="<%= no %>">
				  	<input type="hidden" name="no" value="<%= reviewList.get(i).getNo() %>">
				  
				
           			<textarea style="background-color:#202020;" class="sm-form-control edit-textarea" id="review-edit-<%= reviewList.get(i).getNo() %>-input template-contactform-message" name="content" rows="3" cols="30"><%= reviewList.get(i).getContent() %></textarea>
				     <button style="background-color: gray;" class="button m-0" type="submit" id="template-contactform-submit" name="template-contactform-submit" value="submit">완료</button>
				  	</form>
				  </div>
				  <hr>
				<%
				}
				%>
				<script>
				/* function showEditSection(index) {
					// 수정 버튼 클릭 시 
				  document.getElementById("review-"+index).style.display = "none";
				  document.getElementById("edit-section-"+index).style.display = "block";
				 
				  var editButtons = document.getElementsByClassName("edit-button");
				    for (var i = 0; i < editButtons.length; i++) {
				        editButtons[i].style.display = "none"; // 수정 버튼 감추기
				    }
				}
				 */
				

				</script>
              </div>
            </div>
         </div>
         </div>
      </section><!-- #content end -->
      <!-- ============================================= -->
      <footer id="footer" class="dark">
         
         <!-- Footer Widgets
            ============================================= -->
            <div class="footer-widgets-wrap" style="padding: 30px 0; background-color: #202020;">
   
            </div><!-- .footer-widgets-wrap end -->
            <!-- Copyrights
            ============================================= -->
            <div id="copyrights">
               <div class="container">
                  <div class="row col-mb-30">
   
                     <div class="col-md-6 text-center text-md-start">
                        Copyrights &copy; 2023 All Rights Reserved by Neulbo Inc.<br>
                        <div class="copyright-links"><a href="https://gj-aischool.or.kr/">광주 인공지능사관학교</a></div>
                     </div>
   
                     <div class="col-md-6 text-center text-md-end">
                        <div class="d-flex justify-content-center justify-content-md-end">
                           <a href="https://ko-kr.facebook.com/" class="social-icon si-small si-borderless si-facebook">
                              <i class="icon-facebook"></i>
                              <i class="icon-facebook"></i>
                           </a>
   
                           <a href="https://twitter.com/?lang=ko" class="social-icon si-small si-borderless si-twitter">
                              <i class="icon-twitter"></i>
                              <i class="icon-twitter"></i>
                           </a>
   
                           <a href="https://github.com/" class="social-icon si-small si-borderless si-github">
                              <i class="icon-github"></i>
                              <i class="icon-github"></i>
                           </a>
                           
                        </div>
   
                        <div class="clear"></div>
   
                        <i class="icon-envelope2"></i> kam_ta_yon@naver.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> 010-2838-5405 <span class="middot">&middot;</span> <i class="icon-skype2"></i> NeouboCampany
                     </div>
   
                  </div>
   
               </div>
            </div><!-- #copyrights end -->
         </footer><!-- #footer end -->

   </div><!-- #wrapper end -->

   <!-- Go To Top
   ============================================= -->
   <div id="gotoTop" class="icon-angle-up"></div>

   <!-- JavaScripts
   ============================================= -->
   <script src="js/jquery.js"></script>
   <script src="js/plugins.min.js"></script>

   <!-- Footer Scripts
   ============================================= -->
   <script src="js/functions.js"></script>

</body>
</html>