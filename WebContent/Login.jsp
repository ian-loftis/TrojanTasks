<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Log In</title>
		<link rel="stylesheet" href="css/login.css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- Viewport -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!-- Optional Theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<script>
			function validate(){
				var access = false;
				var uname = document.myform.uname.value;
				var pwd = document.myform.pwd.value;
				
				
				var xhttp = new XMLHttpRequest();
				// the open function sets the parameters
				xhttp.open("GET", "/"+window.location.pathname.split("/")[1]+"/LoginServlet?uname="+ uname + "&pwd="+ pwd, false);
				xhttp.send();
				
				var status = document.getElementById("status");
				
				if (xhttp.responseText.trim().length > 0) {
					var message = xhttp.responseText.trim();
					if(message == 0){ // something is wrong
						//display error message
						status.textContent = "That is not a valid combination of Username and Password."
					}
					if(message == 1){ //login info validated, go to home page
						access = true;
					}
				}
				return access;
			}
		</script>
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
	  	<!-- <span id="status"></span> -->
		<div id="login">
			<h1>Login</h1>
			<form name="myform" method="POST" action="Home.jsp" onsubmit="return validate()">
				<label for="uname"><b>Username</b></label>
				<input type="text" name="uname" placeholder="Enter Username">
				<label for="pwd"><b>Password</b></label>
				<input type="password" name="pwd" placeholder="Enter Password">
				<div id="lower">
					<input type="submit" value="Log In">
					<button id="create" value="Create Account" >Create Account</button>
				</div> 
			</form>
		</div> 
		
	  </section>
	  <section class="col-md-6"> 
	  	<div id="taskassign">
	  		<button id="task" onclick="RandomTaskAssigner.jsp" value="Random Task Assigner"> Random Task Assigner </button>
	  		Click here to randomly assign tasks without logging in or creating an account.
	  	</div>
	  </section>
	</div>
	<span id="status"></span>
	</body>
</html>