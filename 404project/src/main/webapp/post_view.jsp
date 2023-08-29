<%@page import="com.model.dto.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.dao.CommentsDAO"%>
<%@page import="com.model.dao.MemberDAO"%>
<%@page import="com.model.dto.PostDTO"%>
<%@page import="com.model.dao.BoardFileDAO"%>
<%@page import="com.model.dao.PostDAO"%>
<%@page import="com.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Poppins:300,400,500,600,700|PT+Serif:400,400i&display=swap" rel="stylesheet" type="text/css" />
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
	<title>Blog Single - Left Sidebar | Canvas</title>

</head>

<body class="stretched">

	<!-- Header
		============================================= -->
		<header id="header" class="white">
			<div id="header-wrap" style="background-color:rgb(251, 249, 232)">
				<div class="container">
					<div class="header-row">

						<!-- Logo
						============================================= -->
						<div id="logo">
							<a href="index.jsp" class="standard-logo" data-dark-logo="images/neulbo_logo.png"><img src="images/neulbo_logo.png" alt="Canvas Logo"></a>
							<a href="index.html" class="retina-logo" data-dark-logo="images/neulbo_logo.png"><img src="images/neulbo_logo.png" alt="Canvas Logo"></a>
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
						
							if(info==null){									%>
							
								<li class="menu-item">
									<a class="menu-link" href="login_join.jsp"><div><i class="icon-user4"></i>회원 가입</div></a>
									
								</li>
								<li class="menu-item">
									<a class="menu-link" href="login_join.jsp"><div>로그인</div></a>
									
								</li>
							
						
								
						<% 	}else{ 													%>
						
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
	<div id="fb-root"></div>

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
		<section id="content">
			<div class="content-wrap" style="padding:2em;">
			<%
			int no = Integer.parseInt(request.getParameter("no"));
	
			
			PostDAO post_dao = new PostDAO();
			BoardFileDAO file_dao = new BoardFileDAO();
			MemberDAO memberDao = new MemberDAO();
			CommentsDAO commentsDao = new CommentsDAO();
			ArrayList<CommentsDTO> commentsList = commentsDao.select(no);
			
			PostDTO dto = post_dao.selectOne(no);
			int like = dto.getP_Like();
			
			%>
				<div class="container clearfix">
					<div class="row justify-content-center">
						<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
						<a href="post_main.jsp"><h3 style="color:#FFD966; margin: 0 0 0 0;" class="h1 fw-bold mb-3">Community</h3></a>
						</div>
					</div>
					<div class="row gutter-40 col-mb-80">
						<!-- Post Content
						============================================= -->
						<div class="postcontent col-lg-9 order-lg-last">

							<div class="single-post mb-0">

								<!-- Single Post
								============================================= -->
								<div class="entry clearfix">

									<!-- Entry Title
									============================================= -->
									<div class="entry-title">
										<h2><%=dto.getTitle() %></h2>
									</div><!-- .entry-title end -->

									<!-- Entry Meta
									============================================= -->
									<div class="entry-meta">
										<ul>
											<li><i class="icon-calendar3"></i> <%=dto.getPost_Date() %></li>
											<li><i class="icon-user"></i> <%= memberDao.getFindNick(dto.getId())  %></a></li>
											<li><i class="icon-comments"></i><%=commentsList.size()  %></a></li>
											<li><i class="icon-comments"></i><%=dto.getP_View() %></a></li>
											<li><i class="icon-comments"></i><%=dto.getP_Like() %></a></li>
											<li><i class="icon-camera-retro"></i>사진 유무</a></li>
										</ul>
									</div><!-- .entry-meta end -->

									<!-- Entry Image
									============================================= -->
									<div class="entry-image">
									<%
										if(dto.getFile_no() != 0){
											out.print("<td><img src='upload/"+ file_dao.findName(dto.getFile_no())+"'/></td>");
										}
									%>
									<!--  	<a href="#"><img src="images/blog/full/1.jpg" alt="Blog Single"></a> -->
									</div><!-- .entry-image end -->

									<!-- Entry Content
									============================================= -->
									<div class="entry-content mt-0">
										
										<p><%=dto.getContent() %></p>
										<!-- Post Single - Content End -->


									</div>
								</div><!-- .entry end -->
								<button onclick="location.href='PostLikeService?no=<%=no %>&like=<%=dto.getP_Like() %>'" class="button button-3d button m-0" background-color="#1ABC9C" id="register-form-submit" name="register-form-submit" value="register">추천</button>
								<br>
								<br>
								<%
									info = (MemberDTO)session.getAttribute("info");
								
									if(info != null){
										if(dto.getId().equals(info.getId())){			%>
											<button onclick="location.href='post_modification.jsp?no=<%=no %>'" class="button button-3d button-black m-0" id="register-form-submit" name="register-form-submit" value="register">수정</button>
											<button onclick="location.href='PostDeleteService?no=<%=no %>'" class="button button-3d button-black m-0" id="register-form-submit" name="register-form-submit" value="register">삭제</button>
								<%		
										}
									}
								%>
							
								<h2>Comments</h2>
								<!-- Comments
								============================================= -->
								<div id="comments" class="clearfix">
									
									<%
									for (int i = 0; i < commentsList.size(); i++) {
									%>
									  <div>
									    <% if (info != null && commentsList.get(i).getId().equals(info.getId())) { %>
									      <p id="comment-<%= commentsList.get(i).getNo() %>"><%= commentsList.get(i).getContent() %></p>
									      <button class="button button-3d button-black m-0 edit-button" onclick="showEditSection(<%= commentsList.get(i).getNo() %>)">수정</button>
									      <button class="button button-3d button-black m-0 edit-button" onclick="location.href='CommentsDeleteService?no=<%=commentsList.get(i).getNo()%>&postNo=<%=no%>'">삭제</button>
									    <% } else { %>
									      <p><%= commentsList.get(i).getContent() %></p>
									    <% } %>
									  </div>
									  <div id="edit-section-<%= commentsList.get(i).getNo() %>" style="display: none;">
									    <textarea class="edit-textarea" id="comment-edit-<%= commentsList.get(i).getNo() %>-input" rows="4" cols="50"><%= commentsList.get(i).getContent() %></textarea>
									    <button class="button button-3d button-black m-0 edit-form-submit" onclick="editComment(<%= commentsList.get(i).getNo() %>)">완료</button>
									  </div>
									  <hr>
									<%
									}
									%>
									<script>
									function showEditSection(index) {
										// 수정 버튼 클릭 시 
									  document.getElementById("comment-"+index).style.display = "none";
									  document.getElementById("edit-section-"+index).style.display = "block";
									 
									  var editButtons = document.getElementsByClassName("edit-button");
									    for (var i = 0; i < editButtons.length; i++) {
									        editButtons[i].style.display = "none"; // 수정 버튼 감추기
									    }
									}
									
									function editComment(index) {
									    const editedContent = document.getElementById("comment-edit-" + index + "-input").value;
									    
									    var xhr = new XMLHttpRequest();
									    xhr.open("POST", "CommentsUpdateService", true);
									    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

									    xhr.onreadystatechange = function() {
									        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
									            var response = xhr.responseText;
									            console.log(response);
									            
									            // 수정 섹션을 다시 숨기고 원래 내용을 업데이트합니다.
									            document.getElementById("edit-section-" + index).style.display = "none";
									            document.getElementById("comment-" + index).style.display = "block";
									            document.getElementById("comment-" + index).textContent = editedContent;
									            
									            var editButtons = document.getElementsByClassName("edit-button");
									            for (var i = 0; i < editButtons.length; i++) {
									                editButtons[i].style.display = "inline"; // 수정 버튼 나타내기
									            }
									        }
									    };

									    xhr.send("content=" + editedContent + "&no=" + index);
									}

									</script>

					
									
								
								</div><!-- #comments end -->
								<div id="comments" class="clearfix">
								<%
									if(info != null){
										%>
										<form action="CommentWriteService" method="post">
											<p>댓글</p>
											<input type="hidden" name="no" value="<%= no %>">
											<input type="text" name="content">
											<button class="button button-3d button m-0" background-color="#1ABC9C" id="register-form-submit" name="register-form-submit" value="register">등록</button>
										</form>
									<%
									}else{
										%>
											<p>로그인 시 댓글을 작성할 수 있습니다.</p>
											<button class="button button-3d button-black m-0" id="register-form-submit" onclick="window.location.href = '/404project/login_join.jsp';">로그인 하러 가기</button>
										<%
									}
								%>
								</div>

							</div>

						</div><!-- .postcontent end -->

						<!-- Sidebar
						============================================= -->
						
					</div>

				</div>
			</div>
		</section><!-- #content end -->

	<!-- Footer -->
	<footer id="footer" class="white" style="border:0;">
			
		<!-- Footer Widgets
			============================================= -->
			<div class="footer-widgets-wrap" style="padding: 30px 0; background-color: #FFFFFF;">

			</div><!-- .footer-widgets-wrap end -->
			<!-- Copyrights
			============================================= -->
			<div id="copyrights" style="background-color:rgb(251, 249, 232); border:5px;">
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