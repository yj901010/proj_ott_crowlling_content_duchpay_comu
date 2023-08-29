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
	<% 
		String id = request.getParameter("id");

	%>
	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap">
				<div class="row justify-content-center">
					<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
					<h3 style="color:#FFD966; margin: 0 0 0 0;" class="h1 fw-bold mb-3">ID</h3>
					</div>
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<form class="row mb-0" action="IdService" method="post">
								<div class="col-12">
									<label for="form-password">이름을 입력하세요</label>
									<div class="input-group toggle-password">
										<input type="text" name="name" class="form-control" value="">
									</div>
								</div>
								
								<div class="col-12">
									<label for="form-password">E-mail을 입력하세요</label>
									<div class="input-group">
										<input type="email" name="email" class="form-control" value="">
									</div>
								</div>

								<div style="margin:1em 0 0 0;" class="col-12 form-group">
									<button class="button button-3d button-black m-0" id="register-form-submit" name="register-form-submit" value="register" onclick="showUserId();">인증</button>
								</div>

							</form>
							<br>
							<%if(id != null) { %>
							<div class="col-12">
							<form>
								<label for="form-password">사용자 ID</label>
								<fieldset>
									<input type="text" id="myInput" readonly>
								</fieldset>
							</form>
							</div>
							<% } %>
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
		// JavaScript 함수를 호출하여 사용자 ID를 입력창에 표시
	    function showUserId() {
	        document.getElementById('myInput').value = '<%=id%>';
	    }
	    
	    // 페이지가 로드될 때 사용자 ID를 표시
	    window.onload = function() {
	        showUserId();
	    };
	</script>

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