<%@page import="com.model.dao.BoardFileDAO"%>
<%@page import="com.model.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>Cards | Canvas</title>
</head>
<% 
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	BoardFileDAO dao = new BoardFileDAO();
	String birth = info.getBirth().substring(0,10);
	Object imageName = request.getAttribute("imageName"); 
	String imageNameStr = "";
	if (imageName == null || imageName.equals("")){
		imageNameStr = dao.findName(info.getFile_no());
	}else{
		imageNameStr = imageName.toString();
	}
	
	List<String> memberships = dao.findMemberShipByuserId(info.getId());
%>
<body class="stretched">
	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Content
		============================================= -->
		<section id="content">
			<div style="padding:0 0 0 0 ;" class="content-wrap min-vh-100 d-flex align-items-center">
				<div class="container clearfix">
					<div class="row justify-content-center gutter-50 col-mb-60">
						<div style="margin:0; padding:0;" class="col-xl-6 col-lg-8 text-center">
							<h3 style="margin: 0; color:#FFD966; cursor: pointer;" class="h1 fw-bold mb-3" onclick="window.location.href='/404project/index.jsp'">Profile</h3>
						</div>
						<% 
						// NPE 오류 수정 
						if (info != null){
							dao = new BoardFileDAO();
							birth = info.getBirth().substring(0,10);
						}
						 %>
							<div class="col-lg-8">
									<div class="team team-list rounded-5 g-0 align-items-center shadow-sm border h-shadow h-translatey-sm all-ts rounded-4 overflow-hidden">
							    		<div class="row">
											<div style="width:58.8px;">
											</div>
											<div class="row-md-4 team-image col-sm-5 d-flex align-self-stretch" style="margin: 0 0 0 0; width:150px; height:300px; justify-items: center; align-items: center;">
												
												<%  
													if(info.getFile_no() == 0){ %>
													<img src="images/party_empty_neulbo.svg" alt="Profile image">
													
												<%
													}else{	%>
													<img src='upload/<%=imageNameStr%>' alt="Profile image">
												<%
													}
												%>
										    			</div>
							    			<div style="margin:0 0 0 0;" class="col-md-8 col-sm-8 p-5" >
							    			
												<div class="team-title pt-0 mb-3"><h4>NAME : <%=info.getName() %></h4><span class="fst-normal" style="color:#FFD966">Nick : <%=info.getNick() %></span></div>
													<p title="Phone Number" style="margin-bottom:0%"><strong>Phone : <%=info.getPhone() %></strong><br>
													<p title="Email Address" style="margin-bottom:0%"><strong>Email : <%=info.getEmail() %></strong><br>
													<p title="Phone Number" style="margin-bottom:0%"><strong>Gender : <%=info.getGender() %></strong><br>
													<p title="Email Address" style="margin-bottom:0%"><strong>BirthDate : <%=birth %></strong><br>
													<div class="col-12" style="text-align: right;">
														<button onclick="location.href='member_info_modification.jsp'" type="submit" class="button button-3d button m-0" id="login-form-submit" name="login-form-submit" value="modification">수정</button>
														<button onclick="location.href='index.jsp'" type="submit" class="button button-3d button-black m-0" id="login-form-submit" name="login-form-submit" value="modification">나가기</button>
													</div>
													
													<script>
													function goBack() {
													    window.history.back();
													}
													</script>
											</div>
										</div>
										
					         		</div>
								</div>
							</div>
							<br>
							<!-- in use 부터 로고 6까지 -->
							<h2 style="margin: 0; color:#FFD966; text-align:center; " class="mb-3">in use</h2>
							<div class="rounded-5 g-0 align-items-center">
								<div class="row" style="padding: 0 0 0 0px; display: flex; justify-content: center;">							
									<img id="netflix_logo" style="height:10%; width:10%; padding:0 10px 0 10px; display:none;" src="https://images.justwatch.com/icon/207360008/s100" alt=""/>
									<img id="amazonprimevideo_logo"style="height:10%; width:10%; padding:0 10px 0 10px; display:none;" src="https://images.justwatch.com/icon/52449861/s100" alt=""/>
									<img id="disney+_logo" style="height:10%; width:10%; padding:0 10px 0 10px; display:none;" src="https://www.justwatch.com/images/icon/147638351/s100" alt=""/>
									<img id="wavve_logo" style="height:10%; width:10%; padding:0 10px 0 10px; display:none;" src="https://www.justwatch.com/images/icon/155655742/s100" alt=""/>
									<img id="watcha_logo" style="height:10%; width:10%; padding:0 10px 0 10px; display:none;" src="https://www.justwatch.com/images/icon/2538290/s100" alt=""/>
									<img id="appletv+_logo" style="height:10%; width:10%; padding:0 10px 0 10px; display:none;" src="https://www.justwatch.com/images/icon/152862153/s100" alt=""/>
								</div>
								<script>
										<c:forEach items='<%=memberships%>' var="memberShip">
											var memberShipid = "${memberShip}";
											memberShipid = memberShipid.toLowerCase() + "_logo";
											var memberShipElement = document.getElementById(memberShipid);
											memberShipElement.style.display = '';
									   	</c:forEach>
								</script>
							</div>
							<!-- in use 부터 로고 6까지 끝-->
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
</body>
</html>