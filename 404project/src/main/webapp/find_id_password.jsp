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

	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Show/Hide Password | Canvas</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap">
				<div class="row justify-content-center">
					<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
					<h3 style="color:#FFD966; margin: 0 0 0 0;" class="h1 fw-bold mb-3">Password</h3>
					</div>
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<form class="row mb-0" action="PwService" method="post">
								<div class="col-12">
									<label for="form-password">ID를 입력하세요</label>
									<div class="input-group toggle-password">
										<input type="text" name="id" class="form-control">
									</div>
								</div>
								
								<div class="col-12">
									<label for="form-password">E-mail을 입력하세요</label>
									<div class="input-group">
										<input type="email" name="email" class="form-control" value="">
									</div>
								</div>

								<div  style="margin:1em 0 0 0;" class="col-12 form-group">
									<button class="button button-3d button-black m-0" id="register-form-submit" name="register-form-submit" value="register">인증</button>
								</div>
							</form>

								<div class="col-12 mt-5">
								<%
									Integer cnt = (Integer) session.getAttribute("cnt");
									if (cnt != null && cnt > 0) {
									String id = request.getParameter("id");
									
								%>
									<form action="ChangePwService" method="post">	
										<input type="hidden" name="id" value="<%=id%>">			
										<label for="form-password">새로운 비밀번호를 입력해주세요</label>
										<div class="input-group toggle-password" data-icon-off="icon-line-unlock" data-icon-on="icon-line-lock">
											<input type="password" name="pw" class="form-control border-end-1" id="password1">
											<!--<button class="btn border-start-0 btn-outline-secondary icon-line-lock btn-password-toggle" type="button" style="border-color: #ced4da"></button>-->
										</div>
											
										<label for="form-password">비밀번호를 다시 입력해주세요</label>
										<div class="input-group toggle-password" data-icon-off="icon-line-unlock" data-icon-on="icon-line-lock">
											<input type="password" name="confirmPw" class="form-control border-end-1" id="password2">
											<!--<button class="btn border-start-0 btn-outline-secondary icon-line-lock btn-password-toggle" type="button" style="border-color: #ced4da"></button>-->
										</div>
											
										<div  style="margin:1em 0 0 0;" class="col-12 form-group">
											<button class="button button-3d button-black m-0" id="register-form-submit" name="register-form-submit" value="register">변경</button>
										</div>
									</form>
								<%
	            					session.removeAttribute("cnt"); // 세션에서 cnt 제거
        	
									}
        						%>
								</div>
								<%
						       		String successMessage = request.getParameter("success");
							    	String errorMessage = request.getParameter("error");
							    
							    	if (successMessage != null) {
							        	out.println("<p style='color: green;'>비밀번호 변경이 성공적으로 이루어졌습니다.</p>");
							    	} else if (errorMessage != null) {
							        	out.println("<p style='color: red;'>비밀번호와 확인 비밀번호가 일치하지 않습니다.</p>");
							    	}
       							%>


						</div>

					</div>

				</div>

			</div>
		</section><!-- #content end -->


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

	<script>
		let elem = $(".toggle-password");

		elem.each( function(){
			let el = $(this),
				btn = el.find(".btn-password-toggle"),
				iconOn = el.attr('data-icon-on') || 'icon-line-eye',
				iconOff = el.attr('data-icon-off') || 'icon-line-eye-off',
				input = el.find('input');

			btn.off( 'click' ).on( 'click', function(){
				if (input.attr('type') === "password") {
					input.attr('type', 'text');
					btn.removeClass(iconOn).addClass(iconOff);
				} else {
					input.attr('type', 'password');
					btn.removeClass(iconOff).addClass(iconOn);
				}

				return false;
			});
		});
	</script>

</body>
</html>