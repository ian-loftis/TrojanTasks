<%@ page import="objects.Calendar" %>
<%@ page import="objects.Day" %>
<%@ page import="objects.Event" %>
<%@ page import="objects.Group" %>
<%@ page import="objects.Task" %>
<%@ page import="objects.TaskManager" %>
<%@ page import="objects.Time" %>
<%@ page import="objects.User" %>
<%@ page import="objects.TaskList" %>

<%@ page import="jsonObjects.UpdateTasksRequest" %>
<%@ page import="jsonObjects.CalendarUpdateRequest" %>
<%@ page import="jsonObjects.RequestTask" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Iterator" %>

<%
	User user = (User)session.getAttribute("User");
	Group group = (Group)session.getAttribute("Group");

	if (group != null) {
		ArrayList<TaskList> groupLists = group.getLists();
	}
	
	// Test code 
	TaskList test1 = new TaskList();
	test1.setName("list 1");
	test1.addItem("bananas");
	test1.addItem("apples");
	test1.addItem("pears");
	
	
	TaskList test2 = new TaskList();
	test2.setName("list 2");
	test2.addItem("broom");
	test2.addItem("clorox");
	test2.addItem("detergent");
	
	TaskList test3 = new TaskList();
	test3.setName("list 3");
	test3.addItem("natty");
	test3.addItem("svedka");
	test3.addItem("smirnoff");
	
	ArrayList<TaskList> list = new ArrayList<TaskList>();
	list.add(test1);
	list.add(test2);
	list.add(test3);

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
	    
	     <!-- Jquery  -->
	    	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        
        
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
	            <li> <a href="Home.jsp"> Home </a> </li>
	            <li> <a href="Profile.jsp"> Profile </a> </li>
	            <li> <a href="Calendar.jsp"> Calendar </a> </li>
	            <li> <a href="ChoreAssigner.jsp"> Chore Assigner </a> </li>
	            <li class="active"> <a href="Lists.jsp"> Lists </a> </li>
        			</ul>
	        	</div>
  		</nav>
	</div>
	
	<div class="container">
		<section class="col-md-6"> 
	  	<h2> Current Lists</h2>
	  	</br> 
	  	<table class="table">
	    <thead>
	      <tr>
	      </tr>
	    </thead>
		    <tbody> 
			<% for (int i = 0; i < list.size(); i++) { %>		      	
		      	<tr> 
		      		<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo<%=i%>"> <%= list.get(i).getName() %></button>
		      		<% ArrayList<String> items = list.get(i).getItems(); %>
				    <div id="demo<%=i%>" class="collapse">
				    <% for (int j = 0; j < items.size(); j++) { %> 
					      <li><a href="#"><%=items.get(j) %></a></li> 
				   <% } %>
				   </div>
				   <br> 
		      	</tr>
		      	</br> 
		      <% } %>
		    </tbody>
	  </table>
	  </section>
	  <section class="col-md-3">
		  <h2>Add List</h2>
		  <br> 
		  <input type="text" placeholder="List Name"> </br> </br> 
		  <input id="item" type="text" placeholder="Item Name"> 
		  <br> <br> 
		  <button id="addBtn">Add Item</button>
		  <button id="clearBtn">Clear</button> <br> <br> 
		  <button id="addListBtn" onClick="addList()">Create List</button>
	  </section>
	  <section class="col-md-3">
	  		<h2> Items Added </h2>
	        <ul id="dialog" title="Add List" class="list-group">
	            <ul id=listItem>
	            </ul>     
	        </ul>
	  </section>
	</div>
	<script> 
		var items = [];
		$(document).ready(function(){
	        var $appendItemsToList;
	        $("#addBtn").click(function() {
	        	 	var bla = $("#item").val();
	            $("#dialog ul").append(bla);
	            $("#dialog ul").append("<br>");
	            items.push(bla);
	        });
	        
	        $("#clearBtn").click(function() {
	            $( "#dialog ul" ).empty();
        		});
	    });
		
		function addList() {
			
			for (i = 0; i < items.length; i++) { 
			    console.log(items[i]);
			}
		}
	</script>

	
	<!-- FOOTER SECTION - Before closing </body> tag -->
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<!-- My script -->
	<script> src="js/script.js" </script>
	</body>
</html>