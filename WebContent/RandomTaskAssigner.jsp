<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Random Assigner</title>
		<link rel="stylesheet" href="css/taskAssigner.css">
		<link rel="stylesheet" href="css/styles.css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- Viewport -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!-- Optional Theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<script>
			var taskList = [];
			var peopleList = [];
			function addTask(){
				var task = document.forms["assignTasks"]["addtask"].value;
				taskList.push(task);
				display();
			}
			function addPerson(){
				var person = document.forms["assignPeople"]["addperson"].value;
				peopleList.push(person);
				display();
			}
			function display(){
				var td = "";
				for(var i=0; i<taskList.length; i++){
					td += taskList[i];
					if(i < taskList.length-1){
						td += ", ";
					}
				}
				document.getElementById("taskDisplay").innerHTML = td;
				
				var pd = "";
				for(var i=0; i<peopleList.length; i++){
					pd += peopleList[i];
					if(i < peopleList.length-1){
						pd += ", ";
					}
				}
				document.getElementById("peopleDisplay").innerHTML = pd;
			}
			function assign(){
				shuffle(taskList);
				var myMap = new Map();
				var status = "";
				while(taskList.length > 0){
					//do the code below
				}
				for(var j=0; j<peopleList.length; j++){
					var person = peopleList[j];	
					var task = taskList[0]; //gets first task in array
					
					var tasks = [];
					myMap.set(person, tasks);
					
					
					tasks.push(task); //adds task to persons task list
					
					
					
					taskList.shift(); //deletes first task in array
					var assignment = person + ": " + task;
					myMap.set(person, assignment);
					status += myMap.get(person);
					if(j < peopleList.length-1){
						status += ", ";
					}
				}
				document.getElementById("assignments").innerHTML = status;
			}
			function shuffle(a) {
			    var j, x, i;
			    for (i = a.length - 1; i > 0; i--) {
			        j = Math.floor(Math.random() * (i + 1));
			        x = a[i];
			        a[i] = a[j];
			        a[j] = x;
			    }
			}
		</script>
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
    
    <section class="col-md-6"> 
    <div id="things">
    		<h2>Things To Assign</h2>
    		<Form name="assignTasks" >
    			<input type="text" name="task" id="addtask" placeholder="Specify task"> 
    			<input type="button" value="Add Task" onclick="addTask();">
    		</Form>
    		<label> Added Tasks: </label>
    		<p><span id="taskDisplay"></span></p>
    	</div>
    </section>
    
    <section class="col-md-6"> 
    		<h2>People To Assign To</h2>
    		<Form name="assignPeople" >
    			<input type="text" name="person" id="addperson" placeholder="Specify person"> 
    			<input type="button" value="Add Person" onclick="addPerson();">
    		</Form>
    		<label> Added Users: </label>
    		<p><span id="peopleDisplay"></span></p>
    </section>
    
    <section class="col-md-12">
    <div id="assignbutton">
       <input type="button" id="assignIt" value="Assign" onclick="assign();">
       <p><span id="assignments"></span></p>
       </div>
    </section>
    
	</div>
	</body>
</html>
