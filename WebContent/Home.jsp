<%@ page import="objects.Calendar" %>
<%@ page import="objects.Day" %>
<%@ page import="objects.Event" %>
<%@ page import="objects.Group" %>
<%@ page import="objects.List" %>
<%@ page import="objects.Task" %>
<%@ page import="objects.TaskManager" %>
<%@ page import="objects.Time" %>
<%@ page import="objects.User" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Iterator" %>

<% 
	User user = (User)session.getAttribute("User");
	Group group = (Group)session.getAttribute("Group");
	Map<String, String> groupTasks = null; 
	if (group != null) {
		ArrayList<User> groupUsers = group.getUsers();
		groupTasks = new HashMap<String, String>();
		
		// Fill map with group's tasks -- each task maps to a user 
		for (int i = 0; i < groupUsers.size(); i++) {
			ArrayList<Task> userTasks = groupUsers.get(i).getTasklist();
			for (int j = 0; j < userTasks.size(); j++) {
				System.out.println(groupUsers.get(i).getName());
				groupTasks.put(userTasks.get(j).getName(), groupUsers.get(i).getName());
			}
		}
	}
%> 

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
	<head>
	    <meta charset="UTF-8">
	
	    <!-- BOOTSTRAP HEAD SECTION -->
	    <!-- IE Edge Meta Tag -->
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	    <!-- Viewport -->
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <!-- Minified CSS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	    <!-- Optional Theme -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	
	    <!-- Optional IE8 Support -->
	    <!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	
	    <!-- My stylesheet -->
	    <link rel="stylesheet" href="css/styles.css">
	    <title>Home</title>
	</head>
	<body>
	<div class="services container">
	    <div class="row">
	        <section class="col-md-12">
	            <h1>
				  <span class="redh1">Trojan</span>
				  <span class="blackh1">Tasks!</span>
				</h1>
	        </section>
	    </div>
  		<nav class="navbar navbar-default">
	  		<div class="container"> 
  				<ul class="nav navbar-nav">
	            <li class="active"> <a href="Home.jsp"> Home </a> </li>
	            <li> <a href="Profile.jsp"> Profile </a> </li>
	            <li> <a href="Calendar.jsp"> Calendar </a> </li>
	            <li> <a href="ChoreAssigner.jsp"> Chore Assigner </a> </li>
	            <li> <a href="Lists.jsp"> Lists </a> </li>
        			</ul>
	        	</div>
  		</nav>
  	</div>
  		
	<div class="container">
		<section class="col-md-6"> 
	  <h2>Your Tasks</h2>
	  <table class="table">
	    <thead>
	      <tr>
	        <th>Task</th>
	        <th>Complete?</th>
	      </tr>
	    </thead>
		    <tbody> 
		    <%  if (user != null ) { for (int i = 0; i < user.getTasklist().size(); i++) { %>
	    		 	<tr>
			        <td> <%= user.getTasklist().get(i).getName() %></td>
			        <td> 
				       <form action="completeTask">
					  <input id="taskButton" type="radio" name="task">
						</form>
					</td>
		      	</tr>
		      <% }  }%> <!-- End of loop through User tasks -->
		    </tbody>
	  </table>
	  </section>
	  <section class="col-md-6"> 
	  <h2>Group Tasks</h2>
	  <table class="table">
	    <thead>
	      <tr>
	        <th>Task</th>
	        <th>Assigned To: </th>
	      </tr>
	    </thead>
		    <tbody> 
		    		<% if (groupTasks != null) { Iterator it = groupTasks.entrySet().iterator(); 
		    		while (it.hasNext()) {
		    			Map.Entry pair = (Map.Entry)it.next();
		    		%>
	    		 	<tr>
			        <td> <%= pair.getKey() %></td>
			        <td> <%= pair.getValue() %> </td>
		      	</tr>
		      	<% } %> <!-- Loop through map -->
		    			<% }%> <!-- if statement -->
		    </tbody>
	  </table>
	  </section>
	</div>

	<!-- FOOTER SECTION - Before closing </body> tag -->
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<!-- My script -->
	<script> src="js/script.js" </script>
	</body>
</html>


