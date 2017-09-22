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
<script type="text/javascript">
	function validateForm() {
		var pwd1 = document.getElementById("pwd").value;
		var cpwd1 = document.getElementById("cpwd").value;
		if (pwd1 != cpwd1) {
			alert("password conformation failed");
			return false;
		}
		return true;
	}
</script>
<style>
p.dotted {
	border-style: dotted;
}

body {
	background-color: #66ffff;
}

#d1 {
	background-color: #ffffff;
	margin: 0 auto;
	float: none;
	line-height: 2;
	padding: 10px;
}
</style>
<title>Registration Page</title>
</head>
<body>
<%
if(session.getAttribute("error")!=null){%>
<script type="text/javascript">
	alert("Something went wrong ");
	</script>
<%
session.invalidate();
}
%>
	<div class="row">
		<div id="d1" class="col-sm-4 col-lg-4 col-md-6 col-xs-12">

			<h1>Create an Account</h1>
			<form class="" method="post" name="frm" id="nameId" onsubmit="return validateForm()" action="RegisterUser">
				<div class="form-group">
					<hr>
					<label for="name">Enter your Name</label><br> 
					<input type="text" id="text" name="name" class="form-control" required="required">
				</div>

				<div class="form-group">
					<label for="email">Enter your Email</label><br> <input
						type="text" id="email" name="email" class="form-control"
						required="required">
				</div>
				<div class="form-group">
					<label for="password">Enter your Password</label><br> <input
						type="password" id="pwd" name="password" class="form-control"
						required="required">

				</div>
				<div class="form-group">
					<label for="conformPassword">Confirm Password</label><br> <input
						type="password" id="cpwd" name="confirmPassword"
						class="form-control" required="required">

				</div>
				<div class="form-group">
					<label for="contact">Contact Number</label><br> <input
						type="tel" id="tel" name="contact" class="form-control"
						required="required" minlength="10" maxlength="10">
				</div>
				<p class="dotted">
					By Clicking On the "Create an account button" bellow, you certify
					that you have read and agree to our <a href="hello.html">terms
						of use </a>and <a href="policy.html">Privacy policy</a>
				</p>
				<button type="submit" class="btn btn-success btn-block"
					onClick="return validateForm()">Create an account</button>
				Create an account?<a
					href="login">Sign
					in</a>
			</form>
		</div>
	</div>
</body>
</html>