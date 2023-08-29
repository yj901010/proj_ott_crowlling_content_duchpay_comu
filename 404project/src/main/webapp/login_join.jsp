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
	<style>
        select.box {
            width: 100%;
            height: 50px;
            box-sizing: border-box;
            margin-left: 5px;
            padding: 5px 0 5px 10px;
            border-radius: 4px;
            border: 1px solid #d9d6d6;
            color: #383838;
            background-color: #ffffff;
            font-family: 'Montserrat', 'Pretendard', sans-serif;
        }

        option {
        font-size: 16px;
        }

        .info .box#domain-list option {
        font-size: 14px;
        background-color: #ffffff;
        }

        .info#info__birth select::-webkit-scrollbar {
        width: 10px;
        }

        .info#info__birth select::-webkit-scrollbar-thumb {
        background-color: #b6b6b6;
        border-radius: 3px;
        }

        .info#info__birth select::-webkit-scrollbar-track {
        background-color: #ebe9e9;
        border-radius: 6px;
        }
        /* SECTION - BIRTH */
        .info#info__birth {
        display: flex;
        }

        .info#info__birth select {
        margin-left : 7px;
        }

        .info#info__birth select:first-child {
        margin-left : 0px;
        }
    </style>

	<!-- Document Title
	============================================= -->
	<title>Login - Layout 3 | Canvas</title>
</head>
<!-- 
	쿼리파라미터 is_login을 확인 후 null이 아니고 value가 N 인 경우, alert창 호출 - 오류사항 수정
-->
<%
	String is_login = request.getParameter("is_login");
	if (is_login != null && is_login.equals("N")){
		%>
			<script type="text/javascript">
				alert("로그인에 실패했습니다. 다시 시도해주세요.");
			</script>
		<%
	}
%>
<body class="stretched">
		<section id="content">
			<div class="content-wrap">
				<div class="row justify-content-center">
					<div class="col-xl-6 col-lg-8 text-center mb-5" style="margin:0px 0 0 0; padding:0px;">
					<h3 style="color:#FFD966; cursor:pointer; margin: 0 0 0 0;" class="h1 fw-bold mb-3" onclick="window.location.href='/404project/index.jsp'">Account</h3>
					</div>
				</div>
				<div class="container clearfix">
					<div class="accordion accordion-lg mx-auto mb-0 clearfix" style="max-width: 550px;">

						<div class="accordion-header">
							<div class="accordion-icon">
								<i class="accordion-closed icon-lock3"></i>
								<i class="accordion-open icon-unlock"></i>
							</div>
							<div class="accordion-title">
								로그인
							</div>
						</div>
						<div class="accordion-content clearfix">
							<form id="login-form" name="login-form" class="row mb-0" action="LoginService" method="post">
								<div class="col-12 form-group">
									<label for="login-form-username">아이디</label>
									<input type="text" id="login-form-username" name="id" value="" class="form-control" />
								</div>

								<div class="col-12 form-group">
									<label for="login-form-password">비밀번호</label>
									<input type="password" id="login-form-password" name="pw" value="" class="form-control" />
								</div>

								<div class="col-12 form-group">
									<button class="button button-3d button-black m-0" id="login-form-submit" name="login-form-submit" value="login">Login</button>
									<a href="find_id.jsp" class="float-end">아이디를 잊으셨나요?</a><br>
									<a href="find_id_password.jsp" class="float-end">비밀번호를 잊으셨나요?</a>
								</div>
								
							</form>
						</div>

						<div class="accordion-header">
							<div class="accordion-icon">
								<i class="accordion-closed icon-user4"></i>
								<i class="accordion-open icon-ok-sign"></i>
							</div>
							<div class="accordion-title">
								회원가입
							</div>
						</div>
						<div class="accordion-content clearfix">
							<form id="register-form" name="register-form" class="row mb-0" action="JoinService" method="post">
								<div class="col-12 form-group">
									<label for="register-form-name">아이디</label>
									<input type="text" id="register-form-name" name="id" value="" class="form-control" />
								</div>

								<div class="col-12 form-group">
									<label for="register-form-password">비밀번호</label>
									<input type="password" id="register-form-password" name="pw" value="" class="form-control" />
								</div>

								<div class="col-12 form-group">
									<label for="register-form-username">이름</label>
									<input type="text" id="register-form-username" name="name" value="" class="form-control" />
								</div>

								<div class="col-12 form-group">
									<label for="register-form-username">생년월일</label>
									<div class="info" id="info__birth">
										<select class="box" id="birth-year" name="birthYear">
										  <option disabled selected>출생 연도</option>
										</select>
										<select class="box" id="birth-month" name="birthMonth">
										  <option disabled selected>월</option>
										</select>
										<select class="box" id="birth-day" name="birthDay">
										  <option disabled selected>일</option>
										</select>
									  </div>
								</div>
										

                                            <!-- 출처: https://choiiis.github.io/web/toy-project-sign-up-and-in-page-2/-->
                                            <!-- html파일이라서 jsp파일 다루는 영재님, 한빈님, 형준님에게 부탁드립니다-->
                                            <!-- // '출생 연도' 셀렉트 박스 option 목록 동적 생성-->
                                            
                                            <script>
                                            const birthYearEl = document.querySelector('#birth-year')
                                            // option 목록 생성 여부 확인
                                            isYearOptionExisted = false;
                                            birthYearEl.addEventListener('focus', function () {
                                            // year 목록 생성되지 않았을 때 (최초 클릭 시)
                                            if(!isYearOptionExisted) {
                                                isYearOptionExisted = true
                                                for(var i = 1940; i <= 2022; i++) {
                                                // option element 생성
                                                const YearOption = document.createElement('option')
                                                YearOption.setAttribute('value', i)
                                                YearOption.innerText = i
                                                // birthYearEl의 자식 요소로 추가
                                                this.appendChild(YearOption);
                                                }
                                            }
                                            });
                                            
                                            const birthMonthEl = document.querySelector('#birth-month')
                                            // option 목록 생성 여부 확인
                                            isMonthOptionExisted = false;
                                            birthMonthEl.addEventListener('focus', function () {
                                            // month 목록 생성되지 않았을 때 (최초 클릭 시)
                                            if(!isMonthOptionExisted) {
                                            	isMonthOptionExisted = true
                                                for(var i = 1; i <= 12; i++) {
                                                // option element 생성
                                                const MonthOption = document.createElement('option')
                                                MonthOption.setAttribute('value', i)
                                                MonthOption.innerText = i
                                                // birthMonthEl의 자식 요소로 추가
                                                this.appendChild(MonthOption);
                                                }
                                            }
                                            });
                                            
                                            const birthDayEl = document.querySelector('#birth-day')
                                            // option 목록 생성 여부 확인
                                            isDayOptionExisted = false;
                                            birthDayEl.addEventListener('focus', function () {
                                            // month 목록 생성되지 않았을 때 (최초 클릭 시)
                                            if(!isDayOptionExisted) {
                                            	isDayOptionExisted = true
                                                for(var i = 1; i <= 31; i++) {
                                                // option element 생성
                                                const DayOption = document.createElement('option')
                                                DayOption.setAttribute('value', i)
                                                DayOption.innerText = i
                                                // birthMonthEl의 자식 요소로 추가
                                                this.appendChild(DayOption);
                                                }
                                            }
                                            });
                                            </script>
                                         <!--     // Month, Day도 동일한 방식으로 구현           이렇답니다-->
			
										
								<div class="col-12 form-group">
									<label for="login-form-username">성별</label>
									<br>
									<label>
										<input style="transform : scale(1.3);" style="margin-top:7px;"type="radio" name="gender" value="남자"><span style="font-size:large;">  Man</span>
									  </label>
									  <label>
										<input style="transform : scale(1.3);" style="margin-top:7px;"type="radio" name="gender" value="여자"><span style="font-size:large;">  Woman</span>
									  </label>
								</div>

								<div class="col-12 form-group">
									<label for="register-form-phone">휴대폰</label>
									<input type="text" id="register-form-phone" name="phone" value="" class="form-control" />
								</div>


								<div class="col-12 form-group">
									<label for="login-form-username">Email</label>
									<input type="email" id="login-form-username" name="email" value="" class="form-control not-dark" />
								</div>

								<div class="col-12 form-group">
									<label for="login-form-password">Nick</label>
									<input type="text" id="login-form-password" name="nick" value="" class="form-control not-dark" />
								</div>

								<div class="col-12 form-group">
									<button class="button button-3d button-black m-0" id="register-form-submit" name="register-form-submit" value="register">회원 가입</button>
								</div>
							</form>
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