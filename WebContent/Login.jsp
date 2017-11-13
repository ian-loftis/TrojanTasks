<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Log In</title>
		<link rel="stylesheet" href="css/login.css">
		<script>
			function validate(){
				
				var uname = document.myform.uname.value;
				var pwd = document.myform.pwd.value;
				
				
				var xhttp = new XMLHttpRequest();
				// the open function sets the parameters
				xhttp.open("GET", "/"+window.location.pathname.split("/")[1]+"/LoginServlet?uname="+ uname + "/LoginServlet?pwd="+ pwd, false);
				xhttp.send();
			}
		</script>
	</head>
	<body>
		<div id="login">
			<h1>Login</h1>
			<form name="myform" method="post" action="LoginServlet">
				<label for="uname"><b>Username</b></label>
				<input type="text" name="uname" placeholder="Enter Username">
				<label for="pwd"><b>Password</b></label>
				<input type="password" name="pwd" placeholder="Enter Password">
				<div id="lower">
					<input type="submit" value="Login">
				</div> 
			</form>
		</div> 
	</body>
</html>


<!-- 
AJAX call to submit form to /LoginServlet
Pass in the form 

-->