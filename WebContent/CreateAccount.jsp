<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create Account</title>
		<link rel="stylesheet" href="css/login.css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- Viewport -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!-- Optional Theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	</head>
	<body>
		<div class="row">
	        <section class="col-md-12">
	            <h1>
				  <span class="redh1">Trojan</span>
				  <span class="blackh1">Tasks!</span>
				</h1>
	        </section>
	    </div>
	    <div class="container">
		  	<section class="col-md-6"> 
		  	<span id="status"></span>
			<div id="createAccount">
				<h1>Login</h1>
				<form name="myform" method="post" action="Home.jsp" onsubmit="return validate()">
					<label for="uname"><b>Username</b></label>
					<input type="text" name="uname" placeholder="Enter Username">
					<label for="pwd1"><b>Password</b></label>
					<input type="password" name="pwd1" placeholder="Enter Password">
					<label for="pwd2"><b>Repeat Password</b></label>
					<input type="password" name="pwd2" placeholder="Enter Password Again">
					<div id="lower">
						<input type="submit" value="Create Account">
					</div> 
				</form>
			</div> 
			</section>
		</div>
	</body>
</html>