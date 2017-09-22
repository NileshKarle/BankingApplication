<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#d1 {
	margin: 0 auto;
	float: none;
	line-height: 2;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>
	<div class="row">
		<div id="d1" class="col-sm-6 col-lg-6 col-md-9 col-xs-12"
			style="padding: 50px">
			<h1>Sign In.</h1>
			<hr style="border-width: 2px" color="black">
			<form class="form-horizontal" method="post" action="Verification">
				<div class="row">
					<div class="col-sm-6">
						<h3>
							<b>use other account</b>
						</h3>
						You can also sign in using facebook account and google account<br>
						<br>
						<button type="button" class="btn btn-primary btn-block">login
							using facebook</button>
						<br>
						<button type="button" class="btn btn-block"
							style="background-color: black; color: white">login
							using google</button>
					</div>
					<div class="col-sm-6 col-lg-6 col-md-9 col-xs-12"
						style="border-left: 1px solid grey">
						<h3>
							<b> Using your account</b>
						</h3>
						<br>
						<div class="form-group" style="margin-left: 5px">
							<input type="email" id="email" name="email"
								placeholder="Enter ur mail" class="form-control"
								required="required"> <input type="password"
								placeholder="Enter ur password" id="pwd" name="password"
								class="form-control" required="required">
						</div>
						<div class="form-group" style="margin-left: 5px">
							<button type="submit" class="btn btn-info btn-block">Sign
								in</button>
							<br> <a href="forgot.html" style="text-align: center"><u>Forgot
									ur password?</u></a><br>
									<a href="signIn"> Register </a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>