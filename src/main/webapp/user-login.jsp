<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Login</title>
<style><%@include file="/resources/css/bootstrap.min.css"%></style>
<script><%@include file="/resources/js/bootstrap.min.js" %></script>
<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
<script>
	$('.alert').show();
	setTimeout(function(){ $('.alert').hide(); }, 3500);
</script>
</head>
<body>
	<c:if test="${isLoginFailed}">
		<div class="alert alert-warning" style="margin-bottom: 0px;">
		  <strong>Login not successful! </strong> Please check your email or password. Also, make sure your user status is Active!
		</div>
	</c:if>
	
	<c:if test="${isLogoutSuccess}">
		<div class="alert alert-success" style="margin-bottom: 0px;">
		  <strong>Logout successful! </strong> Thank you!
		</div>
	</c:if>

	<div class="jumbotron jumbotron-fluid" style="margin-bottom: 0px;">
		<div class="container ">
			<div class="row" style="margin: 100px auto;">
				<div
					class="col-lg-4 col-md-4 col-sm-4 container justify-content-center">
					<form action="dologin" method="post">
						<fieldset>
							<h2>Please Sign In</h2>
							<hr class="colorgraph">
							<div class="form-group">
								<input type="email" name="email" required id="email"
									class="form-control input-lg" placeholder="Email Address" >
							</div>
							<div class="form-group">
								<input type="password" name="password" required id="password"
									class="form-control input-lg" placeholder="Password" >
							</div>
							<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="submit" class="btn btn-lg btn-success btn-block"
										value="Sign In">
								</div>
								<a href="registration-form.jsp" class="link-info">Don't have account?Register here.</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			© 2022 <a
				href="https://in.linkedin.com/in/saiteja-galipelli-071245b7">
				Saiteja Galipelli LinkedIn </a>
		</div>
	</footer>
	
</body>