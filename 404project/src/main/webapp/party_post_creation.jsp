<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />

<!-- Stylesheets
	============================================= -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Poppins:300,400,500,600,700|PT+Serif:400,400i&display=swap"
	rel="stylesheet" type="text/css" />
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
<title>Neulbo Dutch</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body class="stretched">
	

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">


		<!-- Content
		============================================= -->
		<section id="content">
			<div style="padding-top: 7em; height: 800px;" class="content-wrap">
				<div class="container clearfix">
					<div style="height: 100px;" class="row justify-content-center">
						<div class="col-xl-6 col-lg-8 text-center mb-5">
							<h3 style="color: #FFD966; cursor: pointer;" class="h1 fw-bold mb-3" onclick="window.location.href='/404project/index.jsp'" >Create Party</h3>
						</div>

					</div>

					<div class="row justify-content-center">
						<div class="col-lg-8 col-xl-7">
							<div style="height: 520px;" class="p-5 rounded-5 shadow-lg">
								<div class="d-flex flex-column mb-4">
									<div class="col-md-16 form-group" width="500px">
										<label for="template-contactform-service">Platform</label>
										<select id="platformSelect" name="name" class="sm-form-control">
											<option class="platform"></option>
											<option class="platform" value="NETFLIX">넷플릭스</option>
											<option class="platform" value="WAVVE">웨이브</option>
											<option class="platform" value="DISNEY+">디즈니+</option>
											<option class="platform" value="WATCHA">왓챠</option>
											<option class="platform" value="APPLETV+">애플TV+</option>
											<option class="platform" value="AMAZONPRIMEVIDEO">아마존프라임비디오</option>
										</select> <br>
										<div class="row">
											<div class="col-md-6">
												<label for="template-contactform-service">요금제</label> 
												<select id="titleSelect" name="title" class="sm-form-control">

												</select>
											</div>

											<div class="col-md-6">
												<label for="template-contactform-service">기간</label> 
												<select id="perSelect" name="period" class="sm-form-control">
													<option class="per" value="1">1</option>
													<option class="per" value="2">2</option>
													<option class="per" value="3">3</option>
													<option class="per" value="4">4</option>
													<option class="per" value="5">5</option>
													<option class="per" value="6">6</option>
													<option class="per" value="7">7</option>
													<option class="per" value="8">8</option>
													<option class="per" value="9">9</option>
													<option class="per" value="10">10</option>
													<option class="per" value="11">11</option>
													<option class="per" value="12">12</option>
												</select>
											</div>
										</div>
										<div class="row" style="margin-top: 0.8em;">
											<div class="col-md-6">
												<label for="template-contactform-service">공유인원</label>
												<p id="shareInfo"></p>
											</div>
											<div class="col-md-6">
												<label for="template-contactform-service">총 가격</label>
												<p id="priceInfo"></p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label for="template-contactform-service">StartDate</label>
												<form>
													<p>
														<input class="start" type="date" name="start_Date">
													</p>
												</form>
											</div>
											<div class="col-md-6">
												<label for="template-contactform-service">EndDate</label>
												<form style="margin: auto">
													<p>
														<input class="end_date" type="date">
													</p>
												</form>
											</div>
										</div>
									</div>
									<div style="text-align: center;">
										<a id="createButton" class="btn py-2 px-3 bg-color text-white">생성</a> 
										<a href="party_post_main.jsp" class="btn py-2 px-3 btn-outline-danger ms-1">취소</a>
									</div>
									<!-- 모집인원수 - 참가인원수로 내림차순 정렬-->
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>
	<!-- #wrapper end -->

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
		$("#createButton").click(function() {
		    var platform = $("#platformSelect").val();
		    var title = $("#titleSelect").val();
		    var period = $("#perSelect").val();
		    var startDate = $(".start").val();
		    
		    $.ajax({
		        url: "PartyCreateService", // 실제 서블릿 URL로 변경
		        type: "POST",
		        data: {
		            "platform": platform,
		            "title": title,
		            "period": period,
		            "start_Date": startDate
		        },
		        success: function(response) {
		            // 서블릿 응답 처리
		            location.href="party_post_main.jsp";
		        },
		        error: function(e) {
		            console.log(e);
		        }
		    });
		});
	</script>

	<script>
		$("#platformSelect").on('change',
			function() {
				var platform = $(this).val();
					$.ajax({
						url : "MembershipSelect",
						type : "POST",
						data : {"platform" : platform},
						dataType : "JSON",success : function(result) {
						let html = "<option></option>";
						for (let i = 0; i < result.length; i++) {
							html += "<option neme='title' value='" + result[i].title + "'>" + result[i].title + "</option>";
							}
							$("#titleSelect").html(html);
						},
						error : function(e) {
							console.log(e);
				}
			});
		});
	</script>
	
	<script>
		$("#platformSelect, #titleSelect").on('change',
			function() {
				var platform = $("#platformSelect").val();
				var title = $("#titleSelect").val();
					$.ajax({
						url : "ShareAndPriceInfo",
						type : "POST",
						data: {"platform": platform, "title": title},
						dataType : "JSON",success : function(result) {
						let price = 0;
						let share = 0;
						price = result[0].price;
						share = result[0].share;
						$("#shareInfo").text(share + "명");
						$("#priceInfo").text(price + "원");
						},
						error : function(e) {
							console.log(e);
				}
			});
		});
	</script>
		
	<script>
	$("#perSelect, .start").on('change',
			function() {
				var per = $("#perSelect").val();
				var start_Date = $(".start").val();
				
					$.ajax({
						url : "DateCalService",
						type : "POST",
						data: {"per": per, "start_Date": start_Date},
						dataType : "JSON",success : function(result) {
						let end_date = result;
						$(".end_date").val(end_date);
						},
						error : function(e) {
							console.log(e);
				}
			});
		});
	</script>
</body>
</html>