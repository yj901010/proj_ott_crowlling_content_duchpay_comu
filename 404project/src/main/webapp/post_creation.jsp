<%@page import="com.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/components/bs-filestyle.css" type="text/css" />
	<link rel="stylesheet" href="css/components/select-boxes.css" type="text/css" />
	<!-- Bootstrap Select CSS -->
	<link rel="stylesheet" href="css/components/bs-select.css" type="text/css" />
	<!-- Date & Time Picker CSS -->
	<link rel="stylesheet" href="css/components/datepicker.css" type="text/css" />
	<link rel="stylesheet" href="css/components/timepicker.css" type="text/css" />

	<!-- Range Slider CSS -->
	<link rel="stylesheet" href="css/components/ion.rangeslider.css" type="text/css" />

	<!-- Star Rating CSS -->
	<link rel="stylesheet" href="css/components/bs-rating.css" type="text/css" />

	<!-- Bootstrap Switch CSS -->
	<link rel="stylesheet" href="css/components/bs-switches.css" type="text/css" />


	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Form Fields | Canvas</title>

	<style>
	.file-caption.icon-visible .file-caption-name {
		font-family: 'Lato', sans-serif;
		color: #666;
	}
	.form-process {
		position: absolute;
		-webkit-transition: all .3s ease;
		-o-transition: all .3s ease;
		transition: all .3s ease;
		background-image: none;
	}

	.form-process > div { background-color: #999;  }

	.form-process,
	#template-contactform-submitted,
	.template-contactform-complete .form-process {
		display: none;
		opacity: 0;
		background-color: rgba(255,255,255,0.7);
	}

	.template-contactform-processing .form-process {
		display: block;
		opacity: 1;
	}
	</style>

</head>

<body class="stretched">
	<div id="wrapper" class="clearfix">
		    <!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header">
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
		<!-- Content
		============================================= -->


		<!--
		<section id="content">
			<div class="content-wrap" style="padding:2em;">
				<div class="container clearfix">
					<div class="row justify-content-center">
						<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
							<h3 style="color:#FFD966; margin: 0 0 0 0;" class="h1 fw-bold mb-3">Modification</h3>
						</div>
					</div>
		-->
		<section id="content"> 
			<div class="content-wrap" style="background-color: #FFFFFF; padding:2em;">
				<div class="row justify-content-center">
					<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
						<h3 style="color:#FFD966; margin: 0 0 0 0;" class="h1 fw-bold mb-3">Create Posts</h3>
					</div>
				<div class="container">
					<div class="row justify-content-center" style="padding:0;background-color: #FFFFFF;">
						<div class="col-lg-7 col-md-10">
							<div class="card shadow-sm">
								<div class="card-header">
									<h4 class="mb-0">게시글 작성</h4>
								</div>
								<div class="card-body">
										<div class="form-process">
											<div class="css3-spinner">
												<div class="css3-spinner-double-bounce1"></div>
												<div class="css3-spinner-double-bounce2"></div>
											</div>
										</div>

										<form class="mb-0" id="template-contactform" name="template-contactform" action="PostWriteService" method="post" enctype="multipart/form-data">
										<!-- <div class="accordion-content clearfix">
												<form id="register-form" name="register-form" class="row mb-0" action="#" method="post">
													<div class="col-12 form-group">
													<label for="register-form-password">비밀번호</label>
												<input type="password" id="register-form-password" name="register-form-password" value="" class="form-control" />
											</div> -->
											<div class="row">
												<!-- <div class="col-12 bottommargin-sm">
													<label for="template-contactform-rating" class="mb-0">Ratings:</label>
													<input id="template-contactform-rating" name="template-contactform-rating" type="number" class="rating" max="5" data-size="md">
												</div> 평점!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

												<!-- <div class="col-12 bottommargin-sm">
													<label for="template-contactform-platform" class="mb-3">Choose any Platform:</label><br>
													<div class="btn-group w-100" role="group">
														<input type="radio" class="btn-check" name="template-contactform-platform" id="template-contactform-platform-mobile" autocomplete="off" checked value="Mobile">
														<label for="template-contactform-platform-mobile" class="btn btn-outline-secondary flex-fill fw-semibold ls0 nott">Mobile
														</label>

														<input type="radio" class="btn-check" name="template-contactform-platform" id="template-contactform-platform-web" autocomplete="off" value="Web">
														<label for="template-contactform-platform-web" class="btn btn-outline-secondary flex-fill fw-semibold ls0 nott">Web
														</label>

														<input type="radio" class="btn-check" name="template-contactform-platform" id="template-contactform-platform-others" autocomplete="off" value="Others">
														<label for="template-contactform-platform-others" class="btn btn-outline-secondary flex-fill fw-semibold ls0 nott"> Others
														</label>
													</div>
												</div> 플랫폼 선택!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
												<div class="col-12 bottommargin-sm">
													<!-- <form id="register-form" name="register-form" class="row mb-0" action="UploadService" method="post"> -->
														<div class="col-12 form-group">
														<label for="register-form-password">Title</label>
														<input type="text" id="" name="title" value="" class="form-control" />
												</div>
												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-message">Contents<small class="text-danger">*</small></label>
													<textarea class="required form-control textarea-message" id="template-contactform-message" name="content" rows="6" cols="30"></textarea>
												</div>
												<div class="col-lg-6 bottommargin">
													<label>Basic Select File</label><br>
													<input id="input-1" type="file" class="file" data-show-preview="false" name="upload">
												</div>
												<div class="col-12 d-none">
													<input type="text" id="template-contactform-botcheck" name="template-contactform-botcheck" value="" />
												</div>
												<div style="text-align: right;">
													<div class="col-12" style>
														<button type="submit" class="button button-3d button m-0" background-color="#1ABC9C" id="login-form-submit" name="login-form-submit" value="login">Post</button>
														<button type="button" class="button button-3d button-black m-0" id="login-form-submit" name="login-form-submit" value="login">Cancel</button>
													</div>
												</div>

											</div>

										</form>

							</div>
						</div>
					</div>

				</div>
			</div>
		</section><!-- #content end -->
		    		<!-- Footer
		============================================= -->
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

	<!-- Bootstrap File Upload Plugin -->
	<script src="js/components/bs-filestyle.js"></script>

	<!-- Select-Boxes Plugin -->
	<script src="js/components/select-boxes.js"></script>

	<!-- Bootstrap Select Plugin -->
	<script src="js/components/bs-select.js"></script>

	<!-- Date & Time Picker JS -->
	<script src="js/components/moment.js"></script>
	<script src="js/components/datepicker.js"></script>
	<script src="js/components/timepicker.js"></script>

	<!-- Include Date Range Picker -->
	<script src="js/components/daterangepicker.js"></script>

	<!-- Range Slider Plugin -->
	<script src="js/components/rangeslider.min.js"></script>

	<!-- Star Rating Plugin -->
	<script src="js/components/star-rating.js"></script>

	<!-- Select-Splitter Plugin -->
	<script src="js/components/selectsplitter.js"></script>

	<!-- TinyMCE Plugin -->
	<script src="js/components/tinymce/tinymce.min.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="js/functions.js"></script>

<script>

		jQuery(document).ready( function(){

			jQuery(".range_01").ionRangeSlider({
				grid: true,
				min: 18,
				max: 70,
				from: 30,
				prefix: "Age ",
				max_postfix: "+"
			});

			jQuery(".select-tags").select2({
				tags: true,
				placeholder: "Add Values and Press Enter"
			});

			jQuery('.datetimepicker1').datetimepicker();

			jQuery('.selectsplitter').selectsplitter();

			tinymce.init({
				selector: '.textarea-message',
				menubar: false,
				setup: function(editor) {
					editor.on('change', function(e) {
						editor.save();
					});
				}
			});

		});


	</script>
	

</body>
</html>