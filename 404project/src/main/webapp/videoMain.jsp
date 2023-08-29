<%@page import="com.model.dto.MemberDTO"%>
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

	<style>
		.block-card-9 .grid-inner .btn-hover {
			opacity: 0;
			display: block;
			transition: opacity .3s ease, transform .3s .1s ease;
			margin-top: 15px;
			position: absolute;
			transform: translateY(0);
		}
		.block-card-9 .grid-inner:hover .btn-hover {
			opacity: 1;
			transform: translateY(-5px);
		}

		.block-card-9 .grid-inner .grid-image {
			position: absolute;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			background-size: cover;
			background-position: center center;
		}

		.block-card-9 .grid-inner:hover .grid-image {
			-webkit-animation: kenburns 20s ease-out both;
	        animation: kenburns 20s ease-out both;
		}

		.block-card-9 .grid-inner .grid-icon,
		.block-card-9 .grid-inner .grid-content {
			transition: transform .3s ease;
		}

		.block-card-9 .grid-inner:hover .grid-content { transform: translateY(-45px); }
		.block-card-9 .grid-inner:hover .grid-icon { transform: translateY(-5px); }

		@-webkit-keyframes kenburns {
		  0% {
		    -webkit-transform: scale(1) translate(0, 0);
		            transform: scale(1) translate(0, 0);
		    -webkit-transform-origin: 84% 84%;
		            transform-origin: 84% 84%;
		  }
		  100% {
		    -webkit-transform: scale(1.25) translate(20px, 15px);
		            transform: scale(1.25) translate(20px, 15px);
		    -webkit-transform-origin: right bottom;
		            transform-origin: right bottom;
		  }
		}
		@keyframes kenburns {
		  0% {
		    -webkit-transform: scale(1) translate(0, 0);
		            transform: scale(1) translate(0, 0);
		    -webkit-transform-origin: 84% 84%;
		            transform-origin: 84% 84%;
		  }
		  100% {
		    -webkit-transform: scale(1.25) translate(20px, 15px);
		            transform: scale(1.25) translate(20px, 15px);
		    -webkit-transform-origin: right bottom;
		            transform-origin: right bottom;
		  }
		}


	</style>

</head>

<body class="stretched">
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

		<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap min-vh-100 d-flex align-items-center" style="padding:0 0 3.1em 0;background-color: #202020;">
				<div class="container clearfix">
					<div style="padding-top:3.6em;"class="content-wrap" >
						<div class="container clearfix">
							<div style="height: 100px;" class="row justify-content-center">
								<div class="col-xl-6 col-lg-8 text-center mb-5">
									<h3 style="color:rgb(229, 198, 198)"class="h5 fw-bold mb-3">컨텐츠를 입력하세요!</h3>
								</div>
								<div class="w-100 mb-5">
									<form action="videoSearchResult.jsp" method="get">
										<input style="background-color: #202020;"class="typeahead sm-form-control" type="text" name="title" placeholder="ENTER">
									</form>
								</div>
							</div>
						</div>
					</div>
					<div style="height: 100px;" class="row justify-content-center">
						<div class="col-xl-6 col-lg-8 text-center mb-5">
							<h3 style="color:rgb(229, 198, 198)"class="h1 fw-bold mb-3">플랫폼별 화제작</h3>
						</div>
					</div>
					<div>
						<div class="row block-card-9 col-mb-50">
							<!--복붙-->
							<div class="col-lg-4 min-vh-75">
								<div class="grid-inner rounded-3 h-100">
									<div class="grid-image lazy" data-bg="https://images.justwatch.com/poster/306382164/s592/the-summer-i-turned-pretty"></div>
									<div class="bg-overlay">
										<div class="bg-overlay-content flex-column justify-content-between align-items-start p-5 dark">
											<div class="grid-icon">
												<img src="./images/amazonprime.png" alt="Image" width="115" height="33">
											</div>
											<div class="grid-content">
												<h5 class="text-uppercase fw-medium font-body ls1 text-smaller op-07 mb-2">내가 예뻐진 그 여름</h5>
												<h3 class="fw-medium h4">Available on <br><span class="h2" style="color: rgb(37, 163, 218)">Amazon Prime</span></h3>
												<a href="video_contens_view.jsp?no=9" class="icon-stacked rounded-circle bg-white text-center mb-0 btn-hover h5" style="color: brown"><i class="icon-line-arrow-right"></i></a>
											</div>
										</div>
										<div class="bg-overlay-bg" style="background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, #000000 130%);"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 min-vh-75">
								<div class="grid-inner rounded-3 h-100">
									<div class="grid-image lazy" data-bg="https://images.justwatch.com/poster/302209667/s592/deo-geulrori"></div>
									<div class="bg-overlay">
										<div class="bg-overlay-content flex-column justify-content-between align-items-start p-5 dark">
											<div class="grid-icon">
												<img src="./images/netflix.png" alt="Image" width="60">
											</div>
											<div class="grid-content">
												<h5 class="text-uppercase fw-medium font-body ls1 text-smaller op-07 mb-2">더 글로리</h5>
												<h3 class="fw-medium h4">Available on <br><span class="h2" style="color: red">Netflix</span></h3>
												<a href="video_contens_view.jsp?no=31" class="icon-stacked rounded-circle bg-white text-center mb-0 btn-hover h5" style="color: brown"><i class="icon-line-arrow-right"></i></a>
											</div>
										</div>
										<div class="bg-overlay-bg" style="background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, #000000 100%);"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 min-vh-75">
								<div class="grid-inner rounded-3 h-100">
									<div class="grid-image lazy" data-bg="https://images.justwatch.com/poster/97857095/s592/seupaideomaen-nyu-yunibeoseu"></div>
									<div class="bg-overlay">
										<div class="bg-overlay-content flex-column justify-content-between align-items-start p-5 dark">
											<div class="grid-icon">
												<img src="./images/disney.png" alt="Image" width="100">
											</div>
											<div class="grid-content">
												<h5 class="text-uppercase fw-medium font-body ls1 text-smaller op-07 mb-2">스파이더맨 : 뉴 유니버스</h5>
												<h3 class="fw-medium h4">Available on <span class="h2" style="color: rgb(150, 164, 233);">Disney+ </span></h3>
												<a href="video_contens_view.jsp?no=20" class="icon-stacked rounded-circle bg-white text-success text-center mb-0 btn-hover h5"><i class="icon-line-arrow-right"></i></a>
											</div>
										</div>
										<div class="bg-overlay-bg" style="background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, #000000 100%);"></div>
									</div>
								</div>
							</div>
							<div>
								<div class="row block-card-9 col-mb-50">
									<div class="col-lg-4 min-vh-75">
										<div class="grid-inner rounded-3 h-100">
											<div class="grid-image lazy" data-bg="https://images.justwatch.com/poster/255390811/s592/gwimyeolyi-kalnal"></div>
											<div class="bg-overlay">
												<div class="bg-overlay-content flex-column justify-content-between align-items-start p-5 dark">
													<div class="grid-icon">
														<img src="./images/watcha.png" alt="Image" width="60">
													</div>
													<div class="grid-content">
														<h5 class="text-uppercase fw-medium font-body ls1 text-smaller op-07 mb-2">귀멸의 칼날</h5>
														<h3 class="fw-medium h4">Available on <br><span class="h2" style="color: rgb(243, 112, 112)">Watcha</span></h3>
														<a href="video_contens_view.jsp?no=8" class="icon-stacked rounded-circle bg-white text-center mb-0 btn-hover h5" style="color: brown"><i class="icon-line-arrow-right"></i></a>
													</div>
												</div>
												<div class="bg-overlay-bg" style="background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, #000000 100%);"></div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 min-vh-75">
										<div class="grid-inner rounded-3 h-100">
											<div class="grid-image lazy" data-bg="https://images.justwatch.com/poster/305308396/s592/deo-peulraesi"></div>
											<div class="bg-overlay">
												<div class="bg-overlay-content flex-column justify-content-between align-items-start p-5 dark">
													<div class="grid-icon">
														<img src="./images/wavve.png" alt="Image" width="115">
													</div>
													<div class="grid-content">
														<h5 class="text-uppercase fw-medium font-body ls1 text-smaller op-07 mb-2">플래시</h5>
														<h3 class="fw-medium h4">Available on <br><span class="h2" style="color: blue">Wavve</span></h3>
														<a href="video_contens_view.jsp?no=17" class="icon-stacked rounded-circle bg-white text-center mb-0 btn-hover h5" style="color: brown"><i class="icon-line-arrow-right"></i></a>
													</div>
												</div>
												<div class="bg-overlay-bg" style="background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, #000000 100%);"></div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 min-vh-75">
										<div class="grid-inner rounded-3 h-100">
											<div class="grid-image lazy" data-bg="https://images.justwatch.com/poster/305420579/s592/ul"></div>
											<div class="bg-overlay">
												<div class="bg-overlay-content flex-column justify-content-between align-items-start p-5 dark">
													<div class="grid-icon">
														<img src="./images/appletv.png" alt="Image" width="100">
													</div>
													<div class="grid-content">
														<h5 class="text-uppercase fw-medium font-body ls1 text-smaller op-07 mb-2">지하창고 사일로의 비밀</h5>
														<h3 class="fw-medium h4">Available on <br><span class="h2" style="color:rgb(242, 160, 37);">Apple TV+</span></h3>
														<a href="video_contens_view.jsp?no=16" class="icon-stacked rounded-circle bg-white text-success text-center mb-0 btn-hover h5"><i class="icon-line-arrow-right"></i></a>
													</div>
												</div>
												<div class="bg-overlay-bg" style="background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, #000000 100%);"></div>
											</div>
										</div>
									</div>

							</div>
						</div>
					</div>
				<!--여기에 적어야함-->
		</section><!-- #content end -->
		<!-- 새로 시작-->
		<div id="wrapper" class="clearfix">
			<section id="content">
				<div class="content-wrap align-items-center" style="background-color: #202020;">
					<div class="container clearfix">
						<div class="row justify-content-center">
							<div class="col-xl-6 col-lg-8 text-center mb-5">
								<h3 style="color:rgb(229, 198, 198)"class="h1 fw-bold mb-3">이런 컨텐츠는 어때요?</h3>
							</div>
						</div>
	
						<!-- Portfolio Items
						============================================= -->
						<div id="portfolio" class="portfolio portfolio-reveal row grid-container gutter-20" data-layout="fitRows">
							<!-- 범죄도시2-->
							<!-- 디즈니플러스-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/292757027/s592/the-roundup" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=42">범죄도시2</a></h3>
										<span><a href="https://www.netflix.com/kr/">Netflix</a></span>
									</div>
								</div>
							</article>
	
							<!-- SHERLOCK-->
							<!-- 아마존-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/177867069/s592/sherlock" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=51">셜록</a></h3>
										<span><a href="https://www.primevideo.com/offers/nonprimehomepage/ref=dv_web_force_root">Amazon prime</a></a></span>
									</div>
								</div>
							</article>
	
							<!-- 존웍4-->
							<!-- 웨이브-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/305473501/s592/jon-wig-4" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=62">존윅4</a></h3>
										<span><a href="https://www.wavve.com/?utm_source=NA-PC&utm_medium=BSA&utm_campaign=MOBI_SA_MAIN_NA_BR_PC_BSA_230801&utm_content=P_NONE_NONE_NONE_HOMELINK_EXOLADDER_230801&n_media=27758&n_query=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_rank=1&n_ad_group=grp-a001-04-000000036229160&n_ad=nad-a001-04-000000255641950&n_keyword_id=nkw-a001-04-000005548025649&n_keyword=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_campaign_type=4&n_contract=tct-a001-04-000000000750417&n_ad_group_type=5&NaPm=ct%3Dll4iybg0%7Cci%3D0yW0002AfXfyShORJL1m%7Ctr%3Dbrnd%7Chk%3Dbc74d303b5cac1b6a33b54d16cea8dc43fb6c457">Wavve</a></span>
									</div>
								</div>
							</article>
	
							<!-- 타이타닉-->
							<!-- 넷플, 디즈니-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/302949320/s592/taitanig" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=99">타이타닉</a></h3>
										<span><a href="https://www.netflix.com/kr/">Netflix</a>, <a href="https://www.disneyplus.com/ko-kr?cid=DSS-SEARCH-NaverSA-0000000001_SEM_NBS&dss_kw=all&NaPm=ct%3Dll4j09ns%7Cci%3D0zy00001gbfyaHoDTf0o%7Ctr%3Dbrnd%7Chk%3D44f134a377f2a64f3ce250502457de30c1cdb01b&gclid=CO6z8L2C0YADFalDwgUdBdkG-w&gclsrc=ds">Disney+</a></span>
									</div>
								</div>
							</article>
							
							<!-- 모범택시-->
							<!-- 웨이브 -->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/242528158/s592/mobeomtaegsi" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=135">모범택시</a></h3>
										<span><a href="https://www.wavve.com/?utm_source=NA-PC&utm_medium=BSA&utm_campaign=MOBI_SA_MAIN_NA_BR_PC_BSA_230801&utm_content=P_NONE_NONE_NONE_HOMELINK_EXOLADDER_230801&n_media=27758&n_query=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_rank=1&n_ad_group=grp-a001-04-000000036229160&n_ad=nad-a001-04-000000255641950&n_keyword_id=nkw-a001-04-000005548025649&n_keyword=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_campaign_type=4&n_contract=tct-a001-04-000000000750417&n_ad_group_type=5&NaPm=ct%3Dll4iybg0%7Cci%3D0yW0002AfXfyShORJL1m%7Ctr%3Dbrnd%7Chk%3Dbc74d303b5cac1b6a33b54d16cea8dc43fb6c457">Wavve</a></span>
									</div>
								</div>
							</article>
	
							<!-- 서치2-->
							<!-- netflix-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/302461034/s592/missing-2023" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=132">서치2</a></h3>
										<span><a href="https://www.netflix.com/kr/">Netflix</a></span>
									</div>
								</div>
							</article>
	
							<!-- 오징어게임-->
							<!-- netflix-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/251207693/s592/ojingeo-geim" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=25">오징어 게임</a></h3>
										<span><a href="https://www.netflix.com/kr/">Netflix</a></span>
									</div>
								</div>
							</article>
	
							<!-- 아바타:물의길-->
							<!-- 디즈니 -->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/301777717/s592/abata-2" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=117">아바타 : 물의 길</a></h3>
										<span><a href="https://www.disneyplus.com/ko-kr?cid=DSS-SEARCH-NaverSA-0000000001_SEM_NBS&dss_kw=all&NaPm=ct%3Dll4j09ns%7Cci%3D0zy00001gbfyaHoDTf0o%7Ctr%3Dbrnd%7Chk%3D44f134a377f2a64f3ce250502457de30c1cdb01b&gclid=CO6z8L2C0YADFalDwgUdBdkG-w&gclsrc=ds">Disney+</a></span>
									</div>
								</div>
							</article>
	
							<!-- 골때리는 그녀들-->
							<!-- 웨이브, 왓차-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-media pf-icons">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single.html">
											<img src="https://images.justwatch.com/poster/248776833/s592/gol-ddaerineun-geunyeodeul" alt="Open Imagination">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=126">골때리는 그녀들</a></h3>
										<span><a href="https://watcha.com/?NaPm=ct%3Dll4jnse0%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3Dnull%7Chk%3Dc518ac94d01cbf4ba190e41dd2b3d408d4d18242">Watcha</a>, <a href="https://www.wavve.com/?utm_source=NA-PC&utm_medium=BSA&utm_campaign=MOBI_SA_MAIN_NA_BR_PC_BSA_230801&utm_content=P_NONE_NONE_NONE_HOMELINK_EXOLADDER_230801&n_media=27758&n_query=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_rank=1&n_ad_group=grp-a001-04-000000036229160&n_ad=nad-a001-04-000000255641950&n_keyword_id=nkw-a001-04-000005548025649&n_keyword=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_campaign_type=4&n_contract=tct-a001-04-000000000750417&n_ad_group_type=5&NaPm=ct%3Dll4iybg0%7Cci%3D0yW0002AfXfyShORJL1m%7Ctr%3Dbrnd%7Chk%3Dbc74d303b5cac1b6a33b54d16cea8dc43fb6c457">Wavve</a></span>
									</div>
								</div>
							</article>
	
							<!-- 하트시그널-->
							<!-- 웨이브, 넷플, 디즈니-->
							<article class="portfolio-item col-lg-1-5 col-md-4 col-sm-6 col-12 pf-graphics pf-media pf-uielements">
								<div class="grid-inner">
									<div class="portfolio-image">
										<a href="portfolio-single-video.html">
											<img src="https://images.justwatch.com/poster/11272372/s592/hateusigeuneol" alt="Study Table">
										</a>
										<div class="bg-overlay">
											<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
										</div>
									</div>
									<div style="background-color: #202020;" class="portfolio-desc">
										<h3><a style="color:rgb(229, 198, 198)" href="video_contens_view.jsp?no=102">하트시그널</a></h3>
										<span><a href="https://www.netflix.com/kr/">Netflix</a>, <a href="https://www.wavve.com/?utm_source=NA-PC&utm_medium=BSA&utm_campaign=MOBI_SA_MAIN_NA_BR_PC_BSA_230801&utm_content=P_NONE_NONE_NONE_HOMELINK_EXOLADDER_230801&n_media=27758&n_query=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_rank=1&n_ad_group=grp-a001-04-000000036229160&n_ad=nad-a001-04-000000255641950&n_keyword_id=nkw-a001-04-000005548025649&n_keyword=%EC%9B%A8%EC%9D%B4%EB%B8%8C&n_campaign_type=4&n_contract=tct-a001-04-000000000750417&n_ad_group_type=5&NaPm=ct%3Dll4iybg0%7Cci%3D0yW0002AfXfyShORJL1m%7Ctr%3Dbrnd%7Chk%3Dbc74d303b5cac1b6a33b54d16cea8dc43fb6c457">Wavve</a></span>
									</div>
								</div>
							</article>
						</div><!-- #portfolio end -->
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