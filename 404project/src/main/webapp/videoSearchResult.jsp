<%@page import="com.model.dto.MemberDTO"%>
<%@page import="com.model.dto.VideoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.dao.VideoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
	<title>Cards | Canvas</title>
</head>

<body class="stretched">
	<%
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
	
		VideoDAO dao = new VideoDAO();
		ArrayList<VideoDTO> list =  dao.select(title);
	%>
	
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
		<section id="content">
			<div class="content-wrap min-vh-100 d-flex align-items-center" style="padding:0 0 3.1em 0;background-color: #202020;">
				<div class="container clearfix">
						<div style="margin-top:2em; text-align: center;">
							<h2 style="text-align: center; color:rgb(229, 198, 198)"class="h2 fw-bold mb-10">컨텐츠를 입력하세요!</h2>
							<br>
						</div>
						<form action="videoSearchResult.jsp" method="get">
							<input style="background-color: #202020; margin: 0 0 0 0;"class="typeahead sm-form-control" type="text" name="title" placeholder="ENTER">
						</form>
						<!--여기서부터-->
						<div class="col-xl-6 col-lg-8 mb-5">
							<h5 style="color:rgb(229, 198, 198)"class="h5 fw-bold mb-3">'<%= request.getParameter("title") %>'를(을) 검색한 결과입니다.</h5>
						</div>
						<!--여기까지만 건드려주세용 >_<-->
					<div style="padding:0 0 0 0;" class="content-wrap" >			
						<div class="container clearfix">
							<div id="portfolio" class="portfolio portfolio-reveal row grid-container gutter-20" data-layout="fitRows">
								<!-- 여기서부터-->
								<%
								    for(int i=0; i<list.size(); i++){	
								%>
								<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								    <div class="grid-inner">
								        <div class="portfolio-item">
								            <div class="portfolio-image">
								                <a href='video_contens_view.jsp?no=<%= list.get(i).getNo() %>'>
								                    <img src='<%= list.get(i).getThumbnail_Path() %>' alt="Open Imagination">
								                </a>
								                <div class="bg-overlay bg-overlay-bg dark" data-hover-animate="fadeIn"></div>
								            </div>
								            <div style="background-color: #202020;" class="portfolio-desc">
								                <h3>
								                    <a style="color:rgb(229, 198, 198)" href='video_contens_view.jsp?no=<%= list.get(i).getNo() %>'>
								                        <%= list.get(i).getTitle() %>
								                    </a>
								                </h3>
								                <span>
								                    <a href="<%= list.get(i).getPlatform_Name() %>"><%= list.get(i).getPlatform_Name() %></a>
								                </span>
								            </div>
								        </div>
								    </div>
								</article>
								<%
								    }
								%>
								<!-- 여기까지만 건드려주세용 >_<-->
							</div>
						</div>		
					</div>
				</div>
			</div>
		</section>
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
				</div><!-- #copyrights end -->
			</footer><!-- #footer end -->
		</div>
		
	</div><!-- #wrapper end -->
	</div>

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
	
	<script>
	function showUserSearch() {
        document.getElementById('myInput').value = ;
    }
	</script>
</body>
</html>