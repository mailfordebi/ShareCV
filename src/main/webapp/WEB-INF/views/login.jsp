<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">
<link href="css/style.css" rel="stylesheet">
<title>ShareCV -Login/Register</title>
<!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
</head>
<body id="body1">
	<header id="header">
		<div class="container">
			<div id="logo" class="pull-left">
				<h1>
					<a href="${pageContext.request.contextPath}/index" class="scrollto">SHARECV</a>
				</h1>
			</div>
		</div>
	</header>
	<div id="logreg-forms">
		<form class="form-signin" action="${pageContext.request.contextPath}/login_submit" name="login_submit" method="post">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
				Sign in</h1>
			<!-- <div class="social-login">
				<button class="btn facebook-btn social-btn" type="button">
					<span><i class="fab fa-facebook-f"></i> Sign in with
						Facebook</span>
				</button>
				<button class="btn google-btn social-btn" type="button">
					<span><i class="fab fa-google-plus-g"></i> Sign in with
						Google+</span>
				</button>
			</div>
			<p style="text-align: center">OR</p> -->
			<input type="email" id="inputEmail" name="inputEmail" class="form-control"
				placeholder="Email address" required="" autofocus=""> 
			<input
				type="password" id="inputPassword" name="inputPassword" class="form-control"
				placeholder="Password" required="">
			<input type="hidden" id="nextPage" name="nextPage" value="${page}">	
			<c:if test="${!isLoggedIn}">
               	${error}
            </c:if>	
			<button class="btn btn-success btn-block" type="submit">
				<i class="fas fa-sign-in-alt"></i> Sign in
			</button>
			<a href="#" id="forgot_pswd">Forgot password?</a>
			<hr>
			<!-- <p>Don't have an account!</p>  -->
			<button class="btn btn-primary btn-block" type="button"
				id="btn-signup">
				<i class="fas fa-user-plus"></i> Sign up New Account
			</button>
		</form>

		<form action="${pageContext.request.contextPath}/resetpassword" class="form-reset" name="resetpassword" method="post">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
				Reset Password</h1>
			<input type="email" id="resetEmail" name="resetEmail" class="form-control"
				placeholder="Email address" required="" autofocus="">
			<input
				type="password" id="reset_pass" name="reset_pass" class="form-control"
				placeholder="Password" required autofocus="">
			<input
				type="password" id="reset_pass_again" name="reset_pass_again" class="form-control"
				placeholder="Re-enter Password" required autofocus="">		
			<button class="btn btn-primary btn-block" type="submit">Reset
				Password</button>
			<a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i>
				Back</a>
		</form>

		<form class="form-signup" action="${pageContext.request.contextPath}/signup" name="signup" method="post">
			<!-- <div class="social-login">
				<button class="btn facebook-btn social-btn" type="button">
					<span><i class="fab fa-facebook-f"></i> Sign up with
						Facebook</span>
				</button>
			</div>
			<div class="social-login">
				<button class="btn google-btn social-btn" type="button">
					<span><i class="fab fa-google-plus-g"></i> Sign up with
						Google+</span>
				</button>
			</div>

			<p style="text-align: center">OR</p> -->

			<input type="text" id="user_name" name="user_name" class="form-control"
				placeholder="Full name" required="" autofocus=""> 
			<input
				type="email" id="user_email" name="user_email" class="form-control"
				placeholder="Email address" required autofocus=""> 
			<input
				type="password" id="user_pass" name="user_pass" class="form-control"
				placeholder="Password" required autofocus="">

			<button class="btn btn-primary btn-block" type="submit">
				<i class="fas fa-user-plus"></i> Sign Up
			</button>
			<a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i>
				Back</a>
		</form>
		<br>

	</div>
	
	<!-- <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 text-lg-left text-center">
          <div class="copyright">
            &copy; Copyright <strong>ShareCV</strong>. All Rights Reserved
          </div>
        </div>
      </div>
    </div>
  </footer> -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/login.js"></script>
</body>
</html>