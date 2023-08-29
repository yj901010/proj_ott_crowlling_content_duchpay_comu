<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="com.model.dto.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.dao.BoardFileDAO"%>
<%@page import="com.model.dao.MemberDAO"%>
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

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
		<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap" style="padding:2em;">
				<div class="container clearfix">
					<div class="row justify-content-center">
						<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
						<h3 style="color:#FFD966; margin: 0 0 0 0;" class="h1 fw-bold mb-3">Community</h3>
						</div>
					</div>
					<div style="text-align: center;">
						<hr style="color: rgb(219, 111, 10);">
						<!-- Post Content
						============================================= -->
						<div style="text-align: center;"class="postcontent">

							<table class="table" style="margin-left:0px">
							  <thead>
								<tr>
								  <th width="50px">Number</th>
								  <th width="500px">Title</th>
								  <th>Nickname</th>
								  <th>PostDate</th>
								  <th>Views</th>
								  <th>Likes</th>
								</tr>
							  </thead>
							  <tbody>
								<%
								String input = request.getParameter("searchTitle");
								System.out.println(input);
								PostDAO dao = new PostDAO();
								ArrayList<PostDTO> list = null;
								if(input != null){
									list = dao.searchTitle(input);
								}else{
									
									list = dao.select();
								}
								MemberDAO memberDao = new MemberDAO();
								BoardFileDAO file_dao = new BoardFileDAO();
								
								// 'No' 필드를 기준으로 리스트를 오름차순으로 정렬합니다.
								Collections.sort(list, Comparator.comparingInt(PostDTO::getNo).reversed());
								
								for(int i =0; i <list.size(); i++){  %>
									
									<tr onclick="location.href='post_view.jsp?no=<%= list.get(i).getNo() %>'">
									<td><%=i+1 %></td>
									<td  style="cursor: pointer"><%= list.get(i).getTitle() %></td>
				          			<td><%= memberDao.getFindNick(list.get(i).getId()) %></td>
						            <td><%= list.get(i).getPost_Date().replace(".0", "") %></td>
						            <td><%= list.get(i).getP_View() %></td>
						            <td><%= list.get(i).getP_Like() %></td>
									</tr>
									
							<%
								}
							%>
							  </tbody>
							</table>
						<div class="line"></div>
						<div class="col-12" style="text-align: right; ">
							<%
							if(info!=null){	
								%>
								<a id="insert_post" href="post_creation.jsp" class="button button-large button-rounded" style="background-color="#1ABC9C";>게시</a>
								<%
							}
							%>
						</div>
						
					</div>
					<!-- 목차(index) -->
					<ul class="pagination mt-5 pagination-circle justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"><i class="icon-angle-left"></i></a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"><i class="icon-angle-right"></i></a></li>
					</ul>
					<!-- 목차(index) 끝 -->
					<!-- 검색창 -->
					<form action="post_main.jsp" method="get">
					<div class="input-group input-group-sm mt-2 mb-4 mw-xs mx-auto my-4">
						<input name="searchTitle" style="margin-right: 3px;" class="form-control rounded-start border-1 fw-semibold" type="search" placeholder="게시글을 검색하세요!" aria-label="Search">
						<button style="margin-top:2px;" class="btn border-0 bg-white rounded-end h-bg-alt" type="submit"><i class="icon-line-search"></i></button>

					</div>
					</form>
					<!-- 검색창 끝 -->
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