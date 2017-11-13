<%@ page import="objects.Calendar" %>
<%@ page import="objects.Day" %>
<%@ page import="objects.Event" %>
<%@ page import="objects.Group" %>
<%@ page import="objects.Task" %>
<%@ page import="objects.TaskManager" %>
<%@ page import="objects.Time" %>
<%@ page import="objects.User" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Iterator" %>

<% 
	//User user = (User)session.getAttribute("User");
	Group group = (Group)session.getAttribute("Group");
	//Map<String, String> groupTasks = null; 
	if (group != null) {
		ArrayList<User> groupUsers = group.getUsers();
		//groupTasks = new HashMap<String, String>();
		
		// Fill map with group's tasks -- each task maps to a user 
		for (int i = 0; i < groupUsers.size(); i++) {
			ArrayList<Task> userTasks = groupUsers.get(i).getTasklist();
			for (int j = 0; j < userTasks.size(); j++) {
				//groupTasks.put(userTasks.get(j).getName(), groupUsers.get(i).getName());
			}
		}
	}
	
	Group myGroup = new Group();
	ArrayList<User> myGroupUsers = new ArrayList<User>();
	myGroup.setUsers(myGroupUsers);
	
	User user = new User();
	user.setName("nat");
	User isa = new User();
	isa.setName("isa");
	
	Task task1 = new Task();
	task1.setName("task 1");
	task1.setCompleted(true);
	ArrayList<Task> natsList = new ArrayList<Task>();
	user.setTasklist(natsList);
	user.assignTask(task1);
	
	
	
	Task task2 = new Task();
	task2.setName("task 2");
	ArrayList<Task> isaList = new ArrayList<Task>();
	isa.setTasklist(isaList);
	isa.assignTask(task2);
	user.assignTask(task2);
	
	
	myGroup.addUser(user);
	myGroup.addUser(isa);
	
	ArrayList<User> groupUsers = myGroup.getUsers();
	Map<String, String> groupTasks = new HashMap<String, String>();
	Map<String, String> completeGroupTasks = new HashMap<String, String>();
	
	
	
	for (int i = 0; i < groupUsers.size(); i++) {
		ArrayList<Task> userTasks = groupUsers.get(i).getTasklist();
		for (int j = 0; j < userTasks.size(); j++) {
			if (userTasks.get(j).getCompleted() == true) {
				completeGroupTasks.put(userTasks.get(j).getName(), groupUsers.get(i).getName());
			}
			else {
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
	        <th> </th>
	      </tr>
	    </thead>
		    <tbody> 
		    <%  
		    ArrayList<Task> completeTasks = new ArrayList<>();
		    if (user != null ) { 
		    		for (int i = 0; i < user.getTasklist().size(); i++) { 
		    %>
	    		 	<tr>
	    		 		<% 
	    		 			// Check if task is complete 
	    		 			if (user.getTasklist().get(i).getCompleted() == true) {
	    		 				// If complete, add to completed task array
	    		 				completeTasks.add(user.getTasklist().get(i));
	    		 			}
	    		 			else {
	    		 				// If not complete, print with button 
	    		 				%><td> <%= user.getTasklist().get(i).getName() %></td> <% 
	    		 						%>
	    				        <td> 
	    					       <form action="completeTask">
	    						  <input id="taskButton" type="radio" name="task">
	    							</form>
	    						</td>
	    		 			<% } %> 
		      	</tr>
		      <% } %> <!-- End of loop through User tasks -->
		      <% for (int j = 0; j < completeTasks.size(); j++) { %>
		      	<tr> 
		      		<td> <%= completeTasks.get(j).getName() %> </td>
		      		<td> Complete </td>
		      	</tr>
		      <% } %> <!-- End of loop through complete User tasks -->
	    		<% }%> <!-- Close if statement -->
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
	        <th>Complete? </th>
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
			        <td> No </td>
		      	</tr>
		      	<% } %> <!-- Loop through map -->
		    	<% }%> <!-- if statement -->	
	    			<% if (completeGroupTasks != null) { Iterator it = completeGroupTasks.entrySet().iterator(); 
	    			while (it.hasNext()) {
	    				Map.Entry pair = (Map.Entry)it.next();
	    			%>
    		 		<tr>
			        <td> <%= pair.getKey() %></td>
			        <td> <%= pair.getValue() %> </td>
			        <td> Yes </td>
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


