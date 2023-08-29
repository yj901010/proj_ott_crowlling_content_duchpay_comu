<%@page import="com.model.dto.MemberDTO"%>
<%@page import="com.model.dto.MembershipDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.model.dto.PartyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.model.dao.P_MemberDAO"%>
<%@page import="com.model.dao.MembershipDAO"%>
<%@page import="com.model.dao.PartyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="stretched">
	
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String id = (info != null) ? info.getId() : null;
	%>
	
	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
	
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
							info = (MemberDTO)session.getAttribute("info");
						
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
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<div class="row justify-content-center">

						<div class="col-xl-6 col-lg-8 text-center mb-5">
							<h3 style="color:#FFD966"class="h1 fw-bold mb-3">Party</h3>
						</div>
						<% if(id != null){ %>
						 <div>
							<a style="margin-left: 920px; margin-bottom: 1em;"href="party_post_creation.jsp" class="btn py-2 px-3 bg-color text-white">파티 생성</a>
						 </div>
					</div>
						<%} %>
					<%
						PartyDAO dao = new PartyDAO();
						MembershipDAO mdao = new MembershipDAO();
						P_MemberDAO pmdao = new P_MemberDAO();
						
						ArrayList<PartyDTO> list = dao.select();
						
						ArrayList<MembershipDTO> mlist = mdao.select();
					%>
					
					<!--여기서부터-->
					<% for(int i=0;i<list.size();i++){
						PartyDTO party = list.get(i);
						int count = pmdao.selCount(party.getNo()).size(); 
					%>
					<div style="padding: 0 0 3em 0" class="row justify-content-center" style="width:60px;height:60px;">
			
						<div class="col-lg-8 col-xl-7">
							<div class="p-5 rounded-5 shadow-lg">
								<div class="d-flex flex-column flex-sm-row mb-4">
									<img src="images/logo_<%=mlist.get(party.getP_no()-1).getName() %>.png" width="120" height="70">
									<div>
										<h4 class="mb-0" style="margin-left:20px"><%=mlist.get(party.getP_no()-1).getName() %></h4>
										<p style="margin-bottom:0px; margin-left:20px;"><%=mlist.get(party.getP_no()-1).getTitle() %></p>
										<p style="margin-left:20px;"><%=mlist.get(party.getP_no()-1).getPrice() %>원</p>
									</div>
									<div class="ms-sm-auto align-bottom">
										<h3 style="margin-bottom:0px"><%=mlist.get(party.getP_no()-1).getPrice() / mlist.get(party.getP_no()-1).getShare() %>원 <small class="text-smaller text-black-50">/ 월</small></h3>
										<p style="margin-bottom:0px">공유인원 : <%=mlist.get(party.getP_no()-1).getShare() %>명</p>
										<%
											// LocalDateTime으로 변환
											DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
											LocalDateTime dateTime = LocalDateTime.parse(party.getStart_Date(), formatter);
							
											// LocalDate로 변환 (날짜 부분만 가져오기)
											LocalDate date = dateTime.toLocalDate();
											LocalDate result = date.plusMonths(party.getPeriod());
										%>
										<p style="margin-bottom:0px"><%=date %> ~ <%=result %></p>
										<p><%=party.getPeriod() %>개월</p>
									</div>
								</div>
									<h1 class="col-12 display-3 mb-0">
										<img src="images/party_leader_neulbo.svg" alt="Icon" width="60" class="mb-4">
										<%
											
											for(int j=0;j<dao.enterCheck(party.getNo())-1;j++){
												%>
												<img src="images/party_participation_neulbo.svg" alt="Icon" width="60" class="mb-4">
											<%}
											int temp = mlist.get(party.getP_no()-1).getShare() - dao.enterCheck(party.getNo());
											for(int k=0;k<temp;k++){ %>
												<img src="images/party_empty_neulbo.svg" alt="Icon" width="60" class="mb-4">
											<%	}
										%>
									</h1>
									
								<a class="btn py-2 px-3 bg-color text-white" onclick="goToDetails('<%=party.getNo() %>')">상세 보기</a>
								<!--모집인원수 - 참가인원수로 내림차순 정렬-->
							</div>
						</div>
					</div>
					<% } %>
					<!--여기까지 입니당~-->
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
	
	
		<script>
		    function goToDetails(no) {
		    	var on_id = '<%=id %>';
		    	var on_no = no;
		    	
		    	$.ajax({
					url : "onclickEntry",
					type : "GET",
					data : {
						id : on_id,
						no : on_no
					},
					dataType : "JSON",
					success : function(result){
						console.log(result);
						
						var entryCon = result[0]; // 입장조건
						var pCheck = result[1]; // 공유인원확인
						var enterCheck = result[2]; // 입장인원수
						
						if(pCheck > enterCheck){
				    		window.location.href = "party_post_view.jsp?no=" + no;
				    	}else{
				    		if(entryCon > 0){
				    			window.location.href = "party_post_view.jsp?no=" + no;
				    		}else{
				    			alert("모집인원이 마감되었습니다.");
				    		}
				    	}
					},
					error : function(e){
						console.log(e);
					}
				});
		    } // function 종료
		</script>
	
</body>
</html>